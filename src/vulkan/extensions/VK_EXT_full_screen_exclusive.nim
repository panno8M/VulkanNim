# Generated at 2021-12-26T10:42:47Z
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
prepareVulkanLibDef()

const
  ExtFullScreenExclusiveSpecVersion* = 4
  ExtFullScreenExclusiveExtensionName* = "VK_EXT_full_screen_exclusive"

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
      pPresentModes {.length: pPresentModeCount.} = default(arrPtr[PresentModeKHR]);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorSurfaceLostKhr),
      lazyload("vkGetPhysicalDeviceSurfacePresentModes2EXT", InstanceLevel).}
proc acquireFullScreenExclusiveModeEXT*(
      device: Device;
      swapchain: SwapchainKHR;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInitializationFailed, errorSurfaceLostKhr),
      lazyload("vkAcquireFullScreenExclusiveModeEXT", DeviceLevel).}
proc releaseFullScreenExclusiveModeEXT*(
      device: Device;
      swapchain: SwapchainKHR;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorSurfaceLostKhr),
      lazyload("vkReleaseFullScreenExclusiveModeEXT", DeviceLevel).}


proc getDeviceGroupSurfacePresentModes2EXT*(
      device: Device;
      pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR;
      pModes: ptr DeviceGroupPresentModeFlagsKHR;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorSurfaceLostKhr),
      lazyload("vkGetDeviceGroupSurfacePresentModes2EXT", DeviceLevel).}

proc loadAllVK_EXT_full_screen_exclusive*(instance: Instance) =
  instance.loadCommand getPhysicalDeviceSurfacePresentModes2EXT
  instance.loadCommand acquireFullScreenExclusiveModeEXT
  instance.loadCommand releaseFullScreenExclusiveModeEXT

  instance.loadCommand getDeviceGroupSurfacePresentModes2EXT

  instance.loadCommand getDeviceGroupSurfacePresentModes2EXT

proc loadVK_EXT_full_screen_exclusive*(instance: Instance) =
  instance.loadCommand getPhysicalDeviceSurfacePresentModes2EXT

proc loadVK_EXT_full_screen_exclusive*(device: Device) =
  device.loadCommand acquireFullScreenExclusiveModeEXT
  device.loadCommand releaseFullScreenExclusiveModeEXT

  device.loadCommand getDeviceGroupSurfacePresentModes2EXT

  device.loadCommand getDeviceGroupSurfacePresentModes2EXT

