# Generated at 2021-08-24T18:23:16+09:00
# vulkan 1.1
# Vulkan 1.1 core API interface definitions.
# ==========================================

import ../platform
import vk10
export vk10 except loadInstanceProcs

type
  # Originally based on VK_KHR_subgroup (extension 94), but the actual enum block used was, incorrectly, that of extension 95
  # -------------------------------------------------------------------------------------------------------------------------
  SubgroupFeatureFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_NV_shader_subgroup_partitioned
    Partitioned = 0x00000100
  PhysicalDeviceSubgroupProperties* = object
    sType*: StructureType
    pNext*: pointer
    subgroupSize*: uint32
    supportedStages*: ShaderStageFlags
    supportedOperations*: SubgroupFeatureFlags
    quadOperationsInAllStages*: Bool32
  SubgroupFeatureFlags* = distinct Flags

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
  MemoryAllocateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_VERSION_1_2
    DeviceAddress = 0x00000002
  DeviceGroupRenderPassBeginInfo* = object
    sType*: StructureType
    pNext*: pointer
    deviceMask*: uint32
    deviceRenderAreaCount*: uint32
    pDeviceRenderAreas*: ptr Rect2D
  DeviceGroupSubmitInfo* = object
    sType*: StructureType
    pNext*: pointer
    waitSemaphoreCount*: uint32
    pWaitSemaphoreDeviceIndices*: ptr uint32
    commandBufferCount*: uint32
    pCommandBufferDeviceMasks*: ptr uint32
    signalSemaphoreCount*: uint32
    pSignalSemaphoreDeviceIndices*: ptr uint32
  DeviceGroupCommandBufferBeginInfo* = object
    sType*: StructureType
    pNext*: pointer
    deviceMask*: uint32
  PeerMemoryFeatureFlagBits* {.size: sizeof(int32), pure.} = enum
    
  MemoryAllocateFlagsInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: MemoryAllocateFlags
    deviceMask*: uint32
  MemoryAllocateFlags* = distinct Flags
  DeviceGroupBindSparseInfo* = object
    sType*: StructureType
    pNext*: pointer
    resourceDeviceIndex*: uint32
    memoryDeviceIndex*: uint32
  PeerMemoryFeatureFlags* = distinct Flags

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
  DeviceGroupDeviceCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    physicalDeviceCount*: uint32
    pPhysicalDevices*: ptr PhysicalDevice
  PhysicalDeviceGroupProperties* = object
    sType*: StructureType
    pNext*: pointer
    physicalDeviceCount*: uint32
    physicalDevices*: PhysicalDevice
    subsetAllocation*: Bool32

  # Promoted from VK_KHR_get_memory_requirements2
  # ---------------------------------------------
  ImageSparseMemoryRequirementsInfo2* = object
    sType*: StructureType
    pNext*: pointer
    image*: Image
  SparseImageMemoryRequirements2* = object
    sType*: StructureType
    pNext*: pointer
    memoryRequirements*: SparseImageMemoryRequirements
  BufferMemoryRequirementsInfo2* = object
    sType*: StructureType
    pNext*: pointer
    buffer*: Buffer
  ImageMemoryRequirementsInfo2* = object
    sType*: StructureType
    pNext*: pointer
    image*: Image
  MemoryRequirements2* = object
    sType*: StructureType
    pNext*: pointer
    memoryRequirements*: MemoryRequirements

  # Promoted from VK_KHR_get_physical_device_properties2
  # ----------------------------------------------------
  PhysicalDeviceFeatures2* = object
    sType*: StructureType
    pNext*: pointer
    features*: PhysicalDeviceFeatures
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
  ImageFormatProperties2* = object
    sType*: StructureType
    pNext*: pointer
    imageFormatProperties*: ImageFormatProperties
  PhysicalDeviceProperties2* = object
    sType*: StructureType
    pNext*: pointer
    properties*: PhysicalDeviceProperties
  SparseImageFormatProperties2* = object
    sType*: StructureType
    pNext*: pointer
    properties*: SparseImageFormatProperties
  PhysicalDeviceMemoryProperties2* = object
    sType*: StructureType
    pNext*: pointer
    memoryProperties*: PhysicalDeviceMemoryProperties
  FormatProperties2* = object
    sType*: StructureType
    pNext*: pointer
    formatProperties*: FormatProperties
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
  PipelineTessellationDomainOriginStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    domainOrigin*: TessellationDomainOrigin
  RenderPassInputAttachmentAspectCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    aspectReferenceCount*: uint32
    pAspectReferences*: ptr InputAttachmentAspectReference
  ImageViewUsageCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    usage*: ImageUsageFlags
  TessellationDomainOrigin* {.size: sizeof(int32), pure.} = enum
    UpperLeft = 0
    LowerLeft = 1
  InputAttachmentAspectReference* = object
    subpass*: uint32
    inputAttachmentIndex*: uint32
    aspectMask*: ImageAspectFlags

  # Promoted from VK_KHR_multiview
  # ------------------------------
  PhysicalDeviceMultiviewFeatures* = object
    sType*: StructureType
    pNext*: pointer
    multiview*: Bool32
    multiviewGeometryShader*: Bool32
    multiviewTessellationShader*: Bool32
  RenderPassMultiviewCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    subpassCount*: uint32
    pViewMasks*: ptr uint32
    dependencyCount*: uint32
    pViewOffsets*: ptr int32
    correlationMaskCount*: uint32
    pCorrelationMasks*: ptr uint32
  PhysicalDeviceMultiviewProperties* = object
    sType*: StructureType
    pNext*: pointer
    maxMultiviewViewCount*: uint32
    maxMultiviewInstanceIndex*: uint32

  # Promoted from VK_KHR_variable_pointers
  # --------------------------------------
  PhysicalDeviceVariablePointersFeatures* = object
    sType*: StructureType
    pNext*: pointer
    variablePointersStorageBuffer*: Bool32
    variablePointers*: Bool32
  PhysicalDeviceVariablePointerFeatures* = object

  # Originally based on VK_KHR_protected_memory (extension 146), which was never published; thus the mystifying large value= numbers below. These are not aliased since they weren't actually promoted from an extension.
  # ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  PhysicalDeviceProtectedMemoryFeatures* = object
    sType*: StructureType
    pNext*: pointer
    protectedMemory*: Bool32
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
  PhysicalDeviceProtectedMemoryProperties* = object
    sType*: StructureType
    pNext*: pointer
    protectedNoFault*: Bool32

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
  SamplerYcbcrModelConversion* {.size: sizeof(int32), pure.} = enum
    RgbIdentity = 0
    YcbcrIdentity = 1 # just range expansion
    Ycbcr709 = 2 # aka HD YUV
    Ycbcr601 = 3 # aka SD YUV
    Ycbcr2020 = 4 # aka UHD YUV
  SamplerYcbcrConversionImageFormatProperties* = object
    sType*: StructureType
    pNext*: pointer
    combinedImageSamplerDescriptorCount*: uint32
  BindImagePlaneMemoryInfo* = object
    sType*: StructureType
    pNext*: pointer
    planeAspect*: ImageAspectFlagBits
  SamplerYcbcrConversion* = distinct NonDispatchableHandle
  SamplerYcbcrConversionInfo* = object
    sType*: StructureType
    pNext*: pointer
    conversion*: SamplerYcbcrConversion
  PhysicalDeviceSamplerYcbcrConversionFeatures* = object
    sType*: StructureType
    pNext*: pointer
    samplerYcbcrConversion*: Bool32
  ChromaLocation* {.size: sizeof(int32), pure.} = enum
    CositedEven = 0
    Midpoint = 1
  ImagePlaneMemoryRequirementsInfo* = object
    sType*: StructureType
    pNext*: pointer
    planeAspect*: ImageAspectFlagBits
  SamplerYcbcrRange* {.size: sizeof(int32), pure.} = enum
    ItuFull = 0 # Luma 0..1 maps to 0..255, chroma -0.5..0.5 to 1..255 (clamped)
    ItuNarrow = 1 # Luma 0..1 maps to 16..235, chroma -0.5..0.5 to 16..240

  # Promoted from VK_KHR_descriptor_update_template
  # -----------------------------------------------
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
  DescriptorUpdateTemplate* = distinct NonDispatchableHandle
  DescriptorUpdateTemplateCreateFlags* = distinct Flags
  DescriptorUpdateTemplateType* {.size: sizeof(int32), pure.} = enum
    DescriptorSet = 0 # Create descriptor update template for descriptor set updates
  DescriptorUpdateTemplateEntry* = object
    dstBinding*: uint32
    dstArrayElement*: uint32
    descriptorCount*: uint32
    descriptorType*: DescriptorType
    offset*: uint
    stride*: uint

  # Promoted from VK_KHR_external_memory_capabilities
  # -------------------------------------------------
  ExternalMemoryFeatureFlags* = distinct Flags
  ExternalBufferProperties* = object
    sType*: StructureType
    pNext*: pointer
    externalMemoryProperties*: ExternalMemoryProperties
  ExternalMemoryFeatureFlagBits* {.size: sizeof(int32), pure.} = enum
    
  PhysicalDeviceExternalImageFormatInfo* = object
    sType*: StructureType
    pNext*: pointer
    handleType*: ExternalMemoryHandleTypeFlagBits
  ExternalMemoryProperties* = object
    externalMemoryFeatures*: ExternalMemoryFeatureFlags
    exportFromImportedHandleTypes*: ExternalMemoryHandleTypeFlags
    compatibleHandleTypes*: ExternalMemoryHandleTypeFlags
  PhysicalDeviceIDProperties* = object
    sType*: StructureType
    pNext*: pointer
    deviceUUID*: uint8
    driverUUID*: uint8
    deviceLUID*: uint8
    deviceNodeMask*: uint32
    deviceLUIDValid*: Bool32
  PhysicalDeviceExternalBufferInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: BufferCreateFlags
    usage*: BufferUsageFlags
    handleType*: ExternalMemoryHandleTypeFlagBits
  ExternalMemoryHandleTypeFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_EXT_external_memory_host
    HostAllocation = 0x00000080
    # Provided by VK_EXT_external_memory_host
    HostMappedForeignMemory = 0x00000100
    # Provided by VK_EXT_external_memory_dma_buf
    DmaBuf = 0x00000200
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    AndroidHardwareBuffer = 0x00000400
  ExternalImageFormatProperties* = object
    sType*: StructureType
    pNext*: pointer
    externalMemoryProperties*: ExternalMemoryProperties
  ExternalMemoryHandleTypeFlags* = distinct Flags

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
  ExternalFenceFeatureFlags* = distinct Flags
  ExternalFenceProperties* = object
    sType*: StructureType
    pNext*: pointer
    exportFromImportedHandleTypes*: ExternalFenceHandleTypeFlags
    compatibleHandleTypes*: ExternalFenceHandleTypeFlags
    externalFenceFeatures*: ExternalFenceFeatureFlags
  ExternalFenceHandleTypeFlags* = distinct Flags
  ExternalFenceHandleTypeFlagBits* {.size: sizeof(int32), pure.} = enum
    
  ExternalFenceFeatureFlagBits* {.size: sizeof(int32), pure.} = enum
    

  # Promoted from VK_KHR_external_fence
  # -----------------------------------
  FenceImportFlags* = distinct Flags
  FenceImportFlagBits* {.size: sizeof(int32), pure.} = enum
    
  ExportFenceCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    handleTypes*: ExternalFenceHandleTypeFlags

  # Promoted from VK_KHR_external_semaphore
  # ---------------------------------------
  SemaphoreImportFlags* = distinct Flags
  SemaphoreImportFlagBits* {.size: sizeof(int32), pure.} = enum
    
  ExportSemaphoreCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    handleTypes*: ExternalSemaphoreHandleTypeFlags

  # Promoted from VK_KHR_external_semaphore_capabilities
  # ----------------------------------------------------
  ExternalSemaphoreFeatureFlagBits* {.size: sizeof(int32), pure.} = enum
    
  ExternalSemaphoreProperties* = object
    sType*: StructureType
    pNext*: pointer
    exportFromImportedHandleTypes*: ExternalSemaphoreHandleTypeFlags
    compatibleHandleTypes*: ExternalSemaphoreHandleTypeFlags
    externalSemaphoreFeatures*: ExternalSemaphoreFeatureFlags
  ExternalSemaphoreHandleTypeFlags* = distinct Flags
  ExternalSemaphoreHandleTypeFlagBits* {.size: sizeof(int32), pure.} = enum
    
  PhysicalDeviceExternalSemaphoreInfo* = object
    sType*: StructureType
    pNext*: pointer
    handleType*: ExternalSemaphoreHandleTypeFlagBits
  ExternalSemaphoreFeatureFlags* = distinct Flags

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
    ): Result {.cdecl.} =
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
    ): Result {.cdecl.} =
  bindBufferMemory2Cage(device,bindInfoCount,pBindInfos)

proc bindImageMemory2*(
      device: Device;
      bindInfoCount: uint32;
      pBindInfos: ptr BindImageMemoryInfo;
    ): Result {.cdecl.} =
  bindImageMemory2Cage(device,bindInfoCount,pBindInfos)


# Promoted from VK_KHR_16bit_storage
# ----------------------------------

# Promoted from VK_KHR_dedicated_allocation
# -----------------------------------------

# Promoted from VK_KHR_device_group
# ---------------------------------
# Provided by VK_KHR_device_group
MemoryAllocateFlagBits.defineAlias(DeviceMask, DeviceMask)
# Provided by VK_KHR_device_group
PeerMemoryFeatureFlagBits.defineAlias(CopySrc, CopySrc)
# Provided by VK_KHR_device_group
PeerMemoryFeatureFlagBits.defineAlias(CopyDst, CopyDst)
# Provided by VK_KHR_device_group
PeerMemoryFeatureFlagBits.defineAlias(GenericSrc, GenericSrc)
# Provided by VK_KHR_device_group
PeerMemoryFeatureFlagBits.defineAlias(GenericDst, GenericDst)
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
const MaxDeviceGroupSize* = 32
var # commands
  enumeratePhysicalDeviceGroupsCage: proc(instance: Instance; pPhysicalDeviceGroupCount: ptr uint32; pPhysicalDeviceGroupProperties: ptr PhysicalDeviceGroupProperties;): Result {.cdecl.}

proc enumeratePhysicalDeviceGroups*(
      instance: Instance;
      pPhysicalDeviceGroupCount: ptr uint32;
      pPhysicalDeviceGroupProperties: ptr PhysicalDeviceGroupProperties;
    ): Result {.cdecl.} =
  enumeratePhysicalDeviceGroupsCage(instance,pPhysicalDeviceGroupCount,pPhysicalDeviceGroupProperties)


# Promoted from VK_KHR_get_memory_requirements2
# ---------------------------------------------
var # commands
  getBufferMemoryRequirements2Cage: proc(device: Device; pInfo: ptr BufferMemoryRequirementsInfo2; pMemoryRequirements: ptr MemoryRequirements2;): void {.cdecl.}
  getImageMemoryRequirements2Cage: proc(device: Device; pInfo: ptr ImageMemoryRequirementsInfo2; pMemoryRequirements: ptr MemoryRequirements2;): void {.cdecl.}
  getImageSparseMemoryRequirements2Cage: proc(device: Device; pInfo: ptr ImageSparseMemoryRequirementsInfo2; pSparseMemoryRequirementCount: ptr uint32; pSparseMemoryRequirements: ptr SparseImageMemoryRequirements2;): void {.cdecl.}

proc getBufferMemoryRequirements2*(
      device: Device;
      pInfo: ptr BufferMemoryRequirementsInfo2;
      pMemoryRequirements: ptr MemoryRequirements2;
    ): void {.cdecl.} =
  getBufferMemoryRequirements2Cage(device,pInfo,pMemoryRequirements)

proc getImageMemoryRequirements2*(
      device: Device;
      pInfo: ptr ImageMemoryRequirementsInfo2;
      pMemoryRequirements: ptr MemoryRequirements2;
    ): void {.cdecl.} =
  getImageMemoryRequirements2Cage(device,pInfo,pMemoryRequirements)

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
  getPhysicalDeviceFormatProperties2Cage: proc(physicalDevice: PhysicalDevice; format: Format; pFormatProperties: ptr FormatProperties2;): void {.cdecl.}
  getPhysicalDeviceQueueFamilyProperties2Cage: proc(physicalDevice: PhysicalDevice; pQueueFamilyPropertyCount: ptr uint32; pQueueFamilyProperties: ptr QueueFamilyProperties2;): void {.cdecl.}
  getPhysicalDeviceMemoryProperties2Cage: proc(physicalDevice: PhysicalDevice; pMemoryProperties: ptr PhysicalDeviceMemoryProperties2;): void {.cdecl.}
  getPhysicalDeviceProperties2Cage: proc(physicalDevice: PhysicalDevice; pProperties: ptr PhysicalDeviceProperties2;): void {.cdecl.}
  getPhysicalDeviceSparseImageFormatProperties2Cage: proc(physicalDevice: PhysicalDevice; pFormatInfo: ptr PhysicalDeviceSparseImageFormatInfo2; pPropertyCount: ptr uint32; pProperties: ptr SparseImageFormatProperties2;): void {.cdecl.}
  getPhysicalDeviceImageFormatProperties2Cage: proc(physicalDevice: PhysicalDevice; pImageFormatInfo: ptr PhysicalDeviceImageFormatInfo2; pImageFormatProperties: ptr ImageFormatProperties2;): Result {.cdecl.}

proc getPhysicalDeviceFeatures2*(
      physicalDevice: PhysicalDevice;
      pFeatures: ptr PhysicalDeviceFeatures2;
    ): void {.cdecl.} =
  getPhysicalDeviceFeatures2Cage(physicalDevice,pFeatures)

proc getPhysicalDeviceFormatProperties2*(
      physicalDevice: PhysicalDevice;
      format: Format;
      pFormatProperties: ptr FormatProperties2;
    ): void {.cdecl.} =
  getPhysicalDeviceFormatProperties2Cage(physicalDevice,format,pFormatProperties)

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

proc getPhysicalDeviceProperties2*(
      physicalDevice: PhysicalDevice;
      pProperties: ptr PhysicalDeviceProperties2;
    ): void {.cdecl.} =
  getPhysicalDeviceProperties2Cage(physicalDevice,pProperties)

proc getPhysicalDeviceSparseImageFormatProperties2*(
      physicalDevice: PhysicalDevice;
      pFormatInfo: ptr PhysicalDeviceSparseImageFormatInfo2;
      pPropertyCount: ptr uint32;
      pProperties: ptr SparseImageFormatProperties2;
    ): void {.cdecl.} =
  getPhysicalDeviceSparseImageFormatProperties2Cage(physicalDevice,pFormatInfo,pPropertyCount,pProperties)

proc getPhysicalDeviceImageFormatProperties2*(
      physicalDevice: PhysicalDevice;
      pImageFormatInfo: ptr PhysicalDeviceImageFormatInfo2;
      pImageFormatProperties: ptr ImageFormatProperties2;
    ): Result {.cdecl.} =
  getPhysicalDeviceImageFormatProperties2Cage(physicalDevice,pImageFormatInfo,pImageFormatProperties)


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
# Provided by VK_KHR_maintenance2
PointClippingBehavior.defineAlias(AllClipPlanes, AllClipPlanes)
# Provided by VK_KHR_maintenance2
PointClippingBehavior.defineAlias(UserClipPlanesOnly, UserClipPlanesOnly)
# Provided by VK_KHR_maintenance2
TessellationDomainOrigin.defineAlias(UpperLeft, UpperLeft)
# Provided by VK_KHR_maintenance2
TessellationDomainOrigin.defineAlias(LowerLeft, LowerLeft)

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
# Provided by VK_KHR_sampler_ycbcr_conversion
SamplerYcbcrModelConversion.defineAlias(RgbIdentity, RgbIdentity)
# Provided by VK_KHR_sampler_ycbcr_conversion
SamplerYcbcrModelConversion.defineAlias(YcbcrIdentity, YcbcrIdentity)
# Provided by VK_KHR_sampler_ycbcr_conversion
SamplerYcbcrModelConversion.defineAlias(Ycbcr709, Ycbcr709)
# Provided by VK_KHR_sampler_ycbcr_conversion
SamplerYcbcrModelConversion.defineAlias(Ycbcr601, Ycbcr601)
# Provided by VK_KHR_sampler_ycbcr_conversion
SamplerYcbcrModelConversion.defineAlias(Ycbcr2020, Ycbcr2020)
# Provided by VK_KHR_sampler_ycbcr_conversion
ChromaLocation.defineAlias(CositedEven, CositedEven)
# Provided by VK_KHR_sampler_ycbcr_conversion
ChromaLocation.defineAlias(Midpoint, Midpoint)
# Provided by VK_KHR_sampler_ycbcr_conversion
SamplerYcbcrRange.defineAlias(ItuFull, ItuFull)
# Provided by VK_KHR_sampler_ycbcr_conversion
SamplerYcbcrRange.defineAlias(ItuNarrow, ItuNarrow)
var # commands
  createSamplerYcbcrConversionCage: proc(device: Device; pCreateInfo: ptr SamplerYcbcrConversionCreateInfo; pAllocator: ptr AllocationCallbacks; pYcbcrConversion: ptr SamplerYcbcrConversion;): Result {.cdecl.}
  destroySamplerYcbcrConversionCage: proc(device: Device; ycbcrConversion: SamplerYcbcrConversion; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}

proc createSamplerYcbcrConversion*(
      device: Device;
      pCreateInfo: ptr SamplerYcbcrConversionCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pYcbcrConversion: ptr SamplerYcbcrConversion;
    ): Result {.cdecl.} =
  createSamplerYcbcrConversionCage(device,pCreateInfo,pAllocator,pYcbcrConversion)

proc destroySamplerYcbcrConversion*(
      device: Device;
      ycbcrConversion: SamplerYcbcrConversion;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroySamplerYcbcrConversionCage(device,ycbcrConversion,pAllocator)


# Promoted from VK_KHR_descriptor_update_template
# -----------------------------------------------
# Provided by VK_KHR_descriptor_update_template
DescriptorUpdateTemplateType.defineAlias(DescriptorSet, DescriptorSet)
var # commands
  destroyDescriptorUpdateTemplateCage: proc(device: Device; descriptorUpdateTemplate: DescriptorUpdateTemplate; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  createDescriptorUpdateTemplateCage: proc(device: Device; pCreateInfo: ptr DescriptorUpdateTemplateCreateInfo; pAllocator: ptr AllocationCallbacks; pDescriptorUpdateTemplate: ptr DescriptorUpdateTemplate;): Result {.cdecl.}
  updateDescriptorSetWithTemplateCage: proc(device: Device; descriptorSet: DescriptorSet; descriptorUpdateTemplate: DescriptorUpdateTemplate; pData: pointer;): void {.cdecl.}

proc destroyDescriptorUpdateTemplate*(
      device: Device;
      descriptorUpdateTemplate: DescriptorUpdateTemplate;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyDescriptorUpdateTemplateCage(device,descriptorUpdateTemplate,pAllocator)

proc createDescriptorUpdateTemplate*(
      device: Device;
      pCreateInfo: ptr DescriptorUpdateTemplateCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pDescriptorUpdateTemplate: ptr DescriptorUpdateTemplate;
    ): Result {.cdecl.} =
  createDescriptorUpdateTemplateCage(device,pCreateInfo,pAllocator,pDescriptorUpdateTemplate)

proc updateDescriptorSetWithTemplate*(
      device: Device;
      descriptorSet: DescriptorSet;
      descriptorUpdateTemplate: DescriptorUpdateTemplate;
      pData: pointer;
    ): void {.cdecl.} =
  updateDescriptorSetWithTemplateCage(device,descriptorSet,descriptorUpdateTemplate,pData)


# Promoted from VK_KHR_external_memory_capabilities
# -------------------------------------------------
# Provided by VK_KHR_external_memory_capabilities
ExternalMemoryFeatureFlagBits.defineAlias(DedicatedOnly, DedicatedOnly)
# Provided by VK_KHR_external_memory_capabilities
ExternalMemoryFeatureFlagBits.defineAlias(Exportable, Exportable)
# Provided by VK_KHR_external_memory_capabilities
ExternalMemoryFeatureFlagBits.defineAlias(Importable, Importable)
# Provided by VK_KHR_external_memory_capabilities
ExternalMemoryHandleTypeFlagBits.defineAlias(OpaqueFd, OpaqueFd)
# Provided by VK_KHR_external_memory_capabilities
ExternalMemoryHandleTypeFlagBits.defineAlias(OpaqueWin32, OpaqueWin32)
# Provided by VK_KHR_external_memory_capabilities
ExternalMemoryHandleTypeFlagBits.defineAlias(OpaqueWin32Kmt, OpaqueWin32Kmt)
# Provided by VK_KHR_external_memory_capabilities
ExternalMemoryHandleTypeFlagBits.defineAlias(D3d11Texture, D3d11Texture)
# Provided by VK_KHR_external_memory_capabilities
ExternalMemoryHandleTypeFlagBits.defineAlias(D3d11TextureKmt, D3d11TextureKmt)
# Provided by VK_KHR_external_memory_capabilities
ExternalMemoryHandleTypeFlagBits.defineAlias(D3d12Heap, D3d12Heap)
# Provided by VK_KHR_external_memory_capabilities
ExternalMemoryHandleTypeFlagBits.defineAlias(D3d12Resource, D3d12Resource)
const LuidSize* = 8
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
const QueueFamilyExternal* = (uint.high-1)

# Promoted from VK_KHR_external_fence_capabilities
# ------------------------------------------------
# Provided by VK_KHR_external_fence_capabilities
ExternalFenceHandleTypeFlagBits.defineAlias(OpaqueFd, OpaqueFd)
# Provided by VK_KHR_external_fence_capabilities
ExternalFenceHandleTypeFlagBits.defineAlias(OpaqueWin32, OpaqueWin32)
# Provided by VK_KHR_external_fence_capabilities
ExternalFenceHandleTypeFlagBits.defineAlias(OpaqueWin32Kmt, OpaqueWin32Kmt)
# Provided by VK_KHR_external_fence_capabilities
ExternalFenceHandleTypeFlagBits.defineAlias(SyncFd, SyncFd)
# Provided by VK_KHR_external_fence_capabilities
ExternalFenceFeatureFlagBits.defineAlias(Exportable, Exportable)
# Provided by VK_KHR_external_fence_capabilities
ExternalFenceFeatureFlagBits.defineAlias(Importable, Importable)
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
# Provided by VK_KHR_external_fence
FenceImportFlagBits.defineAlias(Temporary, Temporary)

# Promoted from VK_KHR_external_semaphore
# ---------------------------------------
# Provided by VK_KHR_external_semaphore
SemaphoreImportFlagBits.defineAlias(Temporary, Temporary)

# Promoted from VK_KHR_external_semaphore_capabilities
# ----------------------------------------------------
# Provided by VK_KHR_external_semaphore_capabilities
ExternalSemaphoreFeatureFlagBits.defineAlias(Exportable, Exportable)
# Provided by VK_KHR_external_semaphore_capabilities
ExternalSemaphoreFeatureFlagBits.defineAlias(Importable, Importable)
# Provided by VK_KHR_external_semaphore_capabilities
ExternalSemaphoreHandleTypeFlagBits.defineAlias(OpaqueFd, OpaqueFd)
# Provided by VK_KHR_external_semaphore_capabilities
ExternalSemaphoreHandleTypeFlagBits.defineAlias(OpaqueWin32, OpaqueWin32)
# Provided by VK_KHR_external_semaphore_capabilities
ExternalSemaphoreHandleTypeFlagBits.defineAlias(OpaqueWin32Kmt, OpaqueWin32Kmt)
# Provided by VK_KHR_external_semaphore_capabilities
ExternalSemaphoreHandleTypeFlagBits.defineAlias(D3d12Fence, D3d12Fence)
# Provided by VK_KHR_external_semaphore_capabilities
ExternalSemaphoreHandleTypeFlagBits.defineAlias(SyncFd, SyncFd)
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
  # ---------------------
  enumerateInstanceVersionCage << "vkEnumerateInstanceVersion"

  # Promoted from VK_KHR_bind_memory2
  # ---------------------------------
  bindBufferMemory2Cage << "vkBindBufferMemory2"
  bindImageMemory2Cage << "vkBindImageMemory2"

  # Promoted from VK_KHR_device_group
  # ---------------------------------
  getDeviceGroupPeerMemoryFeaturesCage << "vkGetDeviceGroupPeerMemoryFeatures"
  cmdSetDeviceMaskCage << "vkCmdSetDeviceMask"
  cmdDispatchBaseCage << "vkCmdDispatchBase"

  # Promoted from VK_KHR_device_group_creation
  # ------------------------------------------
  enumeratePhysicalDeviceGroupsCage << "vkEnumeratePhysicalDeviceGroups"

  # Promoted from VK_KHR_get_memory_requirements2
  # ---------------------------------------------
  getBufferMemoryRequirements2Cage << "vkGetBufferMemoryRequirements2"
  getImageMemoryRequirements2Cage << "vkGetImageMemoryRequirements2"
  getImageSparseMemoryRequirements2Cage << "vkGetImageSparseMemoryRequirements2"

  # Promoted from VK_KHR_get_physical_device_properties2
  # ----------------------------------------------------
  getPhysicalDeviceFeatures2Cage << "vkGetPhysicalDeviceFeatures2"
  getPhysicalDeviceFormatProperties2Cage << "vkGetPhysicalDeviceFormatProperties2"
  getPhysicalDeviceQueueFamilyProperties2Cage << "vkGetPhysicalDeviceQueueFamilyProperties2"
  getPhysicalDeviceMemoryProperties2Cage << "vkGetPhysicalDeviceMemoryProperties2"
  getPhysicalDeviceProperties2Cage << "vkGetPhysicalDeviceProperties2"
  getPhysicalDeviceSparseImageFormatProperties2Cage << "vkGetPhysicalDeviceSparseImageFormatProperties2"
  getPhysicalDeviceImageFormatProperties2Cage << "vkGetPhysicalDeviceImageFormatProperties2"

  # Promoted from VK_KHR_maintenance1
  # ---------------------------------
  trimCommandPoolCage << "vkTrimCommandPool"

  # Originally based on VK_KHR_protected_memory (extension 146), which was never published; thus the mystifying large value= numbers below. These are not aliased since they weren't actually promoted from an extension.
  # ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  getDeviceQueue2Cage << "vkGetDeviceQueue2"

  # Promoted from VK_KHR_sampler_ycbcr_conversion
  # ---------------------------------------------
  createSamplerYcbcrConversionCage << "vkCreateSamplerYcbcrConversion"
  destroySamplerYcbcrConversionCage << "vkDestroySamplerYcbcrConversion"

  # Promoted from VK_KHR_descriptor_update_template
  # -----------------------------------------------
  destroyDescriptorUpdateTemplateCage << "vkDestroyDescriptorUpdateTemplate"
  createDescriptorUpdateTemplateCage << "vkCreateDescriptorUpdateTemplate"
  updateDescriptorSetWithTemplateCage << "vkUpdateDescriptorSetWithTemplate"

  # Promoted from VK_KHR_external_memory_capabilities
  # -------------------------------------------------
  getPhysicalDeviceExternalBufferPropertiesCage << "vkGetPhysicalDeviceExternalBufferProperties"

  # Promoted from VK_KHR_external_fence_capabilities
  # ------------------------------------------------
  getPhysicalDeviceExternalFencePropertiesCage << "vkGetPhysicalDeviceExternalFenceProperties"

  # Promoted from VK_KHR_external_semaphore_capabilities
  # ----------------------------------------------------
  getPhysicalDeviceExternalSemaphorePropertiesCage << "vkGetPhysicalDeviceExternalSemaphoreProperties"

  # Promoted from VK_KHR_maintenance3
  # ---------------------------------
  getDescriptorSetLayoutSupportCage << "vkGetDescriptorSetLayoutSupport"