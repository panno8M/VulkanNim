# Generated at 2021-08-27T06:01:02Z
# VK_KHR_get_display_properties2
# =================================

import ../platform
import ../features/vk10
import VK_KHR_display


const
  KhrGetDisplayProperties2SpecVersion* = 1
  KhrGetDisplayProperties2ExtensionName* = "VK_KHR_get_display_properties2"

type
  DisplayProperties2KHR* = object
    sType*: StructureType
    pNext*: pointer
    displayProperties*: DisplayPropertiesKHR
  DisplayPlaneProperties2KHR* = object
    sType*: StructureType
    pNext*: pointer
    displayPlaneProperties*: DisplayPlanePropertiesKHR
  DisplayModeProperties2KHR* = object
    sType*: StructureType
    pNext*: pointer
    displayModeProperties*: DisplayModePropertiesKHR
  DisplayPlaneInfo2KHR* = object
    sType*: StructureType
    pNext*: pointer
    mode*: DisplayModeKHR
    planeIndex*: uint32
  DisplayPlaneCapabilities2KHR* = object
    sType*: StructureType
    pNext*: pointer
    capabilities*: DisplayPlaneCapabilitiesKHR

var # commands
  getPhysicalDeviceDisplayProperties2KHRCage: proc(physicalDevice: PhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr DisplayProperties2KHR;): Result {.cdecl.}
  getPhysicalDeviceDisplayPlaneProperties2KHRCage: proc(physicalDevice: PhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr DisplayPlaneProperties2KHR;): Result {.cdecl.}
  getDisplayModeProperties2KHRCage: proc(physicalDevice: PhysicalDevice; display: DisplayKHR; pPropertyCount: ptr uint32; pProperties: ptr DisplayModeProperties2KHR;): Result {.cdecl.}
  getDisplayPlaneCapabilities2KHRCage: proc(physicalDevice: PhysicalDevice; pDisplayPlaneInfo: ptr DisplayPlaneInfo2KHR; pCapabilities: ptr DisplayPlaneCapabilities2KHR;): Result {.cdecl.}
proc getPhysicalDeviceDisplayProperties2KHR*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties: ptr DisplayProperties2KHR;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceDisplayProperties2KHRCage(physicalDevice,pPropertyCount,pProperties)
proc getPhysicalDeviceDisplayPlaneProperties2KHR*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties: ptr DisplayPlaneProperties2KHR;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceDisplayPlaneProperties2KHRCage(physicalDevice,pPropertyCount,pProperties)
proc getDisplayModeProperties2KHR*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
      pPropertyCount: ptr uint32;
      pProperties: ptr DisplayModeProperties2KHR;
    ): Result {.cdecl, discardable.} =
  getDisplayModeProperties2KHRCage(physicalDevice,display,pPropertyCount,pProperties)
proc getDisplayPlaneCapabilities2KHR*(
      physicalDevice: PhysicalDevice;
      pDisplayPlaneInfo: ptr DisplayPlaneInfo2KHR;
      pCapabilities: ptr DisplayPlaneCapabilities2KHR;
    ): Result {.cdecl, discardable.} =
  getDisplayPlaneCapabilities2KHRCage(physicalDevice,pDisplayPlaneInfo,pCapabilities)
proc loadVK_KHR_get_display_properties2*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceDisplayProperties2KHRCage << "vkGetPhysicalDeviceDisplayProperties2KHR"
  getPhysicalDeviceDisplayPlaneProperties2KHRCage << "vkGetPhysicalDeviceDisplayPlaneProperties2KHR"
  getDisplayModeProperties2KHRCage << "vkGetDisplayModeProperties2KHR"
  getDisplayPlaneCapabilities2KHRCage << "vkGetDisplayPlaneCapabilities2KHR"