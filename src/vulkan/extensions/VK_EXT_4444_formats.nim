
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2




type
  PhysicalDevice4444FormatsFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    formatA4R4G4B4*: Bool32
    formatA4B4G4R4*: Bool32


