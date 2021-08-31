# Generated at 2021-08-31T00:22:53Z
# VK_KHR_buffer_device_address


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk12
export VK_KHR_get_physical_device_properties2

const
  KhrBufferDeviceAddressSpecVersion* = 1
  KhrBufferDeviceAddressExtensionName* = "VK_KHR_buffer_device_address"

type
  PhysicalDeviceBufferDeviceAddressFeaturesKHR* = object
  BufferDeviceAddressInfoKHR* = object
  BufferOpaqueCaptureAddressCreateInfoKHR* = object
  MemoryOpaqueCaptureAddressAllocateInfoKHR* = object
  DeviceMemoryOpaqueCaptureAddressInfoKHR* = object

const getBufferDeviceAddressKHR* = getBufferDeviceAddress
const getBufferOpaqueCaptureAddressKHR* = getBufferOpaqueCaptureAddress
const getDeviceMemoryOpaqueCaptureAddressKHR* = getDeviceMemoryOpaqueCaptureAddress
BufferUsageFlagBits.defineAliases:
  shaderDeviceAddress as shaderDeviceAddressKhr

Result.defineAliases:
  errorInvalidOpaqueCaptureAddress as errorInvalidOpaqueCaptureAddressKhr

MemoryAllocateFlagBits.defineAliases:
  deviceAddress as deviceAddressKhr
  deviceAddressCaptureReplay as deviceAddressCaptureReplayKhr

StructureType.defineAliases:
  physicalDeviceBufferDeviceAddressFeatures as physicalDeviceBufferDeviceAddressFeaturesKhr
  bufferDeviceAddressInfo as bufferDeviceAddressInfoKhr
  bufferOpaqueCaptureAddressCreateInfo as bufferOpaqueCaptureAddressCreateInfoKhr
  memoryOpaqueCaptureAddressAllocateInfo as memoryOpaqueCaptureAddressAllocateInfoKhr
  deviceMemoryOpaqueCaptureAddressInfo as deviceMemoryOpaqueCaptureAddressInfoKhr

BufferCreateFlagBits.defineAliases:
  deviceAddressCaptureReplay as deviceAddressCaptureReplayKhr

