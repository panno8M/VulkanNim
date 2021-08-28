# Generated at 2021-08-28T12:28:01Z
# VK_EXT_full_screen_exclusive
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2
import VK_KHR_surface
import VK_KHR_get_surface_capabilities2
import VK_KHR_swapchain


const
  ExtFullScreenExclusiveSpecVersion* = 4
  ExtFullScreenExclusiveExtensionName* = "VK_EXT_full_screen_exclusive"

type
  FullScreenExclusiveEXT* {.size: sizeof(int32), pure.} = enum
    defaultExt = 0
    allowedExt = 1
    disallowedExt = 2
    applicationControlledExt = 3
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

var # commands
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


var # commands
  getDeviceGroupSurfacePresentModes2EXTCage: proc(device: Device; pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR; pModes: ptr DeviceGroupPresentModeFlagsKHR;): Result {.cdecl.}
proc getDeviceGroupSurfacePresentModes2EXT*(
      device: Device;
      pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR;
      pModes: ptr DeviceGroupPresentModeFlagsKHR;
    ): Result {.cdecl, discardable.} =
  getDeviceGroupSurfacePresentModes2EXTCage(device,pSurfaceInfo,pModes)


var # commands
proc loadVK_EXT_full_screen_exclusive*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceSurfacePresentModes2EXTCage << "vkGetPhysicalDeviceSurfacePresentModes2EXT"
  acquireFullScreenExclusiveModeEXTCage << "vkAcquireFullScreenExclusiveModeEXT"
  releaseFullScreenExclusiveModeEXTCage << "vkReleaseFullScreenExclusiveModeEXT"

  getDeviceGroupSurfacePresentModes2EXTCage << "vkGetDeviceGroupSurfacePresentModes2EXT"

  getDeviceGroupSurfacePresentModes2EXTCage << "vkGetDeviceGroupSurfacePresentModes2EXT"
