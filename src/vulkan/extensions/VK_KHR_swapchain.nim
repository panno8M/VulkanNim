# Generated at 2021-09-09T01:49:36Z
# VK_KHR_swapchain


import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

const
  KhrSwapchainSpecVersion* = 70
  KhrSwapchainExtensionName* = "VK_KHR_swapchain"

  MaxDeviceGroupSize* = 32

type # enums and bitmasks
  SwapchainCreateFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_KHR_swapchain
    splitInstanceBindRegionsKhr = 0x00000001 # Allow images with VK_IMAGE_CREATE_SPLIT_INSTANCE_BIND_REGIONS_BIT
    # Provided by VK_KHR_swapchain
    protectedKhr = 0x00000002 # Swapchain is protected
    # Provided by VK_KHR_swapchain_mutable_format
    mutableFormatKhr = 0x00000004
  SwapchainCreateFlagsKHR* = Flags[SwapchainCreateFlagBitsKHR]

  DeviceGroupPresentModeFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    localKhr = 0x00000001 # Present from local memory
    remoteKhr = 0x00000002 # Present from remote memory
    sumKhr = 0x00000004 # Present sum of local and/or remote memory
    localMultiDeviceKhr = 0x00000008 # Each physical device presents from local memory
  DeviceGroupPresentModeFlagsKHR* = Flags[DeviceGroupPresentModeFlagBitsKHR]

type
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

proc createSwapchainKHR*(
      device: Device;
      pCreateInfo: ptr SwapchainCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pSwapchain: ptr SwapchainKHR;
    ): Result {.cdecl, lazyload("vkCreateSwapchainKHR", DeviceLevel).}
proc destroySwapchainKHR*(
      device: Device;
      swapchain: SwapchainKHR;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl, lazyload("vkDestroySwapchainKHR", DeviceLevel).}
proc getSwapchainImagesKHR*(
      device: Device;
      swapchain: SwapchainKHR;
      pSwapchainImageCount: ptr uint32;
      pSwapchainImages: ptr Image;
    ): Result {.cdecl, lazyload("vkGetSwapchainImagesKHR", DeviceLevel).}
proc acquireNextImageKHR*(
      device: Device;
      swapchain: SwapchainKHR;
      timeout: uint64;
      semaphore: Semaphore;
      fence: Fence;
      pImageIndex: ptr uint32;
    ): Result {.cdecl, lazyload("vkAcquireNextImageKHR", DeviceLevel).}
proc queuePresentKHR*(
      queue: Queue;
      pPresentInfo: ptr PresentInfoKHR;
    ): Result {.cdecl, lazyload("vkQueuePresentKHR", DeviceLevel).}


proc getDeviceGroupPresentCapabilitiesKHR*(
      device: Device;
      pDeviceGroupPresentCapabilities: ptr DeviceGroupPresentCapabilitiesKHR;
    ): Result {.cdecl, lazyload("vkGetDeviceGroupPresentCapabilitiesKHR", DeviceLevel).}
proc getDeviceGroupSurfacePresentModesKHR*(
      device: Device;
      surface: SurfaceKHR;
      pModes: ptr DeviceGroupPresentModeFlagsKHR;
    ): Result {.cdecl, lazyload("vkGetDeviceGroupSurfacePresentModesKHR", DeviceLevel).}
proc getPhysicalDevicePresentRectanglesKHR*(
      physicalDevice: PhysicalDevice;
      surface: SurfaceKHR;
      pRectCount: ptr uint32;
      pRects: ptr Rect2D;
    ): Result {.cdecl, lazyload("vkGetPhysicalDevicePresentRectanglesKHR", InstanceLevel).}
proc acquireNextImage2KHR*(
      device: Device;
      pAcquireInfo: ptr AcquireNextImageInfoKHR;
      pImageIndex: ptr uint32;
    ): Result {.cdecl, lazyload("vkAcquireNextImage2KHR", DeviceLevel).}

proc loadAllVK_KHR_swapchain*(instance: Instance) =
  createSwapchainKHR.smartLoad(instance)
  destroySwapchainKHR.smartLoad(instance)
  getSwapchainImagesKHR.smartLoad(instance)
  acquireNextImageKHR.smartLoad(instance)
  queuePresentKHR.smartLoad(instance)

  getDeviceGroupPresentCapabilitiesKHR.smartLoad(instance)
  getDeviceGroupSurfacePresentModesKHR.smartLoad(instance)
  getPhysicalDevicePresentRectanglesKHR.smartLoad(instance)
  acquireNextImage2KHR.smartLoad(instance)

proc loadVK_KHR_swapchain*(instance: Instance) =
  getPhysicalDevicePresentRectanglesKHR.smartLoad(instance)

proc loadVK_KHR_swapchain*(device: Device) =
  createSwapchainKHR.smartLoad(device)
  destroySwapchainKHR.smartLoad(device)
  getSwapchainImagesKHR.smartLoad(device)
  acquireNextImageKHR.smartLoad(device)
  queuePresentKHR.smartLoad(device)

  getDeviceGroupPresentCapabilitiesKHR.smartLoad(device)
  getDeviceGroupSurfacePresentModesKHR.smartLoad(device)
  acquireNextImage2KHR.smartLoad(device)

