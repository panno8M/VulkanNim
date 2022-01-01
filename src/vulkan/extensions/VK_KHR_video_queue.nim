# Generated at 2021-12-31T11:28:23Z
# VK_KHR_video_queue

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_sampler_ycbcr_conversion
export VK_KHR_get_physical_device_properties2
export VK_KHR_sampler_ycbcr_conversion
prepareVulkanLibDef()

const
  KhrVideoQueueSpecVersion* = 2
  KhrVideoQueueExtensionName* = "VK_KHR_video_queue"

type
  QueueFamilyQueryResultStatusProperties2KHR* = object
    sType* {.constant: (StructureType.queueFamilyQueryResultStatusProperties2Khr).}: StructureType
    pNext* {.optional.}: pointer
    supported*: Bool32
  VideoQueueFamilyProperties2KHR* = object
    sType* {.constant: (StructureType.videoQueueFamilyProperties2Khr).}: StructureType
    pNext* {.optional.}: pointer
    videoCodecOperations*: VideoCodecOperationFlagsKHR
  VideoProfileKHR* = object
    sType* {.constant: (StructureType.videoProfileKhr).}: StructureType
    pNext* {.optional.}: pointer
    videoCodecOperation*: VideoCodecOperationFlagBitsKHR
    chromaSubsampling*: VideoChromaSubsamplingFlagsKHR
    lumaBitDepth*: VideoComponentBitDepthFlagsKHR
    chromaBitDepth*: VideoComponentBitDepthFlagsKHR
  VideoProfilesKHR* = object
    sType* {.constant: (StructureType.videoProfilesKhr).}: StructureType
    pNext* {.optional.}: pointer
    profileCount*: uint32
    pProfiles*: ptr VideoProfileKHR
  VideoCapabilitiesKHR* = object
    sType* {.constant: (StructureType.videoCapabilitiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    capabilityFlags*: VideoCapabilityFlagsKHR
    minBitstreamBufferOffsetAlignment*: DeviceSize
    minBitstreamBufferSizeAlignment*: DeviceSize
    videoPictureExtentGranularity*: Extent2D
    minExtent*: Extent2D
    maxExtent*: Extent2D
    maxReferencePicturesSlotsCount*: uint32
    maxReferencePicturesActiveCount*: uint32
  PhysicalDeviceVideoFormatInfoKHR* = object
    sType* {.constant: (StructureType.physicalDeviceVideoFormatInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    imageUsage*: ImageUsageFlags
    pVideoProfiles*: ptr VideoProfilesKHR
  VideoFormatPropertiesKHR* = object
    sType* {.constant: (StructureType.videoFormatPropertiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    format*: Format
  VideoPictureResourceKHR* = object
    sType* {.constant: (StructureType.videoPictureResourceKhr).}: StructureType
    pNext* {.optional.}: pointer
    codedOffset*: Offset2D
    codedExtent*: Extent2D
    baseArrayLayer*: uint32
    imageViewBinding*: ImageView
  VideoReferenceSlotKHR* = object
    sType* {.constant: (StructureType.videoReferenceSlotKhr).}: StructureType
    pNext* {.optional.}: pointer
    slotIndex*: int8
    pPictureResource*: ptr VideoPictureResourceKHR
  VideoGetMemoryPropertiesKHR* = object
    sType* {.constant: (StructureType.videoGetMemoryPropertiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    memoryBindIndex*: uint32
    pMemoryRequirements*: ptr MemoryRequirements2
  VideoBindMemoryKHR* = object
    sType* {.constant: (StructureType.videoBindMemoryKhr).}: StructureType
    pNext* {.optional.}: pointer
    memoryBindIndex*: uint32
    memory*: DeviceMemory
    memoryOffset*: DeviceSize
    memorySize*: DeviceSize
  VideoSessionCreateInfoKHR* = object
    sType* {.constant: (StructureType.videoSessionCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    queueFamilyIndex*: uint32
    flags* {.optional.}: VideoSessionCreateFlagsKHR
    pVideoProfile*: ptr VideoProfileKHR
    pictureFormat*: Format
    maxCodedExtent*: Extent2D
    referencePicturesFormat*: Format
    maxReferencePicturesSlotsCount*: uint32
    maxReferencePicturesActiveCount*: uint32
  VideoSessionParametersCreateInfoKHR* = object
    sType* {.constant: (StructureType.videoSessionParametersCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    videoSessionParametersTemplate* {.optional.}: VideoSessionParametersKHR
    videoSession*: VideoSessionKHR
  VideoSessionParametersUpdateInfoKHR* = object
    sType* {.constant: (StructureType.videoSessionParametersUpdateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    updateSequenceCount*: uint32
  VideoBeginCodingInfoKHR* = object
    sType* {.constant: (StructureType.videoBeginCodingInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: VideoBeginCodingFlagsKHR
    codecQualityPreset*: VideoCodingQualityPresetFlagsKHR
    videoSession*: VideoSessionKHR
    videoSessionParameters* {.optional.}: VideoSessionParametersKHR
    referenceSlotCount* {.optional.}: uint32
    pReferenceSlots* {.length: referenceSlotCount.}: arrPtr[VideoReferenceSlotKHR]
  VideoEndCodingInfoKHR* = object
    sType* {.constant: (StructureType.videoEndCodingInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: VideoEndCodingFlagsKHR
  VideoCodingControlInfoKHR* = object
    sType* {.constant: (StructureType.videoCodingControlInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: VideoCodingControlFlagsKHR

proc getPhysicalDeviceVideoCapabilitiesKHR*(
      physicalDevice: PhysicalDevice;
      pVideoProfile: ptr VideoProfileKHR;
      pCapabilities: ptr VideoCapabilitiesKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorExtensionNotPresent, Result.errorInitializationFailed, Result.errorFeatureNotPresent, Result.errorFormatNotSupported],
      lazyload("vkGetPhysicalDeviceVideoCapabilitiesKHR", InstanceLevel).}
proc getPhysicalDeviceVideoFormatPropertiesKHR*(
      physicalDevice: PhysicalDevice;
      pVideoFormatInfo: ptr PhysicalDeviceVideoFormatInfoKHR;
      pVideoFormatPropertyCount: ptr uint32;
      pVideoFormatProperties {.length: pVideoFormatPropertyCount.} = default(arrPtr[VideoFormatPropertiesKHR]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorExtensionNotPresent, Result.errorInitializationFailed, Result.errorFormatNotSupported],
      lazyload("vkGetPhysicalDeviceVideoFormatPropertiesKHR", InstanceLevel).}
proc createVideoSessionKHR*(
      device: Device;
      pCreateInfo: ptr VideoSessionCreateInfoKHR;
      pAllocator = default(ptr AllocationCallbacks);
      pVideoSession: ptr VideoSessionKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorInitializationFailed, Result.errorIncompatibleDriver, Result.errorFeatureNotPresent],
      lazyload("vkCreateVideoSessionKHR", DeviceLevel).}
proc destroyVideoSessionKHR*(
      device: Device;
      videoSession: VideoSessionKHR;
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, lazyload("vkDestroyVideoSessionKHR", DeviceLevel).}
proc getVideoSessionMemoryRequirementsKHR*(
      device: Device;
      videoSession: VideoSessionKHR;
      pVideoSessionMemoryRequirementsCount: ptr uint32;
      pVideoSessionMemoryRequirements {.length: pVideoSessionMemoryRequirementsCount.} = default(arrPtr[VideoGetMemoryPropertiesKHR]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorInitializationFailed],
      lazyload("vkGetVideoSessionMemoryRequirementsKHR", DeviceLevel).}
proc bindVideoSessionMemoryKHR*(
      device: Device;
      videoSession: VideoSessionKHR;
      videoSessionBindMemoryCount: uint32;
      pVideoSessionBindMemories {.length: videoSessionBindMemoryCount.}: arrPtr[VideoBindMemoryKHR];
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorInitializationFailed],
      lazyload("vkBindVideoSessionMemoryKHR", DeviceLevel).}
proc createVideoSessionParametersKHR*(
      device: Device;
      pCreateInfo: ptr VideoSessionParametersCreateInfoKHR;
      pAllocator = default(ptr AllocationCallbacks);
      pVideoSessionParameters: ptr VideoSessionParametersKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorInitializationFailed, Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorTooManyObjects],
      lazyload("vkCreateVideoSessionParametersKHR", DeviceLevel).}
proc updateVideoSessionParametersKHR*(
      device: Device;
      videoSessionParameters: VideoSessionParametersKHR;
      pUpdateInfo: ptr VideoSessionParametersUpdateInfoKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorInitializationFailed, Result.errorTooManyObjects],
      lazyload("vkUpdateVideoSessionParametersKHR", DeviceLevel).}
proc destroyVideoSessionParametersKHR*(
      device: Device;
      videoSessionParameters: VideoSessionParametersKHR;
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, lazyload("vkDestroyVideoSessionParametersKHR", DeviceLevel).}
proc cmdBeginVideoCodingKHR*(
      commandBuffer: CommandBuffer;
      pBeginInfo: ptr VideoBeginCodingInfoKHR;
    ): void {.cdecl, lazyload("vkCmdBeginVideoCodingKHR", DeviceLevel).}
proc cmdEndVideoCodingKHR*(
      commandBuffer: CommandBuffer;
      pEndCodingInfo: ptr VideoEndCodingInfoKHR;
    ): void {.cdecl, lazyload("vkCmdEndVideoCodingKHR", DeviceLevel).}
proc cmdControlVideoCodingKHR*(
      commandBuffer: CommandBuffer;
      pCodingControlInfo: ptr VideoCodingControlInfoKHR;
    ): void {.cdecl, lazyload("vkCmdControlVideoCodingKHR", DeviceLevel).}

proc loadAllVK_KHR_video_queue*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceVideoCapabilitiesKHR
  getPhysicalDeviceVideoFormatPropertiesKHR
  createVideoSessionKHR
  destroyVideoSessionKHR
  getVideoSessionMemoryRequirementsKHR
  bindVideoSessionMemoryKHR
  createVideoSessionParametersKHR
  updateVideoSessionParametersKHR
  destroyVideoSessionParametersKHR
  cmdBeginVideoCodingKHR
  cmdEndVideoCodingKHR
  cmdControlVideoCodingKHR
proc loadVK_KHR_video_queue*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceVideoCapabilitiesKHR
  getPhysicalDeviceVideoFormatPropertiesKHR
proc loadVK_KHR_video_queue*(device: Device) = device.loadCommands:
  createVideoSessionKHR
  destroyVideoSessionKHR
  getVideoSessionMemoryRequirementsKHR
  bindVideoSessionMemoryKHR
  createVideoSessionParametersKHR
  updateVideoSessionParametersKHR
  destroyVideoSessionParametersKHR
  cmdBeginVideoCodingKHR
  cmdEndVideoCodingKHR
  cmdControlVideoCodingKHR
