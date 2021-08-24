# Generated at 2021-08-24T20:18:44+09:00
# vulkan 1.2
# Vulkan 1.2 core API interface definitions.
# ==========================================

import ../platform
import vk11
export vk11

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
    deviceUUID*: uint8
    driverUUID*: uint8
    deviceLUID*: uint8
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
  PhysicalDeviceVulkan12Properties* = object
    sType*: StructureType
    pNext*: pointer
    driverID*: DriverId
    driverName*: char
    driverInfo*: char
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

  # Promoted from VK_KHR_image_format_list (extension 148)
  # ------------------------------------------------------
  ImageFormatListCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    viewFormatCount*: uint32
    pViewFormats*: ptr Format

  # Promoted from VK_KHR_create_renderpass2 (extension 110)
  # -------------------------------------------------------
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
  DriverId* {.size: sizeof(int32), pure.} = enum
    AmdProprietary = 1 # Advanced Micro Devices, Inc.
    AmdOpenSource = 2 # Advanced Micro Devices, Inc.
    MesaRadv = 3 # Mesa open source project
    NvidiaProprietary = 4 # NVIDIA Corporation
    IntelProprietaryWindows = 5 # Intel Corporation
    IntelOpenSource = 6 # Intel Corporation
    ImaginationProprietary = 7 # Imagination Technologies
    QualcommProprietary = 8 # Qualcomm Technologies, Inc.
    ArmProprietary = 9 # Arm Limited
    GoogleSwiftshader = 10 # Google LLC
    GgpProprietary = 11 # Google LLC
    BroadcomProprietary = 12 # Broadcom Inc.
    MesaLlvmpipe = 13 # Mesa
    Molten = 14 # MoltenVK
  ConformanceVersion* = object
    major*: uint8
    minor*: uint8
    subminor*: uint8
    patch*: uint8
  PhysicalDeviceDriverProperties* = object
    sType*: StructureType
    pNext*: pointer
    driverID*: DriverId
    driverName*: char
    driverInfo*: char
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
  ShaderFloatControlsIndependence* {.size: sizeof(int32), pure.} = enum
    Vk32BitOnly = 0
    All = 1
    None = 2

  # Promoted from VK_EXT_descriptor_indexing (extension 162)
  # --------------------------------------------------------
  DescriptorSetLayoutBindingFlagsCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    bindingCount*: uint32
    pBindingFlags*: ptr DescriptorBindingFlags
  DescriptorSetVariableDescriptorCountAllocateInfo* = object
    sType*: StructureType
    pNext*: pointer
    descriptorSetCount*: uint32
    pDescriptorCounts*: ptr uint32
  DescriptorBindingFlags* = distinct Flags
  DescriptorSetVariableDescriptorCountLayoutSupport* = object
    sType*: StructureType
    pNext*: pointer
    maxVariableDescriptorCount*: uint32
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
  DescriptorBindingFlagBits* {.size: sizeof(int32), pure.} = enum
    UpdateAfterBind = 0x00000001
    UpdateUnusedWhilePending = 0x00000002
    PartiallyBound = 0x00000004
    VariableDescriptorCount = 0x00000008
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

  # Promoted from VK_KHR_depth_stencil_resolve (extension 200)
  # ----------------------------------------------------------
  ResolveModeFlagBits* {.size: sizeof(int32), pure.} = enum
    None = 0
    SampleZero = 0x00000001
    Average = 0x00000002
    Min = 0x00000004
    Max = 0x00000008
  SubpassDescriptionDepthStencilResolve* = object
    sType*: StructureType
    pNext*: pointer
    depthResolveMode*: ResolveModeFlagBits
    stencilResolveMode*: ResolveModeFlagBits
    pDepthStencilResolveAttachment*: ptr AttachmentReference2
  ResolveModeFlags* = distinct Flags
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
  SamplerReductionMode* {.size: sizeof(int32), pure.} = enum
    WeightedAverage = 0
    Min = 1
    Max = 2
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
  FramebufferAttachmentsCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    attachmentImageInfoCount*: uint32
    pAttachmentImageInfos*: ptr FramebufferAttachmentImageInfo
  RenderPassAttachmentBeginInfo* = object
    sType*: StructureType
    pNext*: pointer
    attachmentCount*: uint32
    pAttachments*: ptr ImageView
  PhysicalDeviceImagelessFramebufferFeatures* = object
    sType*: StructureType
    pNext*: pointer
    imagelessFramebuffer*: Bool32
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
  AttachmentReferenceStencilLayout* = object
    sType*: StructureType
    pNext*: pointer
    stencilLayout*: ImageLayout
  AttachmentDescriptionStencilLayout* = object
    sType*: StructureType
    pNext*: pointer
    stencilInitialLayout*: ImageLayout
    stencilFinalLayout*: ImageLayout
  PhysicalDeviceSeparateDepthStencilLayoutsFeatures* = object
    sType*: StructureType
    pNext*: pointer
    separateDepthStencilLayouts*: Bool32

  # Promoted from VK_EXT_host_query_reset (extension 262)
  # -----------------------------------------------------
  PhysicalDeviceHostQueryResetFeatures* = object
    sType*: StructureType
    pNext*: pointer
    hostQueryReset*: Bool32

  # Promoted from VK_KHR_timeline_semaphore (extension 208)
  # -------------------------------------------------------
  PhysicalDeviceTimelineSemaphoreProperties* = object
    sType*: StructureType
    pNext*: pointer
    maxTimelineSemaphoreValueDifference*: uint64
  SemaphoreWaitInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: SemaphoreWaitFlags
    semaphoreCount*: uint32
    pSemaphores*: ptr Semaphore
    pValues*: ptr uint64
  PhysicalDeviceTimelineSemaphoreFeatures* = object
    sType*: StructureType
    pNext*: pointer
    timelineSemaphore*: Bool32
  SemaphoreWaitFlags* = distinct Flags
  SemaphoreSignalInfo* = object
    sType*: StructureType
    pNext*: pointer
    semaphore*: Semaphore
    value*: uint64
  SemaphoreType* {.size: sizeof(int32), pure.} = enum
    Binary = 0
    Timeline = 1
  SemaphoreWaitFlagBits* {.size: sizeof(int32), pure.} = enum
    Any = 0x00000001
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

  # Promoted from VK_KHR_buffer_device_address (extension 258)
  # ----------------------------------------------------------
  DeviceMemoryOpaqueCaptureAddressInfo* = object
    sType*: StructureType
    pNext*: pointer
    memory*: DeviceMemory
  PhysicalDeviceBufferDeviceAddressFeatures* = object
    sType*: StructureType
    pNext*: pointer
    bufferDeviceAddress*: Bool32
    bufferDeviceAddressCaptureReplay*: Bool32
    bufferDeviceAddressMultiDevice*: Bool32
  BufferOpaqueCaptureAddressCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    opaqueCaptureAddress*: uint64
  BufferDeviceAddressInfo* = object
    sType*: StructureType
    pNext*: pointer
    buffer*: Buffer
  MemoryOpaqueCaptureAddressAllocateInfo* = object
    sType*: StructureType
    pNext*: pointer
    opaqueCaptureAddress*: uint64

template apiVersion12*(): untyped = makeVersion(1, 2, 0)


# Promoted from VK_KHR_image_format_list (extension 148)
# ------------------------------------------------------

# Promoted from VK_KHR_sampler_mirror_clamp_to_edge (extension 15)
# ----------------------------------------------------------------

# Promoted from VK_KHR_draw_indirect_count (extension 170)
# --------------------------------------------------------
var # commands
  cmdDrawIndexedIndirectCountCage: proc(commandBuffer: CommandBuffer; buffer: Buffer; offset: DeviceSize; countBuffer: Buffer; countBufferOffset: DeviceSize; maxDrawCount: uint32; stride: uint32;): void {.cdecl.}
  cmdDrawIndirectCountCage: proc(commandBuffer: CommandBuffer; buffer: Buffer; offset: DeviceSize; countBuffer: Buffer; countBufferOffset: DeviceSize; maxDrawCount: uint32; stride: uint32;): void {.cdecl.}

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


# Promoted from VK_KHR_create_renderpass2 (extension 110)
# -------------------------------------------------------
var # commands
  createRenderPass2Cage: proc(device: Device; pCreateInfo: ptr RenderPassCreateInfo2; pAllocator: ptr AllocationCallbacks; pRenderPass: ptr RenderPass;): Result {.cdecl.}
  cmdEndRenderPass2Cage: proc(commandBuffer: CommandBuffer; pSubpassEndInfo: ptr SubpassEndInfo;): void {.cdecl.}
  cmdBeginRenderPass2Cage: proc(commandBuffer: CommandBuffer; pRenderPassBegin: ptr RenderPassBeginInfo; pSubpassBeginInfo: ptr SubpassBeginInfo;): void {.cdecl.}
  cmdNextSubpass2Cage: proc(commandBuffer: CommandBuffer; pSubpassBeginInfo: ptr SubpassBeginInfo; pSubpassEndInfo: ptr SubpassEndInfo;): void {.cdecl.}

proc createRenderPass2*(
      device: Device;
      pCreateInfo: ptr RenderPassCreateInfo2;
      pAllocator: ptr AllocationCallbacks;
      pRenderPass: ptr RenderPass;
    ): Result {.cdecl.} =
  createRenderPass2Cage(device,pCreateInfo,pAllocator,pRenderPass)

proc cmdEndRenderPass2*(
      commandBuffer: CommandBuffer;
      pSubpassEndInfo: ptr SubpassEndInfo;
    ): void {.cdecl.} =
  cmdEndRenderPass2Cage(commandBuffer,pSubpassEndInfo)

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


# Promoted from VK_KHR_8bit_storage (extension 178)
# -------------------------------------------------

# Promoted from VK_KHR_driver_properties (extension 197)
# ------------------------------------------------------
# Provided by VK_KHR_driver_properties
DriverId.defineAlias(AmdProprietary, AmdProprietary)
# Provided by VK_KHR_driver_properties
DriverId.defineAlias(AmdOpenSource, AmdOpenSource)
# Provided by VK_KHR_driver_properties
DriverId.defineAlias(MesaRadv, MesaRadv)
# Provided by VK_KHR_driver_properties
DriverId.defineAlias(NvidiaProprietary, NvidiaProprietary)
# Provided by VK_KHR_driver_properties
DriverId.defineAlias(IntelProprietaryWindows, IntelProprietaryWindows)
# Provided by VK_KHR_driver_properties
DriverId.defineAlias(IntelOpenSourceMesa, IntelOpenSource)
# Provided by VK_KHR_driver_properties
DriverId.defineAlias(ImaginationProprietary, ImaginationProprietary)
# Provided by VK_KHR_driver_properties
DriverId.defineAlias(QualcommProprietary, QualcommProprietary)
# Provided by VK_KHR_driver_properties
DriverId.defineAlias(ArmProprietary, ArmProprietary)
# Provided by VK_KHR_driver_properties
DriverId.defineAlias(GoogleSwiftshader, GoogleSwiftshader)
# Provided by VK_KHR_driver_properties
DriverId.defineAlias(GgpProprietary, GgpProprietary)
# Provided by VK_KHR_driver_properties
DriverId.defineAlias(BroadcomProprietary, BroadcomProprietary)
const MaxDriverInfoSize* = 256
const MaxDriverNameSize* = 256

# Promoted from VK_KHR_shader_atomic_int64 (extension 181)
# --------------------------------------------------------

# Promoted from VK_KHR_shader_float16_int8 (extension 83)
# -------------------------------------------------------

# Promoted from VK_KHR_shader_float_controls (extension 198)
# ----------------------------------------------------------
# Provided by VK_KHR_shader_float_controls
ShaderFloatControlsIndependence.defineAlias(Vk32BitOnly, Vk32BitOnly)
# Provided by VK_KHR_shader_float_controls
ShaderFloatControlsIndependence.defineAlias(All, All)

# Promoted from VK_EXT_descriptor_indexing (extension 162)
# --------------------------------------------------------
# Provided by VK_EXT_descriptor_indexing
DescriptorBindingFlagBits.defineAlias(UpdateUnusedWhilePending, UpdateUnusedWhilePending)
# Provided by VK_EXT_descriptor_indexing
DescriptorBindingFlagBits.defineAlias(PartiallyBound, PartiallyBound)
# Provided by VK_EXT_descriptor_indexing
DescriptorBindingFlagBits.defineAlias(VariableDescriptorCount, VariableDescriptorCount)

# Promoted from VK_KHR_depth_stencil_resolve (extension 200)
# ----------------------------------------------------------
# Provided by VK_KHR_depth_stencil_resolve
ResolveModeFlagBits.defineAlias(SampleZero, SampleZero)
# Provided by VK_KHR_depth_stencil_resolve
ResolveModeFlagBits.defineAlias(Average, Average)
# Provided by VK_KHR_depth_stencil_resolve
ResolveModeFlagBits.defineAlias(Min, Min)
# Provided by VK_KHR_depth_stencil_resolve
ResolveModeFlagBits.defineAlias(Max, Max)

# Promoted from VK_EXT_scalar_block_layout (extension 222))
# ---------------------------------------------------------

# Promoted from VK_EXT_shader_viewport_index_layer, which has no API (extension 163)
# ----------------------------------------------------------------------------------

# Promoted from VK_EXT_separate_stencil_usage (extension 247)
# -----------------------------------------------------------

# Promoted from VK_EXT_sampler_filter_minmax (extension 131)
# ----------------------------------------------------------
# Provided by VK_EXT_sampler_filter_minmax
SamplerReductionMode.defineAlias(WeightedAverage, WeightedAverage)
# Provided by VK_EXT_sampler_filter_minmax
SamplerReductionMode.defineAlias(Min, Min)
# Provided by VK_EXT_sampler_filter_minmax
SamplerReductionMode.defineAlias(Max, Max)

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
var # commands
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
# Provided by VK_KHR_timeline_semaphore
SemaphoreType.defineAlias(Binary, Binary)
# Provided by VK_KHR_timeline_semaphore
SemaphoreType.defineAlias(Timeline, Timeline)
# Provided by VK_KHR_timeline_semaphore
SemaphoreWaitFlagBits.defineAlias(Any, Any)
var # commands
  signalSemaphoreCage: proc(device: Device; pSignalInfo: ptr SemaphoreSignalInfo;): Result {.cdecl.}
  getSemaphoreCounterValueCage: proc(device: Device; semaphore: Semaphore; pValue: ptr uint64;): Result {.cdecl.}
  waitSemaphoresCage: proc(device: Device; pWaitInfo: ptr SemaphoreWaitInfo; timeout: uint64;): Result {.cdecl.}

proc signalSemaphore*(
      device: Device;
      pSignalInfo: ptr SemaphoreSignalInfo;
    ): Result {.cdecl.} =
  signalSemaphoreCage(device,pSignalInfo)

proc getSemaphoreCounterValue*(
      device: Device;
      semaphore: Semaphore;
      pValue: ptr uint64;
    ): Result {.cdecl.} =
  getSemaphoreCounterValueCage(device,semaphore,pValue)

proc waitSemaphores*(
      device: Device;
      pWaitInfo: ptr SemaphoreWaitInfo;
      timeout: uint64;
    ): Result {.cdecl.} =
  waitSemaphoresCage(device,pWaitInfo,timeout)


# Promoted from VK_KHR_buffer_device_address (extension 258)
# ----------------------------------------------------------
var # commands
  getDeviceMemoryOpaqueCaptureAddressCage: proc(device: Device; pInfo: ptr DeviceMemoryOpaqueCaptureAddressInfo;): uint64 {.cdecl.}
  getBufferDeviceAddressCage: proc(device: Device; pInfo: ptr BufferDeviceAddressInfo;): DeviceAddress {.cdecl.}
  getBufferOpaqueCaptureAddressCage: proc(device: Device; pInfo: ptr BufferDeviceAddressInfo;): uint64 {.cdecl.}

proc getDeviceMemoryOpaqueCaptureAddress*(
      device: Device;
      pInfo: ptr DeviceMemoryOpaqueCaptureAddressInfo;
    ): uint64 {.cdecl.} =
  getDeviceMemoryOpaqueCaptureAddressCage(device,pInfo)

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


proc loadVk12*(instance: Instance) =
  instance.defineLoader(`<<`)

  # Promoted from VK_KHR_draw_indirect_count (extension 170)
  # --------------------------------------------------------
  cmdDrawIndexedIndirectCountCage << "vkCmdDrawIndexedIndirectCount"
  cmdDrawIndirectCountCage << "vkCmdDrawIndirectCount"

  # Promoted from VK_KHR_create_renderpass2 (extension 110)
  # -------------------------------------------------------
  createRenderPass2Cage << "vkCreateRenderPass2"
  cmdEndRenderPass2Cage << "vkCmdEndRenderPass2"
  cmdBeginRenderPass2Cage << "vkCmdBeginRenderPass2"
  cmdNextSubpass2Cage << "vkCmdNextSubpass2"

  # Promoted from VK_EXT_host_query_reset (extension 262)
  # -----------------------------------------------------
  resetQueryPoolCage << "vkResetQueryPool"

  # Promoted from VK_KHR_timeline_semaphore (extension 208)
  # -------------------------------------------------------
  signalSemaphoreCage << "vkSignalSemaphore"
  getSemaphoreCounterValueCage << "vkGetSemaphoreCounterValue"
  waitSemaphoresCage << "vkWaitSemaphores"

  # Promoted from VK_KHR_buffer_device_address (extension 258)
  # ----------------------------------------------------------
  getDeviceMemoryOpaqueCaptureAddressCage << "vkGetDeviceMemoryOpaqueCaptureAddress"
  getBufferDeviceAddressCage << "vkGetBufferDeviceAddress"
  getBufferOpaqueCaptureAddressCage << "vkGetBufferOpaqueCaptureAddress"