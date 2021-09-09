# Generated at 2021-09-09T01:49:36Z
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

proc getPhysicalDeviceSurfacePresentModes2EXT*(
      physicalDevice: PhysicalDevice;
      pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR;
      pPresentModeCount: ptr uint32;
      pPresentModes: ptr PresentModeKHR;
    ): Result {.cdecl, lazyload("vkGetPhysicalDeviceSurfacePresentModes2EXT", InstanceLevel).}
proc acquireFullScreenExclusiveModeEXT*(
      device: Device;
      swapchain: SwapchainKHR;
    ): Result {.cdecl, lazyload("vkAcquireFullScreenExclusiveModeEXT", DeviceLevel).}
proc releaseFullScreenExclusiveModeEXT*(
      device: Device;
      swapchain: SwapchainKHR;
    ): Result {.cdecl, lazyload("vkReleaseFullScreenExclusiveModeEXT", DeviceLevel).}


proc getDeviceGroupSurfacePresentModes2EXT*(
      device: Device;
      pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR;
      pModes: ptr DeviceGroupPresentModeFlagsKHR;
    ): Result {.cdecl, lazyload("vkGetDeviceGroupSurfacePresentModes2EXT", DeviceLevel).}

proc loadAllVK_EXT_full_screen_exclusive*(instance: Instance) =
  getPhysicalDeviceSurfacePresentModes2EXT.smartLoad(instance)
  acquireFullScreenExclusiveModeEXT.smartLoad(instance)
  releaseFullScreenExclusiveModeEXT.smartLoad(instance)

  getDeviceGroupSurfacePresentModes2EXT.smartLoad(instance)

  getDeviceGroupSurfacePresentModes2EXT.smartLoad(instance)

proc loadVK_EXT_full_screen_exclusive*(instance: Instance) =
  getPhysicalDeviceSurfacePresentModes2EXT.smartLoad(instance)

proc loadVK_EXT_full_screen_exclusive*(device: Device) =
  acquireFullScreenExclusiveModeEXT.smartLoad(device)
  releaseFullScreenExclusiveModeEXT.smartLoad(device)

  getDeviceGroupSurfacePresentModes2EXT.smartLoad(device)

  getDeviceGroupSurfacePresentModes2EXT.smartLoad(device)

