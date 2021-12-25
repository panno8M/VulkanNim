# Generated at 2021-12-25T14:19:30Z
# VK_ANDROID_native_buffer

import ../platform
import ../features/vk10

prepareVulkanLibDef()

const
  AndroidNativeBufferSpecVersion* = 8
  AndroidNativeBufferNumber* = 11
  AndroidNativeBufferName* = "VK_ANDROID_native_buffer"
  AndroidNativeBufferExtensionName* = AndroidNativeBufferName

type
  NativeBufferANDROID* = object
    sType* {.constant: (StructureType.nativeBufferAndroid).}: StructureType
    pNext* {.optional.}: pointer
    handle*: pointer
    stride*: int
    format*: int
    usage*: int
    usage2*: NativeBufferUsage2ANDROID
  SwapchainImageCreateInfoANDROID* = object
    sType* {.constant: (StructureType.swapchainImageCreateInfoAndroid).}: StructureType
    pNext* {.optional.}: pointer
    usage*: SwapchainImageUsageFlagsANDROID
  PhysicalDevicePresentationPropertiesANDROID* = object
    sType* {.constant: (StructureType.physicalDevicePresentationPropertiesAndroid).}: StructureType
    pNext* {.optional.}: pointer
    sharedImage*: Bool32
  NativeBufferUsage2ANDROID* = object
    consumer*: uint64
    producer*: uint64

proc getSwapchainGrallocUsageANDROID*(
      device: Device;
      format: Format;
      imageUsage: ImageUsageFlags;
      grallocUsage: ptr int;
    ): Result {.cdecl, lazyload("vkGetSwapchainGrallocUsageANDROID", DeviceLevel).}
proc acquireImageANDROID*(
      device: Device;
      image: Image;
      nativeFenceFd: int;
      semaphore: Semaphore;
      fence: Fence;
    ): Result {.cdecl, lazyload("vkAcquireImageANDROID", DeviceLevel).}
proc queueSignalReleaseImageANDROID*(
      queue: Queue;
      waitSemaphoreCount: uint32;
      pWaitSemaphores {.length: waitSemaphoreCount.}: arrPtr[Semaphore];
      image: Image;
      pNativeFenceFd: ptr int;
    ): Result {.cdecl, lazyload("vkQueueSignalReleaseImageANDROID", DeviceLevel).}
proc getSwapchainGrallocUsage2ANDROID*(
      device: Device;
      format: Format;
      imageUsage: ImageUsageFlags;
      swapchainImageUsage: SwapchainImageUsageFlagsANDROID;
      grallocConsumerUsage: ptr uint64;
      grallocProducerUsage: ptr uint64;
    ): Result {.cdecl, lazyload("vkGetSwapchainGrallocUsage2ANDROID", DeviceLevel).}

proc loadAllVK_ANDROID_native_buffer*(instance: Instance) =
  instance.loadCommand getSwapchainGrallocUsageANDROID
  instance.loadCommand acquireImageANDROID
  instance.loadCommand queueSignalReleaseImageANDROID
  instance.loadCommand getSwapchainGrallocUsage2ANDROID

proc loadVK_ANDROID_native_buffer*(device: Device) =
  device.loadCommand getSwapchainGrallocUsageANDROID
  device.loadCommand acquireImageANDROID
  device.loadCommand queueSignalReleaseImageANDROID
  device.loadCommand getSwapchainGrallocUsage2ANDROID

