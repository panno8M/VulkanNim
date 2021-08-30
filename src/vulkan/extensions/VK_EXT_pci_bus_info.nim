# Generated at 2021-08-30T14:31:10Z
# VK_EXT_pci_bus_info


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2

const
  ExtPciBusInfoSpecVersion* = 2
  ExtPciBusInfoExtensionName* = "VK_EXT_pci_bus_info"

type
  PhysicalDevicePCIBusInfoPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    pciDomain*: uint32
    pciBus*: uint32
    pciDevice*: uint32
    pciFunction*: uint32


