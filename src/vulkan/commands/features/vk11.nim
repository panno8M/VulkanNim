# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_VERSION_1_1

import ../tools


# VK_VERSION_1_1
# ==============

template apiVersion11*(): untyped =
  makeApiVersion(0, 1, 1, 0)

# Device Initialization
proc enumerateInstanceVersion*(
      pApiVersion: ptr uint32;
    ): Result {.preload("vkEnumerateInstanceVersion"),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory].}
# Promoted from VK_KHR_bind_memory2
proc bindBufferMemory2*(
      device: Device;
      bindInfoCount: uint32;
      pBindInfos {.length: bindInfoCount.}: arrPtr[BindBufferMemoryInfo];
    ): Result {.preload("vkBindBufferMemory2"),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorInvalidOpaqueCaptureAddressKhr].}
proc bindImageMemory2*(
      device: Device;
      bindInfoCount: uint32;
      pBindInfos {.length: bindInfoCount.}: arrPtr[BindImageMemoryInfo];
    ): Result {.preload("vkBindImageMemory2"),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory].}
# Promoted from VK_KHR_device_group
proc getDeviceGroupPeerMemoryFeatures*(
      device: Device;
      heapIndex: uint32;
      localDeviceIndex: uint32;
      remoteDeviceIndex: uint32;
      pPeerMemoryFeatures: ptr PeerMemoryFeatureFlags;
    ): void {.preload("vkGetDeviceGroupPeerMemoryFeatures").}
proc cmdSetDeviceMask*(
      commandBuffer: CommandBuffer;
      deviceMask: uint32;
    ): void {.preload("vkCmdSetDeviceMask"),
      queues: QueueFlags{graphics, compute, transfer}.}
proc cmdDispatchBase*(
      commandBuffer: CommandBuffer;
      baseGroupX: uint32;
      baseGroupY: uint32;
      baseGroupZ: uint32;
      groupCountX: uint32;
      groupCountY: uint32;
      groupCountZ: uint32;
    ): void {.preload("vkCmdDispatchBase"),
      queues: QueueFlags{compute}.}
# Promoted from VK_KHR_device_group_creation
proc enumeratePhysicalDeviceGroups*(
      instance: Instance;
      pPhysicalDeviceGroupCount: ptr uint32;
      pPhysicalDeviceGroupProperties {.length: pPhysicalDeviceGroupCount.} = default(arrPtr[PhysicalDeviceGroupProperties]);
    ): Result {.preload("vkEnumeratePhysicalDeviceGroups"),
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorInitializationFailed].}
# Promoted from VK_KHR_get_memory_requirements2
proc getImageMemoryRequirements2*(
      device: Device;
      pInfo: ptr ImageMemoryRequirementsInfo2;
      pMemoryRequirements: ptr MemoryRequirements2;
    ): void {.preload("vkGetImageMemoryRequirements2").}
proc getBufferMemoryRequirements2*(
      device: Device;
      pInfo: ptr BufferMemoryRequirementsInfo2;
      pMemoryRequirements: ptr MemoryRequirements2;
    ): void {.preload("vkGetBufferMemoryRequirements2").}
proc getImageSparseMemoryRequirements2*(
      device: Device;
      pInfo: ptr ImageSparseMemoryRequirementsInfo2;
      pSparseMemoryRequirementCount: ptr uint32;
      pSparseMemoryRequirements {.length: pSparseMemoryRequirementCount.} = default(arrPtr[SparseImageMemoryRequirements2]);
    ): void {.preload("vkGetImageSparseMemoryRequirements2").}
# Promoted from VK_KHR_get_physical_device_properties2
proc getPhysicalDeviceFeatures2*(
      physicalDevice: PhysicalDevice;
      pFeatures: ptr PhysicalDeviceFeatures2;
    ): void {.preload("vkGetPhysicalDeviceFeatures2").}
proc getPhysicalDeviceProperties2*(
      physicalDevice: PhysicalDevice;
      pProperties: ptr PhysicalDeviceProperties2;
    ): void {.preload("vkGetPhysicalDeviceProperties2").}
proc getPhysicalDeviceFormatProperties2*(
      physicalDevice: PhysicalDevice;
      format: Format;
      pFormatProperties: ptr FormatProperties2;
    ): void {.preload("vkGetPhysicalDeviceFormatProperties2").}
proc getPhysicalDeviceImageFormatProperties2*(
      physicalDevice: PhysicalDevice;
      pImageFormatInfo: ptr PhysicalDeviceImageFormatInfo2;
      pImageFormatProperties: ptr ImageFormatProperties2;
    ): Result {.preload("vkGetPhysicalDeviceImageFormatProperties2"),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorFormatNotSupported].}
proc getPhysicalDeviceQueueFamilyProperties2*(
      physicalDevice: PhysicalDevice;
      pQueueFamilyPropertyCount: ptr uint32;
      pQueueFamilyProperties {.length: pQueueFamilyPropertyCount.} = default(arrPtr[QueueFamilyProperties2]);
    ): void {.preload("vkGetPhysicalDeviceQueueFamilyProperties2").}
proc getPhysicalDeviceMemoryProperties2*(
      physicalDevice: PhysicalDevice;
      pMemoryProperties: ptr PhysicalDeviceMemoryProperties2;
    ): void {.preload("vkGetPhysicalDeviceMemoryProperties2").}
proc getPhysicalDeviceSparseImageFormatProperties2*(
      physicalDevice: PhysicalDevice;
      pFormatInfo: ptr PhysicalDeviceSparseImageFormatInfo2;
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[SparseImageFormatProperties2]);
    ): void {.preload("vkGetPhysicalDeviceSparseImageFormatProperties2").}
# Promoted from VK_KHR_maintenance1
proc trimCommandPool*(
      device: Device;
      commandPool: CommandPool;
      flags = default(CommandPoolTrimFlags);
    ): void {.preload("vkTrimCommandPool").}
# Originally based on VK_KHR_protected_memory (extension 146), which was never published; thus the mystifying large value= numbers below. These are not aliased since they were not actually promoted from an extension.
proc getDeviceQueue2*(
      device: Device;
      pQueueInfo: ptr DeviceQueueInfo2;
      pQueue: ptr Queue;
    ): void {.preload("vkGetDeviceQueue2").}
# Promoted from VK_KHR_sampler_ycbcr_conversion
proc createSamplerYcbcrConversion*(
      device: Device;
      pCreateInfo: ptr SamplerYcbcrConversionCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pYcbcrConversion: ptr SamplerYcbcrConversion;
    ): Result {.preload("vkCreateSamplerYcbcrConversion"),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory].}
proc destroySamplerYcbcrConversion*(
      device: Device;
      ycbcrConversion = default(SamplerYcbcrConversion);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.preload("vkDestroySamplerYcbcrConversion").}
# Promoted from VK_KHR_descriptor_update_template
proc createDescriptorUpdateTemplate*(
      device: Device;
      pCreateInfo: ptr DescriptorUpdateTemplateCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pDescriptorUpdateTemplate: ptr DescriptorUpdateTemplate;
    ): Result {.preload("vkCreateDescriptorUpdateTemplate"),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory].}
proc destroyDescriptorUpdateTemplate*(
      device: Device;
      descriptorUpdateTemplate = default(DescriptorUpdateTemplate);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.preload("vkDestroyDescriptorUpdateTemplate").}
proc updateDescriptorSetWithTemplate*(
      device: Device;
      descriptorSet: DescriptorSet;
      descriptorUpdateTemplate: DescriptorUpdateTemplate;
      pData: pointer;
    ): void {.preload("vkUpdateDescriptorSetWithTemplate").}
# Promoted from VK_KHR_external_memory_capabilities
proc getPhysicalDeviceExternalBufferProperties*(
      physicalDevice: PhysicalDevice;
      pExternalBufferInfo: ptr PhysicalDeviceExternalBufferInfo;
      pExternalBufferProperties: ptr ExternalBufferProperties;
    ): void {.preload("vkGetPhysicalDeviceExternalBufferProperties").}
# Promoted from VK_KHR_external_fence_capabilities
proc getPhysicalDeviceExternalFenceProperties*(
      physicalDevice: PhysicalDevice;
      pExternalFenceInfo: ptr PhysicalDeviceExternalFenceInfo;
      pExternalFenceProperties: ptr ExternalFenceProperties;
    ): void {.preload("vkGetPhysicalDeviceExternalFenceProperties").}
# Promoted from VK_KHR_external_semaphore_capabilities
proc getPhysicalDeviceExternalSemaphoreProperties*(
      physicalDevice: PhysicalDevice;
      pExternalSemaphoreInfo: ptr PhysicalDeviceExternalSemaphoreInfo;
      pExternalSemaphoreProperties: ptr ExternalSemaphoreProperties;
    ): void {.preload("vkGetPhysicalDeviceExternalSemaphoreProperties").}
# Promoted from VK_KHR_maintenance3
proc getDescriptorSetLayoutSupport*(
      device: Device;
      pCreateInfo: ptr DescriptorSetLayoutCreateInfo;
      pSupport: ptr DescriptorSetLayoutSupport;
    ): void {.preload("vkGetDescriptorSetLayoutSupport").}

