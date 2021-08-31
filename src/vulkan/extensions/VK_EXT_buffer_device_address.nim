# Generated at 2021-08-31T00:21:27Z
# VK_EXT_buffer_device_address


import ../platform
import ../features/vk12
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  ExtBufferDeviceAddressSpecVersion* = 2
  ExtBufferDeviceAddressExtensionName* = "VK_EXT_buffer_device_address"

type
  PhysicalDeviceBufferAddressFeaturesEXT* = object
  PhysicalDeviceBufferDeviceAddressFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    bufferDeviceAddress*: Bool32
    bufferDeviceAddressCaptureReplay*: Bool32
    bufferDeviceAddressMultiDevice*: Bool32
  BufferDeviceAddressInfoEXT* = object
  BufferDeviceAddressCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    deviceAddress*: DeviceAddress

const getBufferDeviceAddressEXT* = getBufferDeviceAddress
BufferUsageFlagBits.defineAliases:
  shaderDeviceAddress as shaderDeviceAddressExt

Result.defineAliases:
  errorInvalidOpaqueCaptureAddress as errorInvalidDeviceAddressExt

StructureType.defineAliases:
  physicalDeviceBufferDeviceAddressFeaturesExt as physicalDeviceBufferAddressFeaturesExt
  bufferDeviceAddressInfo as bufferDeviceAddressInfoExt

BufferCreateFlagBits.defineAliases:
  deviceAddressCaptureReplay as deviceAddressCaptureReplayExt

