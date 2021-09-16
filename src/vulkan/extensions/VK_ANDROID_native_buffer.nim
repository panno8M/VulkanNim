# Generated at 2021-09-12T04:58:23Z
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
  getSwapchainGrallocUsageANDROID.load(instance)
  acquireImageANDROID.load(instance)
  queueSignalReleaseImageANDROID.load(instance)
  getSwapchainGrallocUsage2ANDROID.load(instance)

proc loadVK_ANDROID_native_buffer*(device: Device) =
  getSwapchainGrallocUsageANDROID.load(device)
  acquireImageANDROID.load(device)
  queueSignalReleaseImageANDROID.load(device)
  getSwapchainGrallocUsage2ANDROID.load(device)

