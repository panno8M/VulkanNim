
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
proc loadVK_KHR_buffer_device_address*(instance: Instance) =
  instance.defineLoader(`<<`)

  getBufferDeviceAddressKHRCage << "vkGetBufferDeviceAddressKHR"
  getBufferOpaqueCaptureAddressKHRCage << "vkGetBufferOpaqueCaptureAddressKHR"
  getDeviceMemoryOpaqueCaptureAddressKHRCage << "vkGetDeviceMemoryOpaqueCaptureAddressKHR"