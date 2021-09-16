# Generated at 2021-09-16T08:32:06Z
# vk11
# Vulkan 1.1 core API interface definitions.
# ==========================================


import ../platform
import ./vk10
export vk10

const
  # Promoted from VK_KHR_device_group_creation
  MaxDeviceGroupSize* = 32

  # Promoted from VK_KHR_external_memory_capabilities
  LuidSize* = 8
  UuidSize* = 16

  # Promoted from VK_KHR_external_memory
  QueueFamilyExternal* = (uint32.high-1)

type # enums and bitmasks
  # Originally based on VK_KHR_subgroup (extension 94), but the actual enum block used was, incorrectly, that of extension 95
  SubgroupFeatureFlags* = Flags[SubgroupFeatureFlagBits]
  SubgroupFeatureFlagBits* {.size: sizeof(int32), pure.} = enum
    basic = 0x00000001 # Basic subgroup operations
    vote = 0x00000002 # Vote subgroup operations
    arithmetic = 0x00000004 # Arithmetic subgroup operations
    ballot = 0x00000008 # Ballot subgroup operations
    shuffle = 0x00000010 # Shuffle subgroup operations
    shuffleRelative = 0x00000020 # Shuffle relative subgroup operations
    clustered = 0x00000040 # Clustered subgroup operations
    quad = 0x00000080 # Quad subgroup operations
    # Provided by VK_NV_shader_subgroup_partitioned
    partitionedNv = 0x00000100

  # Promoted from VK_KHR_device_group
  PeerMemoryFeatureFlags* = Flags[PeerMemoryFeatureFlagBits]
  PeerMemoryFeatureFlagBits* {.size: sizeof(int32), pure.} = enum
    copySrc = 0x00000001 # Can read with vkCmdCopy commands
    copyDst = 0x00000002 # Can write with vkCmdCopy commands
    genericSrc = 0x00000004 # Can read with any access type/command
    genericDst = 0x00000008 # Can write with and access type/command
  MemoryAllocateFlags* = Flags[MemoryAllocateFlagBits]
  MemoryAllocateFlagBits* {.size: sizeof(int32), pure.} = enum
    deviceMask = 0x00000001 # Force allocation on specific devices
    # Provided by VK_VERSION_1_2
    deviceAddress = 0x00000002
    # Provided by VK_VERSION_1_2
    deviceAddressCaptureReplay = 0x00000004

  # Promoted from VK_KHR_maintenance1
  CommandPoolTrimFlags* = Flags[distinct UnusedEnum]

  # Promoted from VK_KHR_maintenance2
  PointClippingBehavior* {.size: sizeof(int32), pure.} = enum
    allClipPlanes = 0
    userClipPlanesOnly = 1
  TessellationDomainOrigin* {.size: sizeof(int32), pure.} = enum
    upperLeft = 0
    lowerLeft = 1

  # Promoted from VK_KHR_sampler_ycbcr_conversion
  SamplerYcbcrModelConversion* {.size: sizeof(int32), pure.} = enum
    rgbIdentity = 0
    ycbcrIdentity = 1 # just range expansion
    ycbcr709 = 2 # aka HD YUV
    ycbcr601 = 3 # aka SD YUV
    ycbcr2020 = 4 # aka UHD YUV
  SamplerYcbcrRange* {.size: sizeof(int32), pure.} = enum
    ituFull = 0 # Luma 0..1 maps to 0..255, chroma -0.5..0.5 to 1..255 (clamped)
    ituNarrow = 1 # Luma 0..1 maps to 16..235, chroma -0.5..0.5 to 16..240
  ChromaLocation* {.size: sizeof(int32), pure.} = enum
    cositedEven = 0
    midpoint = 1

  # Promoted from VK_KHR_descriptor_update_template
  DescriptorUpdateTemplateCreateFlags* = Flags[distinct UnusedEnum]
  DescriptorUpdateTemplateType* {.size: sizeof(int32), pure.} = enum
    descriptorSet = 0 # Create descriptor update template for descriptor set updates
    # Provided by VK_KHR_push_descriptor
    pushDescriptorsKhr = 1 # Create descriptor update template for pushed descriptor updates

  # Promoted from VK_KHR_external_memory_capabilities
  ExternalMemoryHandleTypeFlags* = Flags[ExternalMemoryHandleTypeFlagBits]
  ExternalMemoryHandleTypeFlagBits* {.size: sizeof(int32), pure.} = enum
    opaqueFd = 0x00000001
    opaqueWin32 = 0x00000002
    opaqueWin32Kmt = 0x00000004
    d3d11Texture = 0x00000008
    d3d11TextureKmt = 0x00000010
    d3d12Heap = 0x00000020
    d3d12Resource = 0x00000040
    # Provided by VK_EXT_external_memory_host
    hostAllocationExt = 0x00000080
    # Provided by VK_EXT_external_memory_host
    hostMappedForeignMemoryExt = 0x00000100
    # Provided by VK_EXT_external_memory_dma_buf
    dmaBufExt = 0x00000200
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    androidHardwareBufferAndroid = 0x00000400
  ExternalMemoryFeatureFlags* = Flags[ExternalMemoryFeatureFlagBits]
  ExternalMemoryFeatureFlagBits* {.size: sizeof(int32), pure.} = enum
    dedicatedOnly = 0x00000001
    exportable = 0x00000002
    importable = 0x00000004

  # Promoted from VK_KHR_external_fence_capabilities
  ExternalFenceHandleTypeFlags* = Flags[ExternalFenceHandleTypeFlagBits]
  ExternalFenceHandleTypeFlagBits* {.size: sizeof(int32), pure.} = enum
    opaqueFd = 0x00000001
    opaqueWin32 = 0x00000002
    opaqueWin32Kmt = 0x00000004
    syncFd = 0x00000008
  ExternalFenceFeatureFlags* = Flags[ExternalFenceFeatureFlagBits]
  ExternalFenceFeatureFlagBits* {.size: sizeof(int32), pure.} = enum
    exportable = 0x00000001
    importable = 0x00000002

  # Promoted from VK_KHR_external_fence
  FenceImportFlags* = Flags[FenceImportFlagBits]
  FenceImportFlagBits* {.size: sizeof(int32), pure.} = enum
    temporary = 0x00000001

  # Promoted from VK_KHR_external_semaphore
  SemaphoreImportFlags* = Flags[SemaphoreImportFlagBits]
  SemaphoreImportFlagBits* {.size: sizeof(int32), pure.} = enum
    temporary = 0x00000001

  # Promoted from VK_KHR_external_semaphore_capabilities
  ExternalSemaphoreHandleTypeFlags* = Flags[ExternalSemaphoreHandleTypeFlagBits]
  ExternalSemaphoreHandleTypeFlagBits* {.size: sizeof(int32), pure.} = enum
    opaqueFd = 0x00000001
    opaqueWin32 = 0x00000002
    opaqueWin32Kmt = 0x00000004
    d3d12Fence = 0x00000008
    syncFd = 0x00000010
  ExternalSemaphoreFeatureFlags* = Flags[ExternalSemaphoreFeatureFlagBits]
  ExternalSemaphoreFeatureFlagBits* {.size: sizeof(int32), pure.} = enum
    exportable = 0x00000001
    importable = 0x00000002

type
  # Originally based on VK_KHR_subgroup (extension 94), but the actual enum block used was, incorrectly, that of extension 95
  # -------------------------------------------------------------------------------------------------------------------------
  PhysicalDeviceSubgroupProperties* = object
    sType* {.constant: (StructureType.physicalDeviceSubgroupProperties).}: StructureType
    pNext* {.optional.}: pointer
    subgroupSize*: uint32
    supportedStages*: ShaderStageFlags
    supportedOperations*: SubgroupFeatureFlags
    quadOperationsInAllStages*: Bool32

  # Promoted from VK_KHR_bind_memory2
  # ---------------------------------
  BindBufferMemoryInfo* = object
    sType* {.constant: (StructureType.bindBufferMemoryInfo).}: StructureType
    pNext* {.optional.}: pointer
    buffer*: Buffer
    memory*: DeviceMemory
    memoryOffset*: DeviceSize
  BindImageMemoryInfo* = object
    sType* {.constant: (StructureType.bindImageMemoryInfo).}: StructureType
    pNext* {.optional.}: pointer
    image*: Image
    memory*: DeviceMemory
    memoryOffset*: DeviceSize

  # Promoted from VK_KHR_16bit_storage
  # ----------------------------------
  PhysicalDevice16BitStorageFeatures* = object
    sType* {.constant: (StructureType.physicalDevice16bitStorageFeatures).}: StructureType
    pNext* {.optional.}: pointer
    storageBuffer16BitAccess*: Bool32
    uniformAndStorageBuffer16BitAccess*: Bool32
    storagePushConstant16*: Bool32
    storageInputOutput16*: Bool32

  # Promoted from VK_KHR_dedicated_allocation
  # -----------------------------------------
  MemoryDedicatedRequirements* = object
    sType* {.constant: (StructureType.memoryDedicatedRequirements).}: StructureType
    pNext* {.optional.}: pointer
    prefersDedicatedAllocation*: Bool32
    requiresDedicatedAllocation*: Bool32
  MemoryDedicatedAllocateInfo* = object
    sType* {.constant: (StructureType.memoryDedicatedAllocateInfo).}: StructureType
    pNext* {.optional.}: pointer
    image* {.optional.}: Image
    buffer* {.optional.}: Buffer

  # Promoted from VK_KHR_device_group
  # ---------------------------------
  MemoryAllocateFlagsInfo* = object
    sType* {.constant: (StructureType.memoryAllocateFlagsInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: MemoryAllocateFlags
    deviceMask*: uint32
  DeviceGroupRenderPassBeginInfo* = object
    sType* {.constant: (StructureType.deviceGroupRenderPassBeginInfo).}: StructureType
    pNext* {.optional.}: pointer
    deviceMask*: uint32
    deviceRenderAreaCount* {.optional.}: uint32
    pDeviceRenderAreas*: ptr Rect2D
  DeviceGroupCommandBufferBeginInfo* = object
    sType* {.constant: (StructureType.deviceGroupCommandBufferBeginInfo).}: StructureType
    pNext* {.optional.}: pointer
    deviceMask*: uint32
  DeviceGroupSubmitInfo* = object
    sType* {.constant: (StructureType.deviceGroupSubmitInfo).}: StructureType
    pNext* {.optional.}: pointer
    waitSemaphoreCount* {.optional.}: uint32
    pWaitSemaphoreDeviceIndices*: ptr uint32
    commandBufferCount* {.optional.}: uint32
    pCommandBufferDeviceMasks*: ptr uint32
    signalSemaphoreCount* {.optional.}: uint32
    pSignalSemaphoreDeviceIndices*: ptr uint32
  DeviceGroupBindSparseInfo* = object
    sType* {.constant: (StructureType.deviceGroupBindSparseInfo).}: StructureType
    pNext* {.optional.}: pointer
    resourceDeviceIndex*: uint32
    memoryDeviceIndex*: uint32

  # Promoted from VK_KHR_device_group + VK_KHR_bind_memory2
  # -------------------------------------------------------
  BindBufferMemoryDeviceGroupInfo* = object
    sType* {.constant: (StructureType.bindBufferMemoryDeviceGroupInfo).}: StructureType
    pNext* {.optional.}: pointer
    deviceIndexCount* {.optional.}: uint32
    pDeviceIndices*: ptr uint32
  BindImageMemoryDeviceGroupInfo* = object
    sType* {.constant: (StructureType.bindImageMemoryDeviceGroupInfo).}: StructureType
    pNext* {.optional.}: pointer
    deviceIndexCount* {.optional.}: uint32
    pDeviceIndices*: ptr uint32
    splitInstanceBindRegionCount* {.optional.}: uint32
    pSplitInstanceBindRegions*: ptr Rect2D

  # Promoted from VK_KHR_device_group_creation
  # ------------------------------------------
  PhysicalDeviceGroupProperties* = object
    sType* {.constant: (StructureType.physicalDeviceGroupProperties).}: StructureType
    pNext* {.optional.}: pointer
    physicalDeviceCount*: uint32
    physicalDevices*: array[MaxDeviceGroupSize, PhysicalDevice]
    subsetAllocation*: Bool32
  DeviceGroupDeviceCreateInfo* = object
    sType* {.constant: (StructureType.deviceGroupDeviceCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    physicalDeviceCount* {.optional.}: uint32
    pPhysicalDevices*: ptr PhysicalDevice

  # Promoted from VK_KHR_get_memory_requirements2
  # ---------------------------------------------
  BufferMemoryRequirementsInfo2* = object
    sType* {.constant: (StructureType.bufferMemoryRequirementsInfo2).}: StructureType
    pNext* {.optional.}: pointer
    buffer*: Buffer
  ImageMemoryRequirementsInfo2* = object
    sType* {.constant: (StructureType.imageMemoryRequirementsInfo2).}: StructureType
    pNext* {.optional.}: pointer
    image*: Image
  ImageSparseMemoryRequirementsInfo2* = object
    sType* {.constant: (StructureType.imageSparseMemoryRequirementsInfo2).}: StructureType
    pNext* {.optional.}: pointer
    image*: Image
  MemoryRequirements2* = object
    sType* {.constant: (StructureType.memoryRequirements2).}: StructureType
    pNext* {.optional.}: pointer
    memoryRequirements*: MemoryRequirements
  SparseImageMemoryRequirements2* = object
    sType* {.constant: (StructureType.sparseImageMemoryRequirements2).}: StructureType
    pNext* {.optional.}: pointer
    memoryRequirements*: SparseImageMemoryRequirements

  # Promoted from VK_KHR_get_physical_device_properties2
  # ----------------------------------------------------
  PhysicalDeviceFeatures2* = object
    sType* {.constant: (StructureType.physicalDeviceFeatures2).}: StructureType
    pNext* {.optional.}: pointer
    features*: PhysicalDeviceFeatures
  PhysicalDeviceProperties2* = object
    sType* {.constant: (StructureType.physicalDeviceProperties2).}: StructureType
    pNext* {.optional.}: pointer
    properties*: PhysicalDeviceProperties
  FormatProperties2* = object
    sType* {.constant: (StructureType.formatProperties2).}: StructureType
    pNext* {.optional.}: pointer
    formatProperties*: FormatProperties
  ImageFormatProperties2* = object
    sType* {.constant: (StructureType.imageFormatProperties2).}: StructureType
    pNext* {.optional.}: pointer
    imageFormatProperties*: ImageFormatProperties
  PhysicalDeviceImageFormatInfo2* = object
    sType* {.constant: (StructureType.physicalDeviceImageFormatInfo2).}: StructureType
    pNext* {.optional.}: pointer
    format*: Format
    theType*: ImageType
    tiling*: ImageTiling
    usage*: ImageUsageFlags
    flags* {.optional.}: ImageCreateFlags
  QueueFamilyProperties2* = object
    sType* {.constant: (StructureType.queueFamilyProperties2).}: StructureType
    pNext* {.optional.}: pointer
    queueFamilyProperties*: QueueFamilyProperties
  PhysicalDeviceMemoryProperties2* = object
    sType* {.constant: (StructureType.physicalDeviceMemoryProperties2).}: StructureType
    pNext* {.optional.}: pointer
    memoryProperties*: PhysicalDeviceMemoryProperties
  SparseImageFormatProperties2* = object
    sType* {.constant: (StructureType.sparseImageFormatProperties2).}: StructureType
    pNext* {.optional.}: pointer
    properties*: SparseImageFormatProperties
  PhysicalDeviceSparseImageFormatInfo2* = object
    sType* {.constant: (StructureType.physicalDeviceSparseImageFormatInfo2).}: StructureType
    pNext* {.optional.}: pointer
    format*: Format
    theType*: ImageType
    samples*: SampleCountFlagBits
    usage*: ImageUsageFlags
    tiling*: ImageTiling

  # Promoted from VK_KHR_maintenance2
  # ---------------------------------
  PhysicalDevicePointClippingProperties* = object
    sType* {.constant: (StructureType.physicalDevicePointClippingProperties).}: StructureType
    pNext* {.optional.}: pointer
    pointClippingBehavior*: PointClippingBehavior
  RenderPassInputAttachmentAspectCreateInfo* = object
    sType* {.constant: (StructureType.renderPassInputAttachmentAspectCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    aspectReferenceCount*: uint32
    pAspectReferences*: ptr InputAttachmentAspectReference
  InputAttachmentAspectReference* = object
    subpass*: uint32
    inputAttachmentIndex*: uint32
    aspectMask*: ImageAspectFlags
  ImageViewUsageCreateInfo* = object
    sType* {.constant: (StructureType.imageViewUsageCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    usage*: ImageUsageFlags
  PipelineTessellationDomainOriginStateCreateInfo* = object
    sType* {.constant: (StructureType.pipelineTessellationDomainOriginStateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    domainOrigin*: TessellationDomainOrigin

  # Promoted from VK_KHR_multiview
  # ------------------------------
  RenderPassMultiviewCreateInfo* = object
    sType* {.constant: (StructureType.renderPassMultiviewCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    subpassCount* {.optional.}: uint32
    pViewMasks*: ptr uint32
    dependencyCount* {.optional.}: uint32
    pViewOffsets*: ptr int32
    correlationMaskCount* {.optional.}: uint32
    pCorrelationMasks*: ptr uint32
  PhysicalDeviceMultiviewFeatures* = object
    sType* {.constant: (StructureType.physicalDeviceMultiviewFeatures).}: StructureType
    pNext* {.optional.}: pointer
    multiview*: Bool32
    multiviewGeometryShader*: Bool32
    multiviewTessellationShader*: Bool32
  PhysicalDeviceMultiviewProperties* = object
    sType* {.constant: (StructureType.physicalDeviceMultiviewProperties).}: StructureType
    pNext* {.optional.}: pointer
    maxMultiviewViewCount*: uint32
    maxMultiviewInstanceIndex*: uint32

  # Promoted from VK_KHR_variable_pointers
  # --------------------------------------
  PhysicalDeviceVariablePointerFeatures* = object
  PhysicalDeviceVariablePointersFeatures* = object
    sType* {.constant: (StructureType.physicalDeviceVariablePointersFeatures).}: StructureType
    pNext* {.optional.}: pointer
    variablePointersStorageBuffer*: Bool32
    variablePointers*: Bool32

  # Originally based on VK_KHR_protected_memory (extension 146), which was never published; thus the mystifying large value= numbers below. These are not aliased since they weren't actually promoted from an extension.
  # ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  PhysicalDeviceProtectedMemoryFeatures* = object
    sType* {.constant: (StructureType.physicalDeviceProtectedMemoryFeatures).}: StructureType
    pNext* {.optional.}: pointer
    protectedMemory*: Bool32
  PhysicalDeviceProtectedMemoryProperties* = object
    sType* {.constant: (StructureType.physicalDeviceProtectedMemoryProperties).}: StructureType
    pNext* {.optional.}: pointer
    protectedNoFault*: Bool32
  DeviceQueueInfo2* = object
    sType* {.constant: (StructureType.deviceQueueInfo2).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DeviceQueueCreateFlags
    queueFamilyIndex*: uint32
    queueIndex*: uint32
  ProtectedSubmitInfo* = object
    sType* {.constant: (StructureType.protectedSubmitInfo).}: StructureType
    pNext* {.optional.}: pointer
    protectedSubmit*: Bool32

  # Promoted from VK_KHR_sampler_ycbcr_conversion
  # ---------------------------------------------
  SamplerYcbcrConversionCreateInfo* = object
    sType* {.constant: (StructureType.samplerYcbcrConversionCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    format*: Format
    ycbcrModel*: SamplerYcbcrModelConversion
    ycbcrRange*: SamplerYcbcrRange
    components*: ComponentMapping
    xChromaOffset*: ChromaLocation
    yChromaOffset*: ChromaLocation
    chromaFilter*: Filter
    forceExplicitReconstruction*: Bool32
  SamplerYcbcrConversionInfo* = object
    sType* {.constant: (StructureType.samplerYcbcrConversionInfo).}: StructureType
    pNext* {.optional.}: pointer
    conversion*: SamplerYcbcrConversion
  BindImagePlaneMemoryInfo* = object
    sType* {.constant: (StructureType.bindImagePlaneMemoryInfo).}: StructureType
    pNext* {.optional.}: pointer
    planeAspect*: ImageAspectFlagBits
  ImagePlaneMemoryRequirementsInfo* = object
    sType* {.constant: (StructureType.imagePlaneMemoryRequirementsInfo).}: StructureType
    pNext* {.optional.}: pointer
    planeAspect*: ImageAspectFlagBits
  PhysicalDeviceSamplerYcbcrConversionFeatures* = object
    sType* {.constant: (StructureType.physicalDeviceSamplerYcbcrConversionFeatures).}: StructureType
    pNext* {.optional.}: pointer
    samplerYcbcrConversion*: Bool32
  SamplerYcbcrConversionImageFormatProperties* = object
    sType* {.constant: (StructureType.samplerYcbcrConversionImageFormatProperties).}: StructureType
    pNext* {.optional.}: pointer
    combinedImageSamplerDescriptorCount*: uint32
  HtSamplerYcbcrConversion = object of HandleType
  SamplerYcbcrConversion* = NonDispatchableHandle[HtSamplerYcbcrConversion]

  # Promoted from VK_KHR_descriptor_update_template
  # -----------------------------------------------
  HtDescriptorUpdateTemplate = object of HandleType
  DescriptorUpdateTemplate* = NonDispatchableHandle[HtDescriptorUpdateTemplate]
  DescriptorUpdateTemplateEntry* = object
    dstBinding*: uint32
    dstArrayElement*: uint32
    descriptorCount*: uint32
    descriptorType*: DescriptorType
    offset*: uint
    stride*: uint
  DescriptorUpdateTemplateCreateInfo* = object
    sType* {.constant: (StructureType.descriptorUpdateTemplateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DescriptorUpdateTemplateCreateFlags
    descriptorUpdateEntryCount*: uint32
    pDescriptorUpdateEntries*: ptr DescriptorUpdateTemplateEntry
    templateType*: DescriptorUpdateTemplateType
    descriptorSetLayout*: DescriptorSetLayout
    pipelineBindPoint*: PipelineBindPoint
    pipelineLayout*: PipelineLayout
    set*: uint32

  # Promoted from VK_KHR_external_memory_capabilities
  # -------------------------------------------------
  ExternalMemoryProperties* = object
    externalMemoryFeatures*: ExternalMemoryFeatureFlags
    exportFromImportedHandleTypes* {.optional.}: ExternalMemoryHandleTypeFlags
    compatibleHandleTypes*: ExternalMemoryHandleTypeFlags
  PhysicalDeviceExternalImageFormatInfo* = object
    sType* {.constant: (StructureType.physicalDeviceExternalImageFormatInfo).}: StructureType
    pNext* {.optional.}: pointer
    handleType* {.optional.}: ExternalMemoryHandleTypeFlagBits
  ExternalImageFormatProperties* = object
    sType* {.constant: (StructureType.externalImageFormatProperties).}: StructureType
    pNext* {.optional.}: pointer
    externalMemoryProperties*: ExternalMemoryProperties
  PhysicalDeviceExternalBufferInfo* = object
    sType* {.constant: (StructureType.physicalDeviceExternalBufferInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: BufferCreateFlags
    usage*: BufferUsageFlags
    handleType*: ExternalMemoryHandleTypeFlagBits
  ExternalBufferProperties* = object
    sType* {.constant: (StructureType.externalBufferProperties).}: StructureType
    pNext* {.optional.}: pointer
    externalMemoryProperties*: ExternalMemoryProperties
  PhysicalDeviceIDProperties* = object
    sType* {.constant: (StructureType.physicalDeviceIdProperties).}: StructureType
    pNext* {.optional.}: pointer
    deviceUUID*: array[UuidSize, uint8]
    driverUUID*: array[UuidSize, uint8]
    deviceLUID*: array[LuidSize, uint8]
    deviceNodeMask*: uint32
    deviceLUIDValid*: Bool32

  # Promoted from VK_KHR_external_memory
  # ------------------------------------
  ExternalMemoryImageCreateInfo* = object
    sType* {.constant: (StructureType.externalMemoryImageCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    handleTypes*: ExternalMemoryHandleTypeFlags
  ExternalMemoryBufferCreateInfo* = object
    sType* {.constant: (StructureType.externalMemoryBufferCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    handleTypes* {.optional.}: ExternalMemoryHandleTypeFlags
  ExportMemoryAllocateInfo* = object
    sType* {.constant: (StructureType.exportMemoryAllocateInfo).}: StructureType
    pNext* {.optional.}: pointer
    handleTypes* {.optional.}: ExternalMemoryHandleTypeFlags

  # Promoted from VK_KHR_external_fence_capabilities
  # ------------------------------------------------
  PhysicalDeviceExternalFenceInfo* = object
    sType* {.constant: (StructureType.physicalDeviceExternalFenceInfo).}: StructureType
    pNext* {.optional.}: pointer
    handleType*: ExternalFenceHandleTypeFlagBits
  ExternalFenceProperties* = object
    sType* {.constant: (StructureType.externalFenceProperties).}: StructureType
    pNext* {.optional.}: pointer
    exportFromImportedHandleTypes*: ExternalFenceHandleTypeFlags
    compatibleHandleTypes*: ExternalFenceHandleTypeFlags
    externalFenceFeatures* {.optional.}: ExternalFenceFeatureFlags

  # Promoted from VK_KHR_external_fence
  # -----------------------------------
  ExportFenceCreateInfo* = object
    sType* {.constant: (StructureType.exportFenceCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    handleTypes* {.optional.}: ExternalFenceHandleTypeFlags

  # Promoted from VK_KHR_external_semaphore
  # ---------------------------------------
  ExportSemaphoreCreateInfo* = object
    sType* {.constant: (StructureType.exportSemaphoreCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    handleTypes* {.optional.}: ExternalSemaphoreHandleTypeFlags

  # Promoted from VK_KHR_external_semaphore_capabilities
  # ----------------------------------------------------
  PhysicalDeviceExternalSemaphoreInfo* = object
    sType* {.constant: (StructureType.physicalDeviceExternalSemaphoreInfo).}: StructureType
    pNext* {.optional.}: pointer
    handleType*: ExternalSemaphoreHandleTypeFlagBits
  ExternalSemaphoreProperties* = object
    sType* {.constant: (StructureType.externalSemaphoreProperties).}: StructureType
    pNext* {.optional.}: pointer
    exportFromImportedHandleTypes*: ExternalSemaphoreHandleTypeFlags
    compatibleHandleTypes*: ExternalSemaphoreHandleTypeFlags
    externalSemaphoreFeatures* {.optional.}: ExternalSemaphoreFeatureFlags

  # Promoted from VK_KHR_maintenance3
  # ---------------------------------
  PhysicalDeviceMaintenance3Properties* = object
    sType* {.constant: (StructureType.physicalDeviceMaintenance3Properties).}: StructureType
    pNext* {.optional.}: pointer
    maxPerSetDescriptors*: uint32
    maxMemoryAllocationSize*: DeviceSize
  DescriptorSetLayoutSupport* = object
    sType* {.constant: (StructureType.descriptorSetLayoutSupport).}: StructureType
    pNext* {.optional.}: pointer
    supported*: Bool32

  # Promoted from VK_KHR_shader_draw_parameters, with a feature support query added
  # -------------------------------------------------------------------------------
  PhysicalDeviceShaderDrawParameterFeatures* = object
  PhysicalDeviceShaderDrawParametersFeatures* = object
    sType* {.constant: (StructureType.physicalDeviceShaderDrawParametersFeatures).}: StructureType
    pNext* {.optional.}: pointer
    shaderDrawParameters*: Bool32

template apiVersion11*(): untyped = makeVersion(1, 1, 0)


# Device Initialization
# ---------------------
proc enumerateInstanceVersion*(
      pApiVersion: ptr uint32;
    ): Result {.cdecl, preload("vkEnumerateInstanceVersion").}


# Promoted from VK_KHR_relaxed_block_layout, which has no API
# -----------------------------------------------------------


# Promoted from VK_KHR_storage_buffer_storage_class, which has no API
# -------------------------------------------------------------------


# Originally based on VK_KHR_subgroup (extension 94), but the actual enum block used was, incorrectly, that of extension 95
# -------------------------------------------------------------------------------------------------------------------------


# Promoted from VK_KHR_bind_memory2
# ---------------------------------
proc bindBufferMemory2*(
      device: Device;
      bindInfoCount: uint32;
      pBindInfos {.length: bindInfoCount.}: ptr BindBufferMemoryInfo;
    ): Result {.cdecl, lazyload("vkBindBufferMemory2", DeviceLevel).}
proc bindImageMemory2*(
      device: Device;
      bindInfoCount: uint32;
      pBindInfos {.length: bindInfoCount.}: ptr BindImageMemoryInfo;
    ): Result {.cdecl, lazyload("vkBindImageMemory2", DeviceLevel).}


# Promoted from VK_KHR_16bit_storage
# ----------------------------------


# Promoted from VK_KHR_dedicated_allocation
# -----------------------------------------


# Promoted from VK_KHR_device_group
# ---------------------------------
proc getDeviceGroupPeerMemoryFeatures*(
      device: Device;
      heapIndex: uint32;
      localDeviceIndex: uint32;
      remoteDeviceIndex: uint32;
      pPeerMemoryFeatures: ptr PeerMemoryFeatureFlags;
    ): void {.cdecl, lazyload("vkGetDeviceGroupPeerMemoryFeatures", DeviceLevel).}
proc cmdSetDeviceMask*(
      commandBuffer: CommandBuffer;
      deviceMask: uint32;
    ): void {.cdecl, lazyload("vkCmdSetDeviceMask", DeviceLevel).}
proc cmdDispatchBase*(
      commandBuffer: CommandBuffer;
      baseGroupX: uint32;
      baseGroupY: uint32;
      baseGroupZ: uint32;
      groupCountX: uint32;
      groupCountY: uint32;
      groupCountZ: uint32;
    ): void {.cdecl, lazyload("vkCmdDispatchBase", DeviceLevel).}
PipelineCreateFlagBits.defineAliases:
  dispatchBase as dispatchBase



# Promoted from VK_KHR_device_group + VK_KHR_bind_memory2
# -------------------------------------------------------


# Promoted from VK_KHR_device_group_creation
# ------------------------------------------
proc enumeratePhysicalDeviceGroups*(
      instance: Instance;
      pPhysicalDeviceGroupCount: ptr uint32;
      pPhysicalDeviceGroupProperties {.length: pPhysicalDeviceGroupCount.} = default(ptr PhysicalDeviceGroupProperties);
    ): Result {.cdecl, lazyload("vkEnumeratePhysicalDeviceGroups", InstanceLevel).}


# Promoted from VK_KHR_get_memory_requirements2
# ---------------------------------------------
proc getImageMemoryRequirements2*(
      device: Device;
      pInfo: ptr ImageMemoryRequirementsInfo2;
      pMemoryRequirements: ptr MemoryRequirements2;
    ): void {.cdecl, lazyload("vkGetImageMemoryRequirements2", DeviceLevel).}
proc getBufferMemoryRequirements2*(
      device: Device;
      pInfo: ptr BufferMemoryRequirementsInfo2;
      pMemoryRequirements: ptr MemoryRequirements2;
    ): void {.cdecl, lazyload("vkGetBufferMemoryRequirements2", DeviceLevel).}
proc getImageSparseMemoryRequirements2*(
      device: Device;
      pInfo: ptr ImageSparseMemoryRequirementsInfo2;
      pSparseMemoryRequirementCount: ptr uint32;
      pSparseMemoryRequirements {.length: pSparseMemoryRequirementCount.} = default(ptr SparseImageMemoryRequirements2);
    ): void {.cdecl, lazyload("vkGetImageSparseMemoryRequirements2", DeviceLevel).}


# Promoted from VK_KHR_get_physical_device_properties2
# ----------------------------------------------------
proc getPhysicalDeviceFeatures2*(
      physicalDevice: PhysicalDevice;
      pFeatures: ptr PhysicalDeviceFeatures2;
    ): void {.cdecl, lazyload("vkGetPhysicalDeviceFeatures2", InstanceLevel).}
proc getPhysicalDeviceProperties2*(
      physicalDevice: PhysicalDevice;
      pProperties: ptr PhysicalDeviceProperties2;
    ): void {.cdecl, lazyload("vkGetPhysicalDeviceProperties2", InstanceLevel).}
proc getPhysicalDeviceFormatProperties2*(
      physicalDevice: PhysicalDevice;
      format: Format;
      pFormatProperties: ptr FormatProperties2;
    ): void {.cdecl, lazyload("vkGetPhysicalDeviceFormatProperties2", InstanceLevel).}
proc getPhysicalDeviceImageFormatProperties2*(
      physicalDevice: PhysicalDevice;
      pImageFormatInfo: ptr PhysicalDeviceImageFormatInfo2;
      pImageFormatProperties: ptr ImageFormatProperties2;
    ): Result {.cdecl, lazyload("vkGetPhysicalDeviceImageFormatProperties2", InstanceLevel).}
proc getPhysicalDeviceQueueFamilyProperties2*(
      physicalDevice: PhysicalDevice;
      pQueueFamilyPropertyCount: ptr uint32;
      pQueueFamilyProperties {.length: pQueueFamilyPropertyCount.} = default(ptr QueueFamilyProperties2);
    ): void {.cdecl, lazyload("vkGetPhysicalDeviceQueueFamilyProperties2", InstanceLevel).}
proc getPhysicalDeviceMemoryProperties2*(
      physicalDevice: PhysicalDevice;
      pMemoryProperties: ptr PhysicalDeviceMemoryProperties2;
    ): void {.cdecl, lazyload("vkGetPhysicalDeviceMemoryProperties2", InstanceLevel).}
proc getPhysicalDeviceSparseImageFormatProperties2*(
      physicalDevice: PhysicalDevice;
      pFormatInfo: ptr PhysicalDeviceSparseImageFormatInfo2;
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(ptr SparseImageFormatProperties2);
    ): void {.cdecl, lazyload("vkGetPhysicalDeviceSparseImageFormatProperties2", InstanceLevel).}


# Promoted from VK_KHR_maintenance1
# ---------------------------------
proc trimCommandPool*(
      device: Device;
      commandPool: CommandPool;
      flags = default(CommandPoolTrimFlags);
    ): void {.cdecl, lazyload("vkTrimCommandPool", DeviceLevel).}


# Promoted from VK_KHR_maintenance2
# ---------------------------------


# Promoted from VK_KHR_multiview
# ------------------------------


# Promoted from VK_KHR_variable_pointers
# --------------------------------------
StructureType.defineAliases:
  physicalDeviceVariablePointersFeatures as physicalDeviceVariablePointerFeatures



# Originally based on VK_KHR_protected_memory (extension 146), which was never published; thus the mystifying large value= numbers below. These are not aliased since they weren't actually promoted from an extension.
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
proc getDeviceQueue2*(
      device: Device;
      pQueueInfo: ptr DeviceQueueInfo2;
      pQueue: ptr Queue;
    ): void {.cdecl, lazyload("vkGetDeviceQueue2", DeviceLevel).}


# Promoted from VK_KHR_sampler_ycbcr_conversion
# ---------------------------------------------
proc createSamplerYcbcrConversion*(
      device: Device;
      pCreateInfo: ptr SamplerYcbcrConversionCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pYcbcrConversion: ptr SamplerYcbcrConversion;
    ): Result {.cdecl, lazyload("vkCreateSamplerYcbcrConversion", DeviceLevel).}
proc destroySamplerYcbcrConversion*(
      device: Device;
      ycbcrConversion = default(SamplerYcbcrConversion);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, lazyload("vkDestroySamplerYcbcrConversion", DeviceLevel).}


# Promoted from VK_KHR_descriptor_update_template
# -----------------------------------------------
proc createDescriptorUpdateTemplate*(
      device: Device;
      pCreateInfo: ptr DescriptorUpdateTemplateCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pDescriptorUpdateTemplate: ptr DescriptorUpdateTemplate;
    ): Result {.cdecl, lazyload("vkCreateDescriptorUpdateTemplate", DeviceLevel).}
proc destroyDescriptorUpdateTemplate*(
      device: Device;
      descriptorUpdateTemplate = default(DescriptorUpdateTemplate);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, lazyload("vkDestroyDescriptorUpdateTemplate", DeviceLevel).}
proc updateDescriptorSetWithTemplate*(
      device: Device;
      descriptorSet: DescriptorSet;
      descriptorUpdateTemplate: DescriptorUpdateTemplate;
      pData: pointer;
    ): void {.cdecl, lazyload("vkUpdateDescriptorSetWithTemplate", DeviceLevel).}


# Promoted from VK_KHR_external_memory_capabilities
# -------------------------------------------------
proc getPhysicalDeviceExternalBufferProperties*(
      physicalDevice: PhysicalDevice;
      pExternalBufferInfo: ptr PhysicalDeviceExternalBufferInfo;
      pExternalBufferProperties: ptr ExternalBufferProperties;
    ): void {.cdecl, lazyload("vkGetPhysicalDeviceExternalBufferProperties", InstanceLevel).}


# Promoted from VK_KHR_external_memory
# ------------------------------------


# Promoted from VK_KHR_external_fence_capabilities
# ------------------------------------------------
proc getPhysicalDeviceExternalFenceProperties*(
      physicalDevice: PhysicalDevice;
      pExternalFenceInfo: ptr PhysicalDeviceExternalFenceInfo;
      pExternalFenceProperties: ptr ExternalFenceProperties;
    ): void {.cdecl, lazyload("vkGetPhysicalDeviceExternalFenceProperties", InstanceLevel).}


# Promoted from VK_KHR_external_fence
# -----------------------------------


# Promoted from VK_KHR_external_semaphore
# ---------------------------------------


# Promoted from VK_KHR_external_semaphore_capabilities
# ----------------------------------------------------
ExternalSemaphoreHandleTypeFlagBits.defineAliases:
  d3d12Fence as d3d11Fence

proc getPhysicalDeviceExternalSemaphoreProperties*(
      physicalDevice: PhysicalDevice;
      pExternalSemaphoreInfo: ptr PhysicalDeviceExternalSemaphoreInfo;
      pExternalSemaphoreProperties: ptr ExternalSemaphoreProperties;
    ): void {.cdecl, lazyload("vkGetPhysicalDeviceExternalSemaphoreProperties", InstanceLevel).}


# Promoted from VK_KHR_maintenance3
# ---------------------------------
proc getDescriptorSetLayoutSupport*(
      device: Device;
      pCreateInfo: ptr DescriptorSetLayoutCreateInfo;
      pSupport: ptr DescriptorSetLayoutSupport;
    ): void {.cdecl, lazyload("vkGetDescriptorSetLayoutSupport", DeviceLevel).}


# Promoted from VK_KHR_shader_draw_parameters, with a feature support query added
# -------------------------------------------------------------------------------
StructureType.defineAliases:
  physicalDeviceShaderDrawParametersFeatures as physicalDeviceShaderDrawParameterFeatures


proc loadAllVk11*(instance: Instance) =
  # Promoted from VK_KHR_bind_memory2
  bindBufferMemory2.load(instance)
  bindImageMemory2.load(instance)

  # Promoted from VK_KHR_device_group
  getDeviceGroupPeerMemoryFeatures.load(instance)
  cmdSetDeviceMask.load(instance)
  cmdDispatchBase.load(instance)

  # Promoted from VK_KHR_device_group_creation
  enumeratePhysicalDeviceGroups.load(instance)

  # Promoted from VK_KHR_get_memory_requirements2
  getImageMemoryRequirements2.load(instance)
  getBufferMemoryRequirements2.load(instance)
  getImageSparseMemoryRequirements2.load(instance)

  # Promoted from VK_KHR_get_physical_device_properties2
  getPhysicalDeviceFeatures2.load(instance)
  getPhysicalDeviceProperties2.load(instance)
  getPhysicalDeviceFormatProperties2.load(instance)
  getPhysicalDeviceImageFormatProperties2.load(instance)
  getPhysicalDeviceQueueFamilyProperties2.load(instance)
  getPhysicalDeviceMemoryProperties2.load(instance)
  getPhysicalDeviceSparseImageFormatProperties2.load(instance)

  # Promoted from VK_KHR_maintenance1
  trimCommandPool.load(instance)

  # Originally based on VK_KHR_protected_memory (extension 146), which was never published; thus the mystifying large value= numbers below. These are not aliased since they weren't actually promoted from an extension.
  getDeviceQueue2.load(instance)

  # Promoted from VK_KHR_sampler_ycbcr_conversion
  createSamplerYcbcrConversion.load(instance)
  destroySamplerYcbcrConversion.load(instance)

  # Promoted from VK_KHR_descriptor_update_template
  createDescriptorUpdateTemplate.load(instance)
  destroyDescriptorUpdateTemplate.load(instance)
  updateDescriptorSetWithTemplate.load(instance)

  # Promoted from VK_KHR_external_memory_capabilities
  getPhysicalDeviceExternalBufferProperties.load(instance)

  # Promoted from VK_KHR_external_fence_capabilities
  getPhysicalDeviceExternalFenceProperties.load(instance)

  # Promoted from VK_KHR_external_semaphore_capabilities
  getPhysicalDeviceExternalSemaphoreProperties.load(instance)

  # Promoted from VK_KHR_maintenance3
  getDescriptorSetLayoutSupport.load(instance)

proc loadVk11*(instance: Instance) =
  # Promoted from VK_KHR_device_group_creation
  enumeratePhysicalDeviceGroups.load(instance)

  # Promoted from VK_KHR_get_physical_device_properties2
  getPhysicalDeviceFeatures2.load(instance)
  getPhysicalDeviceProperties2.load(instance)
  getPhysicalDeviceFormatProperties2.load(instance)
  getPhysicalDeviceImageFormatProperties2.load(instance)
  getPhysicalDeviceQueueFamilyProperties2.load(instance)
  getPhysicalDeviceMemoryProperties2.load(instance)
  getPhysicalDeviceSparseImageFormatProperties2.load(instance)

  # Promoted from VK_KHR_external_memory_capabilities
  getPhysicalDeviceExternalBufferProperties.load(instance)

  # Promoted from VK_KHR_external_fence_capabilities
  getPhysicalDeviceExternalFenceProperties.load(instance)

  # Promoted from VK_KHR_external_semaphore_capabilities
  getPhysicalDeviceExternalSemaphoreProperties.load(instance)

proc loadVk11*(device: Device) =
  # Promoted from VK_KHR_bind_memory2
  bindBufferMemory2.load(device)
  bindImageMemory2.load(device)

  # Promoted from VK_KHR_device_group
  getDeviceGroupPeerMemoryFeatures.load(device)
  cmdSetDeviceMask.load(device)
  cmdDispatchBase.load(device)

  # Promoted from VK_KHR_get_memory_requirements2
  getImageMemoryRequirements2.load(device)
  getBufferMemoryRequirements2.load(device)
  getImageSparseMemoryRequirements2.load(device)

  # Promoted from VK_KHR_maintenance1
  trimCommandPool.load(device)

  # Originally based on VK_KHR_protected_memory (extension 146), which was never published; thus the mystifying large value= numbers below. These are not aliased since they weren't actually promoted from an extension.
  getDeviceQueue2.load(device)

  # Promoted from VK_KHR_sampler_ycbcr_conversion
  createSamplerYcbcrConversion.load(device)
  destroySamplerYcbcrConversion.load(device)

  # Promoted from VK_KHR_descriptor_update_template
  createDescriptorUpdateTemplate.load(device)
  destroyDescriptorUpdateTemplate.load(device)
  updateDescriptorSetWithTemplate.load(device)

  # Promoted from VK_KHR_maintenance3
  getDescriptorSetLayoutSupport.load(device)

