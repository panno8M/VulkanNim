
import ../platform
import ../features/vk10


const
  AndroidNativeBufferSpecVersion* = 8
  AndroidNativeBufferNumber* = 11
  AndroidNativeBufferName* = "VK_ANDROID_native_buffer"
  AndroidNativeBufferExtensionName* = AndroidNativeBufferName

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
  SwapchainImageUsageFlagBitsANDROID* {.size: sizeof(int32), pure.} = enum
    SharedBitAndroid = 0x00000001
  SwapchainImageUsageFlagsANDROID* = distinct Flags

var # commands
  getSwapchainGrallocUsageANDROIDCage: proc(device: Device; format: Format; imageUsage: ImageUsageFlags; grallocUsage: ptr int;): Result {.cdecl.}
  acquireImageANDROIDCage: proc(device: Device; image: Image; nativeFenceFd: int; semaphore: Semaphore; fence: Fence;): Result {.cdecl.}
  queueSignalReleaseImageANDROIDCage: proc(queue: Queue; waitSemaphoreCount: uint32; pWaitSemaphores: ptr Semaphore; image: Image; pNativeFenceFd: ptr int;): Result {.cdecl.}
  getSwapchainGrallocUsage2ANDROIDCage: proc(device: Device; format: Format; imageUsage: ImageUsageFlags; swapchainImageUsage: SwapchainImageUsageFlagsANDROID; grallocConsumerUsage: ptr uint64; grallocProducerUsage: ptr uint64;): Result {.cdecl.}
proc getSwapchainGrallocUsageANDROID*(
      device: Device;
      format: Format;
      imageUsage: ImageUsageFlags;
      grallocUsage: ptr int;
    ): Result {.cdecl, discardable.} =
  getSwapchainGrallocUsageANDROIDCage(device,format,imageUsage,grallocUsage)
proc acquireImageANDROID*(
      device: Device;
      image: Image;
      nativeFenceFd: int;
      semaphore: Semaphore;
      fence: Fence;
    ): Result {.cdecl, discardable.} =
  acquireImageANDROIDCage(device,image,nativeFenceFd,semaphore,fence)
proc queueSignalReleaseImageANDROID*(
      queue: Queue;
      waitSemaphoreCount: uint32;
      pWaitSemaphores: ptr Semaphore;
      image: Image;
      pNativeFenceFd: ptr int;
    ): Result {.cdecl, discardable.} =
  queueSignalReleaseImageANDROIDCage(queue,waitSemaphoreCount,pWaitSemaphores,image,pNativeFenceFd)
proc getSwapchainGrallocUsage2ANDROID*(
      device: Device;
      format: Format;
      imageUsage: ImageUsageFlags;
      swapchainImageUsage: SwapchainImageUsageFlagsANDROID;
      grallocConsumerUsage: ptr uint64;
      grallocProducerUsage: ptr uint64;
    ): Result {.cdecl, discardable.} =
  getSwapchainGrallocUsage2ANDROIDCage(device,format,imageUsage,swapchainImageUsage,grallocConsumerUsage,grallocProducerUsage)
proc loadVK_ANDROID_native_buffer*(instance: Instance) =
  instance.defineLoader(`<<`)

  getSwapchainGrallocUsageANDROIDCage << "vkGetSwapchainGrallocUsageANDROID"
  acquireImageANDROIDCage << "vkAcquireImageANDROID"
  queueSignalReleaseImageANDROIDCage << "vkQueueSignalReleaseImageANDROID"
  getSwapchainGrallocUsage2ANDROIDCage << "vkGetSwapchainGrallocUsage2ANDROID"