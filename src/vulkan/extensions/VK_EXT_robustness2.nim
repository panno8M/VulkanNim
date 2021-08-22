
import ../platform
import ../features/vk10


type
  PhysicalDeviceRobustness2PropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    robustStorageBufferAccessSizeAlignment*: DeviceSize
    robustUniformBufferAccessSizeAlignment*: DeviceSize
  PhysicalDeviceRobustness2FeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    robustBufferAccess2*: Bool32
    robustImageAccess2*: Bool32
    nullDescriptor*: Bool32

const ExtRobustness2ExtensionName* = "VK_EXT_robustness2"
const ExtRobustness2SpecVersion* = 1

