
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2
import VK_KHR_surface
import VK_KHR_get_surface_capabilities2
import VK_KHR_swapchain


type
  SurfaceCapabilitiesFullScreenExclusiveEXT* = object
    sType*: StructureType
    pNext*: pointer
    fullScreenExclusiveSupported*: Bool32
  SurfaceFullScreenExclusiveInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    fullScreenExclusive*: FullScreenExclusiveEXT
  FullScreenExclusiveEXT* {.size: sizeof(int32), pure.} = enum
    Default = 0
    Allowed = 1
    Disallowed = 2
    ApplicationControlled = 3

  SurfaceFullScreenExclusiveWin32InfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    hmonitor*: HMONITOR

const ExtFullScreenExclusiveSpecVersion* = 4
const ExtFullScreenExclusiveExtensionName* = "VK_EXT_full_screen_exclusive"
var # commands
  getPhysicalDeviceSurfacePresentModes2EXTCage: proc(physicalDevice: PhysicalDevice; pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR; pPresentModeCount: ptr uint32; pPresentModes: ptr PresentModeKHR;): Result {.cdecl.}
  releaseFullScreenExclusiveModeEXTCage: proc(device: Device; swapchain: SwapchainKHR;): Result {.cdecl.}
  acquireFullScreenExclusiveModeEXTCage: proc(device: Device; swapchain: SwapchainKHR;): Result {.cdecl.}

proc getPhysicalDeviceSurfacePresentModes2EXT*(
      physicalDevice: PhysicalDevice;
      pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR;
      pPresentModeCount: ptr uint32;
      pPresentModes: ptr PresentModeKHR;
    ): Result {.cdecl.} =
  getPhysicalDeviceSurfacePresentModes2EXTCage(physicalDevice,pSurfaceInfo,pPresentModeCount,pPresentModes)

proc releaseFullScreenExclusiveModeEXT*(
      device: Device;
      swapchain: SwapchainKHR;
    ): Result {.cdecl.} =
  releaseFullScreenExclusiveModeEXTCage(device,swapchain)

proc acquireFullScreenExclusiveModeEXT*(
      device: Device;
      swapchain: SwapchainKHR;
    ): Result {.cdecl.} =
  acquireFullScreenExclusiveModeEXTCage(device,swapchain)



var # commands
  getDeviceGroupSurfacePresentModes2EXTCage: proc(device: Device; pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR; pModes: ptr DeviceGroupPresentModeFlagsKHR;): Result {.cdecl.}

proc getDeviceGroupSurfacePresentModes2EXT*(
      device: Device;
      pSurfaceInfo: ptr PhysicalDeviceSurfaceInfo2KHR;
      pModes: ptr DeviceGroupPresentModeFlagsKHR;
    ): Result {.cdecl.} =
  getDeviceGroupSurfacePresentModes2EXTCage(device,pSurfaceInfo,pModes)


var # commands


proc loadVK_EXT_full_screen_exclusive*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceSurfacePresentModes2EXTCage << "vkGetPhysicalDeviceSurfacePresentModes2EXT"
  releaseFullScreenExclusiveModeEXTCage << "vkReleaseFullScreenExclusiveModeEXT"
  acquireFullScreenExclusiveModeEXTCage << "vkAcquireFullScreenExclusiveModeEXT"

  getDeviceGroupSurfacePresentModes2EXTCage << "vkGetDeviceGroupSurfacePresentModes2EXT"

  getDeviceGroupSurfacePresentModes2EXTCage << "vkGetDeviceGroupSurfacePresentModes2EXT"