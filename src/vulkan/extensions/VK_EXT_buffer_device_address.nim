
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  PhysicalDeviceBufferAddressFeaturesEXT* = object
  BufferDeviceAddressCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    deviceAddress*: DeviceAddress
  PhysicalDeviceBufferDeviceAddressFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    bufferDeviceAddress*: Bool32
    bufferDeviceAddressCaptureReplay*: Bool32
    bufferDeviceAddressMultiDevice*: Bool32
  BufferDeviceAddressInfoEXT* = object

const ExtBufferDeviceAddressSpecVersion* = 2
const ExtBufferDeviceAddressExtensionName* = "VK_EXT_buffer_device_address"
var # commands
  

const getBufferDeviceAddressEXT* = getBufferDeviceAddress


proc loadVK_EXT_buffer_device_address*(instance: Instance) =
  instance.defineLoader(`<<`)

  getBufferDeviceAddressEXTCage << "vkGetBufferDeviceAddressEXT"