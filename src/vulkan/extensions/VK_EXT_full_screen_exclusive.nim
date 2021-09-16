# Generated at 2021-09-16T08:32:06Z
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
    sType* {.constant: (StructureType.surfaceFullScreenExclusiveInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    fullScreenExclusive*: FullScreenExclusiveEXT
  SurfaceCapabilitiesFullScreenExclusiveEXT* = object
    sType* {.constant: (StructureType.surfaceCapabilitiesFullScreenExclusiveExt).}: StructureType
    pNext* {.optional.}: pointer
    fullScreenExclusiveSupported*: Bool32

  SurfaceFullScreenExclusiveWin32InfoEXT* = object
    sType* {.constant: (StructureType.surfaceFullScreenExclusiveWin32InfoExt).}: StructureType
    pNext* {.optional.}: pointer
    hmonitor*: HMONITOR

proc getPhysicalDeviceSurfacePresentModes2EXT*(
      physicalDevice: PhysicalDevice;
      pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR;
      pPresentModeCount: ptr uint32;
      pPresentModes {.length: pPresentModeCount.} = default(ptr PresentModeKHR);
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
  getPhysicalDeviceSurfacePresentModes2EXT.load(instance)
  acquireFullScreenExclusiveModeEXT.load(instance)
  releaseFullScreenExclusiveModeEXT.load(instance)

  getDeviceGroupSurfacePresentModes2EXT.load(instance)

  getDeviceGroupSurfacePresentModes2EXT.load(instance)

proc loadVK_EXT_full_screen_exclusive*(instance: Instance) =
  getPhysicalDeviceSurfacePresentModes2EXT.load(instance)

proc loadVK_EXT_full_screen_exclusive*(device: Device) =
  acquireFullScreenExclusiveModeEXT.load(device)
  releaseFullScreenExclusiveModeEXT.load(device)

  getDeviceGroupSurfacePresentModes2EXT.load(device)

  getDeviceGroupSurfacePresentModes2EXT.load(device)

