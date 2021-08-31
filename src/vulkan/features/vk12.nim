# Generated at 2021-08-31T05:19:03Z
# vk12
# Vulkan 1.2 core API interface definitions.
# ==========================================


import ../platform
import ./vk11
export vk11

const
  StructureTypePhysicalDeviceVulkan11Features* = 49
  StructureTypePhysicalDeviceVulkan11Properties* = 50
  StructureTypePhysicalDeviceVulkan12Features* = 51
  StructureTypePhysicalDeviceVulkan12Properties* = 52
  UuidSize* = 16
  LuidSize* = 8
  MaxDriverNameSize* = 256
  MaxDriverInfoSize* = 256

  # Promoted from VK_KHR_sampler_mirror_clamp_to_edge (extension 15)
  SamplerAddressModeMirrorClampToEdge* = 4

type # enums and bitmasks
  # Promoted from VK_KHR_driver_properties (extension 197)
  DriverId* {.size: sizeof(int32), pure.} = enum
    amdProprietary = 1 # Advanced Micro Devices, Inc.
    amdOpenSource = 2 # Advanced Micro Devices, Inc.
    mesaRadv = 3 # Mesa open source project
    nvidiaProprietary = 4 # NVIDIA Corporation
    intelProprietaryWindows = 5 # Intel Corporation
    intelOpenSourceMesa = 6 # Intel Corporation
    imaginationProprietary = 7 # Imagination Technologies
    qualcommProprietary = 8 # Qualcomm Technologies, Inc.
    armProprietary = 9 # Arm Limited
    googleSwiftshader = 10 # Google LLC
    ggpProprietary = 11 # Google LLC
    broadcomProprietary = 12 # Broadcom Inc.
    mesaLlvmpipe = 13 # Mesa
    molten = 14 # MoltenVK

  # Promoted from VK_KHR_shader_float_controls (extension 198)
  ShaderFloatControlsIndependence* {.size: sizeof(int32), pure.} = enum
    vk32Only = 0
    all = 1
    none = 2

  # Promoted from VK_EXT_descriptor_indexing (extension 162)
  DescriptorBindingFlagBits* {.size: sizeof(int32), pure.} = enum
    updateAfterBind = 0x00000001
    updateUnusedWhilePending = 0x00000002
    partiallyBound = 0x00000004
    variableDescriptorCount = 0x00000008
  DescriptorBindingFlags* = Flags[DescriptorBindingFlagBits]

  # Promoted from VK_KHR_depth_stencil_resolve (extension 200)
  ResolveModeFlagBits* {.size: sizeof(int32), pure.} = enum
    none = 0
    sampleZero = 0x00000001
    average = 0x00000002
    min = 0x00000004
    max = 0x00000008
  ResolveModeFlags* = Flags[ResolveModeFlagBits]

  # Promoted from VK_EXT_sampler_filter_minmax (extension 131)
  SamplerReductionMode* {.size: sizeof(int32), pure.} = enum
    weightedAverage = 0
    min = 1
    max = 2

  # Promoted from VK_KHR_timeline_semaphore (extension 208)
  SemaphoreType* {.size: sizeof(int32), pure.} = enum
    binary = 0
    timeline = 1
  SemaphoreWaitFlagBits* {.size: sizeof(int32), pure.} = enum
    any = 0x00000001
  SemaphoreWaitFlags* = Flags[SemaphoreWaitFlagBits]

type
  PhysicalDeviceVulkan11Features* = object
    sType*: StructureType
    pNext*: pointer
    storageBuffer16BitAccess*: Bool32
    uniformAndStorageBuffer16BitAccess*: Bool32
    storagePushConstant16*: Bool32
    storageInputOutput16*: Bool32
    multiview*: Bool32
    multiviewGeometryShader*: Bool32
    multiviewTessellationShader*: Bool32
    variablePointersStorageBuffer*: Bool32
    variablePointers*: Bool32
    protectedMemory*: Bool32
    samplerYcbcrConversion*: Bool32
    shaderDrawParameters*: Bool32
  PhysicalDeviceVulkan11Properties* = object
    sType*: StructureType
    pNext*: pointer
    deviceUUID*: array[UuidSize, uint8]
    driverUUID*: array[UuidSize, uint8]
    deviceLUID*: array[LuidSize, uint8]
    deviceNodeMask*: uint32
    deviceLUIDValid*: Bool32
    subgroupSize*: uint32
    subgroupSupportedStages*: ShaderStageFlags
    subgroupSupportedOperations*: SubgroupFeatureFlags
    subgroupQuadOperationsInAllStages*: Bool32
    pointClippingBehavior*: PointClippingBehavior
    maxMultiviewViewCount*: uint32
    maxMultiviewInstanceIndex*: uint32
    protectedNoFault*: Bool32
    maxPerSetDescriptors*: uint32
    maxMemoryAllocationSize*: DeviceSize
  PhysicalDeviceVulkan12Features* = object
    sType*: StructureType
    pNext*: pointer
    samplerMirrorClampToEdge*: Bool32
    drawIndirectCount*: Bool32
    storageBuffer8BitAccess*: Bool32
    uniformAndStorageBuffer8BitAccess*: Bool32
    storagePushConstant8*: Bool32
    shaderBufferInt64Atomics*: Bool32
    shaderSharedInt64Atomics*: Bool32
    shaderFloat16*: Bool32
    shaderInt8*: Bool32
    descriptorIndexing*: Bool32
    shaderInputAttachmentArrayDynamicIndexing*: Bool32
    shaderUniformTexelBufferArrayDynamicIndexing*: Bool32
    shaderStorageTexelBufferArrayDynamicIndexing*: Bool32
    shaderUniformBufferArrayNonUniformIndexing*: Bool32
    shaderSampledImageArrayNonUniformIndexing*: Bool32
    shaderStorageBufferArrayNonUniformIndexing*: Bool32
    shaderStorageImageArrayNonUniformIndexing*: Bool32
    shaderInputAttachmentArrayNonUniformIndexing*: Bool32
    shaderUniformTexelBufferArrayNonUniformIndexing*: Bool32
    shaderStorageTexelBufferArrayNonUniformIndexing*: Bool32
    descriptorBindingUniformBufferUpdateAfterBind*: Bool32
    descriptorBindingSampledImageUpdateAfterBind*: Bool32
    descriptorBindingStorageImageUpdateAfterBind*: Bool32
    descriptorBindingStorageBufferUpdateAfterBind*: Bool32
    descriptorBindingUniformTexelBufferUpdateAfterBind*: Bool32
    descriptorBindingStorageTexelBufferUpdateAfterBind*: Bool32
    descriptorBindingUpdateUnusedWhilePending*: Bool32
    descriptorBindingPartiallyBound*: Bool32
    descriptorBindingVariableDescriptorCount*: Bool32
    runtimeDescriptorArray*: Bool32
    samplerFilterMinmax*: Bool32
    scalarBlockLayout*: Bool32
    imagelessFramebuffer*: Bool32
    uniformBufferStandardLayout*: Bool32
    shaderSubgroupExtendedTypes*: Bool32
    separateDepthStencilLayouts*: Bool32
    hostQueryReset*: Bool32
    timelineSemaphore*: Bool32
    bufferDeviceAddress*: Bool32
    bufferDeviceAddressCaptureReplay*: Bool32
    bufferDeviceAddressMultiDevice*: Bool32
    vulkanMemoryModel*: Bool32
    vulkanMemoryModelDeviceScope*: Bool32
    vulkanMemoryModelAvailabilityVisibilityChains*: Bool32
    shaderOutputViewportIndex*: Bool32
    shaderOutputLayer*: Bool32
    subgroupBroadcastDynamicId*: Bool32
  PhysicalDeviceVulkan12Properties* = object
    sType*: StructureType
    pNext*: pointer
    driverID*: DriverId
    driverName*: array[MaxDriverNameSize, char]
    driverInfo*: array[MaxDriverInfoSize, char]
    conformanceVersion*: ConformanceVersion
    denormBehaviorIndependence*: ShaderFloatControlsIndependence
    roundingModeIndependence*: ShaderFloatControlsIndependence
    shaderSignedZeroInfNanPreserveFloat16*: Bool32
    shaderSignedZeroInfNanPreserveFloat32*: Bool32
    shaderSignedZeroInfNanPreserveFloat64*: Bool32
    shaderDenormPreserveFloat16*: Bool32
    shaderDenormPreserveFloat32*: Bool32
    shaderDenormPreserveFloat64*: Bool32
    shaderDenormFlushToZeroFloat16*: Bool32
    shaderDenormFlushToZeroFloat32*: Bool32
    shaderDenormFlushToZeroFloat64*: Bool32
    shaderRoundingModeRTEFloat16*: Bool32
    shaderRoundingModeRTEFloat32*: Bool32
    shaderRoundingModeRTEFloat64*: Bool32
    shaderRoundingModeRTZFloat16*: Bool32
    shaderRoundingModeRTZFloat32*: Bool32
    shaderRoundingModeRTZFloat64*: Bool32
    maxUpdateAfterBindDescriptorsInAllPools*: uint32
    shaderUniformBufferArrayNonUniformIndexingNative*: Bool32
    shaderSampledImageArrayNonUniformIndexingNative*: Bool32
    shaderStorageBufferArrayNonUniformIndexingNative*: Bool32
    shaderStorageImageArrayNonUniformIndexingNative*: Bool32
    shaderInputAttachmentArrayNonUniformIndexingNative*: Bool32
    robustBufferAccessUpdateAfterBind*: Bool32
    quadDivergentImplicitLod*: Bool32
    maxPerStageDescriptorUpdateAfterBindSamplers*: uint32
    maxPerStageDescriptorUpdateAfterBindUniformBuffers*: uint32
    maxPerStageDescriptorUpdateAfterBindStorageBuffers*: uint32
    maxPerStageDescriptorUpdateAfterBindSampledImages*: uint32
    maxPerStageDescriptorUpdateAfterBindStorageImages*: uint32
    maxPerStageDescriptorUpdateAfterBindInputAttachments*: uint32
    maxPerStageUpdateAfterBindResources*: uint32
    maxDescriptorSetUpdateAfterBindSamplers*: uint32
    maxDescriptorSetUpdateAfterBindUniformBuffers*: uint32
    maxDescriptorSetUpdateAfterBindUniformBuffersDynamic*: uint32
    maxDescriptorSetUpdateAfterBindStorageBuffers*: uint32
    maxDescriptorSetUpdateAfterBindStorageBuffersDynamic*: uint32
    maxDescriptorSetUpdateAfterBindSampledImages*: uint32
    maxDescriptorSetUpdateAfterBindStorageImages*: uint32
    maxDescriptorSetUpdateAfterBindInputAttachments*: uint32
    supportedDepthResolveModes*: ResolveModeFlags
    supportedStencilResolveModes*: ResolveModeFlags
    independentResolveNone*: Bool32
    independentResolve*: Bool32
    filterMinmaxSingleComponentFormats*: Bool32
    filterMinmaxImageComponentMapping*: Bool32
    maxTimelineSemaphoreValueDifference*: uint64
    framebufferIntegerColorSampleCounts*: SampleCountFlags

  # Promoted from VK_KHR_image_format_list (extension 148)
  # ------------------------------------------------------
  ImageFormatListCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    viewFormatCount*: uint32
    pViewFormats*: ptr Format

  # Promoted from VK_KHR_create_renderpass2 (extension 110)
  # -------------------------------------------------------
  RenderPassCreateInfo2* = object
    sType*: StructureType
    pNext*: pointer
    flags*: RenderPassCreateFlags
    attachmentCount*: uint32
    pAttachments*: ptr AttachmentDescription2
    subpassCount*: uint32
    pSubpasses*: ptr SubpassDescription2
    dependencyCount*: uint32
    pDependencies*: ptr SubpassDependency2
    correlatedViewMaskCount*: uint32
    pCorrelatedViewMasks*: ptr uint32
  AttachmentDescription2* = object
    sType*: StructureType
    pNext*: pointer
    flags*: AttachmentDescriptionFlags
    format*: Format
    samples*: SampleCountFlagBits
    loadOp*: AttachmentLoadOp
    storeOp*: AttachmentStoreOp
    stencilLoadOp*: AttachmentLoadOp
    stencilStoreOp*: AttachmentStoreOp
    initialLayout*: ImageLayout
    finalLayout*: ImageLayout
  AttachmentReference2* = object
    sType*: StructureType
    pNext*: pointer
    attachment*: uint32
    layout*: ImageLayout
    aspectMask*: ImageAspectFlags
  SubpassDescription2* = object
    sType*: StructureType
    pNext*: pointer
    flags*: SubpassDescriptionFlags
    pipelineBindPoint*: PipelineBindPoint
    viewMask*: uint32
    inputAttachmentCount*: uint32
    pInputAttachments*: ptr AttachmentReference2
    colorAttachmentCount*: uint32
    pColorAttachments*: ptr AttachmentReference2
    pResolveAttachments*: ptr AttachmentReference2
    pDepthStencilAttachment*: ptr AttachmentReference2
    preserveAttachmentCount*: uint32
    pPreserveAttachments*: ptr uint32
  SubpassDependency2* = object
    sType*: StructureType
    pNext*: pointer
    srcSubpass*: uint32
    dstSubpass*: uint32
    srcStageMask*: PipelineStageFlags
    dstStageMask*: PipelineStageFlags
    srcAccessMask*: AccessFlags
    dstAccessMask*: AccessFlags
    dependencyFlags*: DependencyFlags
    viewOffset*: int32
  SubpassBeginInfo* = object
    sType*: StructureType
    pNext*: pointer
    contents*: SubpassContents
  SubpassEndInfo* = object
    sType*: StructureType
    pNext*: pointer

  # Promoted from VK_KHR_8bit_storage (extension 178)
  # -------------------------------------------------
  PhysicalDevice8BitStorageFeatures* = object
    sType*: StructureType
    pNext*: pointer
    storageBuffer8BitAccess*: Bool32
    uniformAndStorageBuffer8BitAccess*: Bool32
    storagePushConstant8*: Bool32

  # Promoted from VK_KHR_driver_properties (extension 197)
  # ------------------------------------------------------
  ConformanceVersion* = object
    major*: uint8
    minor*: uint8
    subminor*: uint8
    patch*: uint8
  PhysicalDeviceDriverProperties* = object
    sType*: StructureType
    pNext*: pointer
    driverID*: DriverId
    driverName*: array[MaxDriverNameSize, char]
    driverInfo*: array[MaxDriverInfoSize, char]
    conformanceVersion*: ConformanceVersion

  # Promoted from VK_KHR_shader_atomic_int64 (extension 181)
  # --------------------------------------------------------
  PhysicalDeviceShaderAtomicInt64Features* = object
    sType*: StructureType
    pNext*: pointer
    shaderBufferInt64Atomics*: Bool32
    shaderSharedInt64Atomics*: Bool32

  # Promoted from VK_KHR_shader_float16_int8 (extension 83)
  # -------------------------------------------------------
  PhysicalDeviceShaderFloat16Int8Features* = object
    sType*: StructureType
    pNext*: pointer
    shaderFloat16*: Bool32
    shaderInt8*: Bool32

  # Promoted from VK_KHR_shader_float_controls (extension 198)
  # ----------------------------------------------------------
  PhysicalDeviceFloatControlsProperties* = object
    sType*: StructureType
    pNext*: pointer
    denormBehaviorIndependence*: ShaderFloatControlsIndependence
    roundingModeIndependence*: ShaderFloatControlsIndependence
    shaderSignedZeroInfNanPreserveFloat16*: Bool32
    shaderSignedZeroInfNanPreserveFloat32*: Bool32
    shaderSignedZeroInfNanPreserveFloat64*: Bool32
    shaderDenormPreserveFloat16*: Bool32
    shaderDenormPreserveFloat32*: Bool32
    shaderDenormPreserveFloat64*: Bool32
    shaderDenormFlushToZeroFloat16*: Bool32
    shaderDenormFlushToZeroFloat32*: Bool32
    shaderDenormFlushToZeroFloat64*: Bool32
    shaderRoundingModeRTEFloat16*: Bool32
    shaderRoundingModeRTEFloat32*: Bool32
    shaderRoundingModeRTEFloat64*: Bool32
    shaderRoundingModeRTZFloat16*: Bool32
    shaderRoundingModeRTZFloat32*: Bool32
    shaderRoundingModeRTZFloat64*: Bool32

  # Promoted from VK_EXT_descriptor_indexing (extension 162)
  # --------------------------------------------------------
  DescriptorSetLayoutBindingFlagsCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    bindingCount*: uint32
    pBindingFlags*: ptr DescriptorBindingFlags
  PhysicalDeviceDescriptorIndexingFeatures* = object
    sType*: StructureType
    pNext*: pointer
    shaderInputAttachmentArrayDynamicIndexing*: Bool32
    shaderUniformTexelBufferArrayDynamicIndexing*: Bool32
    shaderStorageTexelBufferArrayDynamicIndexing*: Bool32
    shaderUniformBufferArrayNonUniformIndexing*: Bool32
    shaderSampledImageArrayNonUniformIndexing*: Bool32
    shaderStorageBufferArrayNonUniformIndexing*: Bool32
    shaderStorageImageArrayNonUniformIndexing*: Bool32
    shaderInputAttachmentArrayNonUniformIndexing*: Bool32
    shaderUniformTexelBufferArrayNonUniformIndexing*: Bool32
    shaderStorageTexelBufferArrayNonUniformIndexing*: Bool32
    descriptorBindingUniformBufferUpdateAfterBind*: Bool32
    descriptorBindingSampledImageUpdateAfterBind*: Bool32
    descriptorBindingStorageImageUpdateAfterBind*: Bool32
    descriptorBindingStorageBufferUpdateAfterBind*: Bool32
    descriptorBindingUniformTexelBufferUpdateAfterBind*: Bool32
    descriptorBindingStorageTexelBufferUpdateAfterBind*: Bool32
    descriptorBindingUpdateUnusedWhilePending*: Bool32
    descriptorBindingPartiallyBound*: Bool32
    descriptorBindingVariableDescriptorCount*: Bool32
    runtimeDescriptorArray*: Bool32
  PhysicalDeviceDescriptorIndexingProperties* = object
    sType*: StructureType
    pNext*: pointer
    maxUpdateAfterBindDescriptorsInAllPools*: uint32
    shaderUniformBufferArrayNonUniformIndexingNative*: Bool32
    shaderSampledImageArrayNonUniformIndexingNative*: Bool32
    shaderStorageBufferArrayNonUniformIndexingNative*: Bool32
    shaderStorageImageArrayNonUniformIndexingNative*: Bool32
    shaderInputAttachmentArrayNonUniformIndexingNative*: Bool32
    robustBufferAccessUpdateAfterBind*: Bool32
    quadDivergentImplicitLod*: Bool32
    maxPerStageDescriptorUpdateAfterBindSamplers*: uint32
    maxPerStageDescriptorUpdateAfterBindUniformBuffers*: uint32
    maxPerStageDescriptorUpdateAfterBindStorageBuffers*: uint32
    maxPerStageDescriptorUpdateAfterBindSampledImages*: uint32
    maxPerStageDescriptorUpdateAfterBindStorageImages*: uint32
    maxPerStageDescriptorUpdateAfterBindInputAttachments*: uint32
    maxPerStageUpdateAfterBindResources*: uint32
    maxDescriptorSetUpdateAfterBindSamplers*: uint32
    maxDescriptorSetUpdateAfterBindUniformBuffers*: uint32
    maxDescriptorSetUpdateAfterBindUniformBuffersDynamic*: uint32
    maxDescriptorSetUpdateAfterBindStorageBuffers*: uint32
    maxDescriptorSetUpdateAfterBindStorageBuffersDynamic*: uint32
    maxDescriptorSetUpdateAfterBindSampledImages*: uint32
    maxDescriptorSetUpdateAfterBindStorageImages*: uint32
    maxDescriptorSetUpdateAfterBindInputAttachments*: uint32
  DescriptorSetVariableDescriptorCountAllocateInfo* = object
    sType*: StructureType
    pNext*: pointer
    descriptorSetCount*: uint32
    pDescriptorCounts*: ptr uint32
  DescriptorSetVariableDescriptorCountLayoutSupport* = object
    sType*: StructureType
    pNext*: pointer
    maxVariableDescriptorCount*: uint32

  # Promoted from VK_KHR_depth_stencil_resolve (extension 200)
  # ----------------------------------------------------------
  SubpassDescriptionDepthStencilResolve* = object
    sType*: StructureType
    pNext*: pointer
    depthResolveMode*: ResolveModeFlagBits
    stencilResolveMode*: ResolveModeFlagBits
    pDepthStencilResolveAttachment*: ptr AttachmentReference2
  PhysicalDeviceDepthStencilResolveProperties* = object
    sType*: StructureType
    pNext*: pointer
    supportedDepthResolveModes*: ResolveModeFlags
    supportedStencilResolveModes*: ResolveModeFlags
    independentResolveNone*: Bool32
    independentResolve*: Bool32

  # Promoted from VK_EXT_scalar_block_layout (extension 222))
  # ---------------------------------------------------------
  PhysicalDeviceScalarBlockLayoutFeatures* = object
    sType*: StructureType
    pNext*: pointer
    scalarBlockLayout*: Bool32

  # Promoted from VK_EXT_separate_stencil_usage (extension 247)
  # -----------------------------------------------------------
  ImageStencilUsageCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    stencilUsage*: ImageUsageFlags

  # Promoted from VK_EXT_sampler_filter_minmax (extension 131)
  # ----------------------------------------------------------
  SamplerReductionModeCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    reductionMode*: SamplerReductionMode
  PhysicalDeviceSamplerFilterMinmaxProperties* = object
    sType*: StructureType
    pNext*: pointer
    filterMinmaxSingleComponentFormats*: Bool32
    filterMinmaxImageComponentMapping*: Bool32

  # Promoted from VK_KHR_vulkan_memory_model (extension 212)
  # --------------------------------------------------------
  PhysicalDeviceVulkanMemoryModelFeatures* = object
    sType*: StructureType
    pNext*: pointer
    vulkanMemoryModel*: Bool32
    vulkanMemoryModelDeviceScope*: Bool32
    vulkanMemoryModelAvailabilityVisibilityChains*: Bool32

  # Promoted from VK_KHR_imageless_framebuffer (extension 109)
  # ----------------------------------------------------------
  PhysicalDeviceImagelessFramebufferFeatures* = object
    sType*: StructureType
    pNext*: pointer
    imagelessFramebuffer*: Bool32
  FramebufferAttachmentsCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    attachmentImageInfoCount*: uint32
    pAttachmentImageInfos*: ptr FramebufferAttachmentImageInfo
  FramebufferAttachmentImageInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: ImageCreateFlags
    usage*: ImageUsageFlags
    width*: uint32
    height*: uint32
    layerCount*: uint32
    viewFormatCount*: uint32
    pViewFormats*: ptr Format
  RenderPassAttachmentBeginInfo* = object
    sType*: StructureType
    pNext*: pointer
    attachmentCount*: uint32
    pAttachments*: ptr ImageView

  # Promoted from VK_KHR_uniform_buffer_standard_layout (extension 254)
  # -------------------------------------------------------------------
  PhysicalDeviceUniformBufferStandardLayoutFeatures* = object
    sType*: StructureType
    pNext*: pointer
    uniformBufferStandardLayout*: Bool32

  # Promoted from VK_KHR_shader_subgroup_extended_types (extension 176)
  # -------------------------------------------------------------------
  PhysicalDeviceShaderSubgroupExtendedTypesFeatures* = object
    sType*: StructureType
    pNext*: pointer
    shaderSubgroupExtendedTypes*: Bool32

  # Promoted from VK_KHR_separate_depth_stencil_layouts (extension 242)
  # -------------------------------------------------------------------
  PhysicalDeviceSeparateDepthStencilLayoutsFeatures* = object
    sType*: StructureType
    pNext*: pointer
    separateDepthStencilLayouts*: Bool32
  AttachmentReferenceStencilLayout* = object
    sType*: StructureType
    pNext*: pointer
    stencilLayout*: ImageLayout
  AttachmentDescriptionStencilLayout* = object
    sType*: StructureType
    pNext*: pointer
    stencilInitialLayout*: ImageLayout
    stencilFinalLayout*: ImageLayout

  # Promoted from VK_EXT_host_query_reset (extension 262)
  # -----------------------------------------------------
  PhysicalDeviceHostQueryResetFeatures* = object
    sType*: StructureType
    pNext*: pointer
    hostQueryReset*: Bool32

  # Promoted from VK_KHR_timeline_semaphore (extension 208)
  # -------------------------------------------------------
  PhysicalDeviceTimelineSemaphoreFeatures* = object
    sType*: StructureType
    pNext*: pointer
    timelineSemaphore*: Bool32
  PhysicalDeviceTimelineSemaphoreProperties* = object
    sType*: StructureType
    pNext*: pointer
    maxTimelineSemaphoreValueDifference*: uint64
  SemaphoreTypeCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    semaphoreType*: SemaphoreType
    initialValue*: uint64
  TimelineSemaphoreSubmitInfo* = object
    sType*: StructureType
    pNext*: pointer
    waitSemaphoreValueCount*: uint32
    pWaitSemaphoreValues*: ptr uint64
    signalSemaphoreValueCount*: uint32
    pSignalSemaphoreValues*: ptr uint64
  SemaphoreWaitInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: SemaphoreWaitFlags
    semaphoreCount*: uint32
    pSemaphores*: ptr Semaphore
    pValues*: ptr uint64
  SemaphoreSignalInfo* = object
    sType*: StructureType
    pNext*: pointer
    semaphore*: Semaphore
    value*: uint64

  # Promoted from VK_KHR_buffer_device_address (extension 258)
  # ----------------------------------------------------------
  PhysicalDeviceBufferDeviceAddressFeatures* = object
    sType*: StructureType
    pNext*: pointer
    bufferDeviceAddress*: Bool32
    bufferDeviceAddressCaptureReplay*: Bool32
    bufferDeviceAddressMultiDevice*: Bool32
  BufferDeviceAddressInfo* = object
    sType*: StructureType
    pNext*: pointer
    buffer*: Buffer
  BufferOpaqueCaptureAddressCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    opaqueCaptureAddress*: uint64
  MemoryOpaqueCaptureAddressAllocateInfo* = object
    sType*: StructureType
    pNext*: pointer
    opaqueCaptureAddress*: uint64
  DeviceMemoryOpaqueCaptureAddressInfo* = object
    sType*: StructureType
    pNext*: pointer
    memory*: DeviceMemory

template apiVersion12*(): untyped = makeVersion(1, 2, 0)


# Promoted from VK_KHR_image_format_list (extension 148)
# ------------------------------------------------------


# Promoted from VK_KHR_sampler_mirror_clamp_to_edge (extension 15)
# ----------------------------------------------------------------


# Promoted from VK_KHR_draw_indirect_count (extension 170)
# --------------------------------------------------------
var # command cages
  cmdDrawIndirectCountCage: proc(commandBuffer: CommandBuffer; buffer: Buffer; offset: DeviceSize; countBuffer: Buffer; countBufferOffset: DeviceSize; maxDrawCount: uint32; stride: uint32;): void {.cdecl.}
  cmdDrawIndexedIndirectCountCage: proc(commandBuffer: CommandBuffer; buffer: Buffer; offset: DeviceSize; countBuffer: Buffer; countBufferOffset: DeviceSize; maxDrawCount: uint32; stride: uint32;): void {.cdecl.}
proc cmdDrawIndirectCount*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      countBuffer: Buffer;
      countBufferOffset: DeviceSize;
      maxDrawCount: uint32;
      stride: uint32;
    ): void {.cdecl.} =
  cmdDrawIndirectCountCage(commandBuffer,buffer,offset,countBuffer,countBufferOffset,maxDrawCount,stride)
proc cmdDrawIndexedIndirectCount*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      countBuffer: Buffer;
      countBufferOffset: DeviceSize;
      maxDrawCount: uint32;
      stride: uint32;
    ): void {.cdecl.} =
  cmdDrawIndexedIndirectCountCage(commandBuffer,buffer,offset,countBuffer,countBufferOffset,maxDrawCount,stride)


# Promoted from VK_KHR_create_renderpass2 (extension 110)
# -------------------------------------------------------
var # command cages
  createRenderPass2Cage: proc(device: Device; pCreateInfo: ptr RenderPassCreateInfo2; pAllocator: ptr AllocationCallbacks; pRenderPass: ptr RenderPass;): Result {.cdecl.}
  cmdBeginRenderPass2Cage: proc(commandBuffer: CommandBuffer; pRenderPassBegin: ptr RenderPassBeginInfo; pSubpassBeginInfo: ptr SubpassBeginInfo;): void {.cdecl.}
  cmdNextSubpass2Cage: proc(commandBuffer: CommandBuffer; pSubpassBeginInfo: ptr SubpassBeginInfo; pSubpassEndInfo: ptr SubpassEndInfo;): void {.cdecl.}
  cmdEndRenderPass2Cage: proc(commandBuffer: CommandBuffer; pSubpassEndInfo: ptr SubpassEndInfo;): void {.cdecl.}
proc createRenderPass2*(
      device: Device;
      pCreateInfo: ptr RenderPassCreateInfo2;
      pAllocator: ptr AllocationCallbacks;
      pRenderPass: ptr RenderPass;
    ): Result {.cdecl, discardable.} =
  createRenderPass2Cage(device,pCreateInfo,pAllocator,pRenderPass)
proc cmdBeginRenderPass2*(
      commandBuffer: CommandBuffer;
      pRenderPassBegin: ptr RenderPassBeginInfo;
      pSubpassBeginInfo: ptr SubpassBeginInfo;
    ): void {.cdecl.} =
  cmdBeginRenderPass2Cage(commandBuffer,pRenderPassBegin,pSubpassBeginInfo)
proc cmdNextSubpass2*(
      commandBuffer: CommandBuffer;
      pSubpassBeginInfo: ptr SubpassBeginInfo;
      pSubpassEndInfo: ptr SubpassEndInfo;
    ): void {.cdecl.} =
  cmdNextSubpass2Cage(commandBuffer,pSubpassBeginInfo,pSubpassEndInfo)
proc cmdEndRenderPass2*(
      commandBuffer: CommandBuffer;
      pSubpassEndInfo: ptr SubpassEndInfo;
    ): void {.cdecl.} =
  cmdEndRenderPass2Cage(commandBuffer,pSubpassEndInfo)


# Promoted from VK_KHR_8bit_storage (extension 178)
# -------------------------------------------------


# Promoted from VK_KHR_driver_properties (extension 197)
# ------------------------------------------------------


# Promoted from VK_KHR_shader_atomic_int64 (extension 181)
# --------------------------------------------------------


# Promoted from VK_KHR_shader_float16_int8 (extension 83)
# -------------------------------------------------------


# Promoted from VK_KHR_shader_float_controls (extension 198)
# ----------------------------------------------------------


# Promoted from VK_EXT_descriptor_indexing (extension 162)
# --------------------------------------------------------


# Promoted from VK_KHR_depth_stencil_resolve (extension 200)
# ----------------------------------------------------------


# Promoted from VK_EXT_scalar_block_layout (extension 222))
# ---------------------------------------------------------


# Promoted from VK_EXT_shader_viewport_index_layer, which has no API (extension 163)
# ----------------------------------------------------------------------------------


# Promoted from VK_EXT_separate_stencil_usage (extension 247)
# -----------------------------------------------------------


# Promoted from VK_EXT_sampler_filter_minmax (extension 131)
# ----------------------------------------------------------


# Promoted from VK_KHR_vulkan_memory_model (extension 212)
# --------------------------------------------------------


# Promoted from VK_KHR_imageless_framebuffer (extension 109)
# ----------------------------------------------------------


# Promoted from VK_KHR_uniform_buffer_standard_layout (extension 254)
# -------------------------------------------------------------------


# Promoted from VK_KHR_shader_subgroup_extended_types (extension 176)
# -------------------------------------------------------------------


# Promoted from VK_KHR_spirv_1_4 (extension 237)
# ----------------------------------------------


# Promoted from VK_KHR_separate_depth_stencil_layouts (extension 242)
# -------------------------------------------------------------------


# Promoted from VK_EXT_host_query_reset (extension 262)
# -----------------------------------------------------
var # command cages
  resetQueryPoolCage: proc(device: Device; queryPool: QueryPool; firstQuery: uint32; queryCount: uint32;): void {.cdecl.}
proc resetQueryPool*(
      device: Device;
      queryPool: QueryPool;
      firstQuery: uint32;
      queryCount: uint32;
    ): void {.cdecl.} =
  resetQueryPoolCage(device,queryPool,firstQuery,queryCount)


# Promoted from VK_KHR_timeline_semaphore (extension 208)
# -------------------------------------------------------
var # command cages
  getSemaphoreCounterValueCage: proc(device: Device; semaphore: Semaphore; pValue: ptr uint64;): Result {.cdecl.}
  waitSemaphoresCage: proc(device: Device; pWaitInfo: ptr SemaphoreWaitInfo; timeout: uint64;): Result {.cdecl.}
  signalSemaphoreCage: proc(device: Device; pSignalInfo: ptr SemaphoreSignalInfo;): Result {.cdecl.}
proc getSemaphoreCounterValue*(
      device: Device;
      semaphore: Semaphore;
      pValue: ptr uint64;
    ): Result {.cdecl, discardable.} =
  getSemaphoreCounterValueCage(device,semaphore,pValue)
proc waitSemaphores*(
      device: Device;
      pWaitInfo: ptr SemaphoreWaitInfo;
      timeout: uint64;
    ): Result {.cdecl, discardable.} =
  waitSemaphoresCage(device,pWaitInfo,timeout)
proc signalSemaphore*(
      device: Device;
      pSignalInfo: ptr SemaphoreSignalInfo;
    ): Result {.cdecl, discardable.} =
  signalSemaphoreCage(device,pSignalInfo)


# Promoted from VK_KHR_buffer_device_address (extension 258)
# ----------------------------------------------------------
var # command cages
  getBufferDeviceAddressCage: proc(device: Device; pInfo: ptr BufferDeviceAddressInfo;): DeviceAddress {.cdecl.}
  getBufferOpaqueCaptureAddressCage: proc(device: Device; pInfo: ptr BufferDeviceAddressInfo;): uint64 {.cdecl.}
  getDeviceMemoryOpaqueCaptureAddressCage: proc(device: Device; pInfo: ptr DeviceMemoryOpaqueCaptureAddressInfo;): uint64 {.cdecl.}
proc getBufferDeviceAddress*(
      device: Device;
      pInfo: ptr BufferDeviceAddressInfo;
    ): DeviceAddress {.cdecl.} =
  getBufferDeviceAddressCage(device,pInfo)
proc getBufferOpaqueCaptureAddress*(
      device: Device;
      pInfo: ptr BufferDeviceAddressInfo;
    ): uint64 {.cdecl.} =
  getBufferOpaqueCaptureAddressCage(device,pInfo)
proc getDeviceMemoryOpaqueCaptureAddress*(
      device: Device;
      pInfo: ptr DeviceMemoryOpaqueCaptureAddressInfo;
    ): uint64 {.cdecl.} =
  getDeviceMemoryOpaqueCaptureAddressCage(device,pInfo)

proc loadVk12*(instance: Instance) =
  instance.defineLoader(`<<`)

  # Promoted from VK_KHR_draw_indirect_count (extension 170)
  cmdDrawIndirectCountCage << "vkCmdDrawIndirectCount"
  cmdDrawIndexedIndirectCountCage << "vkCmdDrawIndexedIndirectCount"

  # Promoted from VK_KHR_create_renderpass2 (extension 110)
  createRenderPass2Cage << "vkCreateRenderPass2"
  cmdBeginRenderPass2Cage << "vkCmdBeginRenderPass2"
  cmdNextSubpass2Cage << "vkCmdNextSubpass2"
  cmdEndRenderPass2Cage << "vkCmdEndRenderPass2"

  # Promoted from VK_EXT_host_query_reset (extension 262)
  resetQueryPoolCage << "vkResetQueryPool"

  # Promoted from VK_KHR_timeline_semaphore (extension 208)
  getSemaphoreCounterValueCage << "vkGetSemaphoreCounterValue"
  waitSemaphoresCage << "vkWaitSemaphores"
  signalSemaphoreCage << "vkSignalSemaphore"

  # Promoted from VK_KHR_buffer_device_address (extension 258)
  getBufferDeviceAddressCage << "vkGetBufferDeviceAddress"
  getBufferOpaqueCaptureAddressCage << "vkGetBufferOpaqueCaptureAddress"
  getDeviceMemoryOpaqueCaptureAddressCage << "vkGetDeviceMemoryOpaqueCaptureAddress"