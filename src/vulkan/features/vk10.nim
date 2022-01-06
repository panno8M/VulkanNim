# VK_VERSION_1_0

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
  PipelineCacheHeaderVersionOne* = object
    headerSize*: uint32
    headerVersion*: PipelineCacheHeaderVersion
    vendorID*: uint32
    deviceID*: uint32
    pipelineCacheUUID*: array[UuidSize, uint8]

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
  FenceCreateInfo* = object
    sType* {.constant: (StructureType.fenceCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: FenceCreateFlags

  # Queue semaphore commands
  # ------------------------
  SemaphoreCreateInfo* = object
    sType* {.constant: (StructureType.semaphoreCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: SemaphoreCreateFlags

  # Event commands
  # --------------
  EventCreateInfo* = object
    sType* {.constant: (StructureType.eventCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: EventCreateFlags

  # Query commands
  # --------------
  QueryPoolCreateInfo* = object
    sType* {.constant: (StructureType.queryPoolCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: QueryPoolCreateFlags
    queryType*: QueryType
    queryCount*: uint32
    pipelineStatistics* {.optional.}: QueryPipelineStatisticFlags

  # Buffer commands
  # ---------------
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
  ShaderModuleCreateInfo* = object
    sType* {.constant: (StructureType.shaderModuleCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: ShaderModuleCreateFlags
    codeSize*: uint
    pCode* {.length: codeSize / 4.}: arrPtr[uint32]

  # Pipeline Cache commands
  # -----------------------
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
    renderPass* {.optional.}: RenderPass
    subpass*: uint32
    basePipelineHandle* {.optional.}: Pipeline
    basePipelineIndex*: int32
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
  DescriptorSetAllocateInfo* = object
    sType* {.constant: (StructureType.descriptorSetAllocateInfo).}: StructureType
    pNext* {.optional.}: pointer
    descriptorPool*: DescriptorPool
    descriptorSetCount*: uint32
    pSetLayouts* {.length: descriptorSetCount.}: arrPtr[DescriptorSetLayout]
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
    srcStageMask* {.optional.}: PipelineStageFlags
    dstStageMask* {.optional.}: PipelineStageFlags
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
  CommandPoolCreateInfo* = object
    sType* {.constant: (StructureType.commandPoolCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: CommandPoolCreateFlags
    queueFamilyIndex*: uint32

  # Command buffer commands
  # -----------------------
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
template defineHandle*(ObjectName: untyped): untyped =
  type HtObjectName* = object of HandleType
  type ObjectName* = Handle[Ht`ObjectName`]

template defineNonDispatchableHandle*(ObjectName: untyped): untyped =
  type HtObjectName* = object of HandleType
  type ObjectName* = NonDispatchableHandle[Ht`ObjectName`]
template nullHandle*(): untyped = ( cast[Handle[HtNil]](0) )


# API version macros
# ------------------
template apiVersion*(): untyped {.deprecated.} = makeVersion(1, 0, 0)
template apiVersion10*(): untyped = makeApiVersion(0, 1, 0, 0)
template headerVersion*(): untyped = 203
template headerVersionComplete*(): untyped =
  makeApiVersion(0, 1, 2, headerVersion())
template makeVersion*(major, minor, patch: uint32): untyped {.deprecated: "makeApiVersion should be used instead.".} =
  ( (major shl 22) or (minor shl 12) or patch )
template versionMajor*(version: uint32): untyped {.deprecated: "apiVersionMajor should be used instead.".} =
  (version shl 22)
template versionMajor*(version: uint32): untyped {.deprecated: "apiVersionMinor should be used instead.".} = 
  (version shl 12) and 0x3ffu
template versionPatch*(version: uint32): untyped {.deprecated: "apiVersionPatch should be used instead.".} = 
  (version) and 0xfffu
template makeApiVersion*(variant, major, minor, patch: uint32): untyped =
  (variant shl 29) or (major shl 22) or (minor shl 12) or patch
template apiVersionVariant*(version: uint32): untyped = version shl 29
template apiVersionMajor*(version: uint32): untyped = (version shl 22) and 0x7fu
template apiVersionMinor*(version: uint32): untyped = (version shl 12) and 0x3ffu
template apiVersionPatch*(version: uint32): untyped = (version) and 0xfffu


# Device initialization
# ---------------------
proc createInstance*(
      pCreateInfo: ptr InstanceCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pInstance: ptr Instance;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorInitializationFailed, Result.errorLayerNotPresent, Result.errorExtensionNotPresent, Result.errorIncompatibleDriver],
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
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorInitializationFailed],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorFormatNotSupported],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorInitializationFailed, Result.errorExtensionNotPresent, Result.errorFeatureNotPresent, Result.errorTooManyObjects, Result.errorDeviceLost],
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
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorLayerNotPresent],
      preload("vkEnumerateInstanceExtensionProperties").}
proc enumerateDeviceExtensionProperties*(
      physicalDevice: PhysicalDevice;
      pLayerName = default(cstring);
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[ExtensionProperties]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorLayerNotPresent],
      preload("vkEnumerateDeviceExtensionProperties").}


# Layer discovery commands
# ------------------------
proc enumerateInstanceLayerProperties*(
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[LayerProperties]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      preload("vkEnumerateInstanceLayerProperties").}
proc enumerateDeviceLayerProperties*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[LayerProperties]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorDeviceLost],
      preload("vkQueueSubmit").}
proc queueWaitIdle*(
      queue: Queue;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorDeviceLost],
      preload("vkQueueWaitIdle").}
proc deviceWaitIdle*(
      device: Device;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorDeviceLost],
      preload("vkDeviceWaitIdle").}


# Memory commands
# ---------------
proc allocateMemory*(
      device: Device;
      pAllocateInfo: ptr MemoryAllocateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pMemory: ptr DeviceMemory;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorInvalidExternalHandle, Result.errorInvalidOpaqueCaptureAddressKhr],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorMemoryMapFailed],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      preload("vkFlushMappedMemoryRanges").}
proc invalidateMappedMemoryRanges*(
      device: Device;
      memoryRangeCount: uint32;
      pMemoryRanges {.length: memoryRangeCount.}: arrPtr[MappedMemoryRange];
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorInvalidOpaqueCaptureAddressKhr],
      preload("vkBindBufferMemory").}
proc bindImageMemory*(
      device: Device;
      image: Image;
      memory: DeviceMemory;
      memoryOffset: DeviceSize;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorDeviceLost],
      preload("vkQueueBindSparse").}


# Fence commands
# --------------
proc createFence*(
      device: Device;
      pCreateInfo: ptr FenceCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pFence: ptr Fence;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfDeviceMemory],
      preload("vkResetFences").}
proc getFenceStatus*(
      device: Device;
      fence: Fence;
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.notReady],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorDeviceLost],
      preload("vkGetFenceStatus").}
proc waitForFences*(
      device: Device;
      fenceCount: uint32;
      pFences {.length: fenceCount.}: arrPtr[Fence];
      waitAll: Bool32;
      timeout: uint64;
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.timeout],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorDeviceLost],
      preload("vkWaitForFences").}


# Queue semaphore commands
# ------------------------
proc createSemaphore*(
      device: Device;
      pCreateInfo: ptr SemaphoreCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pSemaphore: ptr Semaphore;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
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
      successCodes: @[Result.eventSet, Result.eventReset],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorDeviceLost],
      preload("vkGetEventStatus").}
proc setEvent*(
      device: Device;
      event: Event;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      preload("vkSetEvent").}
proc resetEvent*(
      device: Device;
      event: Event;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfDeviceMemory],
      preload("vkResetEvent").}


# Query commands
# --------------
proc createQueryPool*(
      device: Device;
      pCreateInfo: ptr QueryPoolCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pQueryPool: ptr QueryPool;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
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
      successCodes: @[Result.success, Result.notReady],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorDeviceLost],
      preload("vkGetQueryPoolResults").}


# Buffer commands
# ---------------
proc createBuffer*(
      device: Device;
      pCreateInfo: ptr BufferCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pBuffer: ptr Buffer;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorInvalidOpaqueCaptureAddressKhr],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorInvalidShaderNv],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
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
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      preload("vkGetPipelineCacheData").}
proc mergePipelineCaches*(
      device: Device;
      dstCache: PipelineCache;
      srcCacheCount: uint32;
      pSrcCaches {.length: srcCacheCount.}: arrPtr[PipelineCache];
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
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
      successCodes: @[Result.success, Result.pipelineCompileRequiredExt],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorInvalidShaderNv],
      preload("vkCreateGraphicsPipelines").}
proc createComputePipelines*(
      device: Device;
      pipelineCache = default(PipelineCache);
      createInfoCount: uint32;
      pCreateInfos {.length: createInfoCount.}: arrPtr[ComputePipelineCreateInfo];
      pAllocator = default(ptr AllocationCallbacks);
      pPipelines {.length: createInfoCount.}: arrPtr[Pipeline];
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.pipelineCompileRequiredExt],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorInvalidShaderNv],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorFragmentationExt],
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
      successCodes: @[Result.success],
      preload("vkResetDescriptorPool").}
proc allocateDescriptorSets*(
      device: Device;
      pAllocateInfo: ptr DescriptorSetAllocateInfo;
      pDescriptorSets {.length: pAllocateInfo.descriptorSetCount.}: arrPtr[DescriptorSet];
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorFragmentedPool, Result.errorOutOfPoolMemory],
      preload("vkAllocateDescriptorSets").}
proc freeDescriptorSets*(
      device: Device;
      descriptorPool: DescriptorPool;
      descriptorSetCount: uint32;
      pDescriptorSets {.length: descriptorSetCount.}: arrPtr[DescriptorSet];
    ): Result {.cdecl,
      successCodes: @[Result.success],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfDeviceMemory],
      preload("vkResetCommandPool").}


# Command buffer commands
# -----------------------
proc allocateCommandBuffers*(
      device: Device;
      pAllocateInfo: ptr CommandBufferAllocateInfo;
      pCommandBuffers {.length: pAllocateInfo.commandBufferCount.}: arrPtr[CommandBuffer];
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
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
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      preload("vkBeginCommandBuffer").}
proc endCommandBuffer*(
      commandBuffer: CommandBuffer;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      preload("vkEndCommandBuffer").}
proc resetCommandBuffer*(
      commandBuffer: CommandBuffer;
      flags = default(CommandBufferResetFlags);
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfDeviceMemory],
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
      stageMask = default(PipelineStageFlags);
    ): void {.cdecl, preload("vkCmdSetEvent").}
proc cmdResetEvent*(
      commandBuffer: CommandBuffer;
      event: Event;
      stageMask = default(PipelineStageFlags);
    ): void {.cdecl, preload("vkCmdResetEvent").}
proc cmdWaitEvents*(
      commandBuffer: CommandBuffer;
      eventCount: uint32;
      pEvents {.length: eventCount.}: arrPtr[Event];
      srcStageMask = default(PipelineStageFlags);
      dstStageMask = default(PipelineStageFlags);
      memoryBarrierCount = default(uint32);
      pMemoryBarriers {.length: memoryBarrierCount.}: arrPtr[MemoryBarrier];
      bufferMemoryBarrierCount = default(uint32);
      pBufferMemoryBarriers {.length: bufferMemoryBarrierCount.}: arrPtr[BufferMemoryBarrier];
      imageMemoryBarrierCount = default(uint32);
      pImageMemoryBarriers {.length: imageMemoryBarrierCount.}: arrPtr[ImageMemoryBarrier];
    ): void {.cdecl, preload("vkCmdWaitEvents").}
proc cmdPipelineBarrier*(
      commandBuffer: CommandBuffer;
      srcStageMask = default(PipelineStageFlags);
      dstStageMask = default(PipelineStageFlags);
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

