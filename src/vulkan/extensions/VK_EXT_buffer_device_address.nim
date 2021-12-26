# Generated at 2021-12-26T10:42:47Z
# VK_EXT_buffer_device_address

import ../platform

import ../features/vk12
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2
prepareVulkanLibDef()

const
  ExtBufferDeviceAddressSpecVersion* = 2
  ExtBufferDeviceAddressExtensionName* = "VK_EXT_buffer_device_address"

type
  PhysicalDeviceBufferAddressFeaturesEXT* = object
  PhysicalDeviceBufferDeviceAddressFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceBufferDeviceAddressFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    bufferDeviceAddress*: Bool32
    bufferDeviceAddressCaptureReplay*: Bool32
    bufferDeviceAddressMultiDevice*: Bool32
  BufferDeviceAddressInfoEXT* = object
  BufferDeviceAddressCreateInfoEXT* = object
    sType* {.constant: (StructureType.bufferDeviceAddressCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    deviceAddress*: DeviceAddress

const getBufferDeviceAddressEXT* = getBufferDeviceAddress

