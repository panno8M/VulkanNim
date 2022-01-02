# VK_KHR_display

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  KhrDisplaySpecVersion* = 23
  KhrDisplayExtensionName* = "VK_KHR_display"

type
  DisplayModeCreateInfoKHR* = object
    sType* {.constant: (StructureType.displayModeCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DisplayModeCreateFlagsKHR
    parameters*: DisplayModeParametersKHR
  DisplayModeParametersKHR* = object
    visibleRegion*: Extent2D
    refreshRate*: uint32
  DisplayModePropertiesKHR* = object
    displayMode*: DisplayModeKHR
    parameters*: DisplayModeParametersKHR
  DisplayPlaneCapabilitiesKHR* = object
    supportedAlpha* {.optional.}: DisplayPlaneAlphaFlagsKHR
    minSrcPosition*: Offset2D
    maxSrcPosition*: Offset2D
    minSrcExtent*: Extent2D
    maxSrcExtent*: Extent2D
    minDstPosition*: Offset2D
    maxDstPosition*: Offset2D
    minDstExtent*: Extent2D
    maxDstExtent*: Extent2D
  DisplayPlanePropertiesKHR* = object
    currentDisplay*: DisplayKHR
    currentStackIndex*: uint32
  DisplayPropertiesKHR* = object
    display*: DisplayKHR
    displayName*: cstring
    physicalDimensions*: Extent2D
    physicalResolution*: Extent2D
    supportedTransforms* {.optional.}: SurfaceTransformFlagsKHR
    planeReorderPossible*: Bool32
    persistentContent*: Bool32
  DisplaySurfaceCreateInfoKHR* = object
    sType* {.constant: (StructureType.displaySurfaceCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DisplaySurfaceCreateFlagsKHR
    displayMode*: DisplayModeKHR
    planeIndex*: uint32
    planeStackIndex*: uint32
    transform*: SurfaceTransformFlagBitsKHR
    globalAlpha*: float32
    alphaMode*: DisplayPlaneAlphaFlagBitsKHR
    imageExtent*: Extent2D

proc getPhysicalDeviceDisplayPropertiesKHR*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[DisplayPropertiesKHR]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkGetPhysicalDeviceDisplayPropertiesKHR", InstanceLevel).}
proc getPhysicalDeviceDisplayPlanePropertiesKHR*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[DisplayPlanePropertiesKHR]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkGetPhysicalDeviceDisplayPlanePropertiesKHR", InstanceLevel).}
proc getDisplayPlaneSupportedDisplaysKHR*(
      physicalDevice: PhysicalDevice;
      planeIndex: uint32;
      pDisplayCount: ptr uint32;
      pDisplays {.length: pDisplayCount.} = default(arrPtr[DisplayKHR]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkGetDisplayPlaneSupportedDisplaysKHR", InstanceLevel).}
proc getDisplayModePropertiesKHR*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[DisplayModePropertiesKHR]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkGetDisplayModePropertiesKHR", InstanceLevel).}
proc createDisplayModeKHR*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
      pCreateInfo: ptr DisplayModeCreateInfoKHR;
      pAllocator = default(ptr AllocationCallbacks);
      pMode: ptr DisplayModeKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorInitializationFailed],
      lazyload("vkCreateDisplayModeKHR", InstanceLevel).}
proc getDisplayPlaneCapabilitiesKHR*(
      physicalDevice: PhysicalDevice;
      mode: DisplayModeKHR;
      planeIndex: uint32;
      pCapabilities: ptr DisplayPlaneCapabilitiesKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkGetDisplayPlaneCapabilitiesKHR", InstanceLevel).}
proc createDisplayPlaneSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr DisplaySurfaceCreateInfoKHR;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkCreateDisplayPlaneSurfaceKHR", InstanceLevel).}

proc loadAllVK_KHR_display*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceDisplayPropertiesKHR
  getPhysicalDeviceDisplayPlanePropertiesKHR
  getDisplayPlaneSupportedDisplaysKHR
  getDisplayModePropertiesKHR
  createDisplayModeKHR
  getDisplayPlaneCapabilitiesKHR
  createDisplayPlaneSurfaceKHR
proc loadVK_KHR_display*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceDisplayPropertiesKHR
  getPhysicalDeviceDisplayPlanePropertiesKHR
  getDisplayPlaneSupportedDisplaysKHR
  getDisplayModePropertiesKHR
  createDisplayModeKHR
  getDisplayPlaneCapabilitiesKHR
  createDisplayPlaneSurfaceKHR
