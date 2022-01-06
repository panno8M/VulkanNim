# VK_VERSION_1_1

import ../platform
import vk10
prepareVulkanLibDef()

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
    pDeviceRenderAreas* {.length: deviceRenderAreaCount.}: arrPtr[Rect2D]
  DeviceGroupCommandBufferBeginInfo* = object
    sType* {.constant: (StructureType.deviceGroupCommandBufferBeginInfo).}: StructureType
    pNext* {.optional.}: pointer
    deviceMask*: uint32
  DeviceGroupSubmitInfo* = object
    sType* {.constant: (StructureType.deviceGroupSubmitInfo).}: StructureType
    pNext* {.optional.}: pointer
    waitSemaphoreCount* {.optional.}: uint32
    pWaitSemaphoreDeviceIndices* {.length: waitSemaphoreCount.}: arrPtr[uint32]
    commandBufferCount* {.optional.}: uint32
    pCommandBufferDeviceMasks* {.length: commandBufferCount.}: arrPtr[uint32]
    signalSemaphoreCount* {.optional.}: uint32
    pSignalSemaphoreDeviceIndices* {.length: signalSemaphoreCount.}: arrPtr[uint32]
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
    pDeviceIndices* {.length: deviceIndexCount.}: arrPtr[uint32]
  BindImageMemoryDeviceGroupInfo* = object
    sType* {.constant: (StructureType.bindImageMemoryDeviceGroupInfo).}: StructureType
    pNext* {.optional.}: pointer
    deviceIndexCount* {.optional.}: uint32
    pDeviceIndices* {.length: deviceIndexCount.}: arrPtr[uint32]
    splitInstanceBindRegionCount* {.optional.}: uint32
    pSplitInstanceBindRegions* {.length: splitInstanceBindRegionCount.}: arrPtr[Rect2D]

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
    pPhysicalDevices* {.length: physicalDeviceCount.}: arrPtr[PhysicalDevice]

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
    pAspectReferences* {.length: aspectReferenceCount.}: arrPtr[InputAttachmentAspectReference]
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
    pViewMasks* {.length: subpassCount.}: arrPtr[uint32]
    dependencyCount* {.optional.}: uint32
    pViewOffsets* {.length: dependencyCount.}: arrPtr[int32]
    correlationMaskCount* {.optional.}: uint32
    pCorrelationMasks* {.length: correlationMaskCount.}: arrPtr[uint32]
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

  # Originally based on VK_KHR_protected_memory (extension 146), which was never published; thus the mystifying large value= numbers below. These are not aliased since they were not actually promoted from an extension.
  # ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

  # Promoted from VK_KHR_descriptor_update_template
  # -----------------------------------------------
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
    pDescriptorUpdateEntries* {.length: descriptorUpdateEntryCount.}: arrPtr[DescriptorUpdateTemplateEntry]
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
    handleTypes* {.optional.}: ExternalMemoryHandleTypeFlags
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


template apiVersion11*(): untyped =
  makeApiVersion(0, 1, 1, 0)



# Device Initialization
# ---------------------
proc enumerateInstanceVersion*(
      pApiVersion: ptr uint32;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory],
      preload("vkEnumerateInstanceVersion").}


# Promoted from VK_KHR_bind_memory2
# ---------------------------------
proc bindBufferMemory2*(
      device: Device;
      bindInfoCount: uint32;
      pBindInfos {.length: bindInfoCount.}: arrPtr[BindBufferMemoryInfo];
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorInvalidOpaqueCaptureAddressKhr],
      preload("vkBindBufferMemory2").}
proc bindImageMemory2*(
      device: Device;
      bindInfoCount: uint32;
      pBindInfos {.length: bindInfoCount.}: arrPtr[BindImageMemoryInfo];
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      preload("vkBindImageMemory2").}


# Promoted from VK_KHR_device_group
# ---------------------------------
proc getDeviceGroupPeerMemoryFeatures*(
      device: Device;
      heapIndex: uint32;
      localDeviceIndex: uint32;
      remoteDeviceIndex: uint32;
      pPeerMemoryFeatures: ptr PeerMemoryFeatureFlags;
    ): void {.cdecl, preload("vkGetDeviceGroupPeerMemoryFeatures").}
proc cmdSetDeviceMask*(
      commandBuffer: CommandBuffer;
      deviceMask: uint32;
    ): void {.cdecl, preload("vkCmdSetDeviceMask").}
proc cmdDispatchBase*(
      commandBuffer: CommandBuffer;
      baseGroupX: uint32;
      baseGroupY: uint32;
      baseGroupZ: uint32;
      groupCountX: uint32;
      groupCountY: uint32;
      groupCountZ: uint32;
    ): void {.cdecl, preload("vkCmdDispatchBase").}


# Promoted from VK_KHR_device_group_creation
# ------------------------------------------
proc enumeratePhysicalDeviceGroups*(
      instance: Instance;
      pPhysicalDeviceGroupCount: ptr uint32;
      pPhysicalDeviceGroupProperties {.length: pPhysicalDeviceGroupCount.} = default(arrPtr[PhysicalDeviceGroupProperties]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorInitializationFailed],
      preload("vkEnumeratePhysicalDeviceGroups").}


# Promoted from VK_KHR_get_memory_requirements2
# ---------------------------------------------
proc getImageMemoryRequirements2*(
      device: Device;
      pInfo: ptr ImageMemoryRequirementsInfo2;
      pMemoryRequirements: ptr MemoryRequirements2;
    ): void {.cdecl, preload("vkGetImageMemoryRequirements2").}
proc getBufferMemoryRequirements2*(
      device: Device;
      pInfo: ptr BufferMemoryRequirementsInfo2;
      pMemoryRequirements: ptr MemoryRequirements2;
    ): void {.cdecl, preload("vkGetBufferMemoryRequirements2").}
proc getImageSparseMemoryRequirements2*(
      device: Device;
      pInfo: ptr ImageSparseMemoryRequirementsInfo2;
      pSparseMemoryRequirementCount: ptr uint32;
      pSparseMemoryRequirements {.length: pSparseMemoryRequirementCount.} = default(arrPtr[SparseImageMemoryRequirements2]);
    ): void {.cdecl, preload("vkGetImageSparseMemoryRequirements2").}


# Promoted from VK_KHR_get_physical_device_properties2
# ----------------------------------------------------
proc getPhysicalDeviceFeatures2*(
      physicalDevice: PhysicalDevice;
      pFeatures: ptr PhysicalDeviceFeatures2;
    ): void {.cdecl, preload("vkGetPhysicalDeviceFeatures2").}
proc getPhysicalDeviceProperties2*(
      physicalDevice: PhysicalDevice;
      pProperties: ptr PhysicalDeviceProperties2;
    ): void {.cdecl, preload("vkGetPhysicalDeviceProperties2").}
proc getPhysicalDeviceFormatProperties2*(
      physicalDevice: PhysicalDevice;
      format: Format;
      pFormatProperties: ptr FormatProperties2;
    ): void {.cdecl, preload("vkGetPhysicalDeviceFormatProperties2").}
proc getPhysicalDeviceImageFormatProperties2*(
      physicalDevice: PhysicalDevice;
      pImageFormatInfo: ptr PhysicalDeviceImageFormatInfo2;
      pImageFormatProperties: ptr ImageFormatProperties2;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorFormatNotSupported],
      preload("vkGetPhysicalDeviceImageFormatProperties2").}
proc getPhysicalDeviceQueueFamilyProperties2*(
      physicalDevice: PhysicalDevice;
      pQueueFamilyPropertyCount: ptr uint32;
      pQueueFamilyProperties {.length: pQueueFamilyPropertyCount.} = default(arrPtr[QueueFamilyProperties2]);
    ): void {.cdecl, preload("vkGetPhysicalDeviceQueueFamilyProperties2").}
proc getPhysicalDeviceMemoryProperties2*(
      physicalDevice: PhysicalDevice;
      pMemoryProperties: ptr PhysicalDeviceMemoryProperties2;
    ): void {.cdecl, preload("vkGetPhysicalDeviceMemoryProperties2").}
proc getPhysicalDeviceSparseImageFormatProperties2*(
      physicalDevice: PhysicalDevice;
      pFormatInfo: ptr PhysicalDeviceSparseImageFormatInfo2;
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[SparseImageFormatProperties2]);
    ): void {.cdecl, preload("vkGetPhysicalDeviceSparseImageFormatProperties2").}


# Promoted from VK_KHR_maintenance1
# ---------------------------------
proc trimCommandPool*(
      device: Device;
      commandPool: CommandPool;
      flags = default(CommandPoolTrimFlags);
    ): void {.cdecl, preload("vkTrimCommandPool").}


# Originally based on VK_KHR_protected_memory (extension 146), which was never published; thus the mystifying large value= numbers below. These are not aliased since they were not actually promoted from an extension.
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
proc getDeviceQueue2*(
      device: Device;
      pQueueInfo: ptr DeviceQueueInfo2;
      pQueue: ptr Queue;
    ): void {.cdecl, preload("vkGetDeviceQueue2").}


# Promoted from VK_KHR_sampler_ycbcr_conversion
# ---------------------------------------------
proc createSamplerYcbcrConversion*(
      device: Device;
      pCreateInfo: ptr SamplerYcbcrConversionCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pYcbcrConversion: ptr SamplerYcbcrConversion;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      preload("vkCreateSamplerYcbcrConversion").}
proc destroySamplerYcbcrConversion*(
      device: Device;
      ycbcrConversion = default(SamplerYcbcrConversion);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroySamplerYcbcrConversion").}


# Promoted from VK_KHR_descriptor_update_template
# -----------------------------------------------
proc createDescriptorUpdateTemplate*(
      device: Device;
      pCreateInfo: ptr DescriptorUpdateTemplateCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pDescriptorUpdateTemplate: ptr DescriptorUpdateTemplate;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      preload("vkCreateDescriptorUpdateTemplate").}
proc destroyDescriptorUpdateTemplate*(
      device: Device;
      descriptorUpdateTemplate = default(DescriptorUpdateTemplate);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyDescriptorUpdateTemplate").}
proc updateDescriptorSetWithTemplate*(
      device: Device;
      descriptorSet: DescriptorSet;
      descriptorUpdateTemplate: DescriptorUpdateTemplate;
      pData: pointer;
    ): void {.cdecl, preload("vkUpdateDescriptorSetWithTemplate").}


# Promoted from VK_KHR_external_memory_capabilities
# -------------------------------------------------
proc getPhysicalDeviceExternalBufferProperties*(
      physicalDevice: PhysicalDevice;
      pExternalBufferInfo: ptr PhysicalDeviceExternalBufferInfo;
      pExternalBufferProperties: ptr ExternalBufferProperties;
    ): void {.cdecl, preload("vkGetPhysicalDeviceExternalBufferProperties").}


# Promoted from VK_KHR_external_fence_capabilities
# ------------------------------------------------
proc getPhysicalDeviceExternalFenceProperties*(
      physicalDevice: PhysicalDevice;
      pExternalFenceInfo: ptr PhysicalDeviceExternalFenceInfo;
      pExternalFenceProperties: ptr ExternalFenceProperties;
    ): void {.cdecl, preload("vkGetPhysicalDeviceExternalFenceProperties").}


# Promoted from VK_KHR_external_semaphore_capabilities
# ----------------------------------------------------
proc getPhysicalDeviceExternalSemaphoreProperties*(
      physicalDevice: PhysicalDevice;
      pExternalSemaphoreInfo: ptr PhysicalDeviceExternalSemaphoreInfo;
      pExternalSemaphoreProperties: ptr ExternalSemaphoreProperties;
    ): void {.cdecl, preload("vkGetPhysicalDeviceExternalSemaphoreProperties").}


# Promoted from VK_KHR_maintenance3
# ---------------------------------
proc getDescriptorSetLayoutSupport*(
      device: Device;
      pCreateInfo: ptr DescriptorSetLayoutCreateInfo;
      pSupport: ptr DescriptorSetLayoutSupport;
    ): void {.cdecl, preload("vkGetDescriptorSetLayoutSupport").}

