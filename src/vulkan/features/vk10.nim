# Generated at 2021-12-25T14:21:16Z
# vk10
# Vulkan core API interface definitions
# =====================================

import ../platform

prepareVulkanLibDef()

type
  # Fundamental types used by many commands and structures
  # ------------------------------------------------------
  Extent2D* = object
    width*: uint32
    height*: uint32
  Extent3D* = object
    width*: uint32
    height*: uint32
    depth*: uint32
  Offset2D* = object
    x*: int32
    y*: int32
  Offset3D* = object
    x*: int32
    y*: int32
    z*: int32
  Rect2D* = object
    offset*: Offset2D
    extent*: Extent2D

  # These types are part of the API, though not directly used in API commands or data structures
  # --------------------------------------------------------------------------------------------
  BaseInStructure* = object
    sType*: StructureType
    pNext* {.optional.}: ptr BaseInStructure
  BaseOutStructure* = object
    sType*: StructureType
    pNext* {.optional.}: ptr BaseOutStructure
  BufferMemoryBarrier* = object
    sType* {.constant: (StructureType.bufferMemoryBarrier).}: StructureType
    pNext* {.optional.}: pointer
    srcAccessMask*: AccessFlags
    dstAccessMask*: AccessFlags
    srcQueueFamilyIndex*: uint32
    dstQueueFamilyIndex*: uint32
    buffer*: Buffer
    offset*: DeviceSize
    size*: DeviceSize
  DispatchIndirectCommand* = object
    x*: uint32
    y*: uint32
    z*: uint32
  DrawIndexedIndirectCommand* = object
    indexCount*: uint32
    instanceCount*: uint32
    firstIndex*: uint32
    vertexOffset*: int32
    firstInstance*: uint32
  DrawIndirectCommand* = object
    vertexCount*: uint32
    instanceCount*: uint32
    firstVertex*: uint32
    firstInstance*: uint32
  ImageMemoryBarrier* = object
    sType* {.constant: (StructureType.imageMemoryBarrier).}: StructureType
    pNext* {.optional.}: pointer
    srcAccessMask*: AccessFlags
    dstAccessMask*: AccessFlags
    oldLayout*: ImageLayout
    newLayout*: ImageLayout
    srcQueueFamilyIndex*: uint32
    dstQueueFamilyIndex*: uint32
    image*: Image
    subresourceRange*: ImageSubresourceRange
  MemoryBarrier* = object
    sType* {.constant: (StructureType.memoryBarrier).}: StructureType
    pNext* {.optional.}: pointer
    srcAccessMask* {.optional.}: AccessFlags
    dstAccessMask* {.optional.}: AccessFlags

  # Device initialization
  # ---------------------
  PFN_AllocationFunction* = proc(
      pUserData: pointer;
      size: uint;
      alignment: uint;
      allocationScope: SystemAllocationScope;
    ): pointer {.cdecl.}
  PFN_FreeFunction* = proc(
      pUserData: pointer;
      pMemory: pointer;
    ): void {.cdecl.}
  PFN_InternalAllocationNotification* = proc(
      pUserData: pointer;
      size: uint;
      allocationType: InternalAllocationType;
      allocationScope: SystemAllocationScope;
    ): void {.cdecl.}
  PFN_InternalFreeNotification* = proc(
      pUserData: pointer;
      size: uint;
      allocationType: InternalAllocationType;
      allocationScope: SystemAllocationScope;
    ): void {.cdecl.}
  PFN_ReallocationFunction* = proc(
      pUserData: pointer;
      pOriginal: pointer;
      size: uint;
      alignment: uint;
      allocationScope: SystemAllocationScope;
    ): pointer {.cdecl.}
  PFN_VoidFunction* = proc(): void {.cdecl.}
  AllocationCallbacks* = object
    pUserData* {.optional.}: pointer
    pfnAllocation*: PFN_AllocationFunction
    pfnReallocation*: PFN_ReallocationFunction
    pfnFree*: PFN_FreeFunction
    pfnInternalAllocation* {.optional.}: PFN_InternalAllocationNotification
    pfnInternalFree* {.optional.}: PFN_InternalFreeNotification
  ApplicationInfo* = object
    sType* {.constant: (StructureType.applicationInfo).}: StructureType
    pNext* {.optional.}: pointer
    pApplicationName* {.optional.}: cstring
    applicationVersion*: uint32
    pEngineName* {.optional.}: cstring
    engineVersion*: uint32
    apiVersion*: uint32
  FormatProperties* = object
    linearTilingFeatures* {.optional.}: FormatFeatureFlags
    optimalTilingFeatures* {.optional.}: FormatFeatureFlags
    bufferFeatures* {.optional.}: FormatFeatureFlags
  ImageFormatProperties* = object
    maxExtent*: Extent3D
    maxMipLevels*: uint32
    maxArrayLayers*: uint32
    sampleCounts* {.optional.}: SampleCountFlags
    maxResourceSize*: DeviceSize
  HtInstance* = object of HandleType
  Instance* = Handle[HtInstance]
  InstanceCreateInfo* = object
    sType* {.constant: (StructureType.instanceCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: InstanceCreateFlags
    pApplicationInfo* {.optional.}: ptr ApplicationInfo
    enabledLayerCount* {.optional.}: uint32
    ppEnabledLayerNames* {.length: enabledLayerCount.}: cstringArray
    enabledExtensionCount* {.optional.}: uint32
    ppEnabledExtensionNames* {.length: enabledExtensionCount.}: cstringArray
  MemoryHeap* = object
    size*: DeviceSize
    flags* {.optional.}: MemoryHeapFlags
  MemoryType* = object
    propertyFlags* {.optional.}: MemoryPropertyFlags
    heapIndex*: uint32
  HtPhysicalDevice* = object of HandleType
  PhysicalDevice* = Handle[HtPhysicalDevice]
  PhysicalDeviceFeatures* = object
    robustBufferAccess*: Bool32
    fullDrawIndexUint32*: Bool32
    imageCubeArray*: Bool32
    independentBlend*: Bool32
    geometryShader*: Bool32
    tessellationShader*: Bool32
    sampleRateShading*: Bool32
    dualSrcBlend*: Bool32
    logicOp*: Bool32
    multiDrawIndirect*: Bool32
    drawIndirectFirstInstance*: Bool32
    depthClamp*: Bool32
    depthBiasClamp*: Bool32
    fillModeNonSolid*: Bool32
    depthBounds*: Bool32
    wideLines*: Bool32
    largePoints*: Bool32
    alphaToOne*: Bool32
    multiViewport*: Bool32
    samplerAnisotropy*: Bool32
    textureCompressionETC2*: Bool32
    textureCompressionASTC_LDR*: Bool32
    textureCompressionBC*: Bool32
    occlusionQueryPrecise*: Bool32
    pipelineStatisticsQuery*: Bool32
    vertexPipelineStoresAndAtomics*: Bool32
    fragmentStoresAndAtomics*: Bool32
    shaderTessellationAndGeometryPointSize*: Bool32
    shaderImageGatherExtended*: Bool32
    shaderStorageImageExtendedFormats*: Bool32
    shaderStorageImageMultisample*: Bool32
    shaderStorageImageReadWithoutFormat*: Bool32
    shaderStorageImageWriteWithoutFormat*: Bool32
    shaderUniformBufferArrayDynamicIndexing*: Bool32
    shaderSampledImageArrayDynamicIndexing*: Bool32
    shaderStorageBufferArrayDynamicIndexing*: Bool32
    shaderStorageImageArrayDynamicIndexing*: Bool32
    shaderClipDistance*: Bool32
    shaderCullDistance*: Bool32
    shaderFloat64*: Bool32
    shaderInt64*: Bool32
    shaderInt16*: Bool32
    shaderResourceResidency*: Bool32
    shaderResourceMinLod*: Bool32
    sparseBinding*: Bool32
    sparseResidencyBuffer*: Bool32
    sparseResidencyImage2D*: Bool32
    sparseResidencyImage3D*: Bool32
    sparseResidency2Samples*: Bool32
    sparseResidency4Samples*: Bool32
    sparseResidency8Samples*: Bool32
    sparseResidency16Samples*: Bool32
    sparseResidencyAliased*: Bool32
    variableMultisampleRate*: Bool32
    inheritedQueries*: Bool32
  PhysicalDeviceLimits* = object
    maxImageDimension1D*: uint32
    maxImageDimension2D*: uint32
    maxImageDimension3D*: uint32
    maxImageDimensionCube*: uint32
    maxImageArrayLayers*: uint32
    maxTexelBufferElements*: uint32
    maxUniformBufferRange*: uint32
    maxStorageBufferRange*: uint32
    maxPushConstantsSize*: uint32
    maxMemoryAllocationCount*: uint32
    maxSamplerAllocationCount*: uint32
    bufferImageGranularity*: DeviceSize
    sparseAddressSpaceSize*: DeviceSize
    maxBoundDescriptorSets*: uint32
    maxPerStageDescriptorSamplers*: uint32
    maxPerStageDescriptorUniformBuffers*: uint32
    maxPerStageDescriptorStorageBuffers*: uint32
    maxPerStageDescriptorSampledImages*: uint32
    maxPerStageDescriptorStorageImages*: uint32
    maxPerStageDescriptorInputAttachments*: uint32
    maxPerStageResources*: uint32
    maxDescriptorSetSamplers*: uint32
    maxDescriptorSetUniformBuffers*: uint32
    maxDescriptorSetUniformBuffersDynamic*: uint32
    maxDescriptorSetStorageBuffers*: uint32
    maxDescriptorSetStorageBuffersDynamic*: uint32
    maxDescriptorSetSampledImages*: uint32
    maxDescriptorSetStorageImages*: uint32
    maxDescriptorSetInputAttachments*: uint32
    maxVertexInputAttributes*: uint32
    maxVertexInputBindings*: uint32
    maxVertexInputAttributeOffset*: uint32
    maxVertexInputBindingStride*: uint32
    maxVertexOutputComponents*: uint32
    maxTessellationGenerationLevel*: uint32
    maxTessellationPatchSize*: uint32
    maxTessellationControlPerVertexInputComponents*: uint32
    maxTessellationControlPerVertexOutputComponents*: uint32
    maxTessellationControlPerPatchOutputComponents*: uint32
    maxTessellationControlTotalOutputComponents*: uint32
    maxTessellationEvaluationInputComponents*: uint32
    maxTessellationEvaluationOutputComponents*: uint32
    maxGeometryShaderInvocations*: uint32
    maxGeometryInputComponents*: uint32
    maxGeometryOutputComponents*: uint32
    maxGeometryOutputVertices*: uint32
    maxGeometryTotalOutputComponents*: uint32
    maxFragmentInputComponents*: uint32
    maxFragmentOutputAttachments*: uint32
    maxFragmentDualSrcAttachments*: uint32
    maxFragmentCombinedOutputResources*: uint32
    maxComputeSharedMemorySize*: uint32
    maxComputeWorkGroupCount*: array[3, uint32]
    maxComputeWorkGroupInvocations*: uint32
    maxComputeWorkGroupSize*: array[3, uint32]
    subPixelPrecisionBits*: uint32
    subTexelPrecisionBits*: uint32
    mipmapPrecisionBits*: uint32
    maxDrawIndexedIndexValue*: uint32
    maxDrawIndirectCount*: uint32
    maxSamplerLodBias*: float32
    maxSamplerAnisotropy*: float32
    maxViewports*: uint32
    maxViewportDimensions*: array[2, uint32]
    viewportBoundsRange*: array[2, float32]
    viewportSubPixelBits*: uint32
    minMemoryMapAlignment*: uint
    minTexelBufferOffsetAlignment*: DeviceSize
    minUniformBufferOffsetAlignment*: DeviceSize
    minStorageBufferOffsetAlignment*: DeviceSize
    minTexelOffset*: int32
    maxTexelOffset*: uint32
    minTexelGatherOffset*: int32
    maxTexelGatherOffset*: uint32
    minInterpolationOffset*: float32
    maxInterpolationOffset*: float32
    subPixelInterpolationOffsetBits*: uint32
    maxFramebufferWidth*: uint32
    maxFramebufferHeight*: uint32
    maxFramebufferLayers*: uint32
    framebufferColorSampleCounts* {.optional.}: SampleCountFlags
    framebufferDepthSampleCounts* {.optional.}: SampleCountFlags
    framebufferStencilSampleCounts* {.optional.}: SampleCountFlags
    framebufferNoAttachmentsSampleCounts* {.optional.}: SampleCountFlags
    maxColorAttachments*: uint32
    sampledImageColorSampleCounts* {.optional.}: SampleCountFlags
    sampledImageIntegerSampleCounts* {.optional.}: SampleCountFlags
    sampledImageDepthSampleCounts* {.optional.}: SampleCountFlags
    sampledImageStencilSampleCounts* {.optional.}: SampleCountFlags
    storageImageSampleCounts* {.optional.}: SampleCountFlags
    maxSampleMaskWords*: uint32
    timestampComputeAndGraphics*: Bool32
    timestampPeriod*: float32
    maxClipDistances*: uint32
    maxCullDistances*: uint32
    maxCombinedClipAndCullDistances*: uint32
    discreteQueuePriorities*: uint32
    pointSizeRange*: array[2, float32]
    lineWidthRange*: array[2, float32]
    pointSizeGranularity*: float32
    lineWidthGranularity*: float32
    strictLines*: Bool32
    standardSampleLocations*: Bool32
    optimalBufferCopyOffsetAlignment*: DeviceSize
    optimalBufferCopyRowPitchAlignment*: DeviceSize
    nonCoherentAtomSize*: DeviceSize
  PhysicalDeviceMemoryProperties* = object
    memoryTypeCount*: uint32
    memoryTypes*: array[MaxMemoryTypes, MemoryType]
    memoryHeapCount*: uint32
    memoryHeaps*: array[MaxMemoryHeaps, MemoryHeap]
  PhysicalDeviceProperties* = object
    apiVersion*: uint32
    driverVersion*: uint32
    vendorID*: uint32
    deviceID*: uint32
    deviceType*: PhysicalDeviceType
    deviceName*: array[MaxPhysicalDeviceNameSize, char]
    pipelineCacheUUID*: array[UuidSize, uint8]
    limits*: PhysicalDeviceLimits
    sparseProperties*: PhysicalDeviceSparseProperties
  PhysicalDeviceSparseProperties* = object
    residencyStandard2DBlockShape*: Bool32
    residencyStandard2DMultisampleBlockShape*: Bool32
    residencyStandard3DBlockShape*: Bool32
    residencyAlignedMipSize*: Bool32
    residencyNonResidentStrict*: Bool32
  QueueFamilyProperties* = object
    queueFlags* {.optional.}: QueueFlags
    queueCount*: uint32
    timestampValidBits*: uint32
    minImageTransferGranularity*: Extent3D

  # Device commands
  # ---------------
  HtDevice* = object of HandleType
  Device* = Handle[HtDevice]
  DeviceCreateInfo* = object
    sType* {.constant: (StructureType.deviceCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DeviceCreateFlags
    queueCreateInfoCount*: uint32
    pQueueCreateInfos* {.length: queueCreateInfoCount.}: arrPtr[DeviceQueueCreateInfo]
    enabledLayerCount* {.optional.}: uint32
    ppEnabledLayerNames* {.length: enabledLayerCount.}: cstringArray
    enabledExtensionCount* {.optional.}: uint32
    ppEnabledExtensionNames* {.length: enabledExtensionCount.}: cstringArray
    pEnabledFeatures* {.optional.}: ptr PhysicalDeviceFeatures
  DeviceQueueCreateInfo* = object
    sType* {.constant: (StructureType.deviceQueueCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DeviceQueueCreateFlags
    queueFamilyIndex*: uint32
    queueCount*: uint32
    pQueuePriorities* {.length: queueCount.}: arrPtr[float32]

  # Extension discovery commands
  # ----------------------------
  ExtensionProperties* = object
    extensionName*: array[MaxExtensionNameSize, char]
    specVersion*: uint32

  # Layer discovery commands
  # ------------------------
  LayerProperties* = object
    layerName*: array[MaxExtensionNameSize, char]
    specVersion*: uint32
    implementationVersion*: uint32
    description*: array[MaxDescriptionSize, char]

  # Queue commands
  # --------------
  HtQueue* = object of HandleType
  Queue* = Handle[HtQueue]
  SubmitInfo* = object
    sType* {.constant: (StructureType.submitInfo).}: StructureType
    pNext* {.optional.}: pointer
    waitSemaphoreCount* {.optional.}: uint32
    pWaitSemaphores* {.length: waitSemaphoreCount.}: arrPtr[Semaphore]
    pWaitDstStageMask* {.length: waitSemaphoreCount.}: arrPtr[PipelineStageFlags]
    commandBufferCount* {.optional.}: uint32
    pCommandBuffers* {.length: commandBufferCount.}: arrPtr[CommandBuffer]
    signalSemaphoreCount* {.optional.}: uint32
    pSignalSemaphores* {.length: signalSemaphoreCount.}: arrPtr[Semaphore]

  # Memory commands
  # ---------------
  MappedMemoryRange* = object
    sType* {.constant: (StructureType.mappedMemoryRange).}: StructureType
    pNext* {.optional.}: pointer
    memory*: DeviceMemory
    offset*: DeviceSize
    size*: DeviceSize
  MemoryAllocateInfo* = object
    sType* {.constant: (StructureType.memoryAllocateInfo).}: StructureType
    pNext* {.optional.}: pointer
    allocationSize*: DeviceSize
    memoryTypeIndex*: uint32

  # Memory management API commands
  # ------------------------------
  HtDeviceMemory* = object of HandleType
  DeviceMemory* = NonDispatchableHandle[HtDeviceMemory]
  MemoryRequirements* = object
    size*: DeviceSize
    alignment*: DeviceSize
    memoryTypeBits*: uint32

  # Sparse resource memory management API commands
  # ----------------------------------------------
  BindSparseInfo* = object
    sType* {.constant: (StructureType.bindSparseInfo).}: StructureType
    pNext* {.optional.}: pointer
    waitSemaphoreCount* {.optional.}: uint32
    pWaitSemaphores* {.length: waitSemaphoreCount.}: arrPtr[Semaphore]
    bufferBindCount* {.optional.}: uint32
    pBufferBinds* {.length: bufferBindCount.}: arrPtr[SparseBufferMemoryBindInfo]
    imageOpaqueBindCount* {.optional.}: uint32
    pImageOpaqueBinds* {.length: imageOpaqueBindCount.}: arrPtr[SparseImageOpaqueMemoryBindInfo]
    imageBindCount* {.optional.}: uint32
    pImageBinds* {.length: imageBindCount.}: arrPtr[SparseImageMemoryBindInfo]
    signalSemaphoreCount* {.optional.}: uint32
    pSignalSemaphores* {.length: signalSemaphoreCount.}: arrPtr[Semaphore]
  ImageSubresource* = object
    aspectMask*: ImageAspectFlags
    mipLevel*: uint32
    arrayLayer*: uint32
  SparseBufferMemoryBindInfo* = object
    buffer*: Buffer
    bindCount*: uint32
    pBinds* {.length: bindCount.}: arrPtr[SparseMemoryBind]
  SparseImageFormatProperties* = object
    aspectMask* {.optional.}: ImageAspectFlags
    imageGranularity*: Extent3D
    flags* {.optional.}: SparseImageFormatFlags
  SparseImageMemoryBind* = object
    subresource*: ImageSubresource
    offset*: Offset3D
    extent*: Extent3D
    memory* {.optional.}: DeviceMemory
    memoryOffset*: DeviceSize
    flags* {.optional.}: SparseMemoryBindFlags
  SparseImageMemoryBindInfo* = object
    image*: Image
    bindCount*: uint32
    pBinds* {.length: bindCount.}: arrPtr[SparseImageMemoryBind]
  SparseImageMemoryRequirements* = object
    formatProperties*: SparseImageFormatProperties
    imageMipTailFirstLod*: uint32
    imageMipTailSize*: DeviceSize
    imageMipTailOffset*: DeviceSize
    imageMipTailStride*: DeviceSize
  SparseImageOpaqueMemoryBindInfo* = object
    image*: Image
    bindCount*: uint32
    pBinds* {.length: bindCount.}: arrPtr[SparseMemoryBind]
  SparseMemoryBind* = object
    resourceOffset*: DeviceSize
    size*: DeviceSize
    memory* {.optional.}: DeviceMemory
    memoryOffset*: DeviceSize
    flags* {.optional.}: SparseMemoryBindFlags

  # Fence commands
  # --------------
  HtFence* = object of HandleType
  Fence* = NonDispatchableHandle[HtFence]
  FenceCreateInfo* = object
    sType* {.constant: (StructureType.fenceCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: FenceCreateFlags

  # Queue semaphore commands
  # ------------------------
  HtSemaphore* = object of HandleType
  Semaphore* = NonDispatchableHandle[HtSemaphore]
  SemaphoreCreateInfo* = object
    sType* {.constant: (StructureType.semaphoreCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: SemaphoreCreateFlags

  # Event commands
  # --------------
  HtEvent* = object of HandleType
  Event* = NonDispatchableHandle[HtEvent]
  EventCreateInfo* = object
    sType* {.constant: (StructureType.eventCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: EventCreateFlags

  # Query commands
  # --------------
  HtQueryPool* = object of HandleType
  QueryPool* = NonDispatchableHandle[HtQueryPool]
  QueryPoolCreateInfo* = object
    sType* {.constant: (StructureType.queryPoolCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: QueryPoolCreateFlags
    queryType*: QueryType
    queryCount*: uint32
    pipelineStatistics* {.optional.}: QueryPipelineStatisticFlags

  # Buffer commands
  # ---------------
  HtBuffer* = object of HandleType
  Buffer* = NonDispatchableHandle[HtBuffer]
  BufferCreateInfo* = object
    sType* {.constant: (StructureType.bufferCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: BufferCreateFlags
    size*: DeviceSize
    usage*: BufferUsageFlags
    sharingMode*: SharingMode
    queueFamilyIndexCount* {.optional.}: uint32
    pQueueFamilyIndices* {.length: queueFamilyIndexCount.}: arrPtr[uint32]

  # Buffer view commands
  # --------------------
  HtBufferView* = object of HandleType
  BufferView* = NonDispatchableHandle[HtBufferView]
  BufferViewCreateInfo* = object
    sType* {.constant: (StructureType.bufferViewCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: BufferViewCreateFlags
    buffer*: Buffer
    format*: Format
    offset*: DeviceSize
    range*: DeviceSize

  # Image commands
  # --------------
  HtImage* = object of HandleType
  Image* = NonDispatchableHandle[HtImage]
  ImageCreateInfo* = object
    sType* {.constant: (StructureType.imageCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: ImageCreateFlags
    imageType*: ImageType
    format*: Format
    extent*: Extent3D
    mipLevels*: uint32
    arrayLayers*: uint32
    samples*: SampleCountFlagBits
    tiling*: ImageTiling
    usage*: ImageUsageFlags
    sharingMode*: SharingMode
    queueFamilyIndexCount* {.optional.}: uint32
    pQueueFamilyIndices* {.length: queueFamilyIndexCount.}: arrPtr[uint32]
    initialLayout*: ImageLayout
  SubresourceLayout* = object
    offset*: DeviceSize
    size*: DeviceSize
    rowPitch*: DeviceSize
    arrayPitch*: DeviceSize
    depthPitch*: DeviceSize

  # Image view commands
  # -------------------
  ComponentMapping* = object
    r*: ComponentSwizzle
    g*: ComponentSwizzle
    b*: ComponentSwizzle
    a*: ComponentSwizzle
  ImageSubresourceRange* = object
    aspectMask*: ImageAspectFlags
    baseMipLevel*: uint32
    levelCount*: uint32
    baseArrayLayer*: uint32
    layerCount*: uint32
  HtImageView* = object of HandleType
  ImageView* = NonDispatchableHandle[HtImageView]
  ImageViewCreateInfo* = object
    sType* {.constant: (StructureType.imageViewCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: ImageViewCreateFlags
    image*: Image
    viewType*: ImageViewType
    format*: Format
    components*: ComponentMapping
    subresourceRange*: ImageSubresourceRange

  # Shader commands
  # ---------------
  HtShaderModule* = object of HandleType
  ShaderModule* = NonDispatchableHandle[HtShaderModule]
  ShaderModuleCreateInfo* = object
    sType* {.constant: (StructureType.shaderModuleCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: ShaderModuleCreateFlags
    codeSize*: uint
    pCode* {.length: codeSize / 4.}: arrPtr[uint32]

  # Pipeline Cache commands
  # -----------------------
  HtPipelineCache* = object of HandleType
  PipelineCache* = NonDispatchableHandle[HtPipelineCache]
  PipelineCacheCreateInfo* = object
    sType* {.constant: (StructureType.pipelineCacheCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineCacheCreateFlags
    initialDataSize* {.optional.}: uint
    pInitialData* {.length: initialDataSize.}: pointer

  # Pipeline commands
  # -----------------
  ComputePipelineCreateInfo* = object
    sType* {.constant: (StructureType.computePipelineCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineCreateFlags
    stage*: PipelineShaderStageCreateInfo
    layout*: PipelineLayout
    basePipelineHandle* {.optional.}: Pipeline
    basePipelineIndex*: int32
  GraphicsPipelineCreateInfo* = object
    sType* {.constant: (StructureType.graphicsPipelineCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineCreateFlags
    stageCount*: uint32
    pStages* {.length: stageCount.}: arrPtr[PipelineShaderStageCreateInfo]
    pVertexInputState* {.optional.}: ptr PipelineVertexInputStateCreateInfo
    pInputAssemblyState* {.optional.}: ptr PipelineInputAssemblyStateCreateInfo
    pTessellationState* {.optional.}: ptr PipelineTessellationStateCreateInfo
    pViewportState* {.optional.}: ptr PipelineViewportStateCreateInfo
    pRasterizationState*: ptr PipelineRasterizationStateCreateInfo
    pMultisampleState* {.optional.}: ptr PipelineMultisampleStateCreateInfo
    pDepthStencilState* {.optional.}: ptr PipelineDepthStencilStateCreateInfo
    pColorBlendState* {.optional.}: ptr PipelineColorBlendStateCreateInfo
    pDynamicState* {.optional.}: ptr PipelineDynamicStateCreateInfo
    layout*: PipelineLayout
    renderPass*: RenderPass
    subpass*: uint32
    basePipelineHandle* {.optional.}: Pipeline
    basePipelineIndex*: int32
  HtPipeline* = object of HandleType
  Pipeline* = NonDispatchableHandle[HtPipeline]
  PipelineColorBlendAttachmentState* = object
    blendEnable*: Bool32
    srcColorBlendFactor*: BlendFactor
    dstColorBlendFactor*: BlendFactor
    colorBlendOp*: BlendOp
    srcAlphaBlendFactor*: BlendFactor
    dstAlphaBlendFactor*: BlendFactor
    alphaBlendOp*: BlendOp
    colorWriteMask* {.optional.}: ColorComponentFlags
  PipelineColorBlendStateCreateInfo* = object
    sType* {.constant: (StructureType.pipelineColorBlendStateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineColorBlendStateCreateFlags
    logicOpEnable*: Bool32
    logicOp*: LogicOp
    attachmentCount* {.optional.}: uint32
    pAttachments* {.length: attachmentCount.}: arrPtr[PipelineColorBlendAttachmentState]
    blendConstants*: array[4, float32]
  PipelineDepthStencilStateCreateInfo* = object
    sType* {.constant: (StructureType.pipelineDepthStencilStateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineDepthStencilStateCreateFlags
    depthTestEnable*: Bool32
    depthWriteEnable*: Bool32
    depthCompareOp*: CompareOp
    depthBoundsTestEnable*: Bool32
    stencilTestEnable*: Bool32
    front*: StencilOpState
    back*: StencilOpState
    minDepthBounds*: float32
    maxDepthBounds*: float32
  PipelineDynamicStateCreateInfo* = object
    sType* {.constant: (StructureType.pipelineDynamicStateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineDynamicStateCreateFlags
    dynamicStateCount* {.optional.}: uint32
    pDynamicStates* {.length: dynamicStateCount.}: arrPtr[DynamicState]
  PipelineInputAssemblyStateCreateInfo* = object
    sType* {.constant: (StructureType.pipelineInputAssemblyStateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineInputAssemblyStateCreateFlags
    topology*: PrimitiveTopology
    primitiveRestartEnable*: Bool32
  PipelineMultisampleStateCreateInfo* = object
    sType* {.constant: (StructureType.pipelineMultisampleStateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineMultisampleStateCreateFlags
    rasterizationSamples*: SampleCountFlagBits
    sampleShadingEnable*: Bool32
    minSampleShading*: float32
    pSampleMask* {.optional, length: (rasterizationSamples + 31) / 32.}: arrPtr[SampleMask]
    alphaToCoverageEnable*: Bool32
    alphaToOneEnable*: Bool32
  PipelineRasterizationStateCreateInfo* = object
    sType* {.constant: (StructureType.pipelineRasterizationStateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineRasterizationStateCreateFlags
    depthClampEnable*: Bool32
    rasterizerDiscardEnable*: Bool32
    polygonMode*: PolygonMode
    cullMode* {.optional.}: CullModeFlags
    frontFace*: FrontFace
    depthBiasEnable*: Bool32
    depthBiasConstantFactor*: float32
    depthBiasClamp*: float32
    depthBiasSlopeFactor*: float32
    lineWidth*: float32
  PipelineShaderStageCreateInfo* = object
    sType* {.constant: (StructureType.pipelineShaderStageCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineShaderStageCreateFlags
    stage*: ShaderStageFlagBits
    module*: ShaderModule
    pName*: cstring
    pSpecializationInfo* {.optional.}: ptr SpecializationInfo
  PipelineTessellationStateCreateInfo* = object
    sType* {.constant: (StructureType.pipelineTessellationStateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineTessellationStateCreateFlags
    patchControlPoints*: uint32
  PipelineVertexInputStateCreateInfo* = object
    sType* {.constant: (StructureType.pipelineVertexInputStateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineVertexInputStateCreateFlags
    vertexBindingDescriptionCount* {.optional.}: uint32
    pVertexBindingDescriptions* {.length: vertexBindingDescriptionCount.}: arrPtr[VertexInputBindingDescription]
    vertexAttributeDescriptionCount* {.optional.}: uint32
    pVertexAttributeDescriptions* {.length: vertexAttributeDescriptionCount.}: arrPtr[VertexInputAttributeDescription]
  PipelineViewportStateCreateInfo* = object
    sType* {.constant: (StructureType.pipelineViewportStateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineViewportStateCreateFlags
    viewportCount* {.optional.}: uint32
    pViewports* {.optional, length: viewportCount.}: arrPtr[Viewport]
    scissorCount* {.optional.}: uint32
    pScissors* {.optional, length: scissorCount.}: arrPtr[Rect2D]
  SpecializationInfo* = object
    mapEntryCount* {.optional.}: uint32
    pMapEntries* {.length: mapEntryCount.}: arrPtr[SpecializationMapEntry]
    dataSize* {.optional.}: uint
    pData* {.length: dataSize.}: pointer
  SpecializationMapEntry* = object
    constantID*: uint32
    offset*: uint32
    size*: uint
  StencilOpState* = object
    failOp*: StencilOp
    passOp*: StencilOp
    depthFailOp*: StencilOp
    compareOp*: CompareOp
    compareMask*: uint32
    writeMask*: uint32
    reference*: uint32
  VertexInputAttributeDescription* = object
    location*: uint32
    binding*: uint32
    format*: Format
    offset*: uint32
  VertexInputBindingDescription* = object
    binding*: uint32
    stride*: uint32
    inputRate*: VertexInputRate
  Viewport* = object
    x*: float32
    y*: float32
    width*: float32
    height*: float32
    minDepth*: float32
    maxDepth*: float32

  # Pipeline layout commands
  # ------------------------
  HtPipelineLayout* = object of HandleType
  PipelineLayout* = NonDispatchableHandle[HtPipelineLayout]
  PipelineLayoutCreateInfo* = object
    sType* {.constant: (StructureType.pipelineLayoutCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineLayoutCreateFlags
    setLayoutCount* {.optional.}: uint32
    pSetLayouts* {.length: setLayoutCount.}: arrPtr[DescriptorSetLayout]
    pushConstantRangeCount* {.optional.}: uint32
    pPushConstantRanges* {.length: pushConstantRangeCount.}: arrPtr[PushConstantRange]
  PushConstantRange* = object
    stageFlags*: ShaderStageFlags
    offset*: uint32
    size*: uint32

  # Sampler commands
  # ----------------
  HtSampler* = object of HandleType
  Sampler* = NonDispatchableHandle[HtSampler]
  SamplerCreateInfo* = object
    sType* {.constant: (StructureType.samplerCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: SamplerCreateFlags
    magFilter*: Filter
    minFilter*: Filter
    mipmapMode*: SamplerMipmapMode
    addressModeU*: SamplerAddressMode
    addressModeV*: SamplerAddressMode
    addressModeW*: SamplerAddressMode
    mipLodBias*: float32
    anisotropyEnable*: Bool32
    maxAnisotropy*: float32
    compareEnable*: Bool32
    compareOp*: CompareOp
    minLod*: float32
    maxLod*: float32
    borderColor*: BorderColor
    unnormalizedCoordinates*: Bool32

  # Descriptor set commands
  # -----------------------
  CopyDescriptorSet* = object
    sType* {.constant: (StructureType.copyDescriptorSet).}: StructureType
    pNext* {.optional.}: pointer
    srcSet*: DescriptorSet
    srcBinding*: uint32
    srcArrayElement*: uint32
    dstSet*: DescriptorSet
    dstBinding*: uint32
    dstArrayElement*: uint32
    descriptorCount*: uint32
  DescriptorBufferInfo* = object
    buffer* {.optional.}: Buffer
    offset*: DeviceSize
    range*: DeviceSize
  DescriptorImageInfo* = object
    sampler*: Sampler
    imageView*: ImageView
    imageLayout*: ImageLayout
  HtDescriptorPool* = object of HandleType
  DescriptorPool* = NonDispatchableHandle[HtDescriptorPool]
  DescriptorPoolCreateInfo* = object
    sType* {.constant: (StructureType.descriptorPoolCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DescriptorPoolCreateFlags
    maxSets*: uint32
    poolSizeCount*: uint32
    pPoolSizes* {.length: poolSizeCount.}: arrPtr[DescriptorPoolSize]
  DescriptorPoolSize* = object
    theType*: DescriptorType
    descriptorCount*: uint32
  HtDescriptorSet* = object of HandleType
  DescriptorSet* = NonDispatchableHandle[HtDescriptorSet]
  DescriptorSetAllocateInfo* = object
    sType* {.constant: (StructureType.descriptorSetAllocateInfo).}: StructureType
    pNext* {.optional.}: pointer
    descriptorPool*: DescriptorPool
    descriptorSetCount*: uint32
    pSetLayouts* {.length: descriptorSetCount.}: arrPtr[DescriptorSetLayout]
  HtDescriptorSetLayout* = object of HandleType
  DescriptorSetLayout* = NonDispatchableHandle[HtDescriptorSetLayout]
  DescriptorSetLayoutBinding* = object
    binding*: uint32
    descriptorType*: DescriptorType
    descriptorCount* {.optional.}: uint32
    stageFlags*: ShaderStageFlags
    pImmutableSamplers* {.optional, length: descriptorCount.}: arrPtr[Sampler]
  DescriptorSetLayoutCreateInfo* = object
    sType* {.constant: (StructureType.descriptorSetLayoutCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DescriptorSetLayoutCreateFlags
    bindingCount* {.optional.}: uint32
    pBindings* {.length: bindingCount.}: arrPtr[DescriptorSetLayoutBinding]
  WriteDescriptorSet* = object
    sType* {.constant: (StructureType.writeDescriptorSet).}: StructureType
    pNext* {.optional.}: pointer
    dstSet*: DescriptorSet
    dstBinding*: uint32
    dstArrayElement*: uint32
    descriptorCount*: uint32
    descriptorType*: DescriptorType
    pImageInfo* {.length: descriptorCount.}: arrPtr[DescriptorImageInfo]
    pBufferInfo* {.length: descriptorCount.}: arrPtr[DescriptorBufferInfo]
    pTexelBufferView* {.length: descriptorCount.}: arrPtr[BufferView]

  # Pass commands
  # -------------
  AttachmentDescription* = object
    flags* {.optional.}: AttachmentDescriptionFlags
    format*: Format
    samples*: SampleCountFlagBits
    loadOp*: AttachmentLoadOp
    storeOp*: AttachmentStoreOp
    stencilLoadOp*: AttachmentLoadOp
    stencilStoreOp*: AttachmentStoreOp
    initialLayout*: ImageLayout
    finalLayout*: ImageLayout
  AttachmentReference* = object
    attachment*: uint32
    layout*: ImageLayout
  HtFramebuffer* = object of HandleType
  Framebuffer* = NonDispatchableHandle[HtFramebuffer]
  FramebufferCreateInfo* = object
    sType* {.constant: (StructureType.framebufferCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: FramebufferCreateFlags
    renderPass*: RenderPass
    attachmentCount* {.optional.}: uint32
    pAttachments* {.length: attachmentCount.}: arrPtr[ImageView]
    width*: uint32
    height*: uint32
    layers*: uint32
  HtRenderPass* = object of HandleType
  RenderPass* = NonDispatchableHandle[HtRenderPass]
  RenderPassCreateInfo* = object
    sType* {.constant: (StructureType.renderPassCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: RenderPassCreateFlags
    attachmentCount* {.optional.}: uint32
    pAttachments* {.length: attachmentCount.}: arrPtr[AttachmentDescription]
    subpassCount*: uint32
    pSubpasses* {.length: subpassCount.}: arrPtr[SubpassDescription]
    dependencyCount* {.optional.}: uint32
    pDependencies* {.length: dependencyCount.}: arrPtr[SubpassDependency]
  SubpassDependency* = object
    srcSubpass*: uint32
    dstSubpass*: uint32
    srcStageMask*: PipelineStageFlags
    dstStageMask*: PipelineStageFlags
    srcAccessMask* {.optional.}: AccessFlags
    dstAccessMask* {.optional.}: AccessFlags
    dependencyFlags* {.optional.}: DependencyFlags
  SubpassDescription* = object
    flags* {.optional.}: SubpassDescriptionFlags
    pipelineBindPoint*: PipelineBindPoint
    inputAttachmentCount* {.optional.}: uint32
    pInputAttachments* {.length: inputAttachmentCount.}: arrPtr[AttachmentReference]
    colorAttachmentCount* {.optional.}: uint32
    pColorAttachments* {.length: colorAttachmentCount.}: arrPtr[AttachmentReference]
    pResolveAttachments* {.optional, length: colorAttachmentCount.}: arrPtr[AttachmentReference]
    pDepthStencilAttachment* {.optional.}: ptr AttachmentReference
    preserveAttachmentCount* {.optional.}: uint32
    pPreserveAttachments* {.length: preserveAttachmentCount.}: arrPtr[uint32]

  # Command pool commands
  # ---------------------
  HtCommandPool* = object of HandleType
  CommandPool* = NonDispatchableHandle[HtCommandPool]
  CommandPoolCreateInfo* = object
    sType* {.constant: (StructureType.commandPoolCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: CommandPoolCreateFlags
    queueFamilyIndex*: uint32

  # Command buffer commands
  # -----------------------
  HtCommandBuffer* = object of HandleType
  CommandBuffer* = Handle[HtCommandBuffer]
  CommandBufferAllocateInfo* = object
    sType* {.constant: (StructureType.commandBufferAllocateInfo).}: StructureType
    pNext* {.optional.}: pointer
    commandPool*: CommandPool
    level*: CommandBufferLevel
    commandBufferCount*: uint32
  CommandBufferBeginInfo* = object
    sType* {.constant: (StructureType.commandBufferBeginInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: CommandBufferUsageFlags
    pInheritanceInfo* {.optional.}: ptr CommandBufferInheritanceInfo
  CommandBufferInheritanceInfo* = object
    sType* {.constant: (StructureType.commandBufferInheritanceInfo).}: StructureType
    pNext* {.optional.}: pointer
    renderPass* {.optional.}: RenderPass
    subpass*: uint32
    framebuffer* {.optional.}: Framebuffer
    occlusionQueryEnable*: Bool32
    queryFlags* {.optional.}: QueryControlFlags
    pipelineStatistics* {.optional.}: QueryPipelineStatisticFlags

  # Command buffer building commands
  # --------------------------------
  BufferCopy* = object
    srcOffset*: DeviceSize
    dstOffset*: DeviceSize
    size*: DeviceSize
  BufferImageCopy* = object
    bufferOffset*: DeviceSize
    bufferRowLength*: uint32
    bufferImageHeight*: uint32
    imageSubresource*: ImageSubresourceLayers
    imageOffset*: Offset3D
    imageExtent*: Extent3D
  ClearAttachment* = object
    aspectMask*: ImageAspectFlags
    colorAttachment*: uint32
    clearValue*: ClearValue
  # Union allowing specification of floating point, integer, or unsigned integer color data. Actual value selected is based on image/attachment being cleared.
  ClearColorValue* {.union.} = object
    float32*: array[4, float32]
    int32*: array[4, int32]
    uint32*: array[4, uint32]
  ClearDepthStencilValue* = object
    depth*: float32
    stencil*: uint32
  ClearRect* = object
    rect*: Rect2D
    baseArrayLayer*: uint32
    layerCount*: uint32
  # Union allowing specification of color or depth and stencil values. Actual value selected is based on attachment being cleared.
  ClearValue* {.union.} = object
    color*: ClearColorValue
    depthStencil*: ClearDepthStencilValue
  ImageBlit* = object
    srcSubresource*: ImageSubresourceLayers
    srcOffsets*: array[2, Offset3D]
    dstSubresource*: ImageSubresourceLayers
    dstOffsets*: array[2, Offset3D]
  ImageCopy* = object
    srcSubresource*: ImageSubresourceLayers
    srcOffset*: Offset3D
    dstSubresource*: ImageSubresourceLayers
    dstOffset*: Offset3D
    extent*: Extent3D
  ImageResolve* = object
    srcSubresource*: ImageSubresourceLayers
    srcOffset*: Offset3D
    dstSubresource*: ImageSubresourceLayers
    dstOffset*: Offset3D
    extent*: Extent3D
  ImageSubresourceLayers* = object
    aspectMask*: ImageAspectFlags
    mipLevel*: uint32
    baseArrayLayer*: uint32
    layerCount*: uint32
  RenderPassBeginInfo* = object
    sType* {.constant: (StructureType.renderPassBeginInfo).}: StructureType
    pNext* {.optional.}: pointer
    renderPass*: RenderPass
    framebuffer*: Framebuffer
    renderArea*: Rect2D
    clearValueCount* {.optional.}: uint32
    pClearValues* {.length: clearValueCount.}: arrPtr[ClearValue]

# Header boilerplate
# ------------------
template defineHandle*(ObjectName: untyped) =
  type HtObjectName* = object of HandleType
  type ObjectName* = Handle[Ht`ObjectName`]
template defineNonDispatchableHandle*(ObjectName: untyped) =
  type HtObjectName* = object of HandleType
  type ObjectName* = NonDispatchableHandle[Ht`ObjectName`]


# Fundamental types used by many commands and structures
# ------------------------------------------------------


# These types are part of the API, though not directly used in API commands or data structures
# --------------------------------------------------------------------------------------------


# API version macros
# ------------------
template apiVersion*(): untyped = makeVersion(1, 0, 0)
template apiVersion10*(): untyped = makeVersion(1, 0, 0)
template headerVersion*(): untyped = 152
template headerVersionComplete*(): untyped =
  makeVersion(1, 2, headerVersion)
template makeVersion*(major, minor, patch: uint32): untyped =
  ( (major shl 22) or (minor shl 12) or patch )
template versionMajor*(major: uint32): untyped = ( major shl 22 )
template versionMajor*(minor: uint32): untyped = ( minor shl 12 )
template versionPatch*(patch: uint32): untyped = ( patch )


# API constants
# -------------
template nullHandle*(): untyped = ( cast[NullHandle](0) )


# Device initialization
# ---------------------
proc createInstance*(
      pCreateInfo: ptr InstanceCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pInstance: ptr Instance;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInitializationFailed, errorLayerNotPresent, errorExtensionNotPresent, errorIncompatibleDriver),
      preload("vkCreateInstance").}
proc destroyInstance*(
      instance = default(Instance);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyInstance").}
proc enumeratePhysicalDevices*(
      instance: Instance;
      pPhysicalDeviceCount: ptr uint32;
      pPhysicalDevices {.length: pPhysicalDeviceCount.} = default(arrPtr[PhysicalDevice]);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInitializationFailed),
      preload("vkEnumeratePhysicalDevices").}
proc getPhysicalDeviceFeatures*(
      physicalDevice: PhysicalDevice;
      pFeatures: ptr PhysicalDeviceFeatures;
    ): void {.cdecl, preload("vkGetPhysicalDeviceFeatures").}
proc getPhysicalDeviceFormatProperties*(
      physicalDevice: PhysicalDevice;
      format: Format;
      pFormatProperties: ptr FormatProperties;
    ): void {.cdecl, preload("vkGetPhysicalDeviceFormatProperties").}
proc getPhysicalDeviceImageFormatProperties*(
      physicalDevice: PhysicalDevice;
      format: Format;
      theType: ImageType;
      tiling: ImageTiling;
      usage: ImageUsageFlags;
      flags = default(ImageCreateFlags);
      pImageFormatProperties: ptr ImageFormatProperties;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorFormatNotSupported),
      preload("vkGetPhysicalDeviceImageFormatProperties").}
proc getPhysicalDeviceProperties*(
      physicalDevice: PhysicalDevice;
      pProperties: ptr PhysicalDeviceProperties;
    ): void {.cdecl, preload("vkGetPhysicalDeviceProperties").}
proc getPhysicalDeviceQueueFamilyProperties*(
      physicalDevice: PhysicalDevice;
      pQueueFamilyPropertyCount: ptr uint32;
      pQueueFamilyProperties {.length: pQueueFamilyPropertyCount.} = default(arrPtr[QueueFamilyProperties]);
    ): void {.cdecl, preload("vkGetPhysicalDeviceQueueFamilyProperties").}
proc getPhysicalDeviceMemoryProperties*(
      physicalDevice: PhysicalDevice;
      pMemoryProperties: ptr PhysicalDeviceMemoryProperties;
    ): void {.cdecl, preload("vkGetPhysicalDeviceMemoryProperties").}
proc getInstanceProcAddr*(
      instance = default(Instance);
      pName: cstring;
    ): PFN_VoidFunction {.cdecl, preload("vkGetInstanceProcAddr").}
proc getDeviceProcAddr*(
      device: Device;
      pName: cstring;
    ): PFN_VoidFunction {.cdecl, preload("vkGetDeviceProcAddr").}


# Device commands
# ---------------
proc createDevice*(
      physicalDevice: PhysicalDevice;
      pCreateInfo: ptr DeviceCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pDevice: ptr Device;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInitializationFailed, errorExtensionNotPresent, errorFeatureNotPresent, errorTooManyObjects, errorDeviceLost),
      preload("vkCreateDevice").}
proc destroyDevice*(
      device = default(Device);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyDevice").}


# Extension discovery commands
# ----------------------------
proc enumerateInstanceExtensionProperties*(
      pLayerName = default(cstring);
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[ExtensionProperties]);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorLayerNotPresent),
      preload("vkEnumerateInstanceExtensionProperties").}
proc enumerateDeviceExtensionProperties*(
      physicalDevice: PhysicalDevice;
      pLayerName = default(cstring);
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[ExtensionProperties]);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorLayerNotPresent),
      preload("vkEnumerateDeviceExtensionProperties").}


# Layer discovery commands
# ------------------------
proc enumerateInstanceLayerProperties*(
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[LayerProperties]);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkEnumerateInstanceLayerProperties").}
proc enumerateDeviceLayerProperties*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[LayerProperties]);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkEnumerateDeviceLayerProperties").}


# Queue commands
# --------------
proc getDeviceQueue*(
      device: Device;
      queueFamilyIndex: uint32;
      queueIndex: uint32;
      pQueue: ptr Queue;
    ): void {.cdecl, preload("vkGetDeviceQueue").}
proc queueSubmit*(
      queue: Queue;
      submitCount = default(uint32);
      pSubmits {.length: submitCount.}: arrPtr[SubmitInfo];
      fence = default(Fence);
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorDeviceLost),
      preload("vkQueueSubmit").}
proc queueWaitIdle*(
      queue: Queue;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorDeviceLost),
      preload("vkQueueWaitIdle").}
proc deviceWaitIdle*(
      device: Device;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorDeviceLost),
      preload("vkDeviceWaitIdle").}


# Memory commands
# ---------------
proc allocateMemory*(
      device: Device;
      pAllocateInfo: ptr MemoryAllocateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pMemory: ptr DeviceMemory;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInvalidExternalHandle, errorInvalidOpaqueCaptureAddressKhr),
      preload("vkAllocateMemory").}
proc freeMemory*(
      device: Device;
      memory = default(DeviceMemory);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkFreeMemory").}
proc mapMemory*(
      device: Device;
      memory: DeviceMemory;
      offset: DeviceSize;
      size: DeviceSize;
      flags = default(MemoryMapFlags);
      ppData: ptr pointer;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorMemoryMapFailed),
      preload("vkMapMemory").}
proc unmapMemory*(
      device: Device;
      memory: DeviceMemory;
    ): void {.cdecl, preload("vkUnmapMemory").}
proc flushMappedMemoryRanges*(
      device: Device;
      memoryRangeCount: uint32;
      pMemoryRanges {.length: memoryRangeCount.}: arrPtr[MappedMemoryRange];
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkFlushMappedMemoryRanges").}
proc invalidateMappedMemoryRanges*(
      device: Device;
      memoryRangeCount: uint32;
      pMemoryRanges {.length: memoryRangeCount.}: arrPtr[MappedMemoryRange];
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkInvalidateMappedMemoryRanges").}
proc getDeviceMemoryCommitment*(
      device: Device;
      memory: DeviceMemory;
      pCommittedMemoryInBytes: ptr DeviceSize;
    ): void {.cdecl, preload("vkGetDeviceMemoryCommitment").}


# Memory management API commands
# ------------------------------
proc bindBufferMemory*(
      device: Device;
      buffer: Buffer;
      memory: DeviceMemory;
      memoryOffset: DeviceSize;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInvalidOpaqueCaptureAddressKhr),
      preload("vkBindBufferMemory").}
proc bindImageMemory*(
      device: Device;
      image: Image;
      memory: DeviceMemory;
      memoryOffset: DeviceSize;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkBindImageMemory").}
proc getBufferMemoryRequirements*(
      device: Device;
      buffer: Buffer;
      pMemoryRequirements: ptr MemoryRequirements;
    ): void {.cdecl, preload("vkGetBufferMemoryRequirements").}
proc getImageMemoryRequirements*(
      device: Device;
      image: Image;
      pMemoryRequirements: ptr MemoryRequirements;
    ): void {.cdecl, preload("vkGetImageMemoryRequirements").}


# Sparse resource memory management API commands
# ----------------------------------------------
proc getImageSparseMemoryRequirements*(
      device: Device;
      image: Image;
      pSparseMemoryRequirementCount: ptr uint32;
      pSparseMemoryRequirements {.length: pSparseMemoryRequirementCount.} = default(arrPtr[SparseImageMemoryRequirements]);
    ): void {.cdecl, preload("vkGetImageSparseMemoryRequirements").}
proc getPhysicalDeviceSparseImageFormatProperties*(
      physicalDevice: PhysicalDevice;
      format: Format;
      theType: ImageType;
      samples: SampleCountFlagBits;
      usage: ImageUsageFlags;
      tiling: ImageTiling;
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[SparseImageFormatProperties]);
    ): void {.cdecl, preload("vkGetPhysicalDeviceSparseImageFormatProperties").}
proc queueBindSparse*(
      queue: Queue;
      bindInfoCount = default(uint32);
      pBindInfo {.length: bindInfoCount.}: arrPtr[BindSparseInfo];
      fence = default(Fence);
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorDeviceLost),
      preload("vkQueueBindSparse").}


# Fence commands
# --------------
proc createFence*(
      device: Device;
      pCreateInfo: ptr FenceCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pFence: ptr Fence;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateFence").}
proc destroyFence*(
      device: Device;
      fence = default(Fence);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyFence").}
proc resetFences*(
      device: Device;
      fenceCount: uint32;
      pFences {.length: fenceCount.}: arrPtr[Fence];
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfDeviceMemory),
      preload("vkResetFences").}
proc getFenceStatus*(
      device: Device;
      fence: Fence;
    ): Result {.cdecl,
      successCodes(success, notReady),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorDeviceLost),
      preload("vkGetFenceStatus").}
proc waitForFences*(
      device: Device;
      fenceCount: uint32;
      pFences {.length: fenceCount.}: arrPtr[Fence];
      waitAll: Bool32;
      timeout: uint64;
    ): Result {.cdecl,
      successCodes(success, timeout),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorDeviceLost),
      preload("vkWaitForFences").}


# Queue semaphore commands
# ------------------------
proc createSemaphore*(
      device: Device;
      pCreateInfo: ptr SemaphoreCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pSemaphore: ptr Semaphore;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateSemaphore").}
proc destroySemaphore*(
      device: Device;
      semaphore = default(Semaphore);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroySemaphore").}


# Event commands
# --------------
proc createEvent*(
      device: Device;
      pCreateInfo: ptr EventCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pEvent: ptr Event;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateEvent").}
proc destroyEvent*(
      device: Device;
      event = default(Event);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyEvent").}
proc getEventStatus*(
      device: Device;
      event: Event;
    ): Result {.cdecl,
      successCodes(eventSet, eventReset),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorDeviceLost),
      preload("vkGetEventStatus").}
proc setEvent*(
      device: Device;
      event: Event;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkSetEvent").}
proc resetEvent*(
      device: Device;
      event: Event;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfDeviceMemory),
      preload("vkResetEvent").}


# Query commands
# --------------
proc createQueryPool*(
      device: Device;
      pCreateInfo: ptr QueryPoolCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pQueryPool: ptr QueryPool;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateQueryPool").}
proc destroyQueryPool*(
      device: Device;
      queryPool = default(QueryPool);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyQueryPool").}
proc getQueryPoolResults*(
      device: Device;
      queryPool: QueryPool;
      firstQuery: uint32;
      queryCount: uint32;
      dataSize: uint;
      pData {.length: dataSize.}: pointer;
      stride: DeviceSize;
      flags = default(QueryResultFlags);
    ): Result {.cdecl,
      successCodes(success, notReady),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorDeviceLost),
      preload("vkGetQueryPoolResults").}


# Buffer commands
# ---------------
proc createBuffer*(
      device: Device;
      pCreateInfo: ptr BufferCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pBuffer: ptr Buffer;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInvalidOpaqueCaptureAddressKhr),
      preload("vkCreateBuffer").}
proc destroyBuffer*(
      device: Device;
      buffer = default(Buffer);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyBuffer").}


# Buffer view commands
# --------------------
proc createBufferView*(
      device: Device;
      pCreateInfo: ptr BufferViewCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pView: ptr BufferView;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateBufferView").}
proc destroyBufferView*(
      device: Device;
      bufferView = default(BufferView);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyBufferView").}


# Image commands
# --------------
proc createImage*(
      device: Device;
      pCreateInfo: ptr ImageCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pImage: ptr Image;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateImage").}
proc destroyImage*(
      device: Device;
      image = default(Image);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyImage").}
proc getImageSubresourceLayout*(
      device: Device;
      image: Image;
      pSubresource: ptr ImageSubresource;
      pLayout: ptr SubresourceLayout;
    ): void {.cdecl, preload("vkGetImageSubresourceLayout").}


# Image view commands
# -------------------
proc createImageView*(
      device: Device;
      pCreateInfo: ptr ImageViewCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pView: ptr ImageView;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateImageView").}
proc destroyImageView*(
      device: Device;
      imageView = default(ImageView);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyImageView").}


# Shader commands
# ---------------
proc createShaderModule*(
      device: Device;
      pCreateInfo: ptr ShaderModuleCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pShaderModule: ptr ShaderModule;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInvalidShaderNv),
      preload("vkCreateShaderModule").}
proc destroyShaderModule*(
      device: Device;
      shaderModule = default(ShaderModule);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyShaderModule").}


# Pipeline Cache commands
# -----------------------
proc createPipelineCache*(
      device: Device;
      pCreateInfo: ptr PipelineCacheCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pPipelineCache: ptr PipelineCache;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreatePipelineCache").}
proc destroyPipelineCache*(
      device: Device;
      pipelineCache = default(PipelineCache);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyPipelineCache").}
proc getPipelineCacheData*(
      device: Device;
      pipelineCache: PipelineCache;
      pDataSize: ptr uint;
      pData {.length: pDataSize.} = default(pointer);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkGetPipelineCacheData").}
proc mergePipelineCaches*(
      device: Device;
      dstCache: PipelineCache;
      srcCacheCount: uint32;
      pSrcCaches {.length: srcCacheCount.}: arrPtr[PipelineCache];
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkMergePipelineCaches").}


# Pipeline commands
# -----------------
proc createGraphicsPipelines*(
      device: Device;
      pipelineCache = default(PipelineCache);
      createInfoCount: uint32;
      pCreateInfos {.length: createInfoCount.}: arrPtr[GraphicsPipelineCreateInfo];
      pAllocator = default(ptr AllocationCallbacks);
      pPipelines {.length: createInfoCount.}: arrPtr[Pipeline];
    ): Result {.cdecl,
      successCodes(success, pipelineCompileRequiredExt),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInvalidShaderNv),
      preload("vkCreateGraphicsPipelines").}
proc createComputePipelines*(
      device: Device;
      pipelineCache = default(PipelineCache);
      createInfoCount: uint32;
      pCreateInfos {.length: createInfoCount.}: arrPtr[ComputePipelineCreateInfo];
      pAllocator = default(ptr AllocationCallbacks);
      pPipelines {.length: createInfoCount.}: arrPtr[Pipeline];
    ): Result {.cdecl,
      successCodes(success, pipelineCompileRequiredExt),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInvalidShaderNv),
      preload("vkCreateComputePipelines").}
proc destroyPipeline*(
      device: Device;
      pipeline = default(Pipeline);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyPipeline").}


# Pipeline layout commands
# ------------------------
proc createPipelineLayout*(
      device: Device;
      pCreateInfo: ptr PipelineLayoutCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pPipelineLayout: ptr PipelineLayout;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreatePipelineLayout").}
proc destroyPipelineLayout*(
      device: Device;
      pipelineLayout = default(PipelineLayout);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyPipelineLayout").}


# Sampler commands
# ----------------
proc createSampler*(
      device: Device;
      pCreateInfo: ptr SamplerCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pSampler: ptr Sampler;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateSampler").}
proc destroySampler*(
      device: Device;
      sampler = default(Sampler);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroySampler").}


# Descriptor set commands
# -----------------------
proc createDescriptorSetLayout*(
      device: Device;
      pCreateInfo: ptr DescriptorSetLayoutCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pSetLayout: ptr DescriptorSetLayout;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateDescriptorSetLayout").}
proc destroyDescriptorSetLayout*(
      device: Device;
      descriptorSetLayout = default(DescriptorSetLayout);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyDescriptorSetLayout").}
proc createDescriptorPool*(
      device: Device;
      pCreateInfo: ptr DescriptorPoolCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pDescriptorPool: ptr DescriptorPool;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorFragmentationExt),
      preload("vkCreateDescriptorPool").}
proc destroyDescriptorPool*(
      device: Device;
      descriptorPool = default(DescriptorPool);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyDescriptorPool").}
proc resetDescriptorPool*(
      device: Device;
      descriptorPool: DescriptorPool;
      flags = default(DescriptorPoolResetFlags);
    ): Result {.cdecl,
      successCodes(success),
      preload("vkResetDescriptorPool").}
proc allocateDescriptorSets*(
      device: Device;
      pAllocateInfo: ptr DescriptorSetAllocateInfo;
      pDescriptorSets {.length: pAllocateInfo.descriptorSetCount.}: arrPtr[DescriptorSet];
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorFragmentedPool, errorOutOfPoolMemory),
      preload("vkAllocateDescriptorSets").}
proc freeDescriptorSets*(
      device: Device;
      descriptorPool: DescriptorPool;
      descriptorSetCount: uint32;
      pDescriptorSets {.length: descriptorSetCount.}: arrPtr[DescriptorSet];
    ): Result {.cdecl,
      successCodes(success),
      preload("vkFreeDescriptorSets").}
proc updateDescriptorSets*(
      device: Device;
      descriptorWriteCount = default(uint32);
      pDescriptorWrites {.length: descriptorWriteCount.}: arrPtr[WriteDescriptorSet];
      descriptorCopyCount = default(uint32);
      pDescriptorCopies {.length: descriptorCopyCount.}: arrPtr[CopyDescriptorSet];
    ): void {.cdecl, preload("vkUpdateDescriptorSets").}


# Pass commands
# -------------
proc createFramebuffer*(
      device: Device;
      pCreateInfo: ptr FramebufferCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pFramebuffer: ptr Framebuffer;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateFramebuffer").}
proc destroyFramebuffer*(
      device: Device;
      framebuffer = default(Framebuffer);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyFramebuffer").}
proc createRenderPass*(
      device: Device;
      pCreateInfo: ptr RenderPassCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pRenderPass: ptr RenderPass;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateRenderPass").}
proc destroyRenderPass*(
      device: Device;
      renderPass = default(RenderPass);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyRenderPass").}
proc getRenderAreaGranularity*(
      device: Device;
      renderPass: RenderPass;
      pGranularity: ptr Extent2D;
    ): void {.cdecl, preload("vkGetRenderAreaGranularity").}


# Command pool commands
# ---------------------
proc createCommandPool*(
      device: Device;
      pCreateInfo: ptr CommandPoolCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pCommandPool: ptr CommandPool;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateCommandPool").}
proc destroyCommandPool*(
      device: Device;
      commandPool = default(CommandPool);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyCommandPool").}
proc resetCommandPool*(
      device: Device;
      commandPool: CommandPool;
      flags = default(CommandPoolResetFlags);
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfDeviceMemory),
      preload("vkResetCommandPool").}


# Command buffer commands
# -----------------------
proc allocateCommandBuffers*(
      device: Device;
      pAllocateInfo: ptr CommandBufferAllocateInfo;
      pCommandBuffers {.length: pAllocateInfo.commandBufferCount.}: arrPtr[CommandBuffer];
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkAllocateCommandBuffers").}
proc freeCommandBuffers*(
      device: Device;
      commandPool: CommandPool;
      commandBufferCount: uint32;
      pCommandBuffers {.length: commandBufferCount.}: arrPtr[CommandBuffer];
    ): void {.cdecl, preload("vkFreeCommandBuffers").}
proc beginCommandBuffer*(
      commandBuffer: CommandBuffer;
      pBeginInfo: ptr CommandBufferBeginInfo;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkBeginCommandBuffer").}
proc endCommandBuffer*(
      commandBuffer: CommandBuffer;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkEndCommandBuffer").}
proc resetCommandBuffer*(
      commandBuffer: CommandBuffer;
      flags = default(CommandBufferResetFlags);
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfDeviceMemory),
      preload("vkResetCommandBuffer").}


# Command buffer building commands
# --------------------------------
proc cmdBindPipeline*(
      commandBuffer: CommandBuffer;
      pipelineBindPoint: PipelineBindPoint;
      pipeline: Pipeline;
    ): void {.cdecl, preload("vkCmdBindPipeline").}
proc cmdSetViewport*(
      commandBuffer: CommandBuffer;
      firstViewport: uint32;
      viewportCount: uint32;
      pViewports {.length: viewportCount.}: arrPtr[Viewport];
    ): void {.cdecl, preload("vkCmdSetViewport").}
proc cmdSetScissor*(
      commandBuffer: CommandBuffer;
      firstScissor: uint32;
      scissorCount: uint32;
      pScissors {.length: scissorCount.}: arrPtr[Rect2D];
    ): void {.cdecl, preload("vkCmdSetScissor").}
proc cmdSetLineWidth*(
      commandBuffer: CommandBuffer;
      lineWidth: float32;
    ): void {.cdecl, preload("vkCmdSetLineWidth").}
proc cmdSetDepthBias*(
      commandBuffer: CommandBuffer;
      depthBiasConstantFactor: float32;
      depthBiasClamp: float32;
      depthBiasSlopeFactor: float32;
    ): void {.cdecl, preload("vkCmdSetDepthBias").}
proc cmdSetBlendConstants*(
      commandBuffer: CommandBuffer;
      blendConstants: float32;
    ): void {.cdecl, preload("vkCmdSetBlendConstants").}
proc cmdSetDepthBounds*(
      commandBuffer: CommandBuffer;
      minDepthBounds: float32;
      maxDepthBounds: float32;
    ): void {.cdecl, preload("vkCmdSetDepthBounds").}
proc cmdSetStencilCompareMask*(
      commandBuffer: CommandBuffer;
      faceMask: StencilFaceFlags;
      compareMask: uint32;
    ): void {.cdecl, preload("vkCmdSetStencilCompareMask").}
proc cmdSetStencilWriteMask*(
      commandBuffer: CommandBuffer;
      faceMask: StencilFaceFlags;
      writeMask: uint32;
    ): void {.cdecl, preload("vkCmdSetStencilWriteMask").}
proc cmdSetStencilReference*(
      commandBuffer: CommandBuffer;
      faceMask: StencilFaceFlags;
      reference: uint32;
    ): void {.cdecl, preload("vkCmdSetStencilReference").}
proc cmdBindDescriptorSets*(
      commandBuffer: CommandBuffer;
      pipelineBindPoint: PipelineBindPoint;
      layout: PipelineLayout;
      firstSet: uint32;
      descriptorSetCount: uint32;
      pDescriptorSets {.length: descriptorSetCount.}: arrPtr[DescriptorSet];
      dynamicOffsetCount = default(uint32);
      pDynamicOffsets {.length: dynamicOffsetCount.}: arrPtr[uint32];
    ): void {.cdecl, preload("vkCmdBindDescriptorSets").}
proc cmdBindIndexBuffer*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      indexType: IndexType;
    ): void {.cdecl, preload("vkCmdBindIndexBuffer").}
proc cmdBindVertexBuffers*(
      commandBuffer: CommandBuffer;
      firstBinding: uint32;
      bindingCount: uint32;
      pBuffers {.length: bindingCount.}: arrPtr[Buffer];
      pOffsets {.length: bindingCount.}: arrPtr[DeviceSize];
    ): void {.cdecl, preload("vkCmdBindVertexBuffers").}
proc cmdDraw*(
      commandBuffer: CommandBuffer;
      vertexCount: uint32;
      instanceCount: uint32;
      firstVertex: uint32;
      firstInstance: uint32;
    ): void {.cdecl, preload("vkCmdDraw").}
proc cmdDrawIndexed*(
      commandBuffer: CommandBuffer;
      indexCount: uint32;
      instanceCount: uint32;
      firstIndex: uint32;
      vertexOffset: int32;
      firstInstance: uint32;
    ): void {.cdecl, preload("vkCmdDrawIndexed").}
proc cmdDrawIndirect*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      drawCount: uint32;
      stride: uint32;
    ): void {.cdecl, preload("vkCmdDrawIndirect").}
proc cmdDrawIndexedIndirect*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      drawCount: uint32;
      stride: uint32;
    ): void {.cdecl, preload("vkCmdDrawIndexedIndirect").}
proc cmdDispatch*(
      commandBuffer: CommandBuffer;
      groupCountX: uint32;
      groupCountY: uint32;
      groupCountZ: uint32;
    ): void {.cdecl, preload("vkCmdDispatch").}
proc cmdDispatchIndirect*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
    ): void {.cdecl, preload("vkCmdDispatchIndirect").}
proc cmdCopyBuffer*(
      commandBuffer: CommandBuffer;
      srcBuffer: Buffer;
      dstBuffer: Buffer;
      regionCount: uint32;
      pRegions {.length: regionCount.}: arrPtr[BufferCopy];
    ): void {.cdecl, preload("vkCmdCopyBuffer").}
proc cmdCopyImage*(
      commandBuffer: CommandBuffer;
      srcImage: Image;
      srcImageLayout: ImageLayout;
      dstImage: Image;
      dstImageLayout: ImageLayout;
      regionCount: uint32;
      pRegions {.length: regionCount.}: arrPtr[ImageCopy];
    ): void {.cdecl, preload("vkCmdCopyImage").}
proc cmdBlitImage*(
      commandBuffer: CommandBuffer;
      srcImage: Image;
      srcImageLayout: ImageLayout;
      dstImage: Image;
      dstImageLayout: ImageLayout;
      regionCount: uint32;
      pRegions {.length: regionCount.}: arrPtr[ImageBlit];
      filter: Filter;
    ): void {.cdecl, preload("vkCmdBlitImage").}
proc cmdCopyBufferToImage*(
      commandBuffer: CommandBuffer;
      srcBuffer: Buffer;
      dstImage: Image;
      dstImageLayout: ImageLayout;
      regionCount: uint32;
      pRegions {.length: regionCount.}: arrPtr[BufferImageCopy];
    ): void {.cdecl, preload("vkCmdCopyBufferToImage").}
proc cmdCopyImageToBuffer*(
      commandBuffer: CommandBuffer;
      srcImage: Image;
      srcImageLayout: ImageLayout;
      dstBuffer: Buffer;
      regionCount: uint32;
      pRegions {.length: regionCount.}: arrPtr[BufferImageCopy];
    ): void {.cdecl, preload("vkCmdCopyImageToBuffer").}
proc cmdUpdateBuffer*(
      commandBuffer: CommandBuffer;
      dstBuffer: Buffer;
      dstOffset: DeviceSize;
      dataSize: DeviceSize;
      pData {.length: dataSize.}: pointer;
    ): void {.cdecl, preload("vkCmdUpdateBuffer").}
proc cmdFillBuffer*(
      commandBuffer: CommandBuffer;
      dstBuffer: Buffer;
      dstOffset: DeviceSize;
      size: DeviceSize;
      data: uint32;
    ): void {.cdecl, preload("vkCmdFillBuffer").}
proc cmdClearColorImage*(
      commandBuffer: CommandBuffer;
      image: Image;
      imageLayout: ImageLayout;
      pColor: ptr ClearColorValue;
      rangeCount: uint32;
      pRanges {.length: rangeCount.}: arrPtr[ImageSubresourceRange];
    ): void {.cdecl, preload("vkCmdClearColorImage").}
proc cmdClearDepthStencilImage*(
      commandBuffer: CommandBuffer;
      image: Image;
      imageLayout: ImageLayout;
      pDepthStencil: ptr ClearDepthStencilValue;
      rangeCount: uint32;
      pRanges {.length: rangeCount.}: arrPtr[ImageSubresourceRange];
    ): void {.cdecl, preload("vkCmdClearDepthStencilImage").}
proc cmdClearAttachments*(
      commandBuffer: CommandBuffer;
      attachmentCount: uint32;
      pAttachments {.length: attachmentCount.}: arrPtr[ClearAttachment];
      rectCount: uint32;
      pRects {.length: rectCount.}: arrPtr[ClearRect];
    ): void {.cdecl, preload("vkCmdClearAttachments").}
proc cmdResolveImage*(
      commandBuffer: CommandBuffer;
      srcImage: Image;
      srcImageLayout: ImageLayout;
      dstImage: Image;
      dstImageLayout: ImageLayout;
      regionCount: uint32;
      pRegions {.length: regionCount.}: arrPtr[ImageResolve];
    ): void {.cdecl, preload("vkCmdResolveImage").}
proc cmdSetEvent*(
      commandBuffer: CommandBuffer;
      event: Event;
      stageMask: PipelineStageFlags;
    ): void {.cdecl, preload("vkCmdSetEvent").}
proc cmdResetEvent*(
      commandBuffer: CommandBuffer;
      event: Event;
      stageMask: PipelineStageFlags;
    ): void {.cdecl, preload("vkCmdResetEvent").}
proc cmdWaitEvents*(
      commandBuffer: CommandBuffer;
      eventCount: uint32;
      pEvents {.length: eventCount.}: arrPtr[Event];
      srcStageMask: PipelineStageFlags;
      dstStageMask: PipelineStageFlags;
      memoryBarrierCount = default(uint32);
      pMemoryBarriers {.length: memoryBarrierCount.}: arrPtr[MemoryBarrier];
      bufferMemoryBarrierCount = default(uint32);
      pBufferMemoryBarriers {.length: bufferMemoryBarrierCount.}: arrPtr[BufferMemoryBarrier];
      imageMemoryBarrierCount = default(uint32);
      pImageMemoryBarriers {.length: imageMemoryBarrierCount.}: arrPtr[ImageMemoryBarrier];
    ): void {.cdecl, preload("vkCmdWaitEvents").}
proc cmdPipelineBarrier*(
      commandBuffer: CommandBuffer;
      srcStageMask: PipelineStageFlags;
      dstStageMask: PipelineStageFlags;
      dependencyFlags = default(DependencyFlags);
      memoryBarrierCount = default(uint32);
      pMemoryBarriers {.length: memoryBarrierCount.}: arrPtr[MemoryBarrier];
      bufferMemoryBarrierCount = default(uint32);
      pBufferMemoryBarriers {.length: bufferMemoryBarrierCount.}: arrPtr[BufferMemoryBarrier];
      imageMemoryBarrierCount = default(uint32);
      pImageMemoryBarriers {.length: imageMemoryBarrierCount.}: arrPtr[ImageMemoryBarrier];
    ): void {.cdecl, preload("vkCmdPipelineBarrier").}
proc cmdBeginQuery*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      query: uint32;
      flags = default(QueryControlFlags);
    ): void {.cdecl, preload("vkCmdBeginQuery").}
proc cmdEndQuery*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      query: uint32;
    ): void {.cdecl, preload("vkCmdEndQuery").}
proc cmdResetQueryPool*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      firstQuery: uint32;
      queryCount: uint32;
    ): void {.cdecl, preload("vkCmdResetQueryPool").}
proc cmdWriteTimestamp*(
      commandBuffer: CommandBuffer;
      pipelineStage: PipelineStageFlagBits;
      queryPool: QueryPool;
      query: uint32;
    ): void {.cdecl, preload("vkCmdWriteTimestamp").}
proc cmdCopyQueryPoolResults*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      firstQuery: uint32;
      queryCount: uint32;
      dstBuffer: Buffer;
      dstOffset: DeviceSize;
      stride: DeviceSize;
      flags = default(QueryResultFlags);
    ): void {.cdecl, preload("vkCmdCopyQueryPoolResults").}
proc cmdPushConstants*(
      commandBuffer: CommandBuffer;
      layout: PipelineLayout;
      stageFlags: ShaderStageFlags;
      offset: uint32;
      size: uint32;
      pValues {.length: size.}: pointer;
    ): void {.cdecl, preload("vkCmdPushConstants").}
proc cmdBeginRenderPass*(
      commandBuffer: CommandBuffer;
      pRenderPassBegin: ptr RenderPassBeginInfo;
      contents: SubpassContents;
    ): void {.cdecl, preload("vkCmdBeginRenderPass").}
proc cmdNextSubpass*(
      commandBuffer: CommandBuffer;
      contents: SubpassContents;
    ): void {.cdecl, preload("vkCmdNextSubpass").}
proc cmdEndRenderPass*(
      commandBuffer: CommandBuffer;
    ): void {.cdecl, preload("vkCmdEndRenderPass").}
proc cmdExecuteCommands*(
      commandBuffer: CommandBuffer;
      commandBufferCount: uint32;
      pCommandBuffers {.length: commandBufferCount.}: arrPtr[CommandBuffer];
    ): void {.cdecl, preload("vkCmdExecuteCommands").}


# ========================= #
#      LOADER TEMPLATE      #
# ========================= #

# You can use these templates to load Vulkan proc dynamically and individually.
import macros {.all.}
import sequtils

macro loadCommand*[T: proc](handle: Instance or Device; procType: typedesc[T]): T =
  let (loadFrom, loadWith) = block:
    let procTypeDef =
      if procType.kind == nnkSym and procType.symKind == nskType:
        procType.getImpl[2]
      elif procType.kind == nnkTypeOfExpr:
        procType.getTypeImpl[1].getTypeImpl
      else:
        procType

    if procTypeDef.kind != nnkProcTy: error "unexpected"

    let procPragmas = procTypeDef.pragma

    var loadablePragma: NimNode
    for pragma in procPragmas:
      case pragma.kind
      of nnkCall, nnkExprColonExpr:
        if pragma[0].kind == nnkSym and
            pragma[0].symkind == nskTemplate and
            $pragma[0] == "loadable":
          loadablePragma = pragma
          break
      else: continue
    if loadablePragma == nil:
      error "The loadable pragma must be set for the proc type.", procType

    (
      loadFrom: loadablePragma[1],
      loadWith: loadablePragma[2][0..^1].mapIt(LoadWith(it.intVal))
    )

  case handle.getTypeInst.repr
  of Instance.getTypeInst.repr:
    if LoadWith.Instance in loadWith:
      return quote do:
        cast[`procType`](`handle`.getInstanceProcAddr(`loadFrom`))
    else:
      error "Not available to load with instance.", handle

  of Device.getTypeInst.repr:
    if LoadWith.Device in loadWith:
      return quote do:
        cast[`procType`](`handle`.getDeviceProcAddr(`loadFrom`))
    else:
      error "Not available to load with device.", handle

  else: error "Type of the handle must be Instance or Device", procType

macro loadCommand*[T: proc](handle: Instance or Device; procAccessor: T) =
  let cageName = procAccessor.customPragmaNode()
    .findChild(it.len > 0 and it[0].repr == "loadInto")[1]
  quote do:
    `cageName` = option `handle`.loadCommand(`cageName`.unsafeGet.typeof)

template withLoad*[T: proc](procAccessor: T; handle: Instance or Device): T =
  procAccessor.load(handle)
  procAccessor


# ========================= #
#      LOADER TEMPLATE      #
# ========================= #




# Bitmask operations
# Utility for bitmask operation added independently
# =================================================

import strutils
import sets
import sugar

proc `==`*[Flagbits: enum](a, b: Flags[Flagbits]): bool =
  a.uint32 == b.uint32

macro `toFlagSets`*[Flagbits: enum](Type: typedesc[Flagbits]; bits: varargs[untyped]): HashSet[Flagbits] =
  if Type.customPragmaNode().findChild(it.repr == "flagbits") == nil:
    error("Expect the enum that has Flagbits pragma", Type)

  result = quote do:
    toHashSet []

  result[1].expectKind nnkBracket
  result[1].add do:
    bits.mapIt:
      quote do: `Type`.`it`

template `{}`*[Flagbits: enum](Type: typedesc[Flagbits]; bits: varargs[untyped]): HashSet[Flagbits] =
  Type.toFlagSets(bits)

converter toFlagSets*[Flagbits: enum](flags: Flags[Flagbits]): HashSet[Flagbits] =
  var val = 1.uint32
  let flags = flags.uint32
  while val <= flags:
    if (val and flags) != 0:
      result.incl Flagbits(val)
    val = val shl 1
proc `{}`*[Flagbits: enum](flags: Flags[Flagbits]): HashSet[Flagbits] =
  flags.toFlagSets

converter toFlags*[Flagbits: enum](flagsets: HashSet[Flagbits]): Flags[Flagbits] =
  for flagset in flagsets:
    result = result or flagset
proc `<+>`*[Flagbits: enum](flagsets: HashSet[Flagbits]): Flags[Flagbits] =
  flagsets.toFlags

converter toFlags*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  Flags[Flagbits](flagbits)
proc `<+>`*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  flagbits.toFlags

proc `all`*[Flagbits: enum](Type: typedesc[Flags[Flagbits]]): Flags[Flagbits] =
  Flags[Flagbits](Flagbits.high.ord.shl(1) - 1)
proc `all`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] = flags.typeof.all
proc `all`*[Flagbits: enum](Type: typedesc[HashSet[Flagbits]]): HashSet[Flagbits] = Flags[Flagbits].all.toFlagSets
proc `all`*[Flagbits: enum](flagsets: HashSet[Flagbits]): HashSet[Flagbits] = flagsets.typeof.all

proc `none`*[Flagbits: enum](Type: typedesc[HashSet[Flagbits]]): HashSet[Flagbits] = return
proc `none`*[Flagbits: enum](flagsets: HashSet[Flagbits]): HashSet[Flagbits] = flagsets.typeof.none
proc `none`*[Flagbits: enum](Type: typedesc[Flags[Flagbits]]): Flags[Flagbits] = return
proc `none`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] = flags.typeof.none

proc isSome*[Flagbits: enum](flags: Flags[Flagbits]): bool = flags != Flags[Flagbits].none
proc isSome*[Flagbits: enum](flagsets: HashSet[Flagbits]): bool = flagsets.len != 0

proc isNone*[Flagbits: enum](flags: Flags[Flagbits]): bool = flags == Flags[Flagbits].none
proc isNone*[Flagbits: enum](flagsets: HashSet[Flagbits]): bool = flagsets.len == 0

proc `and`*[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] =
  Flags[Flagbits]((a.uint32 and b.uint32) and Flags[Flagbits].all.uint32)
proc `and`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a and <+>b
proc `and`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = b and a
proc `and`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = <+>a and <+>b

proc `or`*[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] =
  Flags[Flagbits]((a.uint32 or b.uint32) and Flags[Flagbits].all.uint32)
proc `or`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a or <+>b
proc `or`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = b or a
proc `or`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = <+>a or <+>b

proc `xor`*[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] =
  # if Flags.all is 00011111:
  # 00011100 xor 00011000 = 00000100
  # 00011100 xor 10000000 = 00011100
  #              ^ overflowed value must be ignored.
  not (a and b) and (a or b)
proc `xor`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a xor <+>b
proc `xor`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = b xor a
proc `xor`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = <+>a xor <+>b

proc `not`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] =
  Flags[Flagbits](flags.all.uint32 and not flags.uint32)

proc `not`*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  not flagbits.toFlags

proc `not`*[Flagbits: enum](flagsets: HashSet[Flagbits]): HashSet[Flagbits] =
  (not flagsets.toFlags).toFlagSets

proc `*`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a and b
proc `*`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a and b
proc `*`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a and b
proc `*`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a and b

proc `+`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a or b
proc `+`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a or b
proc `+`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a or b
proc `+`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a or b

proc `-+-`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a xor b
proc `-+-`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a xor b
proc `-+-`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a xor b
proc `-+-`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a xor b

proc `-`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a and not b
proc `-`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a and not b
proc `-`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a and not b
proc `-`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a and not b

proc `*=`*[Flagbits: enum](a: var Flagbits; b: Flagbits) =               a = a * b
proc `*=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flagbits) =        a = a * b
proc `*=`*[Flagbits: enum](a: var Flagbits; b: Flags[Flagbits]) =        a = a * b
proc `*=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flags[Flagbits]) = a = a * b

proc `+=`*[Flagbits: enum](a: var Flagbits; b: Flagbits) =               a = a + b
proc `+=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flagbits) =        a = a + b
proc `+=`*[Flagbits: enum](a: var Flagbits; b: Flags[Flagbits]) =        a = a + b
proc `+=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flags[Flagbits]) = a = a + b

proc `-+-=`*[Flagbits: enum](a: var Flagbits; b: Flagbits) =               a = a -+- b
proc `-+-=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flagbits) =        a = a -+- b
proc `-+-=`*[Flagbits: enum](a: var Flagbits; b: Flags[Flagbits]) =        a = a -+- b
proc `-+-=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flags[Flagbits]) = a = a -+- b

proc `-=`*[Flagbits: enum](a: var Flagbits; b: Flagbits) =               a = a - b
proc `-=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flagbits) =        a = a - b
proc `-=`*[Flagbits: enum](a: var Flagbits; b: Flags[Flagbits]) =        a = a - b
proc `-=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flags[Flagbits]) = a = a - b

proc contains*[Flagbits: enum](flags: Flags[Flagbits]; flagbits: Flagbits): bool =
  (flags and flagbits) != flags.none

converter toString*[Flagbits: enum](flags: Flags[Flagbits]): string =
  $flags.toFlagSets
proc `$`*[Flagbits: enum](flags: Flags[Flagbits]): string =
  flags.toString

import tables
var flagbitsCache = newTable[string, uint32]()

proc `carefulAll`*[Flagbits: enum](Type: typedesc[Flags[Flagbits]]): Flags[Flagbits] =
  ## Mainly used for flags with non-contiguous bits, such as the DebugUtilsMessageSeverity flag.
  try:
    return Flags[Flagbits](flagbitsCache[$Type])
  except KeyError:
    var x = Flagbits.low.ord
    while x <= Flagbits.high.ord:
      let bit = Flagbits(x)
      if not ($bit)[0].isDigit:
        result = result or bit
      x = x shl 1
    flagbitsCache[$Type] = result.uint32

proc `carefulNot`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] =
  ## Mainly used for flags with non-contiguous bits, such as the DebugUtilsMessageSeverity flag.
  Flags[Flagbits](flags.typeof.carefulAll.uint32 and not flags.uint32)
proc `carefulNot`*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  ## Mainly used for flags with non-contiguous bits, such as the DebugUtilsMessageSeverity flag.
  carefulNot flagbits.toFlags


# Handle operations
# Utility for handle operation added independently
# ================================================

proc `==`*[T](a, b: Handle[T]): bool = a.uint64 == b.uint64
proc `==`*[T](a: Handle[T]; b: Handle[HandleType]): bool = a.uint64 == b.uint64
template `==`*[T](a: Handle[HandleType]; b: Handle[T]): bool = b == a
proc `==`*(a, b: Handle[HandleType]): bool = a.uint64 == b.uint64

proc `==`*[T](a, b: NonDispatchableHandle[T]): bool = a.uint64 == b.uint64
proc `==`*[T](a: NonDispatchableHandle[T]; b: NonDispatchableHandle[HandleType]): bool = a.uint64 == b.uint64
template `==`*[T](a: NonDispatchableHandle[HandleType]; b: NonDispatchableHandle[T]): bool = b == a
proc `==`*(a, b: NonDispatchableHandle[HandleType]): bool = a.uint64 == b.uint64

proc isValid*[T](h: Handle[T]): bool = a.uint64 != 0
proc isValid*[T](h: NonDispatchableHandle[T]): bool = a.uint64 != 0

proc nullHandle*[T](H: typedesc[Handle[T]]): Handle[T] = H(0)
proc nullHandle*[T](H: typedesc[NonDispatchableHandle[T]]): NonDispatchableHandle[T] = H(0)

# Bool32 operations
# =================

converter toString*(b: Bool32): string = (if b.uint32 == 1: "VkTrue" else: "VkFalse")
proc `$`*(b: Bool32): string = b.toString

converter toBool*(b: Bool32): bool = bool(b)
converter toBool32*(b: bool): Bool32 = Bool32(b)

# Array pointer converters
# ========================
converter toArrPtr*[T](x: var seq[T]): arrPtr[T] =
  if x.len == 0: nil
  else: addr x[0]
converter toArrPtr*[I, T](x: var array[I, T]): arrPtr[T] =
  when x.len == 0: nil
  else: addr x[0]


# Struct Constructor
# It makes it easier to understand what is optional, what is
# implicitly determined, and what needs to be explicitly set
# for many items in the vulkan structure. It also makes it
# easier to write the creation of structures.
# ==========================================================

macro `{}`*[T: object](Struct: typedesc[T]; args: varargs[untyped]): T =
  let structMemDefs = Struct.getImpl[2][2][0..^1]
  type StructArg = object
    name: NimNode
    kind: NimNode
    isOptional: bool
    constant: Option[NimNode]
    length: Option[NimNode]

  let structArgs = structMemDefs.map proc(it: NimNode): StructArg =
    result.name = it[0]
    result.kind = it[1]
    var pragma: Option[NimNode]
    if it[0].kind == nnkPragmaExpr:
      result.name = it[0][0]
      pragma = some it[0][1]
    var exportIt: bool
    if result.name.kind == nnkPostfix and result.name[0].eqIdent "*":
      exportIt = true
      result.name = result.name[1]
    if pragma.isSome:
      for p in pragma.get:
        if p.kind == nnkSym and $p == "optional":
          result.isOptional = true
        if p.kind == nnkExprColonExpr:
          if p[0].kind == nnkSym and $p[0] == "constant":
            result.constant = some p[1]
          if p[0].kind == nnkSym and $p[0] == "length":
            result.length = some p[1]
  let argsCanNotFill = structArgs.filterIt: it.constant.isSome
  let argsOptional = structArgs.filterIt: it.isOptional
  let argsFilledOptional = args
    .mapIt(argsOptional.filter(x => eqIdent(x.name, it[0]) and x.isOptional))
    .filterIt(it.len != 0)
    .mapIt(it[0])
  let argsBlankOptional = argsOptional.filter(x => not argsFilledOptional.anyIt(it == x))
  var argsNeedFill = structArgs.filterIt: not it.isOptional and it.constant.isNone
  # Mark param with the "length" pragma that point to other optional param as optional.
  for i in countdown(argsNeedFill.high, argsNeedFill.low):
    if argsNeedFill[i].length.isNone: continue
    if argsBlankOptional
        .anyIt(eqIdent(it.name, argsneedFill[i].length.get)):
      argsNeedFill.delete i

  block errorCheck:
    for arg in args:
      if argsCanNotFill.anyIt(eqIdent(it.name, arg[0])):
        error "\"" & $arg[0] & "\" is marked as constant so cannot fill it manuary", arg
    for argneed in argsNeedFill:
      if not args.anyIt(eqIdent(it[0], argneed.name)):
        error "\"" & argneed.name.repr & ": " & argneed.kind.repr & "\" is not optional. must be filled", Struct

  newNimNode(nnkObjConstr)
    .add(Struct)
    .add(structArgs
      .filterIt(it.constant.isSome)
      .mapIt(newNimNode(nnkExprColonExpr).add(it.name, it.constant.get)))
    .add(args[0..^1])