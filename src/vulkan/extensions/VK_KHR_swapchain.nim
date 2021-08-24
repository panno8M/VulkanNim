
import ../platform
import ../features/vk10
import VK_KHR_surface


type
  SwapchainKHR* = distinct NonDispatchableHandle
  PresentInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    waitSemaphoreCount*: uint32
    pWaitSemaphores*: ptr Semaphore
    swapchainCount*: uint32
    pSwapchains*: ptr SwapchainKHR
    pImageIndices*: ptr uint32
    pResults*: ptr Result
  SwapchainCreateFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_KHR_swapchain_mutable_format
    MutableFormat = 0x00000004
  SwapchainCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: SwapchainCreateFlagsKHR
    surface*: SurfaceKHR
    minImageCount*: uint32
    imageFormat*: Format
    imageColorSpace*: ColorSpaceKHR
    imageExtent*: Extent2D
    imageArrayLayers*: uint32
    imageUsage*: ImageUsageFlags
    imageSharingMode*: SharingMode
    queueFamilyIndexCount*: uint32
    pQueueFamilyIndices*: ptr uint32
    preTransform*: SurfaceTransformFlagBitsKHR
    compositeAlpha*: CompositeAlphaFlagBitsKHR
    presentMode*: PresentModeKHR
    clipped*: Bool32
    oldSwapchain*: SwapchainKHR
  SwapchainCreateFlagsKHR* = distinct Flags

  AcquireNextImageInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    swapchain*: SwapchainKHR
    timeout*: uint64
    semaphore*: Semaphore
    fence*: Fence
    deviceMask*: uint32
  DeviceGroupPresentCapabilitiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    presentMask*: uint32
    modes*: DeviceGroupPresentModeFlagsKHR
  DeviceGroupSwapchainCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    modes*: DeviceGroupPresentModeFlagsKHR
  DeviceGroupPresentInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    swapchainCount*: uint32
    pDeviceMasks*: ptr uint32
    mode*: DeviceGroupPresentModeFlagBitsKHR
  ImageSwapchainCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    swapchain*: SwapchainKHR
  DeviceGroupPresentModeFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    Local = 0x00000001 # Present from local memory
    Remote = 0x00000002 # Present from remote memory
    Sum = 0x00000004 # Present sum of local and/or remote memory
    LocalMultiDevice = 0x00000008 # Each physical device presents from local memory
  DeviceGroupPresentModeFlagsKHR* = distinct Flags
  BindImageMemorySwapchainInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    swapchain*: SwapchainKHR
    imageIndex*: uint32

const KhrSwapchainSpecVersion* = 70
const KhrSwapchainExtensionName* = "VK_KHR_swapchain"
var # commands
  createSwapchainKHRCage: proc(device: Device; pCreateInfo: ptr SwapchainCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pSwapchain: ptr SwapchainKHR;): Result {.cdecl.}
  getSwapchainImagesKHRCage: proc(device: Device; swapchain: SwapchainKHR; pSwapchainImageCount: ptr uint32; pSwapchainImages: ptr Image;): Result {.cdecl.}
  acquireNextImageKHRCage: proc(device: Device; swapchain: SwapchainKHR; timeout: uint64; semaphore: Semaphore; fence: Fence; pImageIndex: ptr uint32;): Result {.cdecl.}
  destroySwapchainKHRCage: proc(device: Device; swapchain: SwapchainKHR; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  queuePresentKHRCage: proc(queue: Queue; pPresentInfo: ptr PresentInfoKHR;): Result {.cdecl.}

proc createSwapchainKHR*(
      device: Device;
      pCreateInfo: ptr SwapchainCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pSwapchain: ptr SwapchainKHR;
    ): Result {.cdecl.} =
  createSwapchainKHRCage(device,pCreateInfo,pAllocator,pSwapchain)

proc getSwapchainImagesKHR*(
      device: Device;
      swapchain: SwapchainKHR;
      pSwapchainImageCount: ptr uint32;
      pSwapchainImages: ptr Image;
    ): Result {.cdecl.} =
  getSwapchainImagesKHRCage(device,swapchain,pSwapchainImageCount,pSwapchainImages)

proc acquireNextImageKHR*(
      device: Device;
      swapchain: SwapchainKHR;
      timeout: uint64;
      semaphore: Semaphore;
      fence: Fence;
      pImageIndex: ptr uint32;
    ): Result {.cdecl.} =
  acquireNextImageKHRCage(device,swapchain,timeout,semaphore,fence,pImageIndex)

proc destroySwapchainKHR*(
      device: Device;
      swapchain: SwapchainKHR;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroySwapchainKHRCage(device,swapchain,pAllocator)

proc queuePresentKHR*(
      queue: Queue;
      pPresentInfo: ptr PresentInfoKHR;
    ): Result {.cdecl.} =
  queuePresentKHRCage(queue,pPresentInfo)


var # commands
  getDeviceGroupPresentCapabilitiesKHRCage: proc(device: Device; pDeviceGroupPresentCapabilities: ptr DeviceGroupPresentCapabilitiesKHR;): Result {.cdecl.}
  getDeviceGroupSurfacePresentModesKHRCage: proc(device: Device; surface: SurfaceKHR; pModes: ptr DeviceGroupPresentModeFlagsKHR;): Result {.cdecl.}
  getPhysicalDevicePresentRectanglesKHRCage: proc(physicalDevice: PhysicalDevice; surface: SurfaceKHR; pRectCount: ptr uint32; pRects: ptr Rect2D;): Result {.cdecl.}
  acquireNextImage2KHRCage: proc(device: Device; pAcquireInfo: ptr AcquireNextImageInfoKHR; pImageIndex: ptr uint32;): Result {.cdecl.}

proc getDeviceGroupPresentCapabilitiesKHR*(
      device: Device;
      pDeviceGroupPresentCapabilities: ptr DeviceGroupPresentCapabilitiesKHR;
    ): Result {.cdecl.} =
  getDeviceGroupPresentCapabilitiesKHRCage(device,pDeviceGroupPresentCapabilities)

proc getDeviceGroupSurfacePresentModesKHR*(
      device: Device;
      surface: SurfaceKHR;
      pModes: ptr DeviceGroupPresentModeFlagsKHR;
    ): Result {.cdecl.} =
  getDeviceGroupSurfacePresentModesKHRCage(device,surface,pModes)

proc getPhysicalDevicePresentRectanglesKHR*(
      physicalDevice: PhysicalDevice;
      surface: SurfaceKHR;
      pRectCount: ptr uint32;
      pRects: ptr Rect2D;
    ): Result {.cdecl.} =
  getPhysicalDevicePresentRectanglesKHRCage(physicalDevice,surface,pRectCount,pRects)

proc acquireNextImage2KHR*(
      device: Device;
      pAcquireInfo: ptr AcquireNextImageInfoKHR;
      pImageIndex: ptr uint32;
    ): Result {.cdecl.} =
  acquireNextImage2KHRCage(device,pAcquireInfo,pImageIndex)


proc loadVK_KHR_swapchain*(instance: Instance) =
  instance.defineLoader(`<<`)

  createSwapchainKHRCage << "vkCreateSwapchainKHR"
  getSwapchainImagesKHRCage << "vkGetSwapchainImagesKHR"
  acquireNextImageKHRCage << "vkAcquireNextImageKHR"
  destroySwapchainKHRCage << "vkDestroySwapchainKHR"
  queuePresentKHRCage << "vkQueuePresentKHR"

  getDeviceGroupPresentCapabilitiesKHRCage << "vkGetDeviceGroupPresentCapabilitiesKHR"
  getDeviceGroupSurfacePresentModesKHRCage << "vkGetDeviceGroupSurfacePresentModesKHR"
  getPhysicalDevicePresentRectanglesKHRCage << "vkGetPhysicalDevicePresentRectanglesKHR"
  acquireNextImage2KHRCage << "vkAcquireNextImage2KHR"