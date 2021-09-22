# Generated at 2021-09-23T04:24:54Z
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
    sType* {.constant: (StructureType.physicalDeviceToolPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    name*: array[MaxExtensionNameSize, char]
    version*: array[MaxExtensionNameSize, char]
    purposes*: ToolPurposeFlagsEXT
    description*: array[MaxDescriptionSize, char]
    layer*: array[MaxExtensionNameSize, char]

proc getPhysicalDeviceToolPropertiesEXT*(
      physicalDevice: PhysicalDevice;
      pToolCount: ptr uint32;
      pToolProperties {.length: pToolCount.} = default(arrPtr[PhysicalDeviceToolPropertiesEXT]);
    ): Result {.cdecl, lazyload("vkGetPhysicalDeviceToolPropertiesEXT", InstanceLevel).}

proc loadAllVK_EXT_tooling_info*(instance: Instance) =
  getPhysicalDeviceToolPropertiesEXT.load(instance)

proc loadVK_EXT_tooling_info*(instance: Instance) =
  getPhysicalDeviceToolPropertiesEXT.load(instance)

