# Generated at 2021-12-22T13:50:05Z
# VK_EXT_tooling_info

import ../platform
import ../features/vk10
import ./VK_EXT_debug_report
import ./VK_EXT_debug_marker
import ./VK_EXT_debug_utils
export VK_EXT_debug_report
export VK_EXT_debug_marker
export VK_EXT_debug_utils

prepareVulkanLibDef()

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
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory),
      lazyload("vkGetPhysicalDeviceToolPropertiesEXT", InstanceLevel).}

proc loadAllVK_EXT_tooling_info*(instance: Instance) =
  instance.loadCommand getPhysicalDeviceToolPropertiesEXT

proc loadVK_EXT_tooling_info*(instance: Instance) =
  instance.loadCommand getPhysicalDeviceToolPropertiesEXT

