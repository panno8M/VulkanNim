# Generated at 2021-09-12T04:58:24Z
# VK_KHR_device_group


import ../platform
import ../features/vk10
import ./VK_KHR_device_group_creation
import ../features/vk11
import ./VK_KHR_bind_memory2
import ./VK_KHR_surface
import ./VK_KHR_swapchain
export VK_KHR_device_group_creation
export VK_KHR_bind_memory2
export VK_KHR_surface
export VK_KHR_swapchain

const
  KhrDeviceGroupSpecVersion* = 4
  KhrDeviceGroupExtensionName* = "VK_KHR_device_group"

  MaxDeviceGroupSize* = 32

type # enums and bitmasks
  PeerMemoryFeatureFlagsKHR* = PeerMemoryFeatureFlags
  PeerMemoryFeatureFlagBitsKHR* = distinct UnusedEnum
  MemoryAllocateFlagsKHR* = MemoryAllocateFlags
  MemoryAllocateFlagBitsKHR* = distinct UnusedEnum

  DeviceGroupPresentModeFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    localKhr = 0x00000001 # Present from local memory
    remoteKhr = 0x00000002 # Present from remote memory
    sumKhr = 0x00000004 # Present sum of local and/or remote memory
    localMultiDeviceKhr = 0x00000008 # Each physical device presents from local memory
  DeviceGroupPresentModeFlagsKHR* = Flags[DeviceGroupPresentModeFlagBitsKHR]

type
  MemoryAllocateFlagsInfoKHR* = object
  DeviceGroupRenderPassBeginInfoKHR* = object
  DeviceGroupCommandBufferBeginInfoKHR* = object
  DeviceGroupSubmitInfoKHR* = object
  DeviceGroupBindSparseInfoKHR* = object

  BindBufferMemoryDeviceGroupInfoKHR* = object
  BindImageMemoryDeviceGroupInfoKHR* = object

  DeviceGroupPresentCapabilitiesKHR* = object
    sType* {.constant: (StructureType.deviceGroupPresentCapabilitiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    presentMask*: array[MaxDeviceGroupSize, uint32]
    modes*: DeviceGroupPresentModeFlagsKHR

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

const getDeviceGroupPeerMemoryFeaturesKHR* = getDeviceGroupPeerMemoryFeatures
const cmdSetDeviceMaskKHR* = cmdSetDeviceMask
const cmdDispatchBaseKHR* = cmdDispatchBase
DependencyFlagBits.defineAliases:
  deviceGroup as deviceGroupKhr

MemoryAllocateFlagBits.defineAliases:
  deviceMask as deviceMaskKhr

StructureType.defineAliases:
  memoryAllocateFlagsInfo as memoryAllocateFlagsInfoKhr
  deviceGroupRenderPassBeginInfo as deviceGroupRenderPassBeginInfoKhr
  deviceGroupCommandBufferBeginInfo as deviceGroupCommandBufferBeginInfoKhr
  deviceGroupSubmitInfo as deviceGroupSubmitInfoKhr
  deviceGroupBindSparseInfo as deviceGroupBindSparseInfoKhr

PeerMemoryFeatureFlagBits.defineAliases:
  copySrc as copySrcKhr
  copyDst as copyDstKhr
  genericSrc as genericSrcKhr
  genericDst as genericDstKhr

PipelineCreateFlagBits.defineAliases:
  viewIndexFromDeviceIndex as viewIndexFromDeviceIndexKhr
  dispatchBase as dispatchBaseKhr



StructureType.defineAliases:
  bindBufferMemoryDeviceGroupInfo as bindBufferMemoryDeviceGroupInfoKhr
  bindImageMemoryDeviceGroupInfo as bindImageMemoryDeviceGroupInfoKhr

ImageCreateFlagBits.defineAliases:
  splitInstanceBindRegions as splitInstanceBindRegionsKhr



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

proc loadAllVK_KHR_device_group*(instance: Instance) =
  getDeviceGroupPresentCapabilitiesKHR.load(instance)
  getDeviceGroupSurfacePresentModesKHR.load(instance)
  getPhysicalDevicePresentRectanglesKHR.load(instance)

  acquireNextImage2KHR.load(instance)

proc loadVK_KHR_device_group*(instance: Instance) =
  getPhysicalDevicePresentRectanglesKHR.load(instance)

proc loadVK_KHR_device_group*(device: Device) =
  getDeviceGroupPresentCapabilitiesKHR.load(device)
  getDeviceGroupSurfacePresentModesKHR.load(device)

  acquireNextImage2KHR.load(device)

