# Generated at 2021-08-30T14:31:10Z
# VK_KHR_device_group


import ../platform
import ../features/vk10
import ./VK_KHR_device_group_creation

const
  KhrDeviceGroupSpecVersion* = 4
  KhrDeviceGroupExtensionName* = "VK_KHR_device_group"

  MaxDeviceGroupSize* = 32

type
  {name}* = {Alias}
  PeerMemoryFeatureFlagBitsKHR* = distinct UnusedEnum
  {name}* = {Alias}
  MemoryAllocateFlagBitsKHR* = distinct UnusedEnum
  MemoryAllocateFlagsInfoKHR* = object
  DeviceGroupRenderPassBeginInfoKHR* = object
  DeviceGroupCommandBufferBeginInfoKHR* = object
  DeviceGroupSubmitInfoKHR* = object
  DeviceGroupBindSparseInfoKHR* = object

  BindBufferMemoryDeviceGroupInfoKHR* = object
  BindImageMemoryDeviceGroupInfoKHR* = object

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

var # commands
  
  
  
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



var # commands
  getDeviceGroupPresentCapabilitiesKHRCage: proc(device: Device; pDeviceGroupPresentCapabilities: ptr DeviceGroupPresentCapabilitiesKHR;): Result {.cdecl.}
  getDeviceGroupSurfacePresentModesKHRCage: proc(device: Device; surface: SurfaceKHR; pModes: ptr DeviceGroupPresentModeFlagsKHR;): Result {.cdecl.}
  getPhysicalDevicePresentRectanglesKHRCage: proc(physicalDevice: PhysicalDevice; surface: SurfaceKHR; pRectCount: ptr uint32; pRects: ptr Rect2D;): Result {.cdecl.}
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


var # commands
  acquireNextImage2KHRCage: proc(device: Device; pAcquireInfo: ptr AcquireNextImageInfoKHR; pImageIndex: ptr uint32;): Result {.cdecl.}
proc acquireNextImage2KHR*(
      device: Device;
      pAcquireInfo: ptr AcquireNextImageInfoKHR;
      pImageIndex: ptr uint32;
    ): Result {.cdecl, discardable.} =
  acquireNextImage2KHRCage(device,pAcquireInfo,pImageIndex)
proc loadVK_KHR_device_group*(instance: Instance) =
  instance.defineLoader(`<<`)

  getDeviceGroupPeerMemoryFeaturesKHRCage << "vkGetDeviceGroupPeerMemoryFeaturesKHR"
  cmdSetDeviceMaskKHRCage << "vkCmdSetDeviceMaskKHR"
  cmdDispatchBaseKHRCage << "vkCmdDispatchBaseKHR"

  getDeviceGroupPresentCapabilitiesKHRCage << "vkGetDeviceGroupPresentCapabilitiesKHR"
  getDeviceGroupSurfacePresentModesKHRCage << "vkGetDeviceGroupSurfacePresentModesKHR"
  getPhysicalDevicePresentRectanglesKHRCage << "vkGetPhysicalDevicePresentRectanglesKHR"

  acquireNextImage2KHRCage << "vkAcquireNextImage2KHR"