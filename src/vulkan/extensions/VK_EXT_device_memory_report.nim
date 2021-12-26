# Generated at 2021-12-26T16:57:01Z
# VK_EXT_device_memory_report

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2
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



