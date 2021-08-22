
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  PhysicalDevicePCIBusInfoPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    pciDomain*: uint32
    pciBus*: uint32
    pciDevice*: uint32
    pciFunction*: uint32

const ExtPciBusInfoExtensionName* = "VK_EXT_pci_bus_info"
const ExtPciBusInfoSpecVersion* = 2

