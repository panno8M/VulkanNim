# Generated at 2021-12-25T14:19:39Z
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

