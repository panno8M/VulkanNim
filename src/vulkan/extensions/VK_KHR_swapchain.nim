# Generated at 2021-08-30T22:51:48Z
# VK_KHR_swapchain


import ../platform
import ../features/vk10
import ./VK_KHR_surface

const
  KhrSwapchainSpecVersion* = 70
  KhrSwapchainExtensionName* = "VK_KHR_swapchain"

  MaxDeviceGroupSize* = 32

type
  SwapchainCreateFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_KHR_swapchain
    splitInstanceBindRegionsKhr = 0x00000001 # Allow images with VK_IMAGE_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT
    # Provided by VK_KHR_swapchain
    protectedKhr = 0x00000002 # Swapchain is protected
    # Provided by VK_KHR_swapchain_mutable_format
    mutableFormatKhr = 0x00000004
  SwapchainCreateFlagsKHR* = Flags[SwapchainCreateFlagBitsKHR]
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
  HtSwapchainKHR = object of HandleType
  SwapchainKHR* = NonDispatchableHandle[HtSwapchainKHR]
  PresentInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    waitSemaphoreCount*: uint32
    pWaitSemaphores*: ptr Semaphore
    swapchainCount*: uint32
    pSwapchains*: ptr SwapchainKHR
    pImageIndices*: ptr uint32
    pResults*: ptr Result

  ImageSwapchainCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    swapchain*: SwapchainKHR
  BindImageMemorySwapchainInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    swapchain*: SwapchainKHR
    imageIndex*: uint32
  AcquireNextImageInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    swapchain*: SwapchainKHR
    timeout*: uint64
    semaphore*: Semaphore
    fence*: Fence
    deviceMask*: uint32
  DeviceGroupPresentModeFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    localKhr = 0x00000001 # Present from local memory
    remoteKhr = 0x00000002 # Present from remote memory
    sumKhr = 0x00000004 # Present sum of local and/or remote memory
    localMultiDeviceKhr = 0x00000008 # Each physical device presents from local memory
  DeviceGroupPresentModeFlagsKHR* = Flags[DeviceGroupPresentModeFlagBitsKHR]
  DeviceGroupPresentCapabilitiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    presentMask*: array[MaxDeviceGroupSize, uint32]
    modes*: DeviceGroupPresentModeFlagsKHR
  DeviceGroupPresentInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    swapchainCount*: uint32
    pDeviceMasks*: ptr uint32
    mode*: DeviceGroupPresentModeFlagBitsKHR
  DeviceGroupSwapchainCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    modes*: DeviceGroupPresentModeFlagsKHR

var # command cages
  createSwapchainKHRCage: proc(device: Device; pCreateInfo: ptr SwapchainCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pSwapchain: ptr SwapchainKHR;): Result {.cdecl.}
  destroySwapchainKHRCage: proc(device: Device; swapchain: SwapchainKHR; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  getSwapchainImagesKHRCage: proc(device: Device; swapchain: SwapchainKHR; pSwapchainImageCount: ptr uint32; pSwapchainImages: ptr Image;): Result {.cdecl.}
  acquireNextImageKHRCage: proc(device: Device; swapchain: SwapchainKHR; timeout: uint64; semaphore: Semaphore; fence: Fence; pImageIndex: ptr uint32;): Result {.cdecl.}
  queuePresentKHRCage: proc(queue: Queue; pPresentInfo: ptr PresentInfoKHR;): Result {.cdecl.}
proc createSwapchainKHR*(
      device: Device;
      pCreateInfo: ptr SwapchainCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pSwapchain: ptr SwapchainKHR;
    ): Result {.cdecl, discardable.} =
  createSwapchainKHRCage(device,pCreateInfo,pAllocator,pSwapchain)
proc destroySwapchainKHR*(
      device: Device;
      swapchain: SwapchainKHR;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroySwapchainKHRCage(device,swapchain,pAllocator)
proc getSwapchainImagesKHR*(
      device: Device;
      swapchain: SwapchainKHR;
      pSwapchainImageCount: ptr uint32;
      pSwapchainImages: ptr Image;
    ): Result {.cdecl, discardable.} =
  getSwapchainImagesKHRCage(device,swapchain,pSwapchainImageCount,pSwapchainImages)
proc acquireNextImageKHR*(
      device: Device;
      swapchain: SwapchainKHR;
      timeout: uint64;
      semaphore: Semaphore;
      fence: Fence;
      pImageIndex: ptr uint32;
    ): Result {.cdecl, discardable.} =
  acquireNextImageKHRCage(device,swapchain,timeout,semaphore,fence,pImageIndex)
proc queuePresentKHR*(
      queue: Queue;
      pPresentInfo: ptr PresentInfoKHR;
    ): Result {.cdecl, discardable.} =
  queuePresentKHRCage(queue,pPresentInfo)


var # command cages
  getDeviceGroupPresentCapabilitiesKHRCage: proc(device: Device; pDeviceGroupPresentCapabilities: ptr DeviceGroupPresentCapabilitiesKHR;): Result {.cdecl.}
  getDeviceGroupSurfacePresentModesKHRCage: proc(device: Device; surface: SurfaceKHR; pModes: ptr DeviceGroupPresentModeFlagsKHR;): Result {.cdecl.}
  getPhysicalDevicePresentRectanglesKHRCage: proc(physicalDevice: PhysicalDevice; surface: SurfaceKHR; pRectCount: ptr uint32; pRects: ptr Rect2D;): Result {.cdecl.}
  acquireNextImage2KHRCage: proc(device: Device; pAcquireInfo: ptr AcquireNextImageInfoKHR; pImageIndex: ptr uint32;): Result {.cdecl.}
proc getDeviceGroupPresentCapabilitiesKHR*(
      device: Device;
      pDeviceGroupPresentCapabilities: ptr DeviceGroupPresentCapabilitiesKHR;
    ): Result {.cdecl, discardable.} =
  getDeviceGroupPresentCapabilitiesKHRCage(device,pDeviceGroupPresentCapabilities)
proc getDeviceGroupSurfacePresentModesKHR*(
      device: Device;
      surface: SurfaceKHR;
      pModes: ptr DeviceGroupPresentModeFlagsKHR;
    ): Result {.cdecl, discardable.} =
  getDeviceGroupSurfacePresentModesKHRCage(device,surface,pModes)
proc getPhysicalDevicePresentRectanglesKHR*(
      physicalDevice: PhysicalDevice;
      surface: SurfaceKHR;
      pRectCount: ptr uint32;
      pRects: ptr Rect2D;
    ): Result {.cdecl, discardable.} =
  getPhysicalDevicePresentRectanglesKHRCage(physicalDevice,surface,pRectCount,pRects)
proc acquireNextImage2KHR*(
      device: Device;
      pAcquireInfo: ptr AcquireNextImageInfoKHR;
      pImageIndex: ptr uint32;
    ): Result {.cdecl, discardable.} =
  acquireNextImage2KHRCage(device,pAcquireInfo,pImageIndex)
proc loadVK_KHR_swapchain*(instance: Instance) =
  instance.defineLoader(`<<`)

  createSwapchainKHRCage << "vkCreateSwapchainKHR"
  destroySwapchainKHRCage << "vkDestroySwapchainKHR"
  getSwapchainImagesKHRCage << "vkGetSwapchainImagesKHR"
  acquireNextImageKHRCage << "vkAcquireNextImageKHR"
  queuePresentKHRCage << "vkQueuePresentKHR"

  getDeviceGroupPresentCapabilitiesKHRCage << "vkGetDeviceGroupPresentCapabilitiesKHR"
  getDeviceGroupSurfacePresentModesKHRCage << "vkGetDeviceGroupSurfacePresentModesKHR"
  getPhysicalDevicePresentRectanglesKHRCage << "vkGetPhysicalDevicePresentRectanglesKHR"
  acquireNextImage2KHRCage << "vkAcquireNextImage2KHR"