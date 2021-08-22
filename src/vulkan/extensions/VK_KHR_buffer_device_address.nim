
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  PhysicalDeviceBufferDeviceAddressFeaturesKHR* = object
  DeviceMemoryOpaqueCaptureAddressInfoKHR* = object
  MemoryOpaqueCaptureAddressAllocateInfoKHR* = object
  BufferDeviceAddressInfoKHR* = object
  BufferOpaqueCaptureAddressCreateInfoKHR* = object

const KhrBufferDeviceAddressSpecVersion* = 1
const KhrBufferDeviceAddressExtensionName* = "VK_KHR_buffer_device_address"
var # commands
  
  
  

const getBufferDeviceAddressKHR* = getBufferDeviceAddress

const getDeviceMemoryOpaqueCaptureAddressKHR* = getDeviceMemoryOpaqueCaptureAddress

const getBufferOpaqueCaptureAddressKHR* = getBufferOpaqueCaptureAddress


proc loadVK_KHR_buffer_device_address*(instance: Instance) =
  instance.defineLoader(`<<`)

  getBufferDeviceAddressKHRCage << "vkGetBufferDeviceAddressKHR"
  getDeviceMemoryOpaqueCaptureAddressKHRCage << "vkGetDeviceMemoryOpaqueCaptureAddressKHR"
  getBufferOpaqueCaptureAddressKHRCage << "vkGetBufferOpaqueCaptureAddressKHR"