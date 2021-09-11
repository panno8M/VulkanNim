# Generated at 2021-09-10T05:27:58Z
# VK_KHR_get_display_properties2


import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

const
  KhrGetDisplayProperties2SpecVersion* = 1
  KhrGetDisplayProperties2ExtensionName* = "VK_KHR_get_display_properties2"

type
  DisplayProperties2KHR* = object
    sType* {.constant: (StructureType.displayProperties2Khr).}: StructureType
    pNext* {.optional.}: pointer
    displayProperties*: DisplayPropertiesKHR
  DisplayPlaneProperties2KHR* = object
    sType* {.constant: (StructureType.displayPlaneProperties2Khr).}: StructureType
    pNext* {.optional.}: pointer
    displayPlaneProperties*: DisplayPlanePropertiesKHR
  DisplayModeProperties2KHR* = object
    sType* {.constant: (StructureType.displayModeProperties2Khr).}: StructureType
    pNext* {.optional.}: pointer
    displayModeProperties*: DisplayModePropertiesKHR
  DisplayPlaneInfo2KHR* = object
    sType* {.constant: (StructureType.displayPlaneInfo2Khr).}: StructureType
    pNext* {.optional.}: pointer
    mode*: DisplayModeKHR
    planeIndex*: uint32
  DisplayPlaneCapabilities2KHR* = object
    sType* {.constant: (StructureType.displayPlaneCapabilities2Khr).}: StructureType
    pNext* {.optional.}: pointer
    capabilities*: DisplayPlaneCapabilitiesKHR

proc getPhysicalDeviceDisplayProperties2KHR*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties: ptr DisplayProperties2KHR;
    ): Result {.cdecl, lazyload("vkGetPhysicalDeviceDisplayProperties2KHR", InstanceLevel).}
proc getPhysicalDeviceDisplayPlaneProperties2KHR*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties: ptr DisplayPlaneProperties2KHR;
    ): Result {.cdecl, lazyload("vkGetPhysicalDeviceDisplayPlaneProperties2KHR", InstanceLevel).}
proc getDisplayModeProperties2KHR*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
      pPropertyCount: ptr uint32;
      pProperties: ptr DisplayModeProperties2KHR;
    ): Result {.cdecl, lazyload("vkGetDisplayModeProperties2KHR", InstanceLevel).}
proc getDisplayPlaneCapabilities2KHR*(
      physicalDevice: PhysicalDevice;
      pDisplayPlaneInfo: ptr DisplayPlaneInfo2KHR;
      pCapabilities: ptr DisplayPlaneCapabilities2KHR;
    ): Result {.cdecl, lazyload("vkGetDisplayPlaneCapabilities2KHR", InstanceLevel).}

proc loadAllVK_KHR_get_display_properties2*(instance: Instance) =
  getPhysicalDeviceDisplayProperties2KHR.smartLoad(instance)
  getPhysicalDeviceDisplayPlaneProperties2KHR.smartLoad(instance)
  getDisplayModeProperties2KHR.smartLoad(instance)
  getDisplayPlaneCapabilities2KHR.smartLoad(instance)

proc loadVK_KHR_get_display_properties2*(instance: Instance) =
  getPhysicalDeviceDisplayProperties2KHR.smartLoad(instance)
  getPhysicalDeviceDisplayPlaneProperties2KHR.smartLoad(instance)
  getDisplayModeProperties2KHR.smartLoad(instance)
  getDisplayPlaneCapabilities2KHR.smartLoad(instance)

