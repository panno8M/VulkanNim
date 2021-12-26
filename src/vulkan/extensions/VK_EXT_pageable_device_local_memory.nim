# Generated at 2021-12-26T16:57:01Z
# VK_EXT_pageable_device_local_memory

import ../platform

import ../features/vk10
import ./VK_EXT_memory_priority
export VK_EXT_memory_priority
prepareVulkanLibDef()

const
  ExtPageableDeviceLocalMemorySpecVersion* = 1
  ExtPageableDeviceLocalMemoryExtensionName* = "VK_EXT_pageable_device_local_memory"

type
  PhysicalDevicePageableDeviceLocalMemoryFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDevicePageableDeviceLocalMemoryFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    pageableDeviceLocalMemory*: Bool32

proc setDeviceMemoryPriorityEXT*(
      device: Device;
      memory: DeviceMemory;
      priority: float32;
    ): void {.cdecl, lazyload("vkSetDeviceMemoryPriorityEXT", DeviceLevel).}

proc loadAllVK_EXT_pageable_device_local_memory*(instance: Instance) =
  instance.loadCommand setDeviceMemoryPriorityEXT

proc loadVK_EXT_pageable_device_local_memory*(device: Device) =
  device.loadCommand setDeviceMemoryPriorityEXT

