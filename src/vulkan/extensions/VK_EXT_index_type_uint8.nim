
import ../platform
import ../features/vk10


type
  PhysicalDeviceIndexTypeUint8FeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    indexTypeUint8*: Bool32

const ExtIndexTypeUint8SpecVersion* = 1
const ExtIndexTypeUint8ExtensionName* = "VK_EXT_index_type_uint8"

