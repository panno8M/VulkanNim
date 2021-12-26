# Generated at 2021-12-26T16:57:02Z
# VK_KHR_maintenance4

import ../platform

import ../features/vk10

prepareVulkanLibDef()

const
  KhrMaintenance4SpecVersion* = 2
  KhrMaintenance4ExtensionName* = "VK_KHR_maintenance4"
  ImageAspectNoneKhr* = 0

type
  PhysicalDeviceMaintenance4FeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceMaintenance4FeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    maintenance4*: Bool32
  PhysicalDeviceMaintenance4PropertiesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceMaintenance4PropertiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    maxBufferSize*: DeviceSize
  DeviceBufferMemoryRequirementsKHR* = object
    sType* {.constant: (StructureType.deviceBufferMemoryRequirementsKhr).}: StructureType
    pNext* {.optional.}: pointer
    pCreateInfo*: ptr BufferCreateInfo
  DeviceImageMemoryRequirementsKHR* = object
    sType* {.constant: (StructureType.deviceImageMemoryRequirementsKhr).}: StructureType
    pNext* {.optional.}: pointer
    pCreateInfo*: ptr ImageCreateInfo
    planeAspect*: ImageAspectFlagBits

proc getDeviceBufferMemoryRequirementsKHR*(
      device: Device;
      pInfo: ptr DeviceBufferMemoryRequirementsKHR;
      pMemoryRequirements: ptr MemoryRequirements2;
    ): void {.cdecl, lazyload("vkGetDeviceBufferMemoryRequirementsKHR", DeviceLevel).}
proc getDeviceImageMemoryRequirementsKHR*(
      device: Device;
      pInfo: ptr DeviceImageMemoryRequirementsKHR;
      pMemoryRequirements: ptr MemoryRequirements2;
    ): void {.cdecl, lazyload("vkGetDeviceImageMemoryRequirementsKHR", DeviceLevel).}
proc getDeviceImageSparseMemoryRequirementsKHR*(
      device: Device;
      pInfo: ptr DeviceImageMemoryRequirementsKHR;
      pSparseMemoryRequirementCount: ptr uint32;
      pSparseMemoryRequirements {.length: pSparseMemoryRequirementCount.} = default(arrPtr[SparseImageMemoryRequirements2]);
    ): void {.cdecl, lazyload("vkGetDeviceImageSparseMemoryRequirementsKHR", DeviceLevel).}

proc loadAllVK_KHR_maintenance4*(instance: Instance) =
  instance.loadCommand getDeviceBufferMemoryRequirementsKHR
  instance.loadCommand getDeviceImageMemoryRequirementsKHR
  instance.loadCommand getDeviceImageSparseMemoryRequirementsKHR

proc loadVK_KHR_maintenance4*(device: Device) =
  device.loadCommand getDeviceBufferMemoryRequirementsKHR
  device.loadCommand getDeviceImageMemoryRequirementsKHR
  device.loadCommand getDeviceImageSparseMemoryRequirementsKHR

