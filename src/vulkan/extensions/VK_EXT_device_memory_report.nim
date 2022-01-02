# VK_EXT_device_memory_report

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtDeviceMemoryReportSpecVersion* = 2
  ExtDeviceMemoryReportExtensionName* = "VK_EXT_device_memory_report"

type
  PhysicalDeviceDeviceMemoryReportFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceDeviceMemoryReportFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    deviceMemoryReport*: Bool32
  DeviceDeviceMemoryReportCreateInfoEXT* = object
    sType* {.constant: (StructureType.deviceDeviceMemoryReportCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    flags*: DeviceMemoryReportFlagsEXT
    pfnUserCallback*: PFN_DeviceMemoryReportCallbackEXT
    pUserData*: pointer
  DeviceMemoryReportCallbackDataEXT* = object
    sType* {.constant: (StructureType.deviceMemoryReportCallbackDataExt).}: StructureType
    pNext* {.optional.}: pointer
    flags*: DeviceMemoryReportFlagsEXT
    theType*: DeviceMemoryReportEventTypeEXT
    memoryObjectId*: uint64
    size*: DeviceSize
    objectType*: ObjectType
    objectHandle*: uint64
    heapIndex*: uint32
  PFN_DeviceMemoryReportCallbackEXT* = proc(
      pCallbackData: ptr DeviceMemoryReportCallbackDataEXT;
      pUserData: pointer;
    ): void {.cdecl.}



