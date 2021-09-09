# Generated at 2021-09-09T01:49:36Z
# VK_ANDROID_native_buffer


import ../platform
import ../features/vk10

const
  AndroidNativeBufferSpecVersion* = 8
  AndroidNativeBufferNumber* = 11
  AndroidNativeBufferName* = "VK_ANDROID_native_buffer"
  AndroidNativeBufferExtensionName* = AndroidNativeBufferName

type # enums and bitmasks
  SwapchainImageUsageFlagBitsANDROID* {.size: sizeof(int32), pure.} = enum
    sharedAndroid = 0x00000001
  SwapchainImageUsageFlagsANDROID* = Flags[SwapchainImageUsageFlagBitsANDROID]

type
  NativeBufferANDROID* = object
    sType*: StructureType
    pNext*: pointer
    handle*: pointer
    stride*: int
    format*: int
    usage*: int
    usage2*: NativeBufferUsage2ANDROID
  SwapchainImageCreateInfoANDROID* = object
    sType*: StructureType
    pNext*: pointer
    usage*: SwapchainImageUsageFlagsANDROID
  PhysicalDevicePresentationPropertiesANDROID* = object
    sType*: StructureType
    pNext*: pointer
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
      pWaitSemaphores: ptr Semaphore;
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
  getSwapchainGrallocUsageANDROID.smartLoad(instance)
  acquireImageANDROID.smartLoad(instance)
  queueSignalReleaseImageANDROID.smartLoad(instance)
  getSwapchainGrallocUsage2ANDROID.smartLoad(instance)

proc loadVK_ANDROID_native_buffer*(device: Device) =
  getSwapchainGrallocUsageANDROID.smartLoad(device)
  acquireImageANDROID.smartLoad(device)
  queueSignalReleaseImageANDROID.smartLoad(device)
  getSwapchainGrallocUsage2ANDROID.smartLoad(device)

