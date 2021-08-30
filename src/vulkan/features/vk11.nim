# Generated at 2021-08-30T22:51:47Z
# vk11
# Vulkan 1.1 core API interface definitions.
# ==========================================


import ../platform
import ./vk10
export vk10 except loadInstanceProcs

const
  # Promoted from VK_KHR_device_group_creation
  MaxDeviceGroupSize* = 32

  # Promoted from VK_KHR_external_memory_capabilities
  LuidSize* = 8
  UuidSize* = 16

  # Promoted from VK_KHR_external_memory
  QueueFamilyExternal* = (uint32.high-1)

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

  # Promoted from VK_KHR_maintenance1
  # ---------------------------------
  CommandPoolTrimFlags* = Flags[distinct UnusedEnum]

  # Promoted from VK_KHR_maintenance2
  # ---------------------------------
  PhysicalDevicePointClippingProperties* = object
    sType*: StructureType
    pNext*: pointer
    pointClippingBehavior*: PointClippingBehavior
  PointClippingBehavior* {.size: sizeof(int32), pure.} = enum
    allClipPlanes = 0
    userClipPlanesOnly = 1
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
  TessellationDomainOrigin* {.size: sizeof(int32), pure.} = enum
    upperLeft = 0
    lowerLeft = 1
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
  # -----------------------------------------------
  HtDescriptorUpdateTemplate = object of HandleType
  DescriptorUpdateTemplate* = NonDispatchableHandle[HtDescriptorUpdateTemplate]
  DescriptorUpdateTemplateCreateFlags* = Flags[distinct UnusedEnum]
  DescriptorUpdateTemplateType* {.size: sizeof(int32), pure.} = enum
    descriptorSet = 0 # Create descriptor update template for descriptor set updates
    # Provided by VK_KHR_push_descriptor
    pushDescriptorsKhr = 1 # Create descriptor update template for pushed descriptor updates
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
  FenceImportFlags* = Flags[FenceImportFlagBits]
  FenceImportFlagBits* {.size: sizeof(int32), pure.} = enum
    temporary = 0x00000001
  ExportFenceCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    handleTypes*: ExternalFenceHandleTypeFlags

  # Promoted from VK_KHR_external_semaphore
  # ---------------------------------------
  SemaphoreImportFlags* = Flags[SemaphoreImportFlagBits]
  SemaphoreImportFlagBits* {.size: sizeof(int32), pure.} = enum
    temporary = 0x00000001
  ExportSemaphoreCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    handleTypes*: ExternalSemaphoreHandleTypeFlags

  # Promoted from VK_KHR_external_semaphore_capabilities
  # ----------------------------------------------------
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
var # command cages
  enumerateInstanceVersionCage: proc(pApiVersion: ptr uint32;): Result {.cdecl.}
proc enumerateInstanceVersion*(
      pApiVersion: ptr uint32;
    ): Result {.cdecl, discardable.} =
  enumerateInstanceVersionCage(pApiVersion)


# Promoted from VK_KHR_relaxed_block_layout, which has no API
# -----------------------------------------------------------


# Promoted from VK_KHR_storage_buffer_storage_class, which has no API
# -------------------------------------------------------------------


# Originally based on VK_KHR_subgroup (extension 94), but the actual enum block used was, incorrectly, that of extension 95
# -------------------------------------------------------------------------------------------------------------------------


# Promoted from VK_KHR_bind_memory2
# ---------------------------------
var # command cages
  bindBufferMemory2Cage: proc(device: Device; bindInfoCount: uint32; pBindInfos: ptr BindBufferMemoryInfo;): Result {.cdecl.}
  bindImageMemory2Cage: proc(device: Device; bindInfoCount: uint32; pBindInfos: ptr BindImageMemoryInfo;): Result {.cdecl.}
proc bindBufferMemory2*(
      device: Device;
      bindInfoCount: uint32;
      pBindInfos: ptr BindBufferMemoryInfo;
    ): Result {.cdecl, discardable.} =
  bindBufferMemory2Cage(device,bindInfoCount,pBindInfos)
proc bindImageMemory2*(
      device: Device;
      bindInfoCount: uint32;
      pBindInfos: ptr BindImageMemoryInfo;
    ): Result {.cdecl, discardable.} =
  bindImageMemory2Cage(device,bindInfoCount,pBindInfos)


# Promoted from VK_KHR_16bit_storage
# ----------------------------------


# Promoted from VK_KHR_dedicated_allocation
# -----------------------------------------


# Promoted from VK_KHR_device_group
# ---------------------------------
var # command cages
  getDeviceGroupPeerMemoryFeaturesCage: proc(device: Device; heapIndex: uint32; localDeviceIndex: uint32; remoteDeviceIndex: uint32; pPeerMemoryFeatures: ptr PeerMemoryFeatureFlags;): void {.cdecl.}
  cmdSetDeviceMaskCage: proc(commandBuffer: CommandBuffer; deviceMask: uint32;): void {.cdecl.}
  cmdDispatchBaseCage: proc(commandBuffer: CommandBuffer; baseGroupX: uint32; baseGroupY: uint32; baseGroupZ: uint32; groupCountX: uint32; groupCountY: uint32; groupCountZ: uint32;): void {.cdecl.}
proc getDeviceGroupPeerMemoryFeatures*(
      device: Device;
      heapIndex: uint32;
      localDeviceIndex: uint32;
      remoteDeviceIndex: uint32;
      pPeerMemoryFeatures: ptr PeerMemoryFeatureFlags;
    ): void {.cdecl.} =
  getDeviceGroupPeerMemoryFeaturesCage(device,heapIndex,localDeviceIndex,remoteDeviceIndex,pPeerMemoryFeatures)
proc cmdSetDeviceMask*(
      commandBuffer: CommandBuffer;
      deviceMask: uint32;
    ): void {.cdecl.} =
  cmdSetDeviceMaskCage(commandBuffer,deviceMask)
proc cmdDispatchBase*(
      commandBuffer: CommandBuffer;
      baseGroupX: uint32;
      baseGroupY: uint32;
      baseGroupZ: uint32;
      groupCountX: uint32;
      groupCountY: uint32;
      groupCountZ: uint32;
    ): void {.cdecl.} =
  cmdDispatchBaseCage(commandBuffer,baseGroupX,baseGroupY,baseGroupZ,groupCountX,groupCountY,groupCountZ)
PipelineCreateFlagBits.defineAliases:
  dispatchBase as dispatchBase



# Promoted from VK_KHR_device_group + VK_KHR_bind_memory2
# -------------------------------------------------------


# Promoted from VK_KHR_device_group_creation
# ------------------------------------------
var # command cages
  enumeratePhysicalDeviceGroupsCage: proc(instance: Instance; pPhysicalDeviceGroupCount: ptr uint32; pPhysicalDeviceGroupProperties: ptr PhysicalDeviceGroupProperties;): Result {.cdecl.}
proc enumeratePhysicalDeviceGroups*(
      instance: Instance;
      pPhysicalDeviceGroupCount: ptr uint32;
      pPhysicalDeviceGroupProperties: ptr PhysicalDeviceGroupProperties;
    ): Result {.cdecl, discardable.} =
  enumeratePhysicalDeviceGroupsCage(instance,pPhysicalDeviceGroupCount,pPhysicalDeviceGroupProperties)


# Promoted from VK_KHR_get_memory_requirements2
# ---------------------------------------------
var # command cages
  getImageMemoryRequirements2Cage: proc(device: Device; pInfo: ptr ImageMemoryRequirementsInfo2; pMemoryRequirements: ptr MemoryRequirements2;): void {.cdecl.}
  getBufferMemoryRequirements2Cage: proc(device: Device; pInfo: ptr BufferMemoryRequirementsInfo2; pMemoryRequirements: ptr MemoryRequirements2;): void {.cdecl.}
  getImageSparseMemoryRequirements2Cage: proc(device: Device; pInfo: ptr ImageSparseMemoryRequirementsInfo2; pSparseMemoryRequirementCount: ptr uint32; pSparseMemoryRequirements: ptr SparseImageMemoryRequirements2;): void {.cdecl.}
proc getImageMemoryRequirements2*(
      device: Device;
      pInfo: ptr ImageMemoryRequirementsInfo2;
      pMemoryRequirements: ptr MemoryRequirements2;
    ): void {.cdecl.} =
  getImageMemoryRequirements2Cage(device,pInfo,pMemoryRequirements)
proc getBufferMemoryRequirements2*(
      device: Device;
      pInfo: ptr BufferMemoryRequirementsInfo2;
      pMemoryRequirements: ptr MemoryRequirements2;
    ): void {.cdecl.} =
  getBufferMemoryRequirements2Cage(device,pInfo,pMemoryRequirements)
proc getImageSparseMemoryRequirements2*(
      device: Device;
      pInfo: ptr ImageSparseMemoryRequirementsInfo2;
      pSparseMemoryRequirementCount: ptr uint32;
      pSparseMemoryRequirements: ptr SparseImageMemoryRequirements2;
    ): void {.cdecl.} =
  getImageSparseMemoryRequirements2Cage(device,pInfo,pSparseMemoryRequirementCount,pSparseMemoryRequirements)


# Promoted from VK_KHR_get_physical_device_properties2
# ----------------------------------------------------
var # command cages
  getPhysicalDeviceFeatures2Cage: proc(physicalDevice: PhysicalDevice; pFeatures: ptr PhysicalDeviceFeatures2;): void {.cdecl.}
  getPhysicalDeviceProperties2Cage: proc(physicalDevice: PhysicalDevice; pProperties: ptr PhysicalDeviceProperties2;): void {.cdecl.}
  getPhysicalDeviceFormatProperties2Cage: proc(physicalDevice: PhysicalDevice; format: Format; pFormatProperties: ptr FormatProperties2;): void {.cdecl.}
  getPhysicalDeviceImageFormatProperties2Cage: proc(physicalDevice: PhysicalDevice; pImageFormatInfo: ptr PhysicalDeviceImageFormatInfo2; pImageFormatProperties: ptr ImageFormatProperties2;): Result {.cdecl.}
  getPhysicalDeviceQueueFamilyProperties2Cage: proc(physicalDevice: PhysicalDevice; pQueueFamilyPropertyCount: ptr uint32; pQueueFamilyProperties: ptr QueueFamilyProperties2;): void {.cdecl.}
  getPhysicalDeviceMemoryProperties2Cage: proc(physicalDevice: PhysicalDevice; pMemoryProperties: ptr PhysicalDeviceMemoryProperties2;): void {.cdecl.}
  getPhysicalDeviceSparseImageFormatProperties2Cage: proc(physicalDevice: PhysicalDevice; pFormatInfo: ptr PhysicalDeviceSparseImageFormatInfo2; pPropertyCount: ptr uint32; pProperties: ptr SparseImageFormatProperties2;): void {.cdecl.}
proc getPhysicalDeviceFeatures2*(
      physicalDevice: PhysicalDevice;
      pFeatures: ptr PhysicalDeviceFeatures2;
    ): void {.cdecl.} =
  getPhysicalDeviceFeatures2Cage(physicalDevice,pFeatures)
proc getPhysicalDeviceProperties2*(
      physicalDevice: PhysicalDevice;
      pProperties: ptr PhysicalDeviceProperties2;
    ): void {.cdecl.} =
  getPhysicalDeviceProperties2Cage(physicalDevice,pProperties)
proc getPhysicalDeviceFormatProperties2*(
      physicalDevice: PhysicalDevice;
      format: Format;
      pFormatProperties: ptr FormatProperties2;
    ): void {.cdecl.} =
  getPhysicalDeviceFormatProperties2Cage(physicalDevice,format,pFormatProperties)
proc getPhysicalDeviceImageFormatProperties2*(
      physicalDevice: PhysicalDevice;
      pImageFormatInfo: ptr PhysicalDeviceImageFormatInfo2;
      pImageFormatProperties: ptr ImageFormatProperties2;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceImageFormatProperties2Cage(physicalDevice,pImageFormatInfo,pImageFormatProperties)
proc getPhysicalDeviceQueueFamilyProperties2*(
      physicalDevice: PhysicalDevice;
      pQueueFamilyPropertyCount: ptr uint32;
      pQueueFamilyProperties: ptr QueueFamilyProperties2;
    ): void {.cdecl.} =
  getPhysicalDeviceQueueFamilyProperties2Cage(physicalDevice,pQueueFamilyPropertyCount,pQueueFamilyProperties)
proc getPhysicalDeviceMemoryProperties2*(
      physicalDevice: PhysicalDevice;
      pMemoryProperties: ptr PhysicalDeviceMemoryProperties2;
    ): void {.cdecl.} =
  getPhysicalDeviceMemoryProperties2Cage(physicalDevice,pMemoryProperties)
proc getPhysicalDeviceSparseImageFormatProperties2*(
      physicalDevice: PhysicalDevice;
      pFormatInfo: ptr PhysicalDeviceSparseImageFormatInfo2;
      pPropertyCount: ptr uint32;
      pProperties: ptr SparseImageFormatProperties2;
    ): void {.cdecl.} =
  getPhysicalDeviceSparseImageFormatProperties2Cage(physicalDevice,pFormatInfo,pPropertyCount,pProperties)


# Promoted from VK_KHR_maintenance1
# ---------------------------------
var # command cages
  trimCommandPoolCage: proc(device: Device; commandPool: CommandPool; flags: CommandPoolTrimFlags;): void {.cdecl.}
proc trimCommandPool*(
      device: Device;
      commandPool: CommandPool;
      flags: CommandPoolTrimFlags;
    ): void {.cdecl.} =
  trimCommandPoolCage(device,commandPool,flags)


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
var # command cages
  getDeviceQueue2Cage: proc(device: Device; pQueueInfo: ptr DeviceQueueInfo2; pQueue: ptr Queue;): void {.cdecl.}
proc getDeviceQueue2*(
      device: Device;
      pQueueInfo: ptr DeviceQueueInfo2;
      pQueue: ptr Queue;
    ): void {.cdecl.} =
  getDeviceQueue2Cage(device,pQueueInfo,pQueue)


# Promoted from VK_KHR_sampler_ycbcr_conversion
# ---------------------------------------------
var # command cages
  createSamplerYcbcrConversionCage: proc(device: Device; pCreateInfo: ptr SamplerYcbcrConversionCreateInfo; pAllocator: ptr AllocationCallbacks; pYcbcrConversion: ptr SamplerYcbcrConversion;): Result {.cdecl.}
  destroySamplerYcbcrConversionCage: proc(device: Device; ycbcrConversion: SamplerYcbcrConversion; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
proc createSamplerYcbcrConversion*(
      device: Device;
      pCreateInfo: ptr SamplerYcbcrConversionCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pYcbcrConversion: ptr SamplerYcbcrConversion;
    ): Result {.cdecl, discardable.} =
  createSamplerYcbcrConversionCage(device,pCreateInfo,pAllocator,pYcbcrConversion)
proc destroySamplerYcbcrConversion*(
      device: Device;
      ycbcrConversion: SamplerYcbcrConversion;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroySamplerYcbcrConversionCage(device,ycbcrConversion,pAllocator)


# Promoted from VK_KHR_descriptor_update_template
# -----------------------------------------------
var # command cages
  createDescriptorUpdateTemplateCage: proc(device: Device; pCreateInfo: ptr DescriptorUpdateTemplateCreateInfo; pAllocator: ptr AllocationCallbacks; pDescriptorUpdateTemplate: ptr DescriptorUpdateTemplate;): Result {.cdecl.}
  destroyDescriptorUpdateTemplateCage: proc(device: Device; descriptorUpdateTemplate: DescriptorUpdateTemplate; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  updateDescriptorSetWithTemplateCage: proc(device: Device; descriptorSet: DescriptorSet; descriptorUpdateTemplate: DescriptorUpdateTemplate; pData: pointer;): void {.cdecl.}
proc createDescriptorUpdateTemplate*(
      device: Device;
      pCreateInfo: ptr DescriptorUpdateTemplateCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pDescriptorUpdateTemplate: ptr DescriptorUpdateTemplate;
    ): Result {.cdecl, discardable.} =
  createDescriptorUpdateTemplateCage(device,pCreateInfo,pAllocator,pDescriptorUpdateTemplate)
proc destroyDescriptorUpdateTemplate*(
      device: Device;
      descriptorUpdateTemplate: DescriptorUpdateTemplate;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyDescriptorUpdateTemplateCage(device,descriptorUpdateTemplate,pAllocator)
proc updateDescriptorSetWithTemplate*(
      device: Device;
      descriptorSet: DescriptorSet;
      descriptorUpdateTemplate: DescriptorUpdateTemplate;
      pData: pointer;
    ): void {.cdecl.} =
  updateDescriptorSetWithTemplateCage(device,descriptorSet,descriptorUpdateTemplate,pData)


# Promoted from VK_KHR_external_memory_capabilities
# -------------------------------------------------
var # command cages
  getPhysicalDeviceExternalBufferPropertiesCage: proc(physicalDevice: PhysicalDevice; pExternalBufferInfo: ptr PhysicalDeviceExternalBufferInfo; pExternalBufferProperties: ptr ExternalBufferProperties;): void {.cdecl.}
proc getPhysicalDeviceExternalBufferProperties*(
      physicalDevice: PhysicalDevice;
      pExternalBufferInfo: ptr PhysicalDeviceExternalBufferInfo;
      pExternalBufferProperties: ptr ExternalBufferProperties;
    ): void {.cdecl.} =
  getPhysicalDeviceExternalBufferPropertiesCage(physicalDevice,pExternalBufferInfo,pExternalBufferProperties)


# Promoted from VK_KHR_external_memory
# ------------------------------------


# Promoted from VK_KHR_external_fence_capabilities
# ------------------------------------------------
var # command cages
  getPhysicalDeviceExternalFencePropertiesCage: proc(physicalDevice: PhysicalDevice; pExternalFenceInfo: ptr PhysicalDeviceExternalFenceInfo; pExternalFenceProperties: ptr ExternalFenceProperties;): void {.cdecl.}
proc getPhysicalDeviceExternalFenceProperties*(
      physicalDevice: PhysicalDevice;
      pExternalFenceInfo: ptr PhysicalDeviceExternalFenceInfo;
      pExternalFenceProperties: ptr ExternalFenceProperties;
    ): void {.cdecl.} =
  getPhysicalDeviceExternalFencePropertiesCage(physicalDevice,pExternalFenceInfo,pExternalFenceProperties)


# Promoted from VK_KHR_external_fence
# -----------------------------------


# Promoted from VK_KHR_external_semaphore
# ---------------------------------------


# Promoted from VK_KHR_external_semaphore_capabilities
# ----------------------------------------------------
ExternalSemaphoreHandleTypeFlagBits.defineAliases:
  d3d12Fence as d3d11Fence

var # command cages
  getPhysicalDeviceExternalSemaphorePropertiesCage: proc(physicalDevice: PhysicalDevice; pExternalSemaphoreInfo: ptr PhysicalDeviceExternalSemaphoreInfo; pExternalSemaphoreProperties: ptr ExternalSemaphoreProperties;): void {.cdecl.}
proc getPhysicalDeviceExternalSemaphoreProperties*(
      physicalDevice: PhysicalDevice;
      pExternalSemaphoreInfo: ptr PhysicalDeviceExternalSemaphoreInfo;
      pExternalSemaphoreProperties: ptr ExternalSemaphoreProperties;
    ): void {.cdecl.} =
  getPhysicalDeviceExternalSemaphorePropertiesCage(physicalDevice,pExternalSemaphoreInfo,pExternalSemaphoreProperties)


# Promoted from VK_KHR_maintenance3
# ---------------------------------
var # command cages
  getDescriptorSetLayoutSupportCage: proc(device: Device; pCreateInfo: ptr DescriptorSetLayoutCreateInfo; pSupport: ptr DescriptorSetLayoutSupport;): void {.cdecl.}
proc getDescriptorSetLayoutSupport*(
      device: Device;
      pCreateInfo: ptr DescriptorSetLayoutCreateInfo;
      pSupport: ptr DescriptorSetLayoutSupport;
    ): void {.cdecl.} =
  getDescriptorSetLayoutSupportCage(device,pCreateInfo,pSupport)


# Promoted from VK_KHR_shader_draw_parameters, with a feature support query added
# -------------------------------------------------------------------------------
StructureType.defineAliases:
  physicalDeviceShaderDrawParametersFeatures as physicalDeviceShaderDrawParameterFeatures

proc loadInstanceProcs*() =
  vk10.loadInstanceProcs()
  nil.defineLoader(`<<`)
  enumerateInstanceVersionCage << "vkEnumerateInstanceVersion"

proc loadVk11*(instance: Instance) =
  instance.defineLoader(`<<`)

  # Device Initialization
  enumerateInstanceVersionCage << "vkEnumerateInstanceVersion"

  # Promoted from VK_KHR_bind_memory2
  bindBufferMemory2Cage << "vkBindBufferMemory2"
  bindImageMemory2Cage << "vkBindImageMemory2"

  # Promoted from VK_KHR_device_group
  getDeviceGroupPeerMemoryFeaturesCage << "vkGetDeviceGroupPeerMemoryFeatures"
  cmdSetDeviceMaskCage << "vkCmdSetDeviceMask"
  cmdDispatchBaseCage << "vkCmdDispatchBase"

  # Promoted from VK_KHR_device_group_creation
  enumeratePhysicalDeviceGroupsCage << "vkEnumeratePhysicalDeviceGroups"

  # Promoted from VK_KHR_get_memory_requirements2
  getImageMemoryRequirements2Cage << "vkGetImageMemoryRequirements2"
  getBufferMemoryRequirements2Cage << "vkGetBufferMemoryRequirements2"
  getImageSparseMemoryRequirements2Cage << "vkGetImageSparseMemoryRequirements2"

  # Promoted from VK_KHR_get_physical_device_properties2
  getPhysicalDeviceFeatures2Cage << "vkGetPhysicalDeviceFeatures2"
  getPhysicalDeviceProperties2Cage << "vkGetPhysicalDeviceProperties2"
  getPhysicalDeviceFormatProperties2Cage << "vkGetPhysicalDeviceFormatProperties2"
  getPhysicalDeviceImageFormatProperties2Cage << "vkGetPhysicalDeviceImageFormatProperties2"
  getPhysicalDeviceQueueFamilyProperties2Cage << "vkGetPhysicalDeviceQueueFamilyProperties2"
  getPhysicalDeviceMemoryProperties2Cage << "vkGetPhysicalDeviceMemoryProperties2"
  getPhysicalDeviceSparseImageFormatProperties2Cage << "vkGetPhysicalDeviceSparseImageFormatProperties2"

  # Promoted from VK_KHR_maintenance1
  trimCommandPoolCage << "vkTrimCommandPool"

  # Originally based on VK_KHR_protected_memory (extension 146), which was never published; thus the mystifying large value= numbers below. These are not aliased since they weren't actually promoted from an extension.
  getDeviceQueue2Cage << "vkGetDeviceQueue2"

  # Promoted from VK_KHR_sampler_ycbcr_conversion
  createSamplerYcbcrConversionCage << "vkCreateSamplerYcbcrConversion"
  destroySamplerYcbcrConversionCage << "vkDestroySamplerYcbcrConversion"

  # Promoted from VK_KHR_descriptor_update_template
  createDescriptorUpdateTemplateCage << "vkCreateDescriptorUpdateTemplate"
  destroyDescriptorUpdateTemplateCage << "vkDestroyDescriptorUpdateTemplate"
  updateDescriptorSetWithTemplateCage << "vkUpdateDescriptorSetWithTemplate"

  # Promoted from VK_KHR_external_memory_capabilities
  getPhysicalDeviceExternalBufferPropertiesCage << "vkGetPhysicalDeviceExternalBufferProperties"

  # Promoted from VK_KHR_external_fence_capabilities
  getPhysicalDeviceExternalFencePropertiesCage << "vkGetPhysicalDeviceExternalFenceProperties"

  # Promoted from VK_KHR_external_semaphore_capabilities
  getPhysicalDeviceExternalSemaphorePropertiesCage << "vkGetPhysicalDeviceExternalSemaphoreProperties"

  # Promoted from VK_KHR_maintenance3
  getDescriptorSetLayoutSupportCage << "vkGetDescriptorSetLayoutSupport"