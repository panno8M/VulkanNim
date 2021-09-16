# Generated at 2021-09-16T07:11:43Z
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
    sType* {.constant: (StructureType.swapchainCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: SwapchainCreateFlagsKHR
    surface*: SurfaceKHR
    minImageCount*: uint32
    imageFormat*: Format
    imageColorSpace*: ColorSpaceKHR
    imageExtent*: Extent2D
    imageArrayLayers*: uint32
    imageUsage*: ImageUsageFlags
    imageSharingMode*: SharingMode
    queueFamilyIndexCount* {.optional.}: uint32
    pQueueFamilyIndices*: ptr uint32
    preTransform*: SurfaceTransformFlagBitsKHR
    compositeAlpha*: CompositeAlphaFlagBitsKHR
    presentMode*: PresentModeKHR
    clipped*: Bool32
    oldSwapchain* {.optional.}: SwapchainKHR
  HtSwapchainKHR = object of HandleType
  SwapchainKHR* = NonDispatchableHandle[HtSwapchainKHR]
  PresentInfoKHR* = object
    sType* {.constant: (StructureType.presentInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    waitSemaphoreCount* {.optional.}: uint32
    pWaitSemaphores*: ptr Semaphore
    swapchainCount*: uint32
    pSwapchains*: ptr SwapchainKHR
    pImageIndices*: ptr uint32
    pResults* {.optional.}: ptr Result

  ImageSwapchainCreateInfoKHR* = object
    sType* {.constant: (StructureType.imageSwapchainCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    swapchain* {.optional.}: SwapchainKHR
  BindImageMemorySwapchainInfoKHR* = object
    sType* {.constant: (StructureType.bindImageMemorySwapchainInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    swapchain*: SwapchainKHR
    imageIndex*: uint32
  AcquireNextImageInfoKHR* = object
    sType* {.constant: (StructureType.acquireNextImageInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    swapchain*: SwapchainKHR
    timeout*: uint64
    semaphore* {.optional.}: Semaphore
    fence* {.optional.}: Fence
    deviceMask*: uint32
  DeviceGroupPresentCapabilitiesKHR* = object
    sType* {.constant: (StructureType.deviceGroupPresentCapabilitiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    presentMask*: array[MaxDeviceGroupSize, uint32]
    modes*: DeviceGroupPresentModeFlagsKHR
  DeviceGroupPresentInfoKHR* = object
    sType* {.constant: (StructureType.deviceGroupPresentInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    swapchainCount* {.optional.}: uint32
    pDeviceMasks*: ptr uint32
    mode*: DeviceGroupPresentModeFlagBitsKHR
  DeviceGroupSwapchainCreateInfoKHR* = object
    sType* {.constant: (StructureType.deviceGroupSwapchainCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    modes*: DeviceGroupPresentModeFlagsKHR

proc createSwapchainKHR*(
      device: Device;
      pCreateInfo: ptr SwapchainCreateInfoKHR;
      pAllocator = default(ptr AllocationCallbacks); # optional
      pSwapchain: ptr SwapchainKHR;
    ): Result {.cdecl, lazyload("vkCreateSwapchainKHR", DeviceLevel).}
proc destroySwapchainKHR*(
      device: Device;
      swapchain = default(SwapchainKHR); # optional
      pAllocator = default(ptr AllocationCallbacks); # optional
    ): void {.cdecl, lazyload("vkDestroySwapchainKHR", DeviceLevel).}
proc getSwapchainImagesKHR*(
      device: Device;
      swapchain: SwapchainKHR;
      pSwapchainImageCount: ptr uint32;
      pSwapchainImages = default(ptr Image); # optional
    ): Result {.cdecl, lazyload("vkGetSwapchainImagesKHR", DeviceLevel).}
proc acquireNextImageKHR*(
      device: Device;
      swapchain: SwapchainKHR;
      timeout: uint64;
      semaphore = default(Semaphore); # optional
      fence = default(Fence); # optional
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
      pRects = default(ptr Rect2D); # optional
    ): Result {.cdecl, lazyload("vkGetPhysicalDevicePresentRectanglesKHR", InstanceLevel).}
proc acquireNextImage2KHR*(
      device: Device;
      pAcquireInfo: ptr AcquireNextImageInfoKHR;
      pImageIndex: ptr uint32;
    ): Result {.cdecl, lazyload("vkAcquireNextImage2KHR", DeviceLevel).}

proc loadAllVK_KHR_swapchain*(instance: Instance) =
  createSwapchainKHR.load(instance)
  destroySwapchainKHR.load(instance)
  getSwapchainImagesKHR.load(instance)
  acquireNextImageKHR.load(instance)
  queuePresentKHR.load(instance)

  getDeviceGroupPresentCapabilitiesKHR.load(instance)
  getDeviceGroupSurfacePresentModesKHR.load(instance)
  getPhysicalDevicePresentRectanglesKHR.load(instance)
  acquireNextImage2KHR.load(instance)

proc loadVK_KHR_swapchain*(instance: Instance) =
  getPhysicalDevicePresentRectanglesKHR.load(instance)

proc loadVK_KHR_swapchain*(device: Device) =
  createSwapchainKHR.load(device)
  destroySwapchainKHR.load(device)
  getSwapchainImagesKHR.load(device)
  acquireNextImageKHR.load(device)
  queuePresentKHR.load(device)

  getDeviceGroupPresentCapabilitiesKHR.load(device)
  getDeviceGroupSurfacePresentModesKHR.load(device)
  acquireNextImage2KHR.load(device)

