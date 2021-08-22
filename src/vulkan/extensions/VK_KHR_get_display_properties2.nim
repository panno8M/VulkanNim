
import ../platform
import ../features/vk10
import VK_KHR_display


type
  DisplayPlaneCapabilities2KHR* = object
    sType*: StructureType
    pNext*: pointer
    capabilities*: DisplayPlaneCapabilitiesKHR
  DisplayProperties2KHR* = object
    sType*: StructureType
    pNext*: pointer
    displayProperties*: DisplayPropertiesKHR
  DisplayPlaneInfo2KHR* = object
    sType*: StructureType
    pNext*: pointer
    mode*: DisplayModeKHR
    planeIndex*: uint32
  DisplayPlaneProperties2KHR* = object
    sType*: StructureType
    pNext*: pointer
    displayPlaneProperties*: DisplayPlanePropertiesKHR
  DisplayModeProperties2KHR* = object
    sType*: StructureType
    pNext*: pointer
    displayModeProperties*: DisplayModePropertiesKHR

const KhrGetDisplayProperties2ExtensionName* = "VK_KHR_get_display_properties2"
const KhrGetDisplayProperties2SpecVersion* = 1
var # commands
  getDisplayPlaneCapabilities2KHRCage: proc(physicalDevice: PhysicalDevice; pDisplayPlaneInfo: ptr DisplayPlaneInfo2KHR; pCapabilities: ptr DisplayPlaneCapabilities2KHR;): Result {.cdecl.}
  getDisplayModeProperties2KHRCage: proc(physicalDevice: PhysicalDevice; display: DisplayKHR; pPropertyCount: ptr uint32; pProperties: ptr DisplayModeProperties2KHR;): Result {.cdecl.}
  getPhysicalDeviceDisplayPlaneProperties2KHRCage: proc(physicalDevice: PhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr DisplayPlaneProperties2KHR;): Result {.cdecl.}
  getPhysicalDeviceDisplayProperties2KHRCage: proc(physicalDevice: PhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr DisplayProperties2KHR;): Result {.cdecl.}

proc getDisplayPlaneCapabilities2KHR*(
      physicalDevice: PhysicalDevice;
      pDisplayPlaneInfo: ptr DisplayPlaneInfo2KHR;
      pCapabilities: ptr DisplayPlaneCapabilities2KHR;
    ): Result {.cdecl.} =
  getDisplayPlaneCapabilities2KHRCage(physicalDevice,pDisplayPlaneInfo,pCapabilities)

proc getDisplayModeProperties2KHR*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
      pPropertyCount: ptr uint32;
      pProperties: ptr DisplayModeProperties2KHR;
    ): Result {.cdecl.} =
  getDisplayModeProperties2KHRCage(physicalDevice,display,pPropertyCount,pProperties)

proc getPhysicalDeviceDisplayPlaneProperties2KHR*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties: ptr DisplayPlaneProperties2KHR;
    ): Result {.cdecl.} =
  getPhysicalDeviceDisplayPlaneProperties2KHRCage(physicalDevice,pPropertyCount,pProperties)

proc getPhysicalDeviceDisplayProperties2KHR*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties: ptr DisplayProperties2KHR;
    ): Result {.cdecl.} =
  getPhysicalDeviceDisplayProperties2KHRCage(physicalDevice,pPropertyCount,pProperties)


proc loadVK_KHR_get_display_properties2*(instance: Instance) =
  instance.defineLoader(`<<`)

  getDisplayPlaneCapabilities2KHRCage << "vkGetDisplayPlaneCapabilities2KHR"
  getDisplayModeProperties2KHRCage << "vkGetDisplayModeProperties2KHR"
  getPhysicalDeviceDisplayPlaneProperties2KHRCage << "vkGetPhysicalDeviceDisplayPlaneProperties2KHR"
  getPhysicalDeviceDisplayProperties2KHRCage << "vkGetPhysicalDeviceDisplayProperties2KHR"