import std/strutils
import std/sugar
import std/sets
import std/options
import std/os

import vulkan
import vkfw

const enableValidationLayers =
  not defined(noValidation) and not defined(release)

const defaultWinsz = Extent2D(width: 800, height: 600)
const maxFramesInFlight = 2
const validationLayers = [
  "VK_LAYER_KHRONOS_validation",
]
const deviceExtensions = [
  KhrSwapchainExtensionName,
]
template raiseFatalError(msg: string) = quit msg

type VkApp* = ref object
  finalizerStack: seq[proc()]
  doforeachframe: proc()

  window: GLFWWindow
  device: Device
  queues: tuple[graphics, present: Queue]
  swapchain: SwapchainKHR
  commandBuffers: seq[CommandBuffer]
  syncObjs: array[maxFramesInFlight, tuple[imageAvailable, renderFinished: Semaphore; inFlightFence: Fence]]
  imagesInFlight: seq[Fence]

template whenFinalize(app: VkApp; body) =
  app.finalizerStack.add proc() = body
template frame(app: VkApp; body) = app.doforeachframe = proc() = body
template tick(app: VkApp) = app.doforeachframe()

type QueueFamilyIndices = object
  graphicsFamily: Option[uint32]
  presentFamily: Option[uint32]
type SwapChainSupportDetails = object
  capabilities: SurfaceCapabilitiesKHR
  formats: seq[SurfaceFormatKHR]
  presentModes: seq[PresentModeKHR]

template cstr(chs: untyped): cstring = cast[cstring](unsafeAddr chs)

proc debugCallback(
      messageSeverity: DebugUtilsMessageSeverityFlagBitsEXT;
      messageType: DebugUtilsMessageTypeFlagsEXT;
      callbackData: ptr DebugUtilsMessengerCallbackDataEXT;
      userData: pointer;
    ): Bool32 {.cdecl.} =

  echo callbackData.pMessage

proc populateDebugMessengerCreateInfo(createInfo: var DebugUtilsMessengerCreateInfoEXT) =
  createInfo.sType = StructureType.debugUtilsMessengerCreateInfoExt
  createInfo.messageSeverity = DebugUtilsMessageSeverityFlagsEXT{errorExt, warningExt}
  createInfo.messageType = all DebugUtilsMessageTypeFlagsEXT
  createInfo.pfnUserCallback = debugCallback

proc setUpDebugMessenger(instance: Instance): DebugUtilsMessengerEXT =
  when not enableValidationLayers: return
  var createInfo: DebugUtilsMessengerCreateInfoEXT
  createInfo.populateDebugMessengerCreateInfo
  if instance.createDebugUtilsMessengerEXT(addr createInfo, nil, addr result) != success:
    raiseFatalError "Failed to set up debug messenger"

proc isAllLayersAvailable(layers: openArray[string]): bool =
  var layerCnt: uint32
  if enumerateInstanceLayerProperties(addr layerCnt) != success:
    raiseFatalError "failed to enumerate instance layer properties"
  var availableLayers = newSeq[LayerProperties](layerCnt)
  if enumerateInstanceLayerProperties(addr layerCnt, addr availableLayers[0]) != success:
    raiseFatalError "failed to enumerate instance layer properties"

  for layer in layers:
    block Look_for_the_layer:
      for layerProperties in availableLayers:
        if layer == $layerProperties.layerName.cstr:
          break Look_for_the_layer
      return false

  return true

proc isAllExtensionsAvailable(extensions: openArray[string]): bool {.used.} =
  var extensionCnt: uint32
  discard enumerateInstanceExtensionProperties(nil, addr extensionCnt, nil)
  var extensionProps = newSeq[ExtensionProperties](extensionCnt)
  discard enumerateInstanceExtensionProperties(nil, addr extensionCnt, addr extensionProps[0])

  for extension in extensions:
    block Look_for_the_extension:
      for extensionProp in extensionProps:
        if extension == $extensionProp.extensionName.cstr:
          break Look_for_the_extension
      return false
  return true

proc getRequiredExtensions: seq[string] =
  var
    glfwExtensionCnt: uint32
    glfwExtensions = glfwGetRequiredInstanceExtensions(addr glfwExtensionCnt)

  result = glfwExtensions.cstringArrayToSeq(glfwExtensionCnt)
  when enableValidationLayers:
    result.add ExtDebugUtilsExtensionName

proc createInstance: Instance =
  when enableValidationLayers:
    if not validationLayers.isAllLayersAvailable:
      raiseFatalError "Not all validation layers is not available\n" & validationLayers.join("\n")
  var
    appInfo = ApplicationInfo{
      pApplicationName: "VK APP",
      applicationVersion: uint32 makeApiVersion(0, 0, 1, 0),
      pEngineName: "No Engine",
      engineVersion: uint32 makeApiVersion(0, 1, 0, 0),
      apiVersion: apiVersion11,}
    extensions = getRequiredExtensions()
    createInfo = InstanceCreateInfo{
      pApplicationInfo: addr appInfo,
      enabledExtensionCount: extensions.len.uint32,
      ppEnabledExtensionNames: extensions.allocCStringArray,}

  when enableValidationLayers:
    var debugMessengerCreateInfo: DebugUtilsMessengerCreateInfoEXT
    debugMessengerCreateInfo.populateDebugMessengerCreateInfo

    createInfo.enabledLayerCount = validationLayers.len
    createInfo.ppEnabledLayerNames = validationLayers.allocCStringArray
    createInfo.pNext = addr debugMessengerCreateInfo

  if createInstance(addr createInfo, nil, addr result) != success:
    raiseFatalError "failed to create Instance"
  else: echo "Instance has correctly created"

proc isComplete(self: QueueFamilyIndices): bool =
  self.graphicsFamily.isSome and
  self.presentFamily.isSome
proc getQueue(device: Device; indices: QueueFamilyIndices): tuple[graphics, present: Queue] =
  device.getDeviceQueue(indices.graphicsFamily.get, 0, addr result.graphics)
  device.getDeviceQueue(indices.presentFamily.get, 0, addr result.present)


proc findQueueFamilies(device: Physicaldevice, surface: SurfaceKHR): QueueFamilyIndices =

  var queueFamilyCnt: uint32
  device.getPhysicalDeviceQueueFamilyProperties(addr queueFamilyCnt, nil)
  var queueFamilies = newSeq[QueueFamilyProperties](queueFamilyCnt)
  device.getPhysicalDeviceQueueFamilyProperties(addr queueFamilyCnt, addr queueFamilies[0])

  for i, queueFamily in queueFamilies:
    let idx = i.uint32
    if QueueFlagBits.graphics in queueFamily.queueFlags:
      result.graphicsFamily = some idx
    if result.presentFamily.isNone:
      var presentSupport: Bool32
      discard device.getPhysicalDeviceSurfaceSupportKHR(idx, surface, addr presentSupport)
      if presentSupport == Bool32.true:
        result.presentFamily = some idx
    if result.isComplete: return

proc hasExtentionSupport(device: PhysicalDevice): bool =
  var extensionCnt: uint32
  discard device.enumerateDeviceExtensionProperties(nil, addr extensionCnt, nil)
  var extensionProps = newSeq[ExtensionProperties](extensionCnt)
  discard device.enumerateDeviceExtensionProperties(nil, addr extensionCnt, addr extensionProps[0])

  for extension in deviceExtensions:
    block Is_each_extentions_supported:
      for extProp in extensionProps:
        if extension == $extProp.extensionName.cstr:
          break Is_each_extentions_supported
      return false
  return true

proc querySwapChainSupport(device: PhysicalDevice; surface: SurfaceKHR): SwapChainSupportDetails =
  discard device.getPhysicalDeviceSurfaceCapabilitiesKHR(surface, addr result.capabilities)

  block:
    var formatCnt: uint32
    discard device.getPhysicalDeviceSurfaceFormatsKHR(surface, addr formatCnt, nil)
    if formatCnt != 0:
      result.formats.setLen(formatCnt)
      discard device.getPhysicalDeviceSurfaceFormatsKHR(surface, addr formatCnt, addr result.formats[0])

  block:
    var presentModeCnt: uint32
    discard device.getPhysicalDeviceSurfacePresentModesKHR(surface, addr presentModeCnt, nil)
    if presentModeCnt != 0:
      result.presentModes.setLen(presentModeCnt)
      discard device.getPhysicalDeviceSurfacePresentModesKHR(surface, addr presentModeCnt, addr result.presentModes[0])


proc chooseSwapSurfaceFormat(availableFormats: openArray[SurfaceFormatKHR]): SurfaceFormatKHR =
  for availableFormat in availableFormats:
    if availableFormat.format == Format.b8g8r8a8Srgb and
       availableFormat.colorSpace == ColorSpaceKHR.srgbNonlinearKhr:
         return availableFormat
  return availableFormats[0]
proc chooseSwapPresentMode(availablePresentModes: openArray[PresentModeKHR]): PresentModeKHR =
  for availablePresentMode in availablePresentModes:
    if availablePresentMode == PresentModeKHR.mailboxKhr:
      return availablePresentMode
  return PresentModeKHR.fifoKhr
proc chooseSwapExtent(capabilities: SurfaceCapabilitiesKHR; window: GLFWWindow): Extent2D =
  if capabilities.currentExtent.width != uint32.high:
    return capabilities.currentExtent
  window.getFramebufferSize(cast[ptr int32](addr result.width), cast[ptr int32](addr result.height))
  result.width = result.width
    .min(capabilities.maxImageExtent.width)
    .max(capabilities.minImageExtent.width)
  result.height = result.height
    .min(capabilities.maxImageExtent.height)
    .max(capabilities.minImageExtent.height)

proc isSuitable(surface: SurfaceKHR): PhysicalDevice->bool =
  return proc(device: PhysicalDevice): bool =
    var
      deviceProperties: PhysicalDeviceProperties
      deviceFeatures: PhysicalDeviceFeatures

    device.getPhysicalDeviceProperties(addr deviceProperties)
    device.getPhysicalDeviceFeatures(addr deviceFeatures)

    if not device.findQueueFamilies(surface).isComplete or
       not device.hasExtentionSupport:
      return

    let swapChainSupport = device.querySwapChainSupport(surface)
    if swapChainSupport.formats.len == 0 or
       swapChainSupport.presentModes.len == 0:
      return

    # notice title"Find the suitable GPU: ":
    #   ($deviceProperties.deviceName.asCstring).deco(Yellow)
    return true

proc pickPhysicalDevice(instance: Instance; isSuitable: PhysicalDevice->bool): PhysicalDevice =
  var deviceCnt: uint32
  discard instance.enumeratePhysicalDevices(addr deviceCnt)
  if deviceCnt == 0:
    raiseFatalError "Failed to find GPUs with Vulkan support"
  var devices = newSeq[PhysicalDevice](deviceCnt)
  discard instance.enumeratePhysicalDevices(addr deviceCnt, addr devices[0])

  for device in devices:
    if device.isSuitable:
      return device

  raiseFatalError "Failed to find a suitable GPU"

proc createLogicalDevice(device: PhysicalDevice; queueFamilyIndices: QueueFamilyIndices): Device =
  let uniqueQueueFamilies = toHashSet [
    queueFamilyIndices.graphicsFamily.get,
    queueFamilyIndices.presentFamily.get,
    ]
  var queueCreateInfos: seq[DeviceQueueCreateInfo]
  var queuePriority = 1f
  for uniqueQueueFamily in uniqueQueueFamilies:
    queueCreateInfos.add DeviceQueueCreateInfo{
      queueFamilyIndex: uniqueQueueFamily,
      queueCount: 1,
      pQueuePriorities: addr queuePriority,}
  var deviceFeatures = PhysicalDeviceFeatures()
  var createInfo = DeviceCreateInfo{
    pQueueCreateInfos: addr queueCreateInfos[0],
    queueCreateInfoCount: queueCreateInfos.len.uint32,
    pEnabledFeatures: addr deviceFeatures,
    ppEnabledExtensionNames: deviceExtensions.allocCStringArray,
    enabledExtensionCount: deviceExtensions.len,}
  if device.createDevice(addr createInfo, nil, addr result) != success:
    raiseFatalError "Failed to create logical device"

proc createSurface(instance: Instance; window: GLFWWindow): SurfaceKHR =
  if instance.glfwCreateWindowSurface(window, nil, addr result) != success:
    raiseFatalError "Failed to create surface"

proc determineSwapMinImageCount(capabilities: SurfaceCapabilitiesKHR): uint32 =
  if capabilities.maxImageCount != 0:
    min(capabilities.minImageCount+1,
        capabilities.maxImageCount)
  else: capabilities.minImageCount+1

proc createSwapChain(device: Device;
    surface: SurfaceKHR;
    window: GLFWWindow;
    swapChainSupport: SwapChainSupportDetails;
    indices: QueueFamilyIndices): SwapchainKHR =
  let
    surfaceFormat = swapChainSupport.formats.chooseSwapSurfaceFormat
    presentMode = swapChainSupport.presentModes.chooseSwapPresentMode
    extent = swapChainSupport.capabilities.chooseSwapExtent(window)
    imageCount = swapChainSupport.capabilities.determineSwapMinImageCount

  var
    queueFamilyIndices = [indices.graphicsFamily.get, indices.presentFamily.get]
    createInfo = SwapchainCreateInfoKHR{
      surface: surface,
      minImageCount: imageCount,
      imageFormat: surfaceFormat.format,
      imageColorSpace: surfaceFormat.colorSpace,
      imageExtent: extent,
      imageArrayLayers: 1,
      imageUsage: ImageUsageFlags{colorAttachment},
      preTransform: swapChainSupport.capabilities.currentTransform,
      compositeAlpha: CompositeAlphaFlagBitsKHR.opaqueKhr,
      presentMode: presentMode,
      clipped: Bool32.true,
      imageSharingMode: SharingMode.exclusive,}

  if indices.graphicsFamily != indices.presentFamily:
    createInfo.imageSharingMode = SharingMode.concurrent
    createInfo.queueFamilyIndexCount = 2
    createInfo.pQueueFamilyIndices = addr queueFamilyIndices[0]

  if device.createSwapChainKHR(addr createInfo, nil, addr result) != success:
    raiseFatalError "Failed to create swap chain"

proc createImageViews(device: Device; images: openArray[Image]; imageFormat: Format): seq[ImageView] =
  result.setLen(images.len)
  var createInfo = ImageViewCreateInfo{
    viewType: ImageViewType.e2d,
    format: imageFormat,
    components: ComponentMapping(),
    subresourceRange: ImageSubresourceRange(
      aspectMask: ImageAspectFlags{color},
      baseMipLevel: 0,
      levelCount: 1,
      baseArrayLayer: 0,
      layerCount: 1),
    image: Image.none}
  for i, Image in images:
    createInfo.image = images[i]
    if device.createImageView(addr createInfo, nil, addr result[i]) != success:
      raiseFatalError "Failed to create image views"

proc createShaderModule(device: Device; path: string): ShaderModule =
  let code =
    if path.fileExists: path.readFile
    else: raiseFatalError "Shader \"" & path & "\" is not exists!"
  var createInfo = ShaderModuleCreateInfo{
    codeSize: uint code.len,
    pCode: cast[ptr uint32](unsafeaddr code[0])
  }
  if createShaderModule(device, addr createInfo, nil, addr result) != success:
    raiseFatalError "Failed to create shader module"

proc createRenderPass(device: Device; swapChainFormat: Format): RenderPass =
  var colorAttachment = AttachmentDescription(
    format: swapChainFormat,
    samples: SampleCountFlagBits.e1,
    loadOp: AttachmentLoadOp.clear,
    storeOp: AttachmentStoreOp.store,
    stencilLoadOp: AttachmentLoadOp.dontCare,
    stencilStoreOp: AttachmentStoreOp.dontCare,
    initialLayout: ImageLayout.undefined,
    finalLayout: ImageLayout.presentSrcKhr,
  )
  var colorAttachmentRef = AttachmentReference(
    attachment: 0,
    layout: ImageLayout.colorAttachmentOptimal,
  )
  var subpass = SubpassDescription(
    pipelineBindPoint: PipelineBindPoint.graphics,
    colorAttachmentCount: 1,
    pColorAttachments: addr colorAttachmentRef,
  )
  var dependency = SubpassDependency(
    srcSubpass: SubpassExternal,
    dstSubpass: 0,
    srcStageMask: PipelineStageFlags{colorAttachmentOutput},
    srcAccessMask: AccessFlags.none,
    dstStageMask: PipelineStageFlags{colorAttachmentOutput},
    dstAccessMask: AccessFlags{colorAttachmentWrite},
  )
  var createInfo = RenderPassCreateInfo{
    attachmentCount: 1,
    pAttachments: addr colorAttachment,
    subpassCount: 1,
    pSubpasses: addr subpass,
    dependencyCount: 1,
    pDependencies: addr dependency,
  }
  if createRenderPass(device, addr createInfo, nil, addr result) != success:
    raiseFatalError "Failed to create render pass"

proc createGraphicsPipeline(device: Device; renderPass: RenderPass; extent: Extent2D): tuple[pipeline: Pipeline; layout: PipelineLayout] =
  let vertModule = device.createShaderModule("shader/triangle.vert.spv")
  let fragModule = device.createShaderModule("shader/triangle.frag.spv")

  var vertStageCI = PipelineShaderStageCreateInfo{
    stage: ShaderStageFlagBits.vertex,
    module: vertModule,
    pName: "main",}
  var fragStageCI = PipelineShaderStageCreateInfo{
    stage: ShaderStageFlagBits.fragment,
    module: fragModule,
    pName: "main",}

  var shaderStages = [vertStageCI, fragStageCI]

  var vertexInputCreateInfo = PipelineVertexInputStateCreateInfo{
    vertexBindingDescriptionCount: 0,
    pVertexBindingDescriptions: nil,
    vertexAttributeDescriptionCount: 0,
    pVertexAttributeDescriptions: nil,}
  var inputAssemblyCreateInfo = PipelineInputAssemblyStateCreateInfo{
    topology: PrimitiveTopology.triangleList,
    primitiveRestartEnable: Bool32.false,}
  var viewport = Viewport(
    x: 0,
    y: 0,
    width: extent.width.float32,
    height: extent.height.float32,
    minDepth: 0,
    maxDepth: 1,)
  var scissor = Rect2D(
    offset: Offset2D(x: 0, y: 0),
    extent: extent,)
  var viewportCreateInfo = PipelineViewportStateCreateInfo{
    viewportCount: 1,
    pViewports: addr viewport,
    scissorCount: 1,
    pScissors: addr scissor,}

  var rasterizerCreateInfo = PipelineRasterizationStateCreateInfo{
    depthClampEnable: Bool32.false,
    rasterizerDiscardEnable: Bool32.false,
    polygonMode: PolygonMode.fill,
    lineWidth: 1.0,
    cullMode: CullModeFlags{back},
    frontFace: FrontFace.clockwise,
    depthBiasEnable: Bool32.false,
    depthBiasConstantFactor: 0,
    depthBiasClamp: 0,
    depthBiasSlopeFactor: 0,}

  var multiSampleCreateInfo = PipelineMultisampleStateCreateInfo{
    sampleShadingEnable: Bool32.false,
    rasterizationSamples: SampleCountFlagBits.e1,
    minSampleShading: 1,
    pSampleMask: nil,
    alphaToCoverageEnable: Bool32.false,
    alphaToOneEnable: Bool32.false,}

  var colorBlendAttachment = PipelineColorBlendAttachmentState(
    colorWriteMask: ColorComponentFlags{r, g, b, a},
    blendEnable: Bool32.false,
    srcColorBlendFactor: BlendFactor.one,
    dstColorBlendFactor: BlendFactor.zero,
    colorBlendOp: BlendOp.add,
    srcAlphaBlendFactor: BlendFactor.one,
    dstAlphaBlendFactor: BlendFactor.zero,
    alphaBlendOp: BlendOp.add,)
  var colorBlendCreateInfo = PipelineColorBlendStateCreateInfo{
    logicOpEnable: Bool32.false,
    logicOp: LogicOp.copy,
    attachmentCount: 1,
    pAttachments: addr colorBlendAttachment,
    blendConstants: [0'f, 0'f, 0'f, 0'f]}

  # var dynamicStates = [
  #   DynamicState.viewport,
  #   DynamicState.lineWidth,
  # ]
  # var dynamicStateCreateInfo = PipelineDynamicStateCreateInfo(
  #   sType: StructureType.pipelineDynamicStateCreateInfo,
  #   dynamicStateCount: dynamicStates.len.uint32,
  #   pDynamicStates: addr dynamicStates[0],
  # )

  var pipelineLayoutCreateInfo = PipelineLayoutCreateInfo{
    setLayoutCount: 0,
    pSetLayouts: nil,
    pushConstantRangeCount: 0,
    pPushConstantRanges: nil,}
  if device.createPipelineLayout(addr pipelineLayoutCreateInfo, nil, addr result.layout) != success:
    raiseFatalError "Failed to create pipeline layout"

  var createInfo = GraphicsPipelineCreateInfo{
    stageCount: 2,
    pStages: addr shaderStages[0],
    pVertexInputState: addr vertexInputCreateInfo,
    pInputAssemblyState: addr inputAssemblyCreateInfo,
    pViewportState: addr viewportCreateInfo,
    pRasterizationState: addr rasterizerCreateInfo,
    pMultisampleState: addr multiSampleCreateInfo,
    pDepthStencilState: nil,
    pColorBlendState: addr colorBlendCreateInfo,
    pDynamicState: nil,
    layout: result.layout,
    renderPass: renderPass,
    subpass: 0,
    basePipelineIndex: -1,}

  if device.createGraphicsPipelines(PipelineCache.none, 1, addr createInfo, nil, addr result.pipeline) != success:
    raiseFatalError "Failed to create graphics pipeline"

  device.destroyShaderModule vertModule
  device.destroyShaderModule fragModule



proc createFramebuffers(device: Device; renderPass: RenderPass; swapchainImageViews: var openArray[ImageView]; swapchainExtent: Extent2D): seq[Framebuffer] =
  result.setLen(swapchainImageViews.len)
  for i, imageView in swapchainImageViews.mpairs:

    var createInfo = FramebufferCreateInfo{
      renderPass: renderPass,
      attachmentCount: 1,
      pAttachments: addr imageView,
      width: swapchainExtent.width,
      height: swapchainExtent.height,
      layers: 1,}
    if device.createFramebuffer(addr createInfo, nil, addr result[i]) != success:
      raiseFatalError "Failed to create frame buffer"

proc createCommandPool(device: Device; indices: QueueFamilyIndices): CommandPool =
  var createInfo = CommandPoolCreateInfo{
    queueFamilyIndex: indices.graphicsFamily.get,}
  if createCommandPool(device, addr createInfo, nil, addr result) != success:
    raiseFatalError "Failed to create command pool"

proc createCommandBuffers(
      device: Device;
      commandPool: CommandPool;
      frameBuffers: openArray[Framebuffer];
    ): seq[CommandBuffer] =
  result.setLen(frameBuffers.len)
  var allocateInfo = CommandBufferAllocateInfo{
    commandPool: commandPool,
    level: CommandBufferLevel.primary,
    commandBufferCount: result.len.uint32,}
  if device.allocateCommandBuffers(addr allocateInfo, addr result[0]) != success:
    raiseFatalError "Failed to allocate command buffers"

proc recordCommandsForEach(
      commandBuffers: openArray[CommandBuffer];
      frameBuffers: openArray[Framebuffer];
      renderPass: RenderPass;
      extent: Extent2D;
      graphicsPipeline: Pipeline
    ) =
  for i, commandBuffer in commandBuffers:
    var beginInfo = CommandBufferBeginInfo{}
    if commandBuffer.beginCommandBuffer(addr beginInfo) != success:
      raiseFatalError "Failed to begin recording command buffer"
    var clearColor = ClearValue(color: ClearColorValue(float32: [0'f, 0'f, 0'f, 1'f]))
    var renderBeginInfo = RenderPassBeginInfo{
      renderPass: renderPass,
      framebuffer: frameBuffers[i],
      renderArea: Rect2D(
        offset: Offset2D(x: 0, y: 0),
        extent: extent,
      ),
      clearValueCount: 1,
      pClearValues: addr clearColor,}
    commandBuffer.cmdBeginRenderPass(addr renderBeginInfo, SubpassContents.inline)
    commandBuffer.cmdBindPipeline(PipelineBindPoint.graphics, graphicsPipeline)
    commandBuffer.cmdDraw(3, 1, 0, 0)
    commandBuffer.cmdEndRenderPass()
    if commandBuffer.endCommandBuffer() != success:
      raiseFatalError "Failed to record command buffer"

proc createSyncObjects(device: Device; swapchainImages: seq[Image]): typeof VkApp.syncObjs =
  var semaphoreCreateInfo = SemaphoreCreateInfo{}
  var fenceCreateInfo = FenceCreateInfo{
    flags: FenceCreateFlags{signaled},}
  for syncObj in result.mitems:
    if device.createSemaphore(addr semaphoreCreateInfo, nil, addr syncObj.imageAvailable) != success or
       device.createSemaphore(addr semaphoreCreateInfo, nil, addr syncObj.renderFinished) != success or
       device.createFence(addr fenceCreateInfo, nil, addr syncObj.inFlightFence)          != success:
      raiseFatalError "Failed to create synchronization objects for a frame"

proc loadVkApi(instance: Instance) =
  # instance.loadVK_KHR_surface
  instance.loadVK_KHR_swapchain

  when enableValidationLayers:
    instance.loadVK_EXT_debug_utils

proc loadVkApi(device: Device) =
  device.loadVK_KHR_swapchain

  when enableValidationLayers:
    device.loadVK_EXT_debug_utils

proc initWindow(app: VkApp) =
  echo ":::start to initialize window"
  if glfwInit(): echo "glfw has correctly initialized"
  else: raiseFatalError "failed to initialize glfw"

  template `<<=`(hint, value: int32): untyped = glfwWindowHint hint, value
  GLFWClientApi <<= GLFWNoApi
  GLFWResizable <<= Bool32.false.int32

  app.window = glfwCreateWindow(defaultWinsz.width.int32, defaultWinsz.height.int32, "vulkan")

  discard app.window.setKeyCallback proc(window: GLFWWindow; key, scancode, action, mods: int32) {.cdecl.} =
    if action == KeyStat.Press.int32 and key == Key.Escape.int32:
      window.setWindowShouldClose(true)

  app.whenFinalize:
    # app.window.destroyWindow()
    glfwTerminate()

  echo ":finish to initialize window"

proc initVulkan(app: VkApp) =
  echo ":::start to initialize vulkan api"

  let instance = createInstance()
  app.whenFinalize: instance.destroyInstance(nil)

  instance.loadVkApi

  when enableValidationLayers:
    let debugMessenger = instance.setUpDebugMessenger
    app.whenFinalize:
      instance.destroyDebugUtilsMessengerEXT(debugMessenger, nil)

  let surface = instance.createSurface(app.window)
  app.whenFinalize: instance.destroySurfaceKHR(surface, nil)

  let isSuitable = isSuitable(surface)
  let physicalDevice = instance.pickPhysicalDevice(isSuitable)

  let indices = physicalDevice.findQueueFamilies(surface)

  app.device = physicalDevice.createLogicalDevice(indices)
  app.whenFinalize: app.device.destroyDevice(nil)

  app.device.loadVkApi

  app.queues = app.device.getQueue(indices)

  let swapChainSupport = physicalDevice.querySwapChainSupport(surface)
  app.swapchain = app.device.createSwapChain(surface, app.window, swapChainSupport, indices)
  app.whenFinalize: app.device.destroySwapchainKHR(app.swapchain, nil)

  let swapchainImageFormat = swapChainSupport.formats.chooseSwapSurfaceFormat.format
  let swapchainExtent = swapChainSupport.capabilities.chooseSwapExtent(app.window)

  var imgcnt: uint32
  discard app.device.getSwapchainImagesKHR(app.swapchain, addr imgcnt, nil)
  var swapchainImages = newSeq[Image](imgcnt)
  discard app.device.getSwapchainImagesKHR(app.swapchain, addr imgcnt, addr swapchainImages[0])

  var swapchainImageViews = app.device.createImageViews(swapchainImages, swapchainImageFormat)
  app.whenFinalize:
    for imageView in swapchainImageViews:
      app.device.destroyImageView(imageView, nil)

  let renderPass = app.device.createRenderPass(swapchainImageFormat)
  app.whenFinalize: app.device.destroyRenderPass(renderPass, nil)

  var (graphicsPipeline, pipelineLayout) = app.device.createGraphicsPipeline(renderPass, swapchainExtent)
  app.whenFinalize:
    app.device.destroyPipeline(graphicsPipeline, nil)
    app.device.destroyPipelineLayout(pipelineLayout, nil)

  let swapchainFramebuffers = app.device.createFramebuffers(renderPass,
    swapchainImageViews, swapchainExtent)
  app.whenFinalize:
    for frameBuffer in swapchainFramebuffers:
      app.device.destroyFramebuffer(frameBuffer, nil)

  let commandPool = app.device.createCommandPool(indices)
  app.whenFinalize: app.device.destroyCommandPool(commandPool, nil)

  app.commandBuffers = app.device.createCommandBuffers(
    commandPool,
    swapchainFramebuffers,
    )
  app.commandBuffers.recordCommandsForEach(
    swapchainFramebuffers,
    renderPass,
    swapchainExtent,
    graphicsPipeline,
    )

  app.syncObjs = app.device.createSyncObjects(swapchainImages)
  app.whenFinalize:
    for syncObj in app.syncObjs:
      app.device.destroySemaphore(syncObj.imageAvailable, nil)
      app.device.destroySemaphore(syncObj.renderFinished, nil)
      app.device.destroyFence(syncObj.inFlightFence, nil)

  app.imagesInFlight.setLen(swapchainImages.len)

  echo ":finish to initialize vulkan api"

proc drawFrame(app: VkApp; currentFrame: range[0..maxFramesInFlight-1]) =
  discard app.device.waitForFences(1, addr app.syncObjs[currentFrame].inFlightFence, Bool32.true, uint64.high)

  var imageIdx: uint32
  discard app.device.acquireNextImageKHR(app.swapchain, uint64.high, app.syncObjs[currentFrame].imageAvailable, Fence.none, addr imageIdx)

  if not app.imagesInFlight[imageIdx].isNone:
    discard app.device.waitForFences(1, addr app.imagesInFlight[imageIdx], Bool32.true, uint64.high)
  app.imagesInFlight[imageIdx] = app.syncObjs[currentFrame].inFlightFence

  var waitSemaphores = [app.syncObjs[currentFrame].imageAvailable]
  var waitStage = PipelineStageFlags{colorAttachmentOutput}
  var signalSemaphores = [app.syncObjs[currentFrame].renderFinished]
  var submitInfo = SubmitInfo{
    waitSemaphoreCount: 1,
    pWaitSemaphores: addr waitSemaphores[0],
    pWaitDstStageMask: addr waitStage,
    commandBufferCount: 1,
    pCommandBuffers: addr app.commandBuffers[imageIdx],
    signalSemaphoreCount: 1,
    pSignalSemaphores: addr signalSemaphores[0],}

  discard app.device.resetFences(1, addr app.syncObjs[currentFrame].inFlightFence)

  if app.queues.graphics.queueSubmit(1, addr submitInfo, app.syncObjs[currentFrame].inFlightFence) != success:
    raiseFatalError "Failed to submit draw command buffer"

  var swapchains = [app.swapchain]
  var presentInfo = PresentInfoKHR{
    waitSemaphoreCount: 1,
    pWaitSemaphores: addr signalSemaphores[0],
    swapchainCount: swapchains.len.uint32,
    pSwapchains: addr swapchains[0],
    pImageIndices: addr imageIdx,
    pResults: nil,}
  discard app.queues.present.queuePresentKHR(addr presentInfo)
  discard app.queues.present.queueWaitIdle

proc setUpMainLoop(app: VkApp) =
  var currentFrame: range[0..maxFramesInFlight-1]

  block setUpMainLoop:
    app.frame:
      glfwPollEvents()
      app.drawFrame(currentFrame)
      currentFrame = currentFrame.succ(1) mod maxFramesInFlight

proc mainLoop(app: VkApp) =
  echo: ":::start mainloop"
  while not app.window.windowShouldClose:
    app.tick
  discard app.device.deviceWaitIdle
  echo: ":finish mainloop"

proc run*(app: VkApp) =
  app.initWindow()
  app.initVulkan()
  app.setUpMainLoop()
  app.mainLoop()

proc main*() =
  var app = new VkApp
  # try:
  app.run()
  # except fatalError:
  #   fatal: getCurrentExceptionMsg()
  #   echo "Fatal Error has occured! messages:"
  #   echo getCurrentExceptionMsg()
  #   echo "See log file for details."
  #   app.resourcemanager.free()
  #   quit(QuitFailure)

  quit(QuitSuccess)

main()