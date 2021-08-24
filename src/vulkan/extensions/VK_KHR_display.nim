
import ../platform
import ../features/vk10
import VK_KHR_surface


type
  DisplayModeCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DisplayModeCreateFlagsKHR
    parameters*: DisplayModeParametersKHR
  DisplaySurfaceCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DisplaySurfaceCreateFlagsKHR
    displayMode*: DisplayModeKHR
    planeIndex*: uint32
    planeStackIndex*: uint32
    transform*: SurfaceTransformFlagBitsKHR
    globalAlpha*: float32
    alphaMode*: DisplayPlaneAlphaFlagBitsKHR
    imageExtent*: Extent2D
  DisplayKHR* = distinct NonDispatchableHandle
  DisplayModeCreateFlagsKHR* = distinct Flags
  DisplayPlaneCapabilitiesKHR* = object
    supportedAlpha*: DisplayPlaneAlphaFlagsKHR
    minSrcPosition*: Offset2D
    maxSrcPosition*: Offset2D
    minSrcExtent*: Extent2D
    maxSrcExtent*: Extent2D
    minDstPosition*: Offset2D
    maxDstPosition*: Offset2D
    minDstExtent*: Extent2D
    maxDstExtent*: Extent2D
  DisplayPlaneAlphaFlagsKHR* = distinct Flags
  DisplayPropertiesKHR* = object
    display*: DisplayKHR
    displayName*: cstring
    physicalDimensions*: Extent2D
    physicalResolution*: Extent2D
    supportedTransforms*: SurfaceTransformFlagsKHR
    planeReorderPossible*: Bool32
    persistentContent*: Bool32
  DisplayModeParametersKHR* = object
    visibleRegion*: Extent2D
    refreshRate*: uint32
  DisplayPlanePropertiesKHR* = object
    currentDisplay*: DisplayKHR
    currentStackIndex*: uint32
  DisplayPlaneAlphaFlagBitsKHR* = UnusedEnum
  DisplayModeKHR* = distinct NonDispatchableHandle
  DisplayModePropertiesKHR* = object
    displayMode*: DisplayModeKHR
    parameters*: DisplayModeParametersKHR
  SurfaceTransformFlagsKHR* = distinct Flags
  DisplaySurfaceCreateFlagsKHR* = distinct Flags

const KhrDisplayExtensionName* = "VK_KHR_display"
const KhrDisplaySpecVersion* = 23
var # commands
  getPhysicalDeviceDisplayPropertiesKHRCage: proc(physicalDevice: PhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr DisplayPropertiesKHR;): Result {.cdecl.}
  createDisplayPlaneSurfaceKHRCage: proc(instance: Instance; pCreateInfo: ptr DisplaySurfaceCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pSurface: ptr SurfaceKHR;): Result {.cdecl.}
  getDisplayModePropertiesKHRCage: proc(physicalDevice: PhysicalDevice; display: DisplayKHR; pPropertyCount: ptr uint32; pProperties: ptr DisplayModePropertiesKHR;): Result {.cdecl.}
  getPhysicalDeviceDisplayPlanePropertiesKHRCage: proc(physicalDevice: PhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr DisplayPlanePropertiesKHR;): Result {.cdecl.}
  getDisplayPlaneSupportedDisplaysKHRCage: proc(physicalDevice: PhysicalDevice; planeIndex: uint32; pDisplayCount: ptr uint32; pDisplays: ptr DisplayKHR;): Result {.cdecl.}
  getDisplayPlaneCapabilitiesKHRCage: proc(physicalDevice: PhysicalDevice; mode: DisplayModeKHR; planeIndex: uint32; pCapabilities: ptr DisplayPlaneCapabilitiesKHR;): Result {.cdecl.}
  createDisplayModeKHRCage: proc(physicalDevice: PhysicalDevice; display: DisplayKHR; pCreateInfo: ptr DisplayModeCreateInfoKHR; pAllocator: ptr AllocationCallbacks; pMode: ptr DisplayModeKHR;): Result {.cdecl.}

proc getPhysicalDeviceDisplayPropertiesKHR*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties: ptr DisplayPropertiesKHR;
    ): Result {.cdecl.} =
  getPhysicalDeviceDisplayPropertiesKHRCage(physicalDevice,pPropertyCount,pProperties)

proc createDisplayPlaneSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr DisplaySurfaceCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl.} =
  createDisplayPlaneSurfaceKHRCage(instance,pCreateInfo,pAllocator,pSurface)

proc getDisplayModePropertiesKHR*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
      pPropertyCount: ptr uint32;
      pProperties: ptr DisplayModePropertiesKHR;
    ): Result {.cdecl.} =
  getDisplayModePropertiesKHRCage(physicalDevice,display,pPropertyCount,pProperties)

proc getPhysicalDeviceDisplayPlanePropertiesKHR*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties: ptr DisplayPlanePropertiesKHR;
    ): Result {.cdecl.} =
  getPhysicalDeviceDisplayPlanePropertiesKHRCage(physicalDevice,pPropertyCount,pProperties)

proc getDisplayPlaneSupportedDisplaysKHR*(
      physicalDevice: PhysicalDevice;
      planeIndex: uint32;
      pDisplayCount: ptr uint32;
      pDisplays: ptr DisplayKHR;
    ): Result {.cdecl.} =
  getDisplayPlaneSupportedDisplaysKHRCage(physicalDevice,planeIndex,pDisplayCount,pDisplays)

proc getDisplayPlaneCapabilitiesKHR*(
      physicalDevice: PhysicalDevice;
      mode: DisplayModeKHR;
      planeIndex: uint32;
      pCapabilities: ptr DisplayPlaneCapabilitiesKHR;
    ): Result {.cdecl.} =
  getDisplayPlaneCapabilitiesKHRCage(physicalDevice,mode,planeIndex,pCapabilities)

proc createDisplayModeKHR*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
      pCreateInfo: ptr DisplayModeCreateInfoKHR;
      pAllocator: ptr AllocationCallbacks;
      pMode: ptr DisplayModeKHR;
    ): Result {.cdecl.} =
  createDisplayModeKHRCage(physicalDevice,display,pCreateInfo,pAllocator,pMode)


proc loadVK_KHR_display*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceDisplayPropertiesKHRCage << "vkGetPhysicalDeviceDisplayPropertiesKHR"
  createDisplayPlaneSurfaceKHRCage << "vkCreateDisplayPlaneSurfaceKHR"
  getDisplayModePropertiesKHRCage << "vkGetDisplayModePropertiesKHR"
  getPhysicalDeviceDisplayPlanePropertiesKHRCage << "vkGetPhysicalDeviceDisplayPlanePropertiesKHR"
  getDisplayPlaneSupportedDisplaysKHRCage << "vkGetDisplayPlaneSupportedDisplaysKHR"
  getDisplayPlaneCapabilitiesKHRCage << "vkGetDisplayPlaneCapabilitiesKHR"
  createDisplayModeKHRCage << "vkCreateDisplayModeKHR"