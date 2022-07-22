import std/times
from std/os import fileExists

import vulkan
import vkfw
import vkm

# Configuration
const enableValidationLayers =
  not defined(noValidation) and not defined(release)

proc clamp*(x, a, b: Extent2D): Extent2D = Extent2D(
  width: x.width.clamp(a.width, b.width),
  height: x.height.clamp(a.height, b.height),)

const windowInitSize = Extent2D(width: 640, height: 480)

when enableValidationLayers:
  const debugLayer = [ "VK_LAYER_KHRONOS_validation" ]
  # Debug callback
  proc debugCallback(
        messageSeverity: DebugUtilsMessageSeverityFlagBitsEXT;
        messageTypes: DebugUtilsMessageTypeFlagsEXT;
        pCallbackData: ptr DebugUtilsMessengerCallbackDataEXT;
        pUserData: pointer;
      ): Bool32 {.cdecl.} =
    echo pCallbackData.pMessage

# Vertex layout
type Vertex = object
  pos: array[3, float32]
  color: array[3, float32]


# NOTE: support swap chain recreation (not only required for resized windows!)
# NOTE: window resize may not result in Vulkan telling that the swap chain should be recreated, should be handled explicitly!

var window: GLFWWindow

var windowResized = false
proc onWindowResized(window: GLFWWindow; width, height: int32) {.cdecl.} =
  windowResized = true

when enableValidationLayers:
  var messenger: DebugUtilsMessengerEXT
var
  instance: Instance
  windowSurface: SurfaceKHR
  physicalDevice: PhysicalDevice
  device: Device
  graphicsQueue: Queue
  presentQueue: Queue
  deviceMemoryProperties: PhysicalDeviceMemoryProperties
  imageAvailableSemaphore: Semaphore
  renderingFinishedSemaphore: Semaphore

  vertexBuffer: Buffer
  vertexBufferMemory: DeviceMemory
  indexBuffer: Buffer
  indexBufferMemory: DeviceMemory
  vertexBindingDescription: VertexInputBindingDescription
  vertexAttributeDescriptions: seq[VertexInputAttributeDescription]

  uniformBufferData: tuple[
    transformationMatrix: Mat[4,4,float32]
  ]
  uniformBuffer: Buffer
  uniformBufferMemory: DeviceMemory
  descriptorSetLayout: DescriptorSetLayout
  descriptorPool: DescriptorPool
  descriptorSet: DescriptorSet

  swapchain: tuple[
    extent: Extent2D,
    format: Format,
    old: SwapchainKHR,
    current: SwapchainKHR,
    images: seq[Image],
    imageViews: seq[ImageView],
    framebuffers: seq[Framebuffer],
  ]

  renderPass: RenderPass
  graphicsPipeline: Pipeline
  pipelineLayout: PipelineLayout

  commandPool {.queues: QueueFlags{graphics}.}: CommandPool
  graphicsCommandBuffers: seq[CommandBuffer]

  graphicsQueueFamily: uint32
  presentQueueFamily: uint32

  timeStart = times.now()

  matrices = (
    model: mat4[float32](1),
    view: (mat: mat4[float32](1), needsUpdate: true),
    proj: (mat: mat4[float32](1), needsUpdate: true),
  )


proc aspect(e: Extent2D): float32 = (e.width.float32) / (e.height.float32)

template sendData(device: Device; memory: DeviceMemory; data: untyped) =
  var devicedata: pointer
  discard device.mapMemory(memory, DeviceSize(0), DeviceSize sizeof data, MemoryMapFlags.none, addr devicedata)
  copyMem(devicedata, unsafeaddr data, sizeof data)
  device.unmapMemory(memory)

#  Find device memory that is supported by the requirements (typeBits) and meets the desired properties
proc getMemoryType(typeBits: uint32, properties: Flags, typeIndex: ptr uint32): Bool32 =
  var typeBits = typeBits
  for i in 0'u32..<32:
    if (typeBits and 1) == 1:
      if (deviceMemoryProperties.memoryTypes[i].propertyFlags and properties) == properties:
        typeIndex[] = i
        return Bool32.true
    typeBits = typeBits shr 1
  return Bool32.false

proc updateUniformData =
  #  Rotate based on time
  let msDur = (times.now() - timeStart).inMilliseconds
  let angle = (msDur mod 4000).float32 / 4000f32 * 2*PI.rad32

  matrices.model = poseMatrix(
    translate = [0.5f32/3, -0.5f32/3, 0],
    rotate = NQuat[float32].rotateZ(angle))

  #  Set up view
  if matrices.view.needsUpdate:
    matrices.view.mat = lookAt([0f,1,1], [0f,0,0], /![0f,0,1])
    matrices.view.needsUpdate = false
    echo "VIEW MATRIX:"
    echo matrices.view.mat

  #  Set up projection
  if matrices.proj.needsUpdate:
    matrices.proj.mat = perspective(70'deg32.rad, swapchain.extent.aspect, 0.1, 10)
    matrices.proj.needsUpdate = false
    echo "PROJECTION MATRIX:"
    echo matrices.proj.mat

  let mvp = matrices.proj.mat * matrices.view.mat * matrices.model
  uniformBufferData.transformationMatrix = mvp

  device.sendData(uniformBufferMemory, uniformBufferData)

proc chooseSurfaceFormat(availableFormats: seq[SurfaceFormatKHR]): SurfaceFormatKHR =
  #  We can either choose any format
  if availableFormats.len == 1 and availableFormats[0].format == Format.undefined:
    return SurfaceFormatKHR{
      format: Format.r8g8b8a8Unorm,
      colorSpace: ColorspaceKHR.srgbNonlinearKHR,}

  #  Or go with the standard format - if available
  for availableSurfaceFormat in availableFormats:
    if availableSurfaceFormat.format == Format.r8g8b8a8Unorm:
      return availableSurfaceFormat

  #  Or fall back to the first available one
  return availableFormats[0]

proc chooseSwapExtent(surfaceCapabilities: ptr SurfaceCapabilitiesKHR): Extent2D =
  if surfaceCapabilities.currentExtent.width == uint32.high:
    swapchain.extent = windowInitSize.clamp(surfaceCapabilities.minImageExtent, surfaceCapabilities.maxImageExtent)
    swapchain.extent
  else: surfaceCapabilities.currentExtent

proc choosePresentMode(presentModes: seq[PresentModeKHR]): PresentModeKHR =
  for presentMode in presentModes:
    if presentMode == PresentModeKHR.mailboxKHR:
      return presentMode

  #  If mailbox is unavailable, fall back to FIFO (guaranteed to be available)
  return PresentModeKHR.fifoKHR

proc createInstance =
  var appInfo = ApplicationInfo{
    pApplicationName: "VulkanClear",
    applicationVersion: uint32 makeApiVersion(0, 1, 0, 0),
    pEngineName: "ClearScreenEngine",
    engineVersion: uint32 makeApiVersion(0, 1, 0, 0),
    apiVersion: apiVersion10,}

  #  Get instance extensions required by GLFW to draw to window
  var glfwExtensionCount: uint32
  let glfwExtensions = glfwGetRequiredInstanceExtensions(addr glfwExtensionCount)

  var extensions = glfwExtensions.cstringArrayToSeq(glfwExtensionCount)

  when enableValidationLayers:
    extensions.add(ExtDebugUtilsExtensionName)

  #  Check for extensions
  var extensionCount: uint32
  discard enumerateInstanceExtensionProperties(nil, addr extensionCount)

  if extensionCount == 0:
    quit "no extensions supported!"

  var availableExtensions = newSeq[ExtensionProperties](extensionCount)
  discard enumerateInstanceExtensionProperties(nil, addr extensionCount, addr availableExtensions[0])

  echo "supported extensions:"
  for availableExtension in availableExtensions:
    echo "* ", cast[cstring](unsafeAddr availableExtension.extensionName)

  var createInfo = InstanceCreateInfo{
    pApplicationInfo: addr appInfo,
    enabledExtensionCount: extensions.len.uint32,
    ppEnabledExtensionNames: extensions.allocCStringArray,}

  when enableValidationLayers:
    createInfo.enabledLayerCount = 1
    createInfo.ppEnabledLayerNames = debugLayer.allocCStringArray

  #  Initialize Vulkan instance
  if createInstance(addr createInfo, nil, addr instance) != success:
    quit "failed to create instance!"
  else:
    echo "created vulkan instance"

proc loadInstanceCommands =
  instance.loadCommands:
    getSwapchainImagesKHR
    acquireNextImageKHR
    queuePresentKHR
  when enableValidationLayers:
    instance.loadCommands:
      createDebugUtilsMessengerEXT
      destroyDebugUtilsMessengerEXT

proc createDebugCallback =
  when enableValidationLayers:
    var createInfo = DebugUtilsMessengerCreateInfoEXT{
    messageSeverity: DebugUtilsMessageSeverityFlagsEXT{errorEXT, warningEXT},
    messageType: DebugUtilsMessageTypeFlagsEXT.all,
    pfnUserCallback: debugCallback,
    }

    if instance.createDebugUtilsMessengerEXT(addr createInfo, nil, addr messenger) != success:
      quit "failed to create debug callback"
    else:
      echo "created debug callback"
  else:
    echo "skipped creating debug callback"

proc createWindowSurface =
  if instance.glfwCreateWindowSurface(window, nil, addr windowSurface) != success:
    quit "failed to create window surface!"
  echo "created window surface"

proc findPhysicalDevice =
  #  Try to find 1 Vulkan supported device
  #  NOTE: perhaps refactor to loop through devices and find first one that supports all required features and extensions
  var deviceCount: uint32
  if instance.enumeratePhysicalDevices(addr deviceCount) != success or deviceCount == 0:
    quit "failed to get number of physical devices"

  deviceCount = 1
  let res = instance.enumeratePhysicalDevices(addr deviceCount, addr physicalDevice)
  if res notin [success, incomplete]:
    quit "enumerating physical devices failed!"

  if deviceCount == 0:
    quit "no physical devices that support vulkan!"

  echo "physical device with vulkan support found"

  #  Check device features
  #  NOTE: will apiVersion >= appInfo.apiVersion? Probably yes, but spec is unclear.
  var deviceProperties: PhysicalDeviceProperties
  var deviceFeatures: PhysicalDeviceFeatures
  physicalDevice.getPhysicalDeviceProperties(addr deviceProperties)
  physicalDevice.getPhysicalDeviceFeatures(addr deviceFeatures)

  let supportedVersion = [
    apiVersionMajor(deviceProperties.apiVersion),
    apiVersionMinor(deviceProperties.apiVersion),
    apiVersionPatch(deviceProperties.apiVersion)
  ]

  echo "physical device supports version ", supportedVersion[0], ".", supportedVersion[1], ".", supportedVersion[2]

proc checkSwapChainSupport =
  var extensionCount: uint32
  discard physicalDevice.enumerateDeviceExtensionProperties(nil, addr extensionCount)

  if extensionCount == 0:
    quit "physical device doesn't support any extensions"

  var deviceExtensions = newSeq[ExtensionProperties](extensionCount)
  discard physicalDevice.enumerateDeviceExtensionProperties(nil, addr extensionCount, addr deviceExtensions[0])

  for extension in deviceExtensions:
    if $cast[cstring](unsafeAddr extension.extensionName) == KhrSwapchainExtensionName:
      echo "physical device supports swap chains"
      return

  quit "physical device doesn't support swap chains"

proc findQueueFamilies =
  #  Check queue families
  var queueFamilyCount: uint32
  physicalDevice.getPhysicalDeviceQueueFamilyProperties(addr queueFamilyCount)

  if queueFamilyCount == 0:
    quit "physical device has no queue families!"

  #  Find queue family with graphics support
  #  NOTE: is a transfer queue necessary to copy vertices to the gpu or can a graphics queue handle that?
  var queueFamilies = newSeq[QueueFamilyProperties](queueFamilyCount)
  physicalDevice.getPhysicalDeviceQueueFamilyProperties(addr queueFamilyCount, addr queueFamilies[0])

  echo "physical device has ", queueFamilyCount, " queue families"

  var foundGraphicsQueueFamily: bool
  var foundPresentQueueFamily: bool

  for i in 0'u32..<queueFamilyCount:
    var presentSupport: Bool32
    discard physicalDevice.getPhysicalDeviceSurfaceSupportKHR(i, windowSurface, addr presentSupport)

    if queueFamilies[i].queueCount > 0 and QueueFlagBits.graphics in queueFamilies[i].queueFlags:
      graphicsQueueFamily = i
      foundGraphicsQueueFamily = true

      if presentSupport == Bool32.true:
        presentQueueFamily = i
        foundPresentQueueFamily = true
        break

    if not foundPresentQueueFamily and presentSupport == Bool32.true:
      presentQueueFamily = i
      foundPresentQueueFamily = true

  if foundGraphicsQueueFamily:
    echo "queue family #", graphicsQueueFamily, " supports graphics"

    if foundPresentQueueFamily:
      echo "queue family #", presentQueueFamily, " supports presentation"
    else:
      quit "could not find a valid queue family with present support"
  else:
    quit "could not find a valid queue family with graphics support"

proc createLogicalDevice =
  #  Greate one graphics queue and optionally a separate presentation queue
  var queuePriority = 1'f32

  var queueCreateInfo = [
    DeviceQueueCreateInfo{
      queueFamilyIndex: graphicsQueueFamily,
      queueCount: 1,
      pQueuePriorities: addr queuePriority,},
    DeviceQueueCreateInfo{
      queueFamilyIndex: presentQueueFamily,
      queueCount: 1,
      pQueuePriorities: addr queuePriority,},]

  #  Create logical device from physical device
  #  NOTE: there are separate instance and device extensions!
  var deviceCreateInfo = DeviceCreateInfo{
    pQueueCreateInfos: addr queueCreateInfo[0],
    queueCreateInfoCount:
      if graphicsQueueFamily == presentQueueFamily: 1
      else:                                         2}


  #  Necessary for shader (for some reason)
  var enabledFeatures = PhysicalDeviceFeatures(
    shaderClipDistance: Bool32.true,
    shaderCullDistance: Bool32.true,
  )

  var deviceExtensions = [KhrSwapchainExtensionName]
  deviceCreateInfo.enabledExtensionCount = 1
  deviceCreateInfo.ppEnabledExtensionNames = deviceExtensions.allocCStringArray
  deviceCreateInfo.pEnabledFeatures = addr enabledFeatures

  when enableValidationLayers:
    deviceCreateInfo.enabledLayerCount = 1
    deviceCreateInfo.ppEnabledLayerNames = debugLayer.allocCStringArray

  if physicalDevice.createDevice(addr deviceCreateInfo, nil, addr device) != success:
    quit "failed to create logical device"

  echo "created logical device"

  #  Get graphics and presentation queues (which may be the same)
  device.getDeviceQueue(graphicsQueueFamily, 0, addr graphicsQueue)
  device.getDeviceQueue(presentQueueFamily, 0, addr presentQueue)

  echo "acquired graphics and presentation queues"

  physicalDevice.getPhysicalDeviceMemoryProperties(addr deviceMemoryProperties)

proc createSemaphores =
  var createInfo = SemaphoreCreateInfo{}

  if device.createSemaphore(addr createInfo, nil, addr imageAvailableSemaphore) != success or
    device.createSemaphore(addr createInfo, nil, addr renderingFinishedSemaphore) != success:
    quit "failed to create semaphores"
  else:
    echo "created semaphores"

proc createCommandPool =
  #  Create graphics command pool
  var poolCreateInfo = CommandPoolCreateInfo{
    queueFamilyIndex: graphicsQueueFamily,}

  if device.createCommandPool(addr poolCreateInfo, nil, addr commandPool) != success:
    quit "failed to create command queue for graphics queue family"
  else:
    echo "created command pool for graphics queue family"

proc createVertexBuffer =
  #  Setup vertices
  let vertices = [
    Vertex(pos: [-0.5f32,  0.5,  0], color: [1f32, 0, 0]),
    Vertex(pos: [-0.5f32, -0.5,  0], color: [0f32, 1, 0]),
    Vertex(pos: [ 0.5f32,  0.5,  0], color: [0f32, 0, 1])
  ]
  let verticesSize = DeviceSize vertices.len * sizeof Vertex

  #  Setup indices
  let indices = [0u32, 1, 2]
  let indicesSize = DeviceSize indices.len * sizeof indices[0]

  var memReqs: MemoryRequirements

  type StagingBuffer = object
    memory: DeviceMemory
    buffer: Buffer

  var stagingBuffers: tuple[ vertices, indices: StagingBuffer ]

  #  Allocate command buffer for copy operation
  var cmdBufInfo = CommandBufferAllocateInfo{
    commandPool: commandPool,
    level: CommandBufferLevel.primary,
    commandBufferCount: 1,}

  var copyCommandBuffer: CommandBuffer
  discard device.allocateCommandBuffers(addr cmdBufInfo, addr copyCommandBuffer)

  #  First copy vertices to host accessible vertex buffer memory
  var vertexBufferInfo = BufferCreateInfo{
    size: verticesSize,
    usage: BufferUsageFlags{transferSrc},
    sharingMode: SharingMode.exclusive,}

  discard device.createBuffer(addr vertexBufferInfo, nil, addr stagingBuffers.vertices.buffer)

  var memAlloc = MemoryAllocateInfo(sType: StructureType.memoryAllocateInfo)

  device.getBufferMemoryRequirements(stagingBuffers.vertices.buffer, addr memReqs)
  memAlloc.allocationSize = memReqs.size
  discard getMemoryType(memReqs.memoryTypeBits, MemoryPropertyFlags{hostVisible}, addr memAlloc.memoryTypeIndex)
  discard device.allocateMemory(addr memAlloc, nil, addr stagingBuffers.vertices.memory)

  device.sendData(stagingBuffers.vertices.memory, vertices)
  discard device.bindBufferMemory(stagingBuffers.vertices.buffer, stagingBuffers.vertices.memory, DeviceSize(0))

  #  Then allocate a gpu only buffer for vertices
  vertexBufferInfo.usage = BufferUsageFlags{vertexBuffer, transferDst}
  discard device.createBuffer(addr vertexBufferInfo, nil, addr vertexBuffer)
  device.getBufferMemoryRequirements(vertexBuffer, addr memReqs)
  memAlloc.allocationSize = memReqs.size
  discard getMemoryType(memReqs.memoryTypeBits, MemoryPropertyFlags{deviceLocal}, addr memAlloc.memoryTypeIndex)
  discard device.allocateMemory(addr memAlloc, nil, addr vertexBufferMemory)
  discard device.bindBufferMemory(vertexBuffer, vertexBufferMemory, DeviceSize(0))

  #  Next copy indices to host accessible index buffer memory
  var indexBufferInfo = BufferCreateInfo{
    size: indicesSize,
    usage: BufferUsageFlags{transferSrc},
    sharingMode: SharingMode.exclusive,}

  discard device.createBuffer(addr indexBufferInfo, nil, addr stagingBuffers.indices.buffer)
  device.getBufferMemoryRequirements(stagingBuffers.indices.buffer, addr memReqs)
  memAlloc.allocationSize = memReqs.size
  discard getMemoryType(memReqs.memoryTypeBits, MemoryPropertyFlags{hostVisible}, addr memAlloc.memoryTypeIndex)
  discard device.allocateMemory(addr memAlloc, nil, addr stagingBuffers.indices.memory)
  device.sendData(stagingBuffers.indices.memory, indices)
  discard device.bindBufferMemory(stagingBuffers.indices.buffer, stagingBuffers.indices.memory, DeviceSize(0))

  #  And allocate another gpu only buffer for indices
  indexBufferInfo.usage = BufferUsageFlags{ indexBuffer, transferDst }
  discard device.createBuffer(addr indexBufferInfo, nil, addr indexBuffer)
  device.getBufferMemoryRequirements(indexBuffer, addr memReqs)
  memAlloc.allocationSize = memReqs.size
  discard getMemoryType(memReqs.memoryTypeBits, MemoryPropertyFlags{deviceLocal}, addr memAlloc.memoryTypeIndex)
  discard device.allocateMemory(addr memAlloc, nil, addr indexBufferMemory)
  discard device.bindBufferMemory(indexBuffer, indexBufferMemory, DeviceSize(0))

  #  Now copy data from host visible buffer to gpu only buffer
  var bufferBeginInfo = CommandBufferBeginInfo{
    flags: CommandBufferUsageFlags{oneTimeSubmit} }

  discard copyCommandBuffer.beginCommandBuffer(addr bufferBeginInfo)

  var copyRegion: BufferCopy
  copyRegion.size = verticesSize
  copyCommandBuffer.cmdCopyBuffer(stagingBuffers.vertices.buffer, vertexBuffer, 1, addr copyRegion)
  copyRegion.size = indicesSize
  copyCommandBuffer.cmdCopyBuffer(stagingBuffers.indices.buffer, indexBuffer, 1, addr copyRegion)

  discard endCommandBuffer copyCommandBuffer

  #  Submit to queue
  var submitInfo = SubmitInfo{
    commandBufferCount: 1,
    pCommandBuffers: addr copyCommandBuffer,}

  discard graphicsQueue.queueSubmit(1, addr submitInfo)
  discard queueWaitIdle graphicsQueue
  device.freeCommandBuffers(commandPool, 1, addr copyCommandBuffer)

  device.destroyBuffer(stagingBuffers.vertices.buffer)
  device.freeMemory(stagingBuffers.vertices.memory)
  device.destroyBuffer(stagingBuffers.indices.buffer)
  device.freeMemory(stagingBuffers.indices.memory)

  echo "set up vertex and index buffers"

  #  Binding and attribute descriptions
  vertexBindingDescription.binding = 0
  vertexBindingDescription.stride = uint32 sizeof vertices[0]
  vertexBindingDescription.inputRate = VertexInputRate.vertex

  #  vec2 position
  vertexAttributeDescriptions.setLen(2)
  vertexAttributeDescriptions[0].binding = 0
  vertexAttributeDescriptions[0].location = 0
  vertexAttributeDescriptions[0].format = Format.r32g32b32Sfloat

  #  vec3 color
  vertexAttributeDescriptions[1].binding = 0
  vertexAttributeDescriptions[1].location = 1
  vertexAttributeDescriptions[1].format = Format.r32g32b32Sfloat
  vertexAttributeDescriptions[1].offset = sizeof(float) * 3

proc createUniformBuffer =
  var bufferInfo = BufferCreateInfo{
    size: DeviceSize sizeof uniformBufferData,
    usage: BufferUsageFlags{uniformBuffer},
    sharingMode: SharingMode.exclusive,}

  discard device.createBuffer(addr bufferInfo, nil, addr uniformBuffer)

  var memReqs: MemoryRequirements
  device.getBufferMemoryRequirements(uniformBuffer, addr memReqs)

  var allocInfo = MemoryAllocateInfo(sType: StructureType.memoryAllocateInfo)
  allocInfo.allocationSize = memReqs.size
  discard getMemoryType(memReqs.memoryTypeBits, MemoryPropertyFlags{hostVisible}, addr allocInfo.memoryTypeIndex)

  discard device.allocateMemory(addr allocInfo, nil, addr uniformBufferMemory)
  discard device.bindBufferMemory(uniformBuffer, uniformBufferMemory, DeviceSize(0))

  updateUniformData()

proc createSwapChain =
  #  Find surface capabilities
  var surfaceCapabilities: SurfaceCapabilitiesKHR
  if physicalDevice.getPhysicalDeviceSurfaceCapabilitiesKHR(windowSurface, addr surfaceCapabilities) != success:
    quit "failed to acquire presentation surface capabilities"

  #  Find supported surface formats
  var formatCount: uint32
  if physicalDevice.getPhysicalDeviceSurfaceFormatsKHR(windowSurface, addr formatCount) != success or formatCount == 0:
    quit "failed to get number of supported surface formats"

  var surfaceFormats = newSeq[SurfaceFormatKHR](formatCount)
  if physicalDevice.getPhysicalDeviceSurfaceFormatsKHR(windowSurface, addr formatCount, addr surfaceFormats[0]) != success:
    quit "failed to get supported surface formats"

  #  Find supported present modes
  var presentModeCount: uint32
  if physicalDevice.getPhysicalDeviceSurfacePresentModesKHR(windowSurface, addr presentModeCount) != success or presentModeCount == 0:
    quit "failed to get number of supported presentation modes"

  var presentModes = newSeq[PresentModeKHR](presentModeCount)
  if physicalDevice.getPhysicalDeviceSurfacePresentModesKHR(windowSurface, addr presentModeCount, addr presentModes[0]) != success:
    quit "failed to get supported presentation modes"

  #  Determine number of images for swap chain
  var imageCount: uint32 = surfaceCapabilities.minImageCount + 1
  if surfaceCapabilities.maxImageCount != 0 and imageCount > surfaceCapabilities.maxImageCount:
    imageCount = surfaceCapabilities.maxImageCount

  echo "using ", imageCount, " images for swap chain"

  #  Select a surface format
  var surfaceFormat = chooseSurfaceFormat(surfaceFormats)

  #  Select swap chain size
  swapchain.extent = chooseSwapExtent(addr surfaceCapabilities)

  #  Determine transformation to use (preferring no transform)
  var surfaceTransform =
    if SurfaceTransformFlagBitsKHR.identityKHR in surfaceCapabilities.supportedTransforms:
      SurfaceTransformFlagBitsKHR.identityKHR
    else:
      surfaceCapabilities.currentTransform

  #  Choose presentation mode (preferring MAILBOX ~= triple buffering)
  var presentMode = choosePresentMode(presentModes)

  #  Finally, create the swap chain
  var createInfo = SwapchainCreateInfoKHR{
    surface: windowSurface,
    minImageCount: imageCount,
    imageFormat: surfaceFormat.format,
    imageColorSpace: surfaceFormat.colorSpace,
    imageExtent: swapchain.extent,
    imageArrayLayers: 1,
    imageUsage: ImageUsageFlags{colorAttachment},
    imageSharingMode: SharingMode.exclusive,
    queueFamilyIndexCount: 0,
    pQueueFamilyIndices: nil,
    preTransform: surfaceTransform,
    compositeAlpha: CompositeAlphaFlagBitsKHR.opaqueKHR,
    presentMode: presentMode,
    clipped: Bool32.true,
    oldSwapchain: swapchain.old,}

  if device.createSwapchainKHR(addr createInfo, nil, addr swapchain.current) != success:
    quit "failed to create swap chain"
  else:
    echo "created swap chain"

  if not swapchain.old.isNone:
    device.destroySwapchainKHR(swapchain.old, nil)
  swapchain.old = swapchain.current

  swapchain.format = surfaceFormat.format

  #  Store the images used by the swap chain
  #  NOTE: these are the images that swap chain image indices refer to
  #  NOTE: actual number of images may differ from requested number, since it's a lower bound
  var actualImageCount: uint32
  if device.getSwapchainImagesKHR(swapchain.current, addr actualImageCount) != success or actualImageCount == 0:
    quit "failed to acquire number of swap chain images"

  swapchain.images.setLen(actualImageCount)

  if device.getSwapchainImagesKHR(swapchain.current, addr actualImageCount, addr swapchain.images[0]) != success:
    quit "failed to acquire swap chain images"

  echo "acquired swap chain images"

proc createRenderPass =
  var attachmentDescription = AttachmentDescription{
    format: swapchain.format,
    samples: SampleCountFlagBits.e1,
    loadOp: AttachmentLoadOp.clear,
    storeOp: AttachmentStoreOp.store,
    stencilLoadOp: AttachmentLoadOp.dontCare,
    stencilStoreOp: AttachmentStoreOp.dontCare,
    initialLayout: ImageLayout.presentSrcKHR,
    finalLayout: ImageLayout.presentSrcKHR,}

  #  NOTE: hardware will automatically transition attachment to the specified layout
  #  NOTE: index refers to attachment descriptions array
  var colorAttachmentReference = AttachmentReference{
    attachment: 0,
    layout: ImageLayout.colorAttachmentOptimal,}

  #  NOTE: this is a description of how the attachments of the render pass will be used in this sub pass
  #  e.g. if they will be read in shaders and/or drawn to
  var subPassDescription = SubpassDescription{
    pipelineBindPoint: PipelineBindPoint.graphics,
    colorAttachmentCount: 1,
    pColorAttachments: addr colorAttachmentReference,}

  #  Create the render pass
  var createInfo = RenderPassCreateInfo{
    attachmentCount: 1,
    pAttachments: addr attachmentDescription,
    subpassCount: 1,
    pSubpasses: addr subPassDescription,}

  if device.createRenderPass(addr createInfo, nil, addr renderPass) != success:
    quit "failed to create render pass"
  else:
    echo "created render pass"

proc createImageViews =
  swapchain.imageViews.setLen(swapchain.images.len)

  #  Create an image view for every image in the swap chain
  for i in 0..<swapchain.images.len:
    var createInfo = ImageViewCreateInfo{
      image: swapchain.images[i],
      viewType: ImageViewType.e2D,
      format: swapchain.format,
      components: ComponentMapping(),
      subresourceRange: ImageSubresourceRange(
        aspectMask: ImageAspectFlags{coLor},
        baseMipLevel: 0,
        levelCount: 1,
        baseArrayLayer: 0,
        layerCount: 1),}

    if device.createImageView(addr createInfo, nil, addr swapchain.imageViews[i]) != success:
      quit "failed to create image view for swap chain image #" & $i

  echo "created image views for swap chain images"

proc createFramebuffers =
  swapchain.framebuffers.setLen(swapchain.images.len)

  #  NOTE: Framebuffer is basically a specific choice of attachments for a render pass
  #  That means all attachments must have the same dimensions, interesting restriction
  for i in 0..<swapchain.images.len:
    var createInfo = FramebufferCreateInfo{
      renderPass: renderPass,
      attachmentCount: 1,
      pAttachments: addr swapchain.imageViews[i],
      width: swapchain.extent.width,
      height: swapchain.extent.height,
      layers: 1,}

    if device.createFramebuffer(addr createInfo, nil, addr swapchain.framebuffers[i]) != success:
      quit "failed to create framebuffer for swap chain image view #" & $i

  echo "created framebuffers for swap chain image views"

proc createShaderModule(filename: string): ShaderModule =
  var shadersrc =
    if filename.fileExists: filename.readFile
    else: quit filename & " is not exists!"

  var createInfo = ShaderModuleCreateInfo{
    codeSize: uint32 shadersrc.len,
    pCode: cast[ptr uint32](addr shadersrc[0]),}

  var shader: ShaderModule
  var res = device.createShaderModule(addr createInfo, nil, addr shader)
  if res != success:
    quit "failed to create shader module for " & filename & " code: " & $res

  echo "created shader module for ", filename
  return shader


proc createGraphicsPipeline =
  var vertexShaderModule = createShaderModule("shaders/vert.spv")
  var fragmentShaderModule = createShaderModule("shaders/frag.spv")

  #  Set up shader stage info

  var shaderStages = [
    PipelineShaderStageCreateInfo{
      stage: ShaderStageFlagBits.vertex,
      module: vertexShaderModule,
      pName: "main",},
    PipelineShaderStageCreateInfo{
      stage: ShaderStageFlagBits.fragment,
      module: fragmentShaderModule,
      pName: "main",},]

  #  Describe vertex input
  var vertexInputCreateInfo = PipelineVertexInputStateCreateInfo{
    vertexBindingDescriptionCount: 1,
    pVertexBindingDescriptions: addr vertexBindingDescription,
    vertexAttributeDescriptionCount: uint32 vertexAttributeDescriptions.len,
    pVertexAttributeDescriptions: addr vertexAttributeDescriptions[0],}

  #  Describe input assembly
  var inputAssemblyCreateInfo = PipelineInputAssemblyStateCreateInfo{
    topology: PrimitiveTopology.triangleList,
    primitiveRestartEnable: Bool32.false,}

  #  Describe viewport and scissor
  var viewport = Viewport{
    x: 0,
    y: 0,
    width: float32 swapchain.extent.width,
    height: float32 swapchain.extent.height,
    minDepth: 0,
    maxDepth: 1,}

  var scissor = Rect2D{
    offset: Offset2D(x: 0, y: 0),
    extent: swapchain.extent,}

  #  NOTE: scissor test is always enabled (although dynamic scissor is possible)
  #  Number of viewports must match number of scissors
  var viewportCreateInfo = PipelineViewportStateCreateInfo{
    viewportCount: 1,
    pViewports: addr viewport,
    scissorCount: 1,
    pScissors: addr scissor,}

  #  Describe rasterization
  #  NOTE: depth bias and using polygon modes other than fill require changes to logical device creation (device features)
  var rasterizationCreateInfo = PipelineRasterizationStateCreateInfo{
    depthClampEnable: Bool32.false,
    rasterizerDiscardEnable: Bool32.false,
    polygonMode: PolygonMode.fill,
    cullMode: CullModeFlags{back},
    frontFace: FrontFace.counterClockwise,
    depthBiasEnable: Bool32.false,
    depthBiasConstantFactor: 0.0f,
    depthBiasClamp: 0.0f,
    depthBiasSlopeFactor: 0.0f,
    lineWidth: 1.0f,}

  #  Describe multisampling
  #  NOTE: using multisampling also requires turning on device features
  var multisampleCreateInfo = PipelineMultisampleStateCreateInfo{
    rasterizationSamples: SampleCountFlagBits.e1,
    sampleShadingEnable: Bool32.false,
    minSampleShading: 1.0f,
    alphaToCoverageEnable: Bool32.false,
    alphaToOneEnable: Bool32.false,}

  #  Describing color blending
  #  NOTE: all paramaters except blendEnable and colorWriteMask are irrelevant here
  var colorBlendAttachmentState = PipelineColorBlendAttachmentState{
    blendEnable: Bool32.false,
    srcColorBlendFactor: BlendFactor.one,
    dstColorBlendFactor: BlendFactor.zero,
    colorBlendOp: BlendOp.add,
    srcAlphaBlendFactor: BlendFactor.one,
    dstAlphaBlendFactor: BlendFactor.zero,
    alphaBlendOp: BlendOp.add,
    colorWriteMask: ColorComponentFlags{r, g, b, a},}

  #  NOTE: all attachments must have the same values unless a device feature is enabled
  var colorBlendCreateInfo = PipelineColorBlendStateCreateInfo{
    logicOpEnable: Bool32.false,
    logicOp: LogicOp.copy,
    attachmentCount: 1,
    pAttachments: addr colorBlendAttachmentState,
    blendConstants: [0f32, 0, 0, 0],}

  #  Describe pipeline layout
  #  NOTE: this describes the mapping between memory and shader resources (descriptor sets)
  #  This is for uniform buffers and samplers
  var layoutBinding = DescriptorSetLayoutBinding{
    descriptorType: DescriptorType.uniformBuffer,
    descriptorCount: 1,
    stageFlags: ShaderStageFlags{vertex},
    binding: 0,}

  var descriptorLayoutCreateInfo = DescriptorSetLayoutCreateInfo{
    bindingCount: 1,
    pBindings: addr layoutBinding,}

  if device.createDescriptorSetLayout(addr descriptorLayoutCreateInfo, nil, addr descriptorSetLayout) != success:
    quit "failed to create descriptor layout"
  else:
    echo "created descriptor layout"

  var layoutCreateInfo = PipelineLayoutCreateInfo{
    setLayoutCount: 1,
    pSetLayouts: addr descriptorSetLayout,}

  if device.createPipelineLayout(addr layoutCreateInfo, nil, addr pipelineLayout) != success:
    quit "failed to create pipeline layout"
  else:
    echo "created pipeline layout"

  #  Create the graphics pipeline
  var pipelineCreateInfo = GraphicsPipelineCreateInfo{
    stageCount: 2,
    pStages: addr shaderStages[0],
    pVertexInputState: addr vertexInputCreateInfo,
    pInputAssemblyState: addr inputAssemblyCreateInfo,
    pViewportState: addr viewportCreateInfo,
    pRasterizationState: addr rasterizationCreateInfo,
    pMultisampleState: addr multisampleCreateInfo,
    pColorBlendState: addr colorBlendCreateInfo,
    layout: pipelineLayout,
    renderPass: renderPass,
    subpass: 0,
    basePipelineHandle: Pipeline.none,
    basePipelineIndex: -1,}

  var res = device.createGraphicsPipelines(PipelineCache.none, 1, addr pipelineCreateInfo, nil, addr graphicsPipeline)
  if res != success:
    quit "failed to create graphics pipeline. code: " & $res
  else:
    echo "created graphics pipeline"

  #  No longer necessary
  device.destroyShaderModule(vertexShaderModule)
  device.destroyShaderModule(fragmentShaderModule)

proc createDescriptorPool =
  #  This describes how many descriptor sets we'll create from this pool for each type
  var typeCount = DescriptorPoolSize(
    thetype: DescriptorType.uniformBuffer,
    descriptorCount: 1,)

  var createInfo = DescriptorPoolCreateInfo{
    poolSizeCount: 1,
    pPoolSizes: addr typeCount,
    maxSets: 1,}

  if device.createDescriptorPool(addr createInfo, nil, addr descriptorPool) != success:
    quit "failed to create descriptor pool"
  else:
    echo "created descriptor pool"

proc createDescriptorSet =
  #  There needs to be one descriptor set per binding point in the shader
  var allocInfo = DescriptorSetAllocateInfo{
    descriptorPool: descriptorPool,
    descriptorSetCount: 1,
    pSetLayouts: addr descriptorSetLayout,}

  if device.allocateDescriptorSets(addr allocInfo, addr descriptorSet) != success:
    quit "failed to create descriptor set"
  else:
    echo "created descriptor set"

  #  Update descriptor set with uniform binding
  var descriptorBufferInfo = DescriptorBufferInfo{
    buffer: uniformBuffer,
    offset: DeviceSize 0,
    range: DeviceSize sizeof uniformBufferData,}

  var writeDescriptorSet = WriteDescriptorSet{
    dstSet: descriptorSet,
    descriptorCount: 1,
    descriptorType: DescriptorType.uniformBuffer,
    pBufferInfo: addr descriptorBufferInfo,
    dstBinding: 0,
    dstArrayElement: 0,
    pImageInfo: nil,
    pTexelBufferView: nil,}

  device.updateDescriptorSets(1, addr writeDescriptorSet, 0, nil)

proc createCommandBuffers =
  #  Allocate graphics command buffers
  graphicsCommandBuffers.setLen(swapchain.images.len)

  var allocInfo = CommandBufferAllocateInfo{
    commandPool: commandPool,
    level: CommandBufferLevel.primary,
    commandBufferCount: uint32 swapchain.images.len,}

  if device.allocateCommandBuffers(addr allocInfo, addr graphicsCommandBuffers[0]) != success:
    quit "failed to allocate graphics command buffers"
  else:
    echo "allocated graphics command buffers"

  #  Prepare data for recording command buffers
  var beginInfo = CommandBufferBeginInfo{
    flags: CommandBufferUsageFlags{simultaneousUse},}

  var subResourceRange = ImageSubresourceRange{
  aspectMask: ImageAspectFlags{color},
  baseMipLevel: 0,
  levelCount: 1,
  baseArrayLayer: 0,
  layerCount: 1 }

  var clearColor = ClearValue( color: ClearColorValue(
      float32: [0.1f, 0.1f, 0.1f, 1.0f] #  R, G, B, A
    ))

  #  Record command buffer for each swap image
  for i, commandBuffer in graphicsCommandBuffers:
    discard commandBuffer.beginCommandBuffer(addr beginInfo)

    #  If present queue family and graphics queue family are different, then a barrier is necessary
    #  The barrier is also needed initially to transition the image to the present layout
    var presentToDrawBarrier = ImageMemoryBarrier{
      srcAccessMask: AccessFlags{noneKHR},
      dstAccessMask: AccessFlags{colorAttachmentWrite},
      oldLayout: ImageLayout.undefined,
      newLayout: ImageLayout.presentSrcKHR,
      srcQueueFamilyIndex:
        if presentQueueFamily != graphicsQueueFamily: QueueFamilyIgnored
        else:                                         presentQueueFamily,
      dstQueueFamilyIndex:
        if presentQueueFamily != graphicsQueueFamily: QueueFamilyIgnored
        else:                                         graphicsQueueFamily,
      image: swapchain.images[i],
      subresourceRange: subresourceRange
    }

    commandBuffer.cmdPipelineBarrier(
      PipelineStageFlags{colorAttachmentOutput},
      PipelineStageFlags{colorAttachmentOutput},
      DependencyFlags.none, 0, nil, 0, nil, 1, addr presentToDrawBarrier)

    var renderPassBeginInfo = RenderPassBeginInfo{
      renderPass: renderPass,
      framebuffer: swapchain.framebuffers[i],
      renderArea: Rect2D(
        offset: Offset2D(x: 0, y: 0),
        extent: swapchain.extent,),
      clearValueCount: 1,
      pClearValues: addr clearColor,}

    commandBuffer.cmdBeginRenderPass(addr renderPassBeginInfo, SubpassContents.inline)

    commandBuffer.cmdBindDescriptorSets(PipelineBindPoint.graphics, pipelineLayout, 0, 1, addr descriptorSet, 0, nil)

    commandBuffer.cmdBindPipeline(PipelineBindPoint.graphics, graphicsPipeline)

    var offset: DeviceSize
    commandBuffer.cmdBindVertexBuffers(0, 1, addr vertexBuffer, addr offset)

    commandBuffer.cmdBindIndexBuffer(indexBuffer, DeviceSize(0), IndexType.uint32)

    commandBuffer.cmdDrawIndexed(3, 1, 0, 0, 0)

    commandBuffer.cmdEndRenderPass

    #  If present and graphics queue families differ, then another barrier is required
    if presentQueueFamily != graphicsQueueFamily:
      var drawToPresentBarrier = ImageMemoryBarrier{
        srcAccessMask: AccessFlags{colorAttachmentWrite},
        dstAccessMask: AccessFlags{memoryRead},
        oldLayout: ImageLayout.presentSrcKHR,
        newLayout: ImageLayout.presentSrcKHR,
        srcQueueFamilyIndex: graphicsQueueFamily,
        dstQueueFamilyIndex: presentQueueFamily,
        image: swapchain.images[i],
        subresourceRange: subResourceRange }

      commandBuffer.cmdPipelineBarrier(
        PipelineStageFlags{colorAttachmentOutput},
        PipelineStageFlags{bottomOfPipe},
        DependencyFlags.none, 0, nil, 0, nil, 1, addr drawToPresentBarrier)

    if commandBuffer.endCommandBuffer != success:
      quit "failed to record command buffer"

  echo "recorded command buffers"

  #  No longer needed
  device.destroyPipelineLayout(pipelineLayout)

proc cleanRenderer =
  discard device.deviceWaitIdle

  device.freeCommandBuffers(commandPool, graphicsCommandBuffers.len.uint32, addr graphicsCommandBuffers[0])

  device.destroyPipeline(graphicsPipeline)
  device.destroyRenderPass(renderPass)

  for i in 0..<swapchain.images.len:
    device.destroyFramebuffer(swapchain.framebuffers[i])
    device.destroyImageView(swapchain.imageViews[i])

  device.destroyDescriptorSetLayout(descriptorSetLayout)

proc cleanAll =

  cleanRenderer()

  device.destroySemaphore(imageAvailableSemaphore)
  device.destroySemaphore(renderingFinishedSemaphore)

  device.destroyCommandPool(commandPool)

  #  Clean up uniform buffer related objects
  device.destroyDescriptorPool(descriptorPool)
  device.destroyBuffer(uniformBuffer)
  device.freeMemory(uniformBufferMemory)

  #  Buffers must be destroyed after no command buffers are referring to them anymore
  device.destroyBuffer(vertexBuffer)
  device.freeMemory(vertexBufferMemory)
  device.destroyBuffer(indexBuffer)
  device.freeMemory(indexBufferMemory)

  #  NOTE: implicitly destroys images (in fact, we're not allowed to do that explicitly)
  device.destroySwapchainKHR(swapchain.current)

  device.destroyDevice()

  instance.destroySurfaceKHR(windowSurface)

  when enableValidationLayers:
    instance.destroyDebugUtilsMessengerEXT(messenger)

  instance.destroyInstance()

proc setupVulkan =
  createInstance()
  loadInstanceCommands()
  createDebugCallback()
  createWindowSurface()
  findPhysicalDevice()
  checkSwapChainSupport()
  findQueueFamilies()
  createLogicalDevice()
  createSemaphores()
  createCommandPool()
  createVertexBuffer()
  createUniformBuffer()
  createSwapChain()
  createRenderPass()
  createImageViews()
  createFramebuffers()
  createGraphicsPipeline()
  createDescriptorPool()
  createDescriptorSet()
  createCommandBuffers()

proc onWindowSizeChanged =
  windowResized = false

  #  Only recreate objects that are affected by framebuffer size changes
  cleanRenderer()

  createSwapChain()
  createRenderPass()
  createImageViews()
  createFramebuffers()
  createGraphicsPipeline()
  createCommandBuffers()

  matrices.proj.needsUpdate = true

proc draw =
  #  Acquire image
  var imageIndex: uint32
  var res = device.acquireNextImageKHR(swapchain.current, uint64.high, imageAvailableSemaphore, Fence.none, addr imageIndex)

  #  Unless surface is out of date right now, defer swap chain recreation until end of this frame
  if res == errorOutOfDateKHR:
    onWindowSizeChanged()
    return
  elif res != success:
    quit "failed to acquire image"

  #  This is the stage where the queue should wait on the semaphore
  var waitDstStageMask = PipelineStageFlags{topOfPipe}

  #  Wait for image to be available and draw
  var submitInfo = SubmitInfo{
    waitSemaphoreCount: 1,
    pWaitSemaphores: addr imageAvailableSemaphore,

    signalSemaphoreCount: 1,
    pSignalSemaphores: addr renderingFinishedSemaphore,

    pWaitDstStageMask: addr waitDstStageMask,

    commandBufferCount: 1,
    pCommandBuffers: addr graphicsCommandBuffers[imageIndex],
  }


  if graphicsQueue.queueSubmit(1, addr submitInfo) != success:
    quit "failed to submit draw command buffer"

  #  Present drawn image
  #  NOTE: semaphore here is not strictly necessary, because commands are processed in submission order within a single queue
  var presentInfo = PresentInfoKHR{
    waitSemaphoreCount: 1,
    pWaitSemaphores: addr renderingFinishedSemaphore,

    swapchainCount: 1,
    pSwapchains: addr swapchain.current,
    pImageIndices: addr imageIndex,
  }

  res = presentQueue.queuePresentKHR(addr presentInfo)

  if windowResized or res in [suboptimalKHR, errorOutOfDateKHR]:
    onWindowSizeChanged()
  elif res != success:
    quit "failed to submit present command buffer."

proc mainLoop =
  while not windowShouldClose(window):
    updateUniformData()
    draw()

    glfwPollEvents()

when isMainModule:
  #  NOTE: dynamically loading loader may be a better idea to fail gracefully when Vulkan is not supported

  #  Create window for Vulkan
  discard glfwInit()
  glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API)
  window = glfwCreateWindow(windowInitSize.width.int32, windowInitSize.height.int32, "The spinning triangle that took 1221 lines of code")
  discard window.setWindowSizeCallback(onWindowResized)

  #  Use Vulkan
  setupVulkan()
  mainLoop()
  cleanAll()
