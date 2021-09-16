# Generated at 2021-09-16T07:11:43Z
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
    e32Only = 0
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
    sType* {.constant: (StructureType.physicalDeviceVulkan11Features).}: StructureType
    pNext* {.optional.}: pointer
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
    sType* {.constant: (StructureType.physicalDeviceVulkan11Properties).}: StructureType
    pNext* {.optional.}: pointer
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
    sType* {.constant: (StructureType.physicalDeviceVulkan12Features).}: StructureType
    pNext* {.optional.}: pointer
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
    sType* {.constant: (StructureType.physicalDeviceVulkan12Properties).}: StructureType
    pNext* {.optional.}: pointer
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
    framebufferIntegerColorSampleCounts* {.optional.}: SampleCountFlags

  # Promoted from VK_KHR_image_format_list (extension 148)
  # ------------------------------------------------------
  ImageFormatListCreateInfo* = object
    sType* {.constant: (StructureType.imageFormatListCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    viewFormatCount* {.optional.}: uint32
    pViewFormats*: ptr Format

  # Promoted from VK_KHR_create_renderpass2 (extension 110)
  # -------------------------------------------------------
  RenderPassCreateInfo2* = object
    sType* {.constant: (StructureType.renderPassCreateInfo2).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: RenderPassCreateFlags
    attachmentCount* {.optional.}: uint32
    pAttachments*: ptr AttachmentDescription2
    subpassCount*: uint32
    pSubpasses*: ptr SubpassDescription2
    dependencyCount* {.optional.}: uint32
    pDependencies*: ptr SubpassDependency2
    correlatedViewMaskCount* {.optional.}: uint32
    pCorrelatedViewMasks*: ptr uint32
  AttachmentDescription2* = object
    sType* {.constant: (StructureType.attachmentDescription2).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: AttachmentDescriptionFlags
    format*: Format
    samples*: SampleCountFlagBits
    loadOp*: AttachmentLoadOp
    storeOp*: AttachmentStoreOp
    stencilLoadOp*: AttachmentLoadOp
    stencilStoreOp*: AttachmentStoreOp
    initialLayout*: ImageLayout
    finalLayout*: ImageLayout
  AttachmentReference2* = object
    sType* {.constant: (StructureType.attachmentReference2).}: StructureType
    pNext* {.optional.}: pointer
    attachment*: uint32
    layout*: ImageLayout
    aspectMask*: ImageAspectFlags
  SubpassDescription2* = object
    sType* {.constant: (StructureType.subpassDescription2).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: SubpassDescriptionFlags
    pipelineBindPoint*: PipelineBindPoint
    viewMask*: uint32
    inputAttachmentCount* {.optional.}: uint32
    pInputAttachments*: ptr AttachmentReference2
    colorAttachmentCount* {.optional.}: uint32
    pColorAttachments*: ptr AttachmentReference2
    pResolveAttachments* {.optional.}: ptr AttachmentReference2
    pDepthStencilAttachment* {.optional.}: ptr AttachmentReference2
    preserveAttachmentCount* {.optional.}: uint32
    pPreserveAttachments*: ptr uint32
  SubpassDependency2* = object
    sType* {.constant: (StructureType.subpassDependency2).}: StructureType
    pNext* {.optional.}: pointer
    srcSubpass*: uint32
    dstSubpass*: uint32
    srcStageMask*: PipelineStageFlags
    dstStageMask*: PipelineStageFlags
    srcAccessMask* {.optional.}: AccessFlags
    dstAccessMask* {.optional.}: AccessFlags
    dependencyFlags* {.optional.}: DependencyFlags
    viewOffset* {.optional.}: int32
  SubpassBeginInfo* = object
    sType* {.constant: (StructureType.subpassBeginInfo).}: StructureType
    pNext* {.optional.}: pointer
    contents*: SubpassContents
  SubpassEndInfo* = object
    sType* {.constant: (StructureType.subpassEndInfo).}: StructureType
    pNext* {.optional.}: pointer

  # Promoted from VK_KHR_8bit_storage (extension 178)
  # -------------------------------------------------
  PhysicalDevice8BitStorageFeatures* = object
    sType* {.constant: (StructureType.physicalDevice8bitStorageFeatures).}: StructureType
    pNext* {.optional.}: pointer
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
    sType* {.constant: (StructureType.physicalDeviceDriverProperties).}: StructureType
    pNext* {.optional.}: pointer
    driverID*: DriverId
    driverName*: array[MaxDriverNameSize, char]
    driverInfo*: array[MaxDriverInfoSize, char]
    conformanceVersion*: ConformanceVersion

  # Promoted from VK_KHR_shader_atomic_int64 (extension 181)
  # --------------------------------------------------------
  PhysicalDeviceShaderAtomicInt64Features* = object
    sType* {.constant: (StructureType.physicalDeviceShaderAtomicInt64Features).}: StructureType
    pNext* {.optional.}: pointer
    shaderBufferInt64Atomics*: Bool32
    shaderSharedInt64Atomics*: Bool32

  # Promoted from VK_KHR_shader_float16_int8 (extension 83)
  # -------------------------------------------------------
  PhysicalDeviceShaderFloat16Int8Features* = object
    sType* {.constant: (StructureType.physicalDeviceShaderFloat16Int8Features).}: StructureType
    pNext* {.optional.}: pointer
    shaderFloat16*: Bool32
    shaderInt8*: Bool32

  # Promoted from VK_KHR_shader_float_controls (extension 198)
  # ----------------------------------------------------------
  PhysicalDeviceFloatControlsProperties* = object
    sType* {.constant: (StructureType.physicalDeviceFloatControlsProperties).}: StructureType
    pNext* {.optional.}: pointer
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
    sType* {.constant: (StructureType.descriptorSetLayoutBindingFlagsCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    bindingCount* {.optional.}: uint32
    pBindingFlags*: ptr DescriptorBindingFlags
  PhysicalDeviceDescriptorIndexingFeatures* = object
    sType* {.constant: (StructureType.physicalDeviceDescriptorIndexingFeatures).}: StructureType
    pNext* {.optional.}: pointer
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
    sType* {.constant: (StructureType.physicalDeviceDescriptorIndexingProperties).}: StructureType
    pNext* {.optional.}: pointer
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
    sType* {.constant: (StructureType.descriptorSetVariableDescriptorCountAllocateInfo).}: StructureType
    pNext* {.optional.}: pointer
    descriptorSetCount* {.optional.}: uint32
    pDescriptorCounts*: ptr uint32
  DescriptorSetVariableDescriptorCountLayoutSupport* = object
    sType* {.constant: (StructureType.descriptorSetVariableDescriptorCountLayoutSupport).}: StructureType
    pNext* {.optional.}: pointer
    maxVariableDescriptorCount*: uint32

  # Promoted from VK_KHR_depth_stencil_resolve (extension 200)
  # ----------------------------------------------------------
  SubpassDescriptionDepthStencilResolve* = object
    sType* {.constant: (StructureType.subpassDescriptionDepthStencilResolve).}: StructureType
    pNext* {.optional.}: pointer
    depthResolveMode*: ResolveModeFlagBits
    stencilResolveMode*: ResolveModeFlagBits
    pDepthStencilResolveAttachment* {.optional.}: ptr AttachmentReference2
  PhysicalDeviceDepthStencilResolveProperties* = object
    sType* {.constant: (StructureType.physicalDeviceDepthStencilResolveProperties).}: StructureType
    pNext* {.optional.}: pointer
    supportedDepthResolveModes*: ResolveModeFlags
    supportedStencilResolveModes*: ResolveModeFlags
    independentResolveNone*: Bool32
    independentResolve*: Bool32

  # Promoted from VK_EXT_scalar_block_layout (extension 222))
  # ---------------------------------------------------------
  PhysicalDeviceScalarBlockLayoutFeatures* = object
    sType* {.constant: (StructureType.physicalDeviceScalarBlockLayoutFeatures).}: StructureType
    pNext* {.optional.}: pointer
    scalarBlockLayout*: Bool32

  # Promoted from VK_EXT_separate_stencil_usage (extension 247)
  # -----------------------------------------------------------
  ImageStencilUsageCreateInfo* = object
    sType* {.constant: (StructureType.imageStencilUsageCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    stencilUsage*: ImageUsageFlags

  # Promoted from VK_EXT_sampler_filter_minmax (extension 131)
  # ----------------------------------------------------------
  SamplerReductionModeCreateInfo* = object
    sType* {.constant: (StructureType.samplerReductionModeCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    reductionMode*: SamplerReductionMode
  PhysicalDeviceSamplerFilterMinmaxProperties* = object
    sType* {.constant: (StructureType.physicalDeviceSamplerFilterMinmaxProperties).}: StructureType
    pNext* {.optional.}: pointer
    filterMinmaxSingleComponentFormats*: Bool32
    filterMinmaxImageComponentMapping*: Bool32

  # Promoted from VK_KHR_vulkan_memory_model (extension 212)
  # --------------------------------------------------------
  PhysicalDeviceVulkanMemoryModelFeatures* = object
    sType* {.constant: (StructureType.physicalDeviceVulkanMemoryModelFeatures).}: StructureType
    pNext* {.optional.}: pointer
    vulkanMemoryModel*: Bool32
    vulkanMemoryModelDeviceScope*: Bool32
    vulkanMemoryModelAvailabilityVisibilityChains*: Bool32

  # Promoted from VK_KHR_imageless_framebuffer (extension 109)
  # ----------------------------------------------------------
  PhysicalDeviceImagelessFramebufferFeatures* = object
    sType* {.constant: (StructureType.physicalDeviceImagelessFramebufferFeatures).}: StructureType
    pNext* {.optional.}: pointer
    imagelessFramebuffer*: Bool32
  FramebufferAttachmentsCreateInfo* = object
    sType* {.constant: (StructureType.framebufferAttachmentsCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    attachmentImageInfoCount* {.optional.}: uint32
    pAttachmentImageInfos*: ptr FramebufferAttachmentImageInfo
  FramebufferAttachmentImageInfo* = object
    sType* {.constant: (StructureType.framebufferAttachmentImageInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: ImageCreateFlags
    usage*: ImageUsageFlags
    width*: uint32
    height*: uint32
    layerCount*: uint32
    viewFormatCount* {.optional.}: uint32
    pViewFormats*: ptr Format
  RenderPassAttachmentBeginInfo* = object
    sType* {.constant: (StructureType.renderPassAttachmentBeginInfo).}: StructureType
    pNext* {.optional.}: pointer
    attachmentCount* {.optional.}: uint32
    pAttachments*: ptr ImageView

  # Promoted from VK_KHR_uniform_buffer_standard_layout (extension 254)
  # -------------------------------------------------------------------
  PhysicalDeviceUniformBufferStandardLayoutFeatures* = object
    sType* {.constant: (StructureType.physicalDeviceUniformBufferStandardLayoutFeatures).}: StructureType
    pNext* {.optional.}: pointer
    uniformBufferStandardLayout*: Bool32

  # Promoted from VK_KHR_shader_subgroup_extended_types (extension 176)
  # -------------------------------------------------------------------
  PhysicalDeviceShaderSubgroupExtendedTypesFeatures* = object
    sType* {.constant: (StructureType.physicalDeviceShaderSubgroupExtendedTypesFeatures).}: StructureType
    pNext* {.optional.}: pointer
    shaderSubgroupExtendedTypes*: Bool32

  # Promoted from VK_KHR_separate_depth_stencil_layouts (extension 242)
  # -------------------------------------------------------------------
  PhysicalDeviceSeparateDepthStencilLayoutsFeatures* = object
    sType* {.constant: (StructureType.physicalDeviceSeparateDepthStencilLayoutsFeatures).}: StructureType
    pNext* {.optional.}: pointer
    separateDepthStencilLayouts*: Bool32
  AttachmentReferenceStencilLayout* = object
    sType* {.constant: (StructureType.attachmentReferenceStencilLayout).}: StructureType
    pNext* {.optional.}: pointer
    stencilLayout*: ImageLayout
  AttachmentDescriptionStencilLayout* = object
    sType* {.constant: (StructureType.attachmentDescriptionStencilLayout).}: StructureType
    pNext* {.optional.}: pointer
    stencilInitialLayout*: ImageLayout
    stencilFinalLayout*: ImageLayout

  # Promoted from VK_EXT_host_query_reset (extension 262)
  # -----------------------------------------------------
  PhysicalDeviceHostQueryResetFeatures* = object
    sType* {.constant: (StructureType.physicalDeviceHostQueryResetFeatures).}: StructureType
    pNext* {.optional.}: pointer
    hostQueryReset*: Bool32

  # Promoted from VK_KHR_timeline_semaphore (extension 208)
  # -------------------------------------------------------
  PhysicalDeviceTimelineSemaphoreFeatures* = object
    sType* {.constant: (StructureType.physicalDeviceTimelineSemaphoreFeatures).}: StructureType
    pNext* {.optional.}: pointer
    timelineSemaphore*: Bool32
  PhysicalDeviceTimelineSemaphoreProperties* = object
    sType* {.constant: (StructureType.physicalDeviceTimelineSemaphoreProperties).}: StructureType
    pNext* {.optional.}: pointer
    maxTimelineSemaphoreValueDifference*: uint64
  SemaphoreTypeCreateInfo* = object
    sType* {.constant: (StructureType.semaphoreTypeCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    semaphoreType*: SemaphoreType
    initialValue*: uint64
  TimelineSemaphoreSubmitInfo* = object
    sType* {.constant: (StructureType.timelineSemaphoreSubmitInfo).}: StructureType
    pNext* {.optional.}: pointer
    waitSemaphoreValueCount* {.optional.}: uint32
    pWaitSemaphoreValues* {.optional.}: ptr uint64
    signalSemaphoreValueCount* {.optional.}: uint32
    pSignalSemaphoreValues* {.optional.}: ptr uint64
  SemaphoreWaitInfo* = object
    sType* {.constant: (StructureType.semaphoreWaitInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: SemaphoreWaitFlags
    semaphoreCount*: uint32
    pSemaphores*: ptr Semaphore
    pValues*: ptr uint64
  SemaphoreSignalInfo* = object
    sType* {.constant: (StructureType.semaphoreSignalInfo).}: StructureType
    pNext* {.optional.}: pointer
    semaphore*: Semaphore
    value*: uint64

  # Promoted from VK_KHR_buffer_device_address (extension 258)
  # ----------------------------------------------------------
  PhysicalDeviceBufferDeviceAddressFeatures* = object
    sType* {.constant: (StructureType.physicalDeviceBufferDeviceAddressFeatures).}: StructureType
    pNext* {.optional.}: pointer
    bufferDeviceAddress*: Bool32
    bufferDeviceAddressCaptureReplay*: Bool32
    bufferDeviceAddressMultiDevice*: Bool32
  BufferDeviceAddressInfo* = object
    sType* {.constant: (StructureType.bufferDeviceAddressInfo).}: StructureType
    pNext* {.optional.}: pointer
    buffer*: Buffer
  BufferOpaqueCaptureAddressCreateInfo* = object
    sType* {.constant: (StructureType.bufferOpaqueCaptureAddressCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    opaqueCaptureAddress*: uint64
  MemoryOpaqueCaptureAddressAllocateInfo* = object
    sType* {.constant: (StructureType.memoryOpaqueCaptureAddressAllocateInfo).}: StructureType
    pNext* {.optional.}: pointer
    opaqueCaptureAddress*: uint64
  DeviceMemoryOpaqueCaptureAddressInfo* = object
    sType* {.constant: (StructureType.deviceMemoryOpaqueCaptureAddressInfo).}: StructureType
    pNext* {.optional.}: pointer
    memory*: DeviceMemory

template apiVersion12*(): untyped = makeVersion(1, 2, 0)


# Promoted from VK_KHR_image_format_list (extension 148)
# ------------------------------------------------------


# Promoted from VK_KHR_sampler_mirror_clamp_to_edge (extension 15)
# ----------------------------------------------------------------


# Promoted from VK_KHR_draw_indirect_count (extension 170)
# --------------------------------------------------------
proc cmdDrawIndirectCount*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      countBuffer: Buffer;
      countBufferOffset: DeviceSize;
      maxDrawCount: uint32;
      stride: uint32;
    ): void {.cdecl, lazyload("vkCmdDrawIndirectCount", DeviceLevel).}
proc cmdDrawIndexedIndirectCount*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      countBuffer: Buffer;
      countBufferOffset: DeviceSize;
      maxDrawCount: uint32;
      stride: uint32;
    ): void {.cdecl, lazyload("vkCmdDrawIndexedIndirectCount", DeviceLevel).}


# Promoted from VK_KHR_create_renderpass2 (extension 110)
# -------------------------------------------------------
proc createRenderPass2*(
      device: Device;
      pCreateInfo: ptr RenderPassCreateInfo2;
      pAllocator = default(ptr AllocationCallbacks); # optional
      pRenderPass: ptr RenderPass;
    ): Result {.cdecl, lazyload("vkCreateRenderPass2", DeviceLevel).}
proc cmdBeginRenderPass2*(
      commandBuffer: CommandBuffer;
      pRenderPassBegin: ptr RenderPassBeginInfo;
      pSubpassBeginInfo: ptr SubpassBeginInfo;
    ): void {.cdecl, lazyload("vkCmdBeginRenderPass2", DeviceLevel).}
proc cmdNextSubpass2*(
      commandBuffer: CommandBuffer;
      pSubpassBeginInfo: ptr SubpassBeginInfo;
      pSubpassEndInfo: ptr SubpassEndInfo;
    ): void {.cdecl, lazyload("vkCmdNextSubpass2", DeviceLevel).}
proc cmdEndRenderPass2*(
      commandBuffer: CommandBuffer;
      pSubpassEndInfo: ptr SubpassEndInfo;
    ): void {.cdecl, lazyload("vkCmdEndRenderPass2", DeviceLevel).}


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
proc resetQueryPool*(
      device: Device;
      queryPool: QueryPool;
      firstQuery: uint32;
      queryCount: uint32;
    ): void {.cdecl, lazyload("vkResetQueryPool", DeviceLevel).}


# Promoted from VK_KHR_timeline_semaphore (extension 208)
# -------------------------------------------------------
proc getSemaphoreCounterValue*(
      device: Device;
      semaphore: Semaphore;
      pValue: ptr uint64;
    ): Result {.cdecl, lazyload("vkGetSemaphoreCounterValue", DeviceLevel).}
proc waitSemaphores*(
      device: Device;
      pWaitInfo: ptr SemaphoreWaitInfo;
      timeout: uint64;
    ): Result {.cdecl, lazyload("vkWaitSemaphores", DeviceLevel).}
proc signalSemaphore*(
      device: Device;
      pSignalInfo: ptr SemaphoreSignalInfo;
    ): Result {.cdecl, lazyload("vkSignalSemaphore", DeviceLevel).}


# Promoted from VK_KHR_buffer_device_address (extension 258)
# ----------------------------------------------------------
proc getBufferDeviceAddress*(
      device: Device;
      pInfo: ptr BufferDeviceAddressInfo;
    ): DeviceAddress {.cdecl, lazyload("vkGetBufferDeviceAddress", DeviceLevel).}
proc getBufferOpaqueCaptureAddress*(
      device: Device;
      pInfo: ptr BufferDeviceAddressInfo;
    ): uint64 {.cdecl, lazyload("vkGetBufferOpaqueCaptureAddress", DeviceLevel).}
proc getDeviceMemoryOpaqueCaptureAddress*(
      device: Device;
      pInfo: ptr DeviceMemoryOpaqueCaptureAddressInfo;
    ): uint64 {.cdecl, lazyload("vkGetDeviceMemoryOpaqueCaptureAddress", DeviceLevel).}

proc loadAllVk12*(instance: Instance) =
  # Promoted from VK_KHR_draw_indirect_count (extension 170)
  cmdDrawIndirectCount.load(instance)
  cmdDrawIndexedIndirectCount.load(instance)

  # Promoted from VK_KHR_create_renderpass2 (extension 110)
  createRenderPass2.load(instance)
  cmdBeginRenderPass2.load(instance)
  cmdNextSubpass2.load(instance)
  cmdEndRenderPass2.load(instance)

  # Promoted from VK_EXT_host_query_reset (extension 262)
  resetQueryPool.load(instance)

  # Promoted from VK_KHR_timeline_semaphore (extension 208)
  getSemaphoreCounterValue.load(instance)
  waitSemaphores.load(instance)
  signalSemaphore.load(instance)

  # Promoted from VK_KHR_buffer_device_address (extension 258)
  getBufferDeviceAddress.load(instance)
  getBufferOpaqueCaptureAddress.load(instance)
  getDeviceMemoryOpaqueCaptureAddress.load(instance)

proc loadVk12*(device: Device) =
  # Promoted from VK_KHR_draw_indirect_count (extension 170)
  cmdDrawIndirectCount.load(device)
  cmdDrawIndexedIndirectCount.load(device)

  # Promoted from VK_KHR_create_renderpass2 (extension 110)
  createRenderPass2.load(device)
  cmdBeginRenderPass2.load(device)
  cmdNextSubpass2.load(device)
  cmdEndRenderPass2.load(device)

  # Promoted from VK_EXT_host_query_reset (extension 262)
  resetQueryPool.load(device)

  # Promoted from VK_KHR_timeline_semaphore (extension 208)
  getSemaphoreCounterValue.load(device)
  waitSemaphores.load(device)
  signalSemaphore.load(device)

  # Promoted from VK_KHR_buffer_device_address (extension 258)
  getBufferDeviceAddress.load(device)
  getBufferOpaqueCaptureAddress.load(device)
  getDeviceMemoryOpaqueCaptureAddress.load(device)

