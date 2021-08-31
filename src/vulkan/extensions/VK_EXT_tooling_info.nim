# Generated at 2021-08-31T05:19:03Z
# VK_EXT_tooling_info


import ../platform
import ../features/vk10
import ./VK_EXT_debug_report
import ./VK_EXT_debug_marker
import ./VK_EXT_debug_utils
export VK_EXT_debug_report
export VK_EXT_debug_marker
export VK_EXT_debug_utils

const
  ExtToolingInfoSpecVersion* = 1
  ExtToolingInfoExtensionName* = "VK_EXT_tooling_info"
  MaxExtensionNameSize* = 256
  MaxDescriptionSize* = 256

type # enums and bitmasks
  ToolPurposeFlagBitsEXT* {.size: sizeof(int32), pure.} = enum
    validationExt = 0x00000001
    profilingExt = 0x00000002
    tracingExt = 0x00000004
    additionalFeaturesExt = 0x00000008
    modifyingFeaturesExt = 0x00000010
    # Provided by VK_EXT_tooling_info
    debugReportingExt = 0x00000020
    # Provided by VK_EXT_tooling_info
    debugMarkersExt = 0x00000040
  ToolPurposeFlagsEXT* = Flags[ToolPurposeFlagBitsEXT]

type
  PhysicalDeviceToolPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    name*: array[MaxExtensionNameSize, char]
    version*: array[MaxExtensionNameSize, char]
    purposes*: ToolPurposeFlagsEXT
    description*: array[MaxDescriptionSize, char]
    layer*: array[MaxExtensionNameSize, char]

var # command cages
  getPhysicalDeviceToolPropertiesEXTCage: proc(physicalDevice: PhysicalDevice; pToolCount: ptr uint32; pToolProperties: ptr PhysicalDeviceToolPropertiesEXT;): Result {.cdecl.}
proc getPhysicalDeviceToolPropertiesEXT*(
      physicalDevice: PhysicalDevice;
      pToolCount: ptr uint32;
      pToolProperties: ptr PhysicalDeviceToolPropertiesEXT;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceToolPropertiesEXTCage(physicalDevice,pToolCount,pToolProperties)

proc loadVK_EXT_tooling_info*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceToolPropertiesEXTCage << "vkGetPhysicalDeviceToolPropertiesEXT"