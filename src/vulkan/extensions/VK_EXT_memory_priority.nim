
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  PhysicalDeviceMemoryPriorityFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    memoryPriority*: Bool32
  MemoryPriorityAllocateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    priority*: float32

const ExtMemoryPrioritySpecVersion* = 1
const ExtMemoryPriorityExtensionName* = "VK_EXT_memory_priority"

