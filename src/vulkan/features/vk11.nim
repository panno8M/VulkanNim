# Generated at 2021-08-27T05:59:50Z
# vulkan 1.1
# Vulkan 1.1 core API interface definitions.
# ==========================================

import ../platform
import vk10
export vk10 except loadInstanceProcs

const
  # Promoted from VK_KHR_device_group_creation
  MaxDeviceGroupSize* = 32

  # Promoted from VK_KHR_external_memory_capabilities
  LuidSize* = 8
  UuidSize* = 16

  # Promoted from VK_KHR_external_memory
  QueueFamilyExternal* = (uint.high-1)

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
  SubgroupFeatureFlags* = distinct Flags
  SubgroupFeatureFlagBits* {.size: sizeof(int32), pure.} = enum
    Basic = 0x00000001 # Basic subgroup operations
    Vote = 0x00000002 # Vote subgroup operations
    Arithmetic = 0x00000004 # Arithmetic subgroup operations
    Ballot = 0x00000008 # Ballot subgroup operations
    Shuffle = 0x00000010 # Shuffle subgroup operations
    ShuffleRelative = 0x00000020 # Shuffle relative subgroup operations
    Clustered = 0x00000040 # Clustered subgroup operations
    Quad = 0x00000080 # Quad subgroup operations
    # Provided by VK_NV_shader_subgroup_partitioned
    PartitionedBitNv = 0x00000100

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
  PeerMemoryFeatureFlags* = distinct Flags
  PeerMemoryFeatureFlagBits* {.size: sizeof(int32), pure.} = enum
    CopySrc = 0x00000001 # Can read with vkCmdCopy commands
    CopyDst = 0x00000002 # Can write with vkCmdCopy commands
    GenericSrc = 0x00000004 # Can read with any access type/command
    GenericDst = 0x00000008 # Can write with and access type/command
  MemoryAllocateFlags* = distinct Flags
  MemoryAllocateFlagBits* {.size: sizeof(int32), pure.} = enum
    DeviceMask = 0x00000001 # Force allocation on specific devices
    # Provided by VK_VERSION_1_2
    DeviceAddress = 0x00000002
    # Provided by VK_VERSION_1_2
    DeviceAddressCaptureReplay = 0x00000004
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
  CommandPoolTrimFlags* = distinct Flags

  # Promoted from VK_KHR_maintenance2
  # ---------------------------------
  PhysicalDevicePointClippingProperties* = object
    sType*: StructureType
    pNext*: pointer
    pointClippingBehavior*: PointClippingBehavior
  PointClippingBehavior* {.size: sizeof(int32), pure.} = enum
    AllClipPlanes = 0
    UserClipPlanesOnly = 1
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
    UpperLeft = 0
    LowerLeft = 1
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
  SamplerYcbcrConversion* = distinct NonDispatchableHandle
  SamplerYcbcrModelConversion* {.size: sizeof(int32), pure.} = enum
    RgbIdentity = 0
    YcbcrIdentity = 1 # just range expansion
    Ycbcr709 = 2 # aka HD YUV
    Ycbcr601 = 3 # aka SD YUV
    Ycbcr2020 = 4 # aka UHD YUV
  SamplerYcbcrRange* {.size: sizeof(int32), pure.} = enum
    ItuFull = 0 # Luma 0..1 maps to 0..255, chroma -0.5..0.5 to 1..255 (clamped)
    ItuNarrow = 1 # Luma 0..1 maps to 16..235, chroma -0.5..0.5 to 16..240
  ChromaLocation* {.size: sizeof(int32), pure.} = enum
    CositedEven = 0
    Midpoint = 1

  # Promoted from VK_KHR_descriptor_update_template
  # -----------------------------------------------
  DescriptorUpdateTemplate* = distinct NonDispatchableHandle
  DescriptorUpdateTemplateCreateFlags* = distinct Flags
  DescriptorUpdateTemplateType* {.size: sizeof(int32), pure.} = enum
    DescriptorSet = 0 # Create descriptor update template for descriptor set updates
    # Provided by VK_KHR_push_descriptor
    PushDescriptorsKhr = 1 # Create descriptor update template for pushed descriptor updates
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
  ExternalMemoryHandleTypeFlags* = distinct Flags
  ExternalMemoryHandleTypeFlagBits* {.size: sizeof(int32), pure.} = enum
    OpaqueFd = 0x00000001
    OpaqueWin32 = 0x00000002
    OpaqueWin32Kmt = 0x00000004
    D3d11Texture = 0x00000008
    D3d11TextureKmt = 0x00000010
    D3d12Heap = 0x00000020
    D3d12Resource = 0x00000040
    # Provided by VK_EXT_external_memory_host
    HostAllocationBitExt = 0x00000080
    # Provided by VK_EXT_external_memory_host
    HostMappedForeignMemoryBitExt = 0x00000100
    # Provided by VK_EXT_external_memory_dma_buf
    DmaBufBitExt = 0x00000200
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    AndroidHardwareBufferBitAndroid = 0x00000400
  ExternalMemoryFeatureFlags* = distinct Flags
  ExternalMemoryFeatureFlagBits* {.size: sizeof(int32), pure.} = enum
    DedicatedOnly = 0x00000001
    Exportable = 0x00000002
    Importable = 0x00000004
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
  ExternalFenceHandleTypeFlags* = distinct Flags
  ExternalFenceHandleTypeFlagBits* {.size: sizeof(int32), pure.} = enum
    OpaqueFd = 0x00000001
    OpaqueWin32 = 0x00000002
    OpaqueWin32Kmt = 0x00000004
    SyncFd = 0x00000008
  ExternalFenceFeatureFlags* = distinct Flags
  ExternalFenceFeatureFlagBits* {.size: sizeof(int32), pure.} = enum
    Exportable = 0x00000001
    Importable = 0x00000002
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
  FenceImportFlags* = distinct Flags
  FenceImportFlagBits* {.size: sizeof(int32), pure.} = enum
    Temporary = 0x00000001
  ExportFenceCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    handleTypes*: ExternalFenceHandleTypeFlags

  # Promoted from VK_KHR_external_semaphore
  # ---------------------------------------
  SemaphoreImportFlags* = distinct Flags
  SemaphoreImportFlagBits* {.size: sizeof(int32), pure.} = enum
    Temporary = 0x00000001
  ExportSemaphoreCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    handleTypes*: ExternalSemaphoreHandleTypeFlags

  # Promoted from VK_KHR_external_semaphore_capabilities
  # ----------------------------------------------------
  ExternalSemaphoreHandleTypeFlags* = distinct Flags
  ExternalSemaphoreHandleTypeFlagBits* {.size: sizeof(int32), pure.} = enum
    OpaqueFd = 0x00000001
    OpaqueWin32 = 0x00000002
    OpaqueWin32Kmt = 0x00000004
    D3d12Fence = 0x00000008
    SyncFd = 0x00000010
  ExternalSemaphoreFeatureFlags* = distinct Flags
  ExternalSemaphoreFeatureFlagBits* {.size: sizeof(int32), pure.} = enum
    Exportable = 0x00000001
    Importable = 0x00000002
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
var # commands
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
var # commands
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
PeerMemoryFeatureFlagBits.defineAliases:
  # Provided by VK_KHR_device_group
  CopySrc as CopySrcBitKhr
  # Provided by VK_KHR_device_group
  CopyDst as CopyDstBitKhr
  # Provided by VK_KHR_device_group
  GenericSrc as GenericSrcBitKhr
  # Provided by VK_KHR_device_group
  GenericDst as GenericDstBitKhr

MemoryAllocateFlagBits.defineAliases:
  # Provided by VK_KHR_device_group
  DeviceMask as DeviceMaskBitKhr
  # Provided by VK_KHR_buffer_device_address
  DeviceAddress as DeviceAddressBitKhr
  # Provided by VK_KHR_buffer_device_address
  DeviceAddressCaptureReplay as DeviceAddressCaptureReplayBitKhr

var # commands
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


# Promoted from VK_KHR_device_group + VK_KHR_bind_memory2
# -------------------------------------------------------


# Promoted from VK_KHR_device_group_creation
# ------------------------------------------
var # commands
  enumeratePhysicalDeviceGroupsCage: proc(instance: Instance; pPhysicalDeviceGroupCount: ptr uint32; pPhysicalDeviceGroupProperties: ptr PhysicalDeviceGroupProperties;): Result {.cdecl.}
proc enumeratePhysicalDeviceGroups*(
      instance: Instance;
      pPhysicalDeviceGroupCount: ptr uint32;
      pPhysicalDeviceGroupProperties: ptr PhysicalDeviceGroupProperties;
    ): Result {.cdecl, discardable.} =
  enumeratePhysicalDeviceGroupsCage(instance,pPhysicalDeviceGroupCount,pPhysicalDeviceGroupProperties)


# Promoted from VK_KHR_get_memory_requirements2
# ---------------------------------------------
var # commands
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
var # commands
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
var # commands
  trimCommandPoolCage: proc(device: Device; commandPool: CommandPool; flags: CommandPoolTrimFlags;): void {.cdecl.}
proc trimCommandPool*(
      device: Device;
      commandPool: CommandPool;
      flags: CommandPoolTrimFlags;
    ): void {.cdecl.} =
  trimCommandPoolCage(device,commandPool,flags)


# Promoted from VK_KHR_maintenance2
# ---------------------------------
PointClippingBehavior.defineAliases:
  # Provided by VK_KHR_maintenance2
  AllClipPlanes as AllClipPlanesKhr
  # Provided by VK_KHR_maintenance2
  UserClipPlanesOnly as UserClipPlanesOnlyKhr

TessellationDomainOrigin.defineAliases:
  # Provided by VK_KHR_maintenance2
  UpperLeft as UpperLeftKhr
  # Provided by VK_KHR_maintenance2
  LowerLeft as LowerLeftKhr



# Promoted from VK_KHR_multiview
# ------------------------------


# Promoted from VK_KHR_variable_pointers
# --------------------------------------


# Originally based on VK_KHR_protected_memory (extension 146), which was never published; thus the mystifying large value= numbers below. These are not aliased since they weren't actually promoted from an extension.
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
var # commands
  getDeviceQueue2Cage: proc(device: Device; pQueueInfo: ptr DeviceQueueInfo2; pQueue: ptr Queue;): void {.cdecl.}
proc getDeviceQueue2*(
      device: Device;
      pQueueInfo: ptr DeviceQueueInfo2;
      pQueue: ptr Queue;
    ): void {.cdecl.} =
  getDeviceQueue2Cage(device,pQueueInfo,pQueue)


# Promoted from VK_KHR_sampler_ycbcr_conversion
# ---------------------------------------------
SamplerYcbcrModelConversion.defineAliases:
  # Provided by VK_KHR_sampler_ycbcr_conversion
  RgbIdentity as RgbIdentityKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  YcbcrIdentity as YcbcrIdentityKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  Ycbcr709 as Ycbcr709Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  Ycbcr601 as Ycbcr601Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  Ycbcr2020 as Ycbcr2020Khr

SamplerYcbcrRange.defineAliases:
  # Provided by VK_KHR_sampler_ycbcr_conversion
  ItuFull as ItuFullKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  ItuNarrow as ItuNarrowKhr

ChromaLocation.defineAliases:
  # Provided by VK_KHR_sampler_ycbcr_conversion
  CositedEven as CositedEvenKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  Midpoint as MidpointKhr

var # commands
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
DescriptorUpdateTemplateType.defineAliases:
  # Provided by VK_KHR_descriptor_update_template
  DescriptorSet as DescriptorSetKhr

var # commands
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
ExternalMemoryHandleTypeFlagBits.defineAliases:
  # Provided by VK_KHR_external_memory_capabilities
  OpaqueFd as OpaqueFdBitKhr
  # Provided by VK_KHR_external_memory_capabilities
  OpaqueWin32 as OpaqueWin32BitKhr
  # Provided by VK_KHR_external_memory_capabilities
  OpaqueWin32Kmt as OpaqueWin32KmtBitKhr
  # Provided by VK_KHR_external_memory_capabilities
  D3d11Texture as D3d11TextureBitKhr
  # Provided by VK_KHR_external_memory_capabilities
  D3d11TextureKmt as D3d11TextureKmtBitKhr
  # Provided by VK_KHR_external_memory_capabilities
  D3d12Heap as D3d12HeapBitKhr
  # Provided by VK_KHR_external_memory_capabilities
  D3d12Resource as D3d12ResourceBitKhr

ExternalMemoryFeatureFlagBits.defineAliases:
  # Provided by VK_KHR_external_memory_capabilities
  DedicatedOnly as DedicatedOnlyBitKhr
  # Provided by VK_KHR_external_memory_capabilities
  Exportable as ExportableBitKhr
  # Provided by VK_KHR_external_memory_capabilities
  Importable as ImportableBitKhr

var # commands
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
ExternalFenceHandleTypeFlagBits.defineAliases:
  # Provided by VK_KHR_external_fence_capabilities
  OpaqueFd as OpaqueFdBitKhr
  # Provided by VK_KHR_external_fence_capabilities
  OpaqueWin32 as OpaqueWin32BitKhr
  # Provided by VK_KHR_external_fence_capabilities
  OpaqueWin32Kmt as OpaqueWin32KmtBitKhr
  # Provided by VK_KHR_external_fence_capabilities
  SyncFd as SyncFdBitKhr

ExternalFenceFeatureFlagBits.defineAliases:
  # Provided by VK_KHR_external_fence_capabilities
  Exportable as ExportableBitKhr
  # Provided by VK_KHR_external_fence_capabilities
  Importable as ImportableBitKhr

var # commands
  getPhysicalDeviceExternalFencePropertiesCage: proc(physicalDevice: PhysicalDevice; pExternalFenceInfo: ptr PhysicalDeviceExternalFenceInfo; pExternalFenceProperties: ptr ExternalFenceProperties;): void {.cdecl.}
proc getPhysicalDeviceExternalFenceProperties*(
      physicalDevice: PhysicalDevice;
      pExternalFenceInfo: ptr PhysicalDeviceExternalFenceInfo;
      pExternalFenceProperties: ptr ExternalFenceProperties;
    ): void {.cdecl.} =
  getPhysicalDeviceExternalFencePropertiesCage(physicalDevice,pExternalFenceInfo,pExternalFenceProperties)


# Promoted from VK_KHR_external_fence
# -----------------------------------
FenceImportFlagBits.defineAliases:
  # Provided by VK_KHR_external_fence
  Temporary as TemporaryBitKhr



# Promoted from VK_KHR_external_semaphore
# ---------------------------------------
SemaphoreImportFlagBits.defineAliases:
  # Provided by VK_KHR_external_semaphore
  Temporary as TemporaryBitKhr



# Promoted from VK_KHR_external_semaphore_capabilities
# ----------------------------------------------------
ExternalSemaphoreHandleTypeFlagBits.defineAliases:
  D3d12Fence as D3d11Fence
  # Provided by VK_KHR_external_semaphore_capabilities
  OpaqueFd as OpaqueFdBitKhr
  # Provided by VK_KHR_external_semaphore_capabilities
  OpaqueWin32 as OpaqueWin32BitKhr
  # Provided by VK_KHR_external_semaphore_capabilities
  OpaqueWin32Kmt as OpaqueWin32KmtBitKhr
  # Provided by VK_KHR_external_semaphore_capabilities
  D3d12Fence as D3d12FenceBitKhr
  # Provided by VK_KHR_external_semaphore_capabilities
  SyncFd as SyncFdBitKhr

ExternalSemaphoreFeatureFlagBits.defineAliases:
  # Provided by VK_KHR_external_semaphore_capabilities
  Exportable as ExportableBitKhr
  # Provided by VK_KHR_external_semaphore_capabilities
  Importable as ImportableBitKhr

var # commands
  getPhysicalDeviceExternalSemaphorePropertiesCage: proc(physicalDevice: PhysicalDevice; pExternalSemaphoreInfo: ptr PhysicalDeviceExternalSemaphoreInfo; pExternalSemaphoreProperties: ptr ExternalSemaphoreProperties;): void {.cdecl.}
proc getPhysicalDeviceExternalSemaphoreProperties*(
      physicalDevice: PhysicalDevice;
      pExternalSemaphoreInfo: ptr PhysicalDeviceExternalSemaphoreInfo;
      pExternalSemaphoreProperties: ptr ExternalSemaphoreProperties;
    ): void {.cdecl.} =
  getPhysicalDeviceExternalSemaphorePropertiesCage(physicalDevice,pExternalSemaphoreInfo,pExternalSemaphoreProperties)


# Promoted from VK_KHR_maintenance3
# ---------------------------------
var # commands
  getDescriptorSetLayoutSupportCage: proc(device: Device; pCreateInfo: ptr DescriptorSetLayoutCreateInfo; pSupport: ptr DescriptorSetLayoutSupport;): void {.cdecl.}
proc getDescriptorSetLayoutSupport*(
      device: Device;
      pCreateInfo: ptr DescriptorSetLayoutCreateInfo;
      pSupport: ptr DescriptorSetLayoutSupport;
    ): void {.cdecl.} =
  getDescriptorSetLayoutSupportCage(device,pCreateInfo,pSupport)


# Promoted from VK_KHR_shader_draw_parameters, with a feature support query added
# -------------------------------------------------------------------------------
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