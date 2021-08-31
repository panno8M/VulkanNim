# Generated at 2021-08-31T05:19:02Z
# VK_EXT_full_screen_exclusive


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_surface
import ./VK_KHR_get_surface_capabilities2
import ./VK_KHR_swapchain
import ./VK_KHR_win32_surface
import ./VK_KHR_device_group
export VK_KHR_get_physical_device_properties2
export VK_KHR_surface
export VK_KHR_get_surface_capabilities2
export VK_KHR_swapchain
export VK_KHR_win32_surface
export VK_KHR_device_group

const
  ExtFullScreenExclusiveSpecVersion* = 4
  ExtFullScreenExclusiveExtensionName* = "VK_EXT_full_screen_exclusive"

type # enums and bitmasks
  FullScreenExclusiveEXT* {.size: sizeof(int32), pure.} = enum
    defaultExt = 0
    allowedExt = 1
    disallowedExt = 2
    applicationControlledExt = 3

type
  SurfaceFullScreenExclusiveInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    fullScreenExclusive*: FullScreenExclusiveEXT
  SurfaceCapabilitiesFullScreenExclusiveEXT* = object
    sType*: StructureType
    pNext*: pointer
    fullScreenExclusiveSupported*: Bool32

  SurfaceFullScreenExclusiveWin32InfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    hmonitor*: HMONITOR

var # command cages
  getPhysicalDeviceSurfacePresentModes2EXTCage: proc(physicalDevice: PhysicalDevice; pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR; pPresentModeCount: ptr uint32; pPresentModes: ptr PresentModeKHR;): Result {.cdecl.}
  acquireFullScreenExclusiveModeEXTCage: proc(device: Device; swapchain: SwapchainKHR;): Result {.cdecl.}
  releaseFullScreenExclusiveModeEXTCage: proc(device: Device; swapchain: SwapchainKHR;): Result {.cdecl.}
proc getPhysicalDeviceSurfacePresentModes2EXT*(
      physicalDevice: PhysicalDevice;
      pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR;
      pPresentModeCount: ptr uint32;
      pPresentModes: ptr PresentModeKHR;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceSurfacePresentModes2EXTCage(physicalDevice,pSurfaceInfo,pPresentModeCount,pPresentModes)
proc acquireFullScreenExclusiveModeEXT*(
      device: Device;
      swapchain: SwapchainKHR;
    ): Result {.cdecl, discardable.} =
  acquireFullScreenExclusiveModeEXTCage(device,swapchain)
proc releaseFullScreenExclusiveModeEXT*(
      device: Device;
      swapchain: SwapchainKHR;
    ): Result {.cdecl, discardable.} =
  releaseFullScreenExclusiveModeEXTCage(device,swapchain)


var # command cages
  getDeviceGroupSurfacePresentModes2EXTCage: proc(device: Device; pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR; pModes: ptr DeviceGroupPresentModeFlagsKHR;): Result {.cdecl.}
proc getDeviceGroupSurfacePresentModes2EXT*(
      device: Device;
      pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR;
      pModes: ptr DeviceGroupPresentModeFlagsKHR;
    ): Result {.cdecl, discardable.} =
  getDeviceGroupSurfacePresentModes2EXTCage(device,pSurfaceInfo,pModes)

proc loadVK_EXT_full_screen_exclusive*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceSurfacePresentModes2EXTCage << "vkGetPhysicalDeviceSurfacePresentModes2EXT"
  acquireFullScreenExclusiveModeEXTCage << "vkAcquireFullScreenExclusiveModeEXT"
  releaseFullScreenExclusiveModeEXTCage << "vkReleaseFullScreenExclusiveModeEXT"

  getDeviceGroupSurfacePresentModes2EXTCage << "vkGetDeviceGroupSurfacePresentModes2EXT"

  getDeviceGroupSurfacePresentModes2EXTCage << "vkGetDeviceGroupSurfacePresentModes2EXT"