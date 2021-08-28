# Generated at 2021-08-28T00:52:26Z
# VK_KHR_buffer_device_address
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  KhrBufferDeviceAddressSpecVersion* = 1
  KhrBufferDeviceAddressExtensionName* = "VK_KHR_buffer_device_address"

type
  PhysicalDeviceBufferDeviceAddressFeaturesKHR* = object
  BufferDeviceAddressInfoKHR* = object
  BufferOpaqueCaptureAddressCreateInfoKHR* = object
  MemoryOpaqueCaptureAddressAllocateInfoKHR* = object
  DeviceMemoryOpaqueCaptureAddressInfoKHR* = object

var # commands
  
  
  
const getBufferDeviceAddressKHR* = getBufferDeviceAddress
const getBufferOpaqueCaptureAddressKHR* = getBufferOpaqueCaptureAddress
const getDeviceMemoryOpaqueCaptureAddressKHR* = getDeviceMemoryOpaqueCaptureAddress
BufferUsageFlagBits.defineAliases:
  ShaderDeviceAddress as ShaderDeviceAddressBitKhr

Result.defineAliases:
  ErrorInvalidOpaqueCaptureAddress as ErrorInvalidOpaqueCaptureAddressKhr

MemoryAllocateFlagBits.defineAliases:
  DeviceAddress as DeviceAddressBitKhr
  DeviceAddressCaptureReplay as DeviceAddressCaptureReplayBitKhr

StructureType.defineAliases:
  PhysicalDeviceBufferDeviceAddressFeatures as PhysicalDeviceBufferDeviceAddressFeaturesKhr
  BufferDeviceAddressInfo as BufferDeviceAddressInfoKhr
  BufferOpaqueCaptureAddressCreateInfo as BufferOpaqueCaptureAddressCreateInfoKhr
  MemoryOpaqueCaptureAddressAllocateInfo as MemoryOpaqueCaptureAddressAllocateInfoKhr
  DeviceMemoryOpaqueCaptureAddressInfo as DeviceMemoryOpaqueCaptureAddressInfoKhr

BufferCreateFlagBits.defineAliases:
  DeviceAddressCaptureReplay as DeviceAddressCaptureReplayBitKhr

proc loadVK_KHR_buffer_device_address*(instance: Instance) =
  instance.defineLoader(`<<`)

  getBufferDeviceAddressKHRCage << "vkGetBufferDeviceAddressKHR"
  getBufferOpaqueCaptureAddressKHRCage << "vkGetBufferOpaqueCaptureAddressKHR"
  getDeviceMemoryOpaqueCaptureAddressKHRCage << "vkGetDeviceMemoryOpaqueCaptureAddressKHR"