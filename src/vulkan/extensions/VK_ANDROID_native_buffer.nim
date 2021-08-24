
import ../platform
import ../features/vk10


type
  SwapchainImageUsageFlagBitsANDROID* {.size: sizeof(int32), pure.} = enum
    Shared = 0x00000001
  NativeBufferUsage2ANDROID* = object
    consumer*: uint64
    producer*: uint64
  SwapchainImageUsageFlagsANDROID* = distinct Flags
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

const AndroidNativeBufferSpecVersion* = 8
template AndroidNativeBufferExtensionName*(): untyped =
  VkAndroidNativeBufferName
const AndroidNativeBufferNumber* = 11
const AndroidNativeBufferName* = "VK_ANDROID_native_buffer"
var # commands
  getSwapchainGrallocUsage2ANDROIDCage: proc(device: Device; format: Format; imageUsage: ImageUsageFlags; swapchainImageUsage: SwapchainImageUsageFlagsANDROID; grallocConsumerUsage: ptr uint64; grallocProducerUsage: ptr uint64;): Result {.cdecl.}
  acquireImageANDROIDCage: proc(device: Device; image: Image; nativeFenceFd: int; semaphore: Semaphore; fence: Fence;): Result {.cdecl.}
  getSwapchainGrallocUsageANDROIDCage: proc(device: Device; format: Format; imageUsage: ImageUsageFlags; grallocUsage: ptr int;): Result {.cdecl.}
  queueSignalReleaseImageANDROIDCage: proc(queue: Queue; waitSemaphoreCount: uint32; pWaitSemaphores: ptr Semaphore; image: Image; pNativeFenceFd: ptr int;): Result {.cdecl.}

proc getSwapchainGrallocUsage2ANDROID*(
      device: Device;
      format: Format;
      imageUsage: ImageUsageFlags;
      swapchainImageUsage: SwapchainImageUsageFlagsANDROID;
      grallocConsumerUsage: ptr uint64;
      grallocProducerUsage: ptr uint64;
    ): Result {.cdecl.} =
  getSwapchainGrallocUsage2ANDROIDCage(device,format,imageUsage,swapchainImageUsage,grallocConsumerUsage,grallocProducerUsage)

proc acquireImageANDROID*(
      device: Device;
      image: Image;
      nativeFenceFd: int;
      semaphore: Semaphore;
      fence: Fence;
    ): Result {.cdecl.} =
  acquireImageANDROIDCage(device,image,nativeFenceFd,semaphore,fence)

proc getSwapchainGrallocUsageANDROID*(
      device: Device;
      format: Format;
      imageUsage: ImageUsageFlags;
      grallocUsage: ptr int;
    ): Result {.cdecl.} =
  getSwapchainGrallocUsageANDROIDCage(device,format,imageUsage,grallocUsage)

proc queueSignalReleaseImageANDROID*(
      queue: Queue;
      waitSemaphoreCount: uint32;
      pWaitSemaphores: ptr Semaphore;
      image: Image;
      pNativeFenceFd: ptr int;
    ): Result {.cdecl.} =
  queueSignalReleaseImageANDROIDCage(queue,waitSemaphoreCount,pWaitSemaphores,image,pNativeFenceFd)


proc loadVK_ANDROID_native_buffer*(instance: Instance) =
  instance.defineLoader(`<<`)

  getSwapchainGrallocUsage2ANDROIDCage << "vkGetSwapchainGrallocUsage2ANDROID"
  acquireImageANDROIDCage << "vkAcquireImageANDROID"
  getSwapchainGrallocUsageANDROIDCage << "vkGetSwapchainGrallocUsageANDROID"
  queueSignalReleaseImageANDROIDCage << "vkQueueSignalReleaseImageANDROID"