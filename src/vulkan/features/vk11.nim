# Generated at 2021-09-09T01:49:36Z
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
    sType*: StructureType
    pNext*: pointer
    subgroupSize*: uint32
    supportedStages*: ShaderStageFlags
    supportedOperations*: SubgroupFeatureFlags
    quadOperationsInAllStages*: Bool32

  # Promoted from VK_KHR_bind_memory2
  # ---------------------------------
  BindBufferMemoryInfo* = object
    sType*: StructureType
    pNext*: pointer
    buffer*: Buffer
    memory*: DeviceMemory
    memoryOffset*: DeviceSize
  BindImageMemoryInfo* = object
    sType*: StructureType
    pNext*: pointer
    image*: Image
    memory*: DeviceMemory
    memoryOffset*: DeviceSize

  # Promoted from VK_KHR_16bit_storage
  # ----------------------------------
  PhysicalDevice16BitStorageFeatures* = object
    sType*: StructureType
    pNext*: pointer
    storageBuffer16BitAccess*: Bool32
    uniformAndStorageBuffer16BitAccess*: Bool32
    storagePushConstant16*: Bool32
    storageInputOutput16*: Bool32

  # Promoted from VK_KHR_dedicated_allocation
  # -----------------------------------------
  MemoryDedicatedRequirements* = object
    sType*: StructureType
    pNext*: pointer
    prefersDedicatedAllocation*: Bool32
    requiresDedicatedAllocation*: Bool32
  MemoryDedicatedAllocateInfo* = object
    sType*: StructureType
    pNext*: pointer
    image*: Image
    buffer*: Buffer

  # Promoted from VK_KHR_device_group
  # ---------------------------------
  MemoryAllocateFlagsInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: MemoryAllocateFlags
    deviceMask*: uint32
  DeviceGroupRenderPassBeginInfo* = object
    sType*: StructureType
    pNext*: pointer
    deviceMask*: uint32
    deviceRenderAreaCount*: uint32
    pDeviceRenderAreas*: ptr Rect2D
  DeviceGroupCommandBufferBeginInfo* = object
    sType*: StructureType
    pNext*: pointer
    deviceMask*: uint32
  DeviceGroupSubmitInfo* = object
    sType*: StructureType
    pNext*: pointer
    waitSemaphoreCount*: uint32
    pWaitSemaphoreDeviceIndices*: ptr uint32
    commandBufferCount*: uint32
    pCommandBufferDeviceMasks*: ptr uint32
    signalSemaphoreCount*: uint32
    pSignalSemaphoreDeviceIndices*: ptr uint32
  DeviceGroupBindSparseInfo* = object
    sType*: StructureType
    pNext*: pointer
    resourceDeviceIndex*: uint32
    memoryDeviceIndex*: uint32

  # Promoted from VK_KHR_device_group + VK_KHR_bind_memory2
  # -------------------------------------------------------
  BindBufferMemoryDeviceGroupInfo* = object
    sType*: StructureType
    pNext*: pointer
    deviceIndexCount*: uint32
    pDeviceIndices*: ptr uint32
  BindImageMemoryDeviceGroupInfo* = object
    sType*: StructureType
    pNext*: pointer
    deviceIndexCount*: uint32
    pDeviceIndices*: ptr uint32
    splitInstanceBindRegionCount*: uint32
    pSplitInstanceBindRegions*: ptr Rect2D

  # Promoted from VK_KHR_device_group_creation
  # ------------------------------------------
  PhysicalDeviceGroupProperties* = object
    sType*: StructureType
    pNext*: pointer
    physicalDeviceCount*: uint32
    physicalDevices*: array[MaxDeviceGroupSize, PhysicalDevice]
    subsetAllocation*: Bool32
  DeviceGroupDeviceCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    physicalDeviceCount*: uint32
    pPhysicalDevices*: ptr PhysicalDevice

  # Promoted from VK_KHR_get_memory_requirements2
  # ---------------------------------------------
  BufferMemoryRequirementsInfo2* = object
    sType*: StructureType
    pNext*: pointer
    buffer*: Buffer
  ImageMemoryRequirementsInfo2* = object
    sType*: StructureType
    pNext*: pointer
    image*: Image
  ImageSparseMemoryRequirementsInfo2* = object
    sType*: StructureType
    pNext*: pointer
    image*: Image
  MemoryRequirements2* = object
    sType*: StructureType
    pNext*: pointer
    memoryRequirements*: MemoryRequirements
  SparseImageMemoryRequirements2* = object
    sType*: StructureType
    pNext*: pointer
    memoryRequirements*: SparseImageMemoryRequirements

  # Promoted from VK_KHR_get_physical_device_properties2
  # ----------------------------------------------------
  PhysicalDeviceFeatures2* = object
    sType*: StructureType
    pNext*: pointer
    features*: PhysicalDeviceFeatures
  PhysicalDeviceProperties2* = object
    sType*: StructureType
    pNext*: pointer
    properties*: PhysicalDeviceProperties
  FormatProperties2* = object
    sType*: StructureType
    pNext*: pointer
    formatProperties*: FormatProperties
  ImageFormatProperties2* = object
    sType*: StructureType
    pNext*: pointer
    imageFormatProperties*: ImageFormatProperties
  PhysicalDeviceImageFormatInfo2* = object
    sType*: StructureType
    pNext*: pointer
    format*: Format
    theType*: ImageType
    tiling*: ImageTiling
    usage*: ImageUsageFlags
    flags*: ImageCreateFlags
  QueueFamilyProperties2* = object
    sType*: StructureType
    pNext*: pointer
    queueFamilyProperties*: QueueFamilyProperties
  PhysicalDeviceMemoryProperties2* = object
    sType*: StructureType
    pNext*: pointer
    memoryProperties*: PhysicalDeviceMemoryProperties
  SparseImageFormatProperties2* = object
    sType*: StructureType
    pNext*: pointer
    properties*: SparseImageFormatProperties
  PhysicalDeviceSparseImageFormatInfo2* = object
    sType*: StructureType
    pNext*: pointer
    format*: Format
    theType*: ImageType
    samples*: SampleCountFlagBits
    usage*: ImageUsageFlags
    tiling*: ImageTiling

  # Promoted from VK_KHR_maintenance2
  # ---------------------------------
  PhysicalDevicePointClippingProperties* = object
    sType*: StructureType
    pNext*: pointer
    pointClippingBehavior*: PointClippingBehavior
  RenderPassInputAttachmentAspectCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    aspectReferenceCount*: uint32
    pAspectReferences*: ptr InputAttachmentAspectReference
  InputAttachmentAspectReference* = object
    subpass*: uint32
    inputAttachmentIndex*: uint32
    aspectMask*: ImageAspectFlags
  ImageViewUsageCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    usage*: ImageUsageFlags
  PipelineTessellationDomainOriginStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    domainOrigin*: TessellationDomainOrigin

  # Promoted from VK_KHR_multiview
  # ------------------------------
  RenderPassMultiviewCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    subpassCount*: uint32
    pViewMasks*: ptr uint32
    dependencyCount*: uint32
    pViewOffsets*: ptr int32
    correlationMaskCount*: uint32
    pCorrelationMasks*: ptr uint32
  PhysicalDeviceMultiviewFeatures* = object
    sType*: StructureType
    pNext*: pointer
    multiview*: Bool32
    multiviewGeometryShader*: Bool32
    multiviewTessellationShader*: Bool32
  PhysicalDeviceMultiviewProperties* = object
    sType*: StructureType
    pNext*: pointer
    maxMultiviewViewCount*: uint32
    maxMultiviewInstanceIndex*: uint32

  # Promoted from VK_KHR_variable_pointers
  # --------------------------------------
  PhysicalDeviceVariablePointerFeatures* = object
  PhysicalDeviceVariablePointersFeatures* = object
    sType*: StructureType
    pNext*: pointer
    variablePointersStorageBuffer*: Bool32
    variablePointers*: Bool32

  # Originally based on VK_KHR_protected_memory (extension 146), which was never published; thus the mystifying large value= numbers below. These are not aliased since they weren't actually promoted from an extension.
  # ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  PhysicalDeviceProtectedMemoryFeatures* = object
    sType*: StructureType
    pNext*: pointer
    protectedMemory*: Bool32
  PhysicalDeviceProtectedMemoryProperties* = object
    sType*: StructureType
    pNext*: pointer
    protectedNoFault*: Bool32
  DeviceQueueInfo2* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DeviceQueueCreateFlags
    queueFamilyIndex*: uint32
    queueIndex*: uint32
  ProtectedSubmitInfo* = object
    sType*: StructureType
    pNext*: pointer
    protectedSubmit*: Bool32

  # Promoted from VK_KHR_sampler_ycbcr_conversion
  # ---------------------------------------------
  SamplerYcbcrConversionCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    format*: Format
    ycbcrModel*: SamplerYcbcrModelConversion
    ycbcrRange*: SamplerYcbcrRange
    components*: ComponentMapping
    xChromaOffset*: ChromaLocation
    yChromaOffset*: ChromaLocation
    chromaFilter*: Filter
    forceExplicitReconstruction*: Bool32
  SamplerYcbcrConversionInfo* = object
    sType*: StructureType
    pNext*: pointer
    conversion*: SamplerYcbcrConversion
  BindImagePlaneMemoryInfo* = object
    sType*: StructureType
    pNext*: pointer
    planeAspect*: ImageAspectFlagBits
  ImagePlaneMemoryRequirementsInfo* = object
    sType*: StructureType
    pNext*: pointer
    planeAspect*: ImageAspectFlagBits
  PhysicalDeviceSamplerYcbcrConversionFeatures* = object
    sType*: StructureType
    pNext*: pointer
    samplerYcbcrConversion*: Bool32
  SamplerYcbcrConversionImageFormatProperties* = object
    sType*: StructureType
    pNext*: pointer
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
    sType*: StructureType
    pNext*: pointer
    flags*: DescriptorUpdateTemplateCreateFlags
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
    exportFromImportedHandleTypes*: ExternalMemoryHandleTypeFlags
    compatibleHandleTypes*: ExternalMemoryHandleTypeFlags
  PhysicalDeviceExternalImageFormatInfo* = object
    sType*: StructureType
    pNext*: pointer
    handleType*: ExternalMemoryHandleTypeFlagBits
  ExternalImageFormatProperties* = object
    sType*: StructureType
    pNext*: pointer
    externalMemoryProperties*: ExternalMemoryProperties
  PhysicalDeviceExternalBufferInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: BufferCreateFlags
    usage*: BufferUsageFlags
    handleType*: ExternalMemoryHandleTypeFlagBits
  ExternalBufferProperties* = object
    sType*: StructureType
    pNext*: pointer
    externalMemoryProperties*: ExternalMemoryProperties
  PhysicalDeviceIDProperties* = object
    sType*: StructureType
    pNext*: pointer
    deviceUUID*: array[UuidSize, uint8]
    driverUUID*: array[UuidSize, uint8]
    deviceLUID*: array[LuidSize, uint8]
    deviceNodeMask*: uint32
    deviceLUIDValid*: Bool32

  # Promoted from VK_KHR_external_memory
  # ------------------------------------
  ExternalMemoryImageCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    handleTypes*: ExternalMemoryHandleTypeFlags
  ExternalMemoryBufferCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    handleTypes*: ExternalMemoryHandleTypeFlags
  ExportMemoryAllocateInfo* = object
    sType*: StructureType
    pNext*: pointer
    handleTypes*: ExternalMemoryHandleTypeFlags

  # Promoted from VK_KHR_external_fence_capabilities
  # ------------------------------------------------
  PhysicalDeviceExternalFenceInfo* = object
    sType*: StructureType
    pNext*: pointer
    handleType*: ExternalFenceHandleTypeFlagBits
  ExternalFenceProperties* = object
    sType*: StructureType
    pNext*: pointer
    exportFromImportedHandleTypes*: ExternalFenceHandleTypeFlags
    compatibleHandleTypes*: ExternalFenceHandleTypeFlags
    externalFenceFeatures*: ExternalFenceFeatureFlags

  # Promoted from VK_KHR_external_fence
  # -----------------------------------
  ExportFenceCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    handleTypes*: ExternalFenceHandleTypeFlags

  # Promoted from VK_KHR_external_semaphore
  # ---------------------------------------
  ExportSemaphoreCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    handleTypes*: ExternalSemaphoreHandleTypeFlags

  # Promoted from VK_KHR_external_semaphore_capabilities
  # ----------------------------------------------------
  PhysicalDeviceExternalSemaphoreInfo* = object
    sType*: StructureType
    pNext*: pointer
    handleType*: ExternalSemaphoreHandleTypeFlagBits
  ExternalSemaphoreProperties* = object
    sType*: StructureType
    pNext*: pointer
    exportFromImportedHandleTypes*: ExternalSemaphoreHandleTypeFlags
    compatibleHandleTypes*: ExternalSemaphoreHandleTypeFlags
    externalSemaphoreFeatures*: ExternalSemaphoreFeatureFlags

  # Promoted from VK_KHR_maintenance3
  # ---------------------------------
  PhysicalDeviceMaintenance3Properties* = object
    sType*: StructureType
    pNext*: pointer
    maxPerSetDescriptors*: uint32
    maxMemoryAllocationSize*: DeviceSize
  DescriptorSetLayoutSupport* = object
    sType*: StructureType
    pNext*: pointer
    supported*: Bool32

  # Promoted from VK_KHR_shader_draw_parameters, with a feature support query added
  # -------------------------------------------------------------------------------
  PhysicalDeviceShaderDrawParameterFeatures* = object
  PhysicalDeviceShaderDrawParametersFeatures* = object
    sType*: StructureType
    pNext*: pointer
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
      pBindInfos: ptr BindBufferMemoryInfo;
    ): Result {.cdecl, lazyload("vkBindBufferMemory2", DeviceLevel).}
proc bindImageMemory2*(
      device: Device;
      bindInfoCount: uint32;
      pBindInfos: ptr BindImageMemoryInfo;
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
      pPhysicalDeviceGroupProperties: ptr PhysicalDeviceGroupProperties;
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
      pSparseMemoryRequirements: ptr SparseImageMemoryRequirements2;
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
      pQueueFamilyProperties: ptr QueueFamilyProperties2;
    ): void {.cdecl, lazyload("vkGetPhysicalDeviceQueueFamilyProperties2", InstanceLevel).}
proc getPhysicalDeviceMemoryProperties2*(
      physicalDevice: PhysicalDevice;
      pMemoryProperties: ptr PhysicalDeviceMemoryProperties2;
    ): void {.cdecl, lazyload("vkGetPhysicalDeviceMemoryProperties2", InstanceLevel).}
proc getPhysicalDeviceSparseImageFormatProperties2*(
      physicalDevice: PhysicalDevice;
      pFormatInfo: ptr PhysicalDeviceSparseImageFormatInfo2;
      pPropertyCount: ptr uint32;
      pProperties: ptr SparseImageFormatProperties2;
    ): void {.cdecl, lazyload("vkGetPhysicalDeviceSparseImageFormatProperties2", InstanceLevel).}


# Promoted from VK_KHR_maintenance1
# ---------------------------------
proc trimCommandPool*(
      device: Device;
      commandPool: CommandPool;
      flags: CommandPoolTrimFlags;
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
      pAllocator: ptr AllocationCallbacks;
      pYcbcrConversion: ptr SamplerYcbcrConversion;
    ): Result {.cdecl, lazyload("vkCreateSamplerYcbcrConversion", DeviceLevel).}
proc destroySamplerYcbcrConversion*(
      device: Device;
      ycbcrConversion: SamplerYcbcrConversion;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl, lazyload("vkDestroySamplerYcbcrConversion", DeviceLevel).}


# Promoted from VK_KHR_descriptor_update_template
# -----------------------------------------------
proc createDescriptorUpdateTemplate*(
      device: Device;
      pCreateInfo: ptr DescriptorUpdateTemplateCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pDescriptorUpdateTemplate: ptr DescriptorUpdateTemplate;
    ): Result {.cdecl, lazyload("vkCreateDescriptorUpdateTemplate", DeviceLevel).}
proc destroyDescriptorUpdateTemplate*(
      device: Device;
      descriptorUpdateTemplate: DescriptorUpdateTemplate;
      pAllocator: ptr AllocationCallbacks;
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
  bindBufferMemory2.smartLoad(instance)
  bindImageMemory2.smartLoad(instance)

  # Promoted from VK_KHR_device_group
  getDeviceGroupPeerMemoryFeatures.smartLoad(instance)
  cmdSetDeviceMask.smartLoad(instance)
  cmdDispatchBase.smartLoad(instance)

  # Promoted from VK_KHR_device_group_creation
  enumeratePhysicalDeviceGroups.smartLoad(instance)

  # Promoted from VK_KHR_get_memory_requirements2
  getImageMemoryRequirements2.smartLoad(instance)
  getBufferMemoryRequirements2.smartLoad(instance)
  getImageSparseMemoryRequirements2.smartLoad(instance)

  # Promoted from VK_KHR_get_physical_device_properties2
  getPhysicalDeviceFeatures2.smartLoad(instance)
  getPhysicalDeviceProperties2.smartLoad(instance)
  getPhysicalDeviceFormatProperties2.smartLoad(instance)
  getPhysicalDeviceImageFormatProperties2.smartLoad(instance)
  getPhysicalDeviceQueueFamilyProperties2.smartLoad(instance)
  getPhysicalDeviceMemoryProperties2.smartLoad(instance)
  getPhysicalDeviceSparseImageFormatProperties2.smartLoad(instance)

  # Promoted from VK_KHR_maintenance1
  trimCommandPool.smartLoad(instance)

  # Originally based on VK_KHR_protected_memory (extension 146), which was never published; thus the mystifying large value= numbers below. These are not aliased since they weren't actually promoted from an extension.
  getDeviceQueue2.smartLoad(instance)

  # Promoted from VK_KHR_sampler_ycbcr_conversion
  createSamplerYcbcrConversion.smartLoad(instance)
  destroySamplerYcbcrConversion.smartLoad(instance)

  # Promoted from VK_KHR_descriptor_update_template
  createDescriptorUpdateTemplate.smartLoad(instance)
  destroyDescriptorUpdateTemplate.smartLoad(instance)
  updateDescriptorSetWithTemplate.smartLoad(instance)

  # Promoted from VK_KHR_external_memory_capabilities
  getPhysicalDeviceExternalBufferProperties.smartLoad(instance)

  # Promoted from VK_KHR_external_fence_capabilities
  getPhysicalDeviceExternalFenceProperties.smartLoad(instance)

  # Promoted from VK_KHR_external_semaphore_capabilities
  getPhysicalDeviceExternalSemaphoreProperties.smartLoad(instance)

  # Promoted from VK_KHR_maintenance3
  getDescriptorSetLayoutSupport.smartLoad(instance)

proc loadVk11*(instance: Instance) =
  # Promoted from VK_KHR_device_group_creation
  enumeratePhysicalDeviceGroups.smartLoad(instance)

  # Promoted from VK_KHR_get_physical_device_properties2
  getPhysicalDeviceFeatures2.smartLoad(instance)
  getPhysicalDeviceProperties2.smartLoad(instance)
  getPhysicalDeviceFormatProperties2.smartLoad(instance)
  getPhysicalDeviceImageFormatProperties2.smartLoad(instance)
  getPhysicalDeviceQueueFamilyProperties2.smartLoad(instance)
  getPhysicalDeviceMemoryProperties2.smartLoad(instance)
  getPhysicalDeviceSparseImageFormatProperties2.smartLoad(instance)

  # Promoted from VK_KHR_external_memory_capabilities
  getPhysicalDeviceExternalBufferProperties.smartLoad(instance)

  # Promoted from VK_KHR_external_fence_capabilities
  getPhysicalDeviceExternalFenceProperties.smartLoad(instance)

  # Promoted from VK_KHR_external_semaphore_capabilities
  getPhysicalDeviceExternalSemaphoreProperties.smartLoad(instance)

proc loadVk11*(device: Device) =
  # Promoted from VK_KHR_bind_memory2
  bindBufferMemory2.smartLoad(device)
  bindImageMemory2.smartLoad(device)

  # Promoted from VK_KHR_device_group
  getDeviceGroupPeerMemoryFeatures.smartLoad(device)
  cmdSetDeviceMask.smartLoad(device)
  cmdDispatchBase.smartLoad(device)

  # Promoted from VK_KHR_get_memory_requirements2
  getImageMemoryRequirements2.smartLoad(device)
  getBufferMemoryRequirements2.smartLoad(device)
  getImageSparseMemoryRequirements2.smartLoad(device)

  # Promoted from VK_KHR_maintenance1
  trimCommandPool.smartLoad(device)

  # Originally based on VK_KHR_protected_memory (extension 146), which was never published; thus the mystifying large value= numbers below. These are not aliased since they weren't actually promoted from an extension.
  getDeviceQueue2.smartLoad(device)

  # Promoted from VK_KHR_sampler_ycbcr_conversion
  createSamplerYcbcrConversion.smartLoad(device)
  destroySamplerYcbcrConversion.smartLoad(device)

  # Promoted from VK_KHR_descriptor_update_template
  createDescriptorUpdateTemplate.smartLoad(device)
  destroyDescriptorUpdateTemplate.smartLoad(device)
  updateDescriptorSetWithTemplate.smartLoad(device)

  # Promoted from VK_KHR_maintenance3
  getDescriptorSetLayoutSupport.smartLoad(device)

