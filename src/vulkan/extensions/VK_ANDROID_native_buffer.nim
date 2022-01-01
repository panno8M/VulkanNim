# VK_ANDROID_native_buffer

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  AndroidNativeBufferSpecVersion* = 8
  AndroidNativeBufferNumber* = 11
  AndroidNativeBufferExtensionName* = "VK_ANDROID_native_buffer"
  AndroidNativeBufferName* = AndroidNativeBufferExtensionName

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

proc loadAllVK_ANDROID_native_buffer*(instance: Instance) = instance.loadCommands:
  getSwapchainGrallocUsageANDROID
  acquireImageANDROID
  queueSignalReleaseImageANDROID
  getSwapchainGrallocUsage2ANDROID
proc loadVK_ANDROID_native_buffer*(device: Device) = device.loadCommands:
  getSwapchainGrallocUsageANDROID
  acquireImageANDROID
  queueSignalReleaseImageANDROID
  getSwapchainGrallocUsage2ANDROID
