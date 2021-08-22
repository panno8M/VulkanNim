
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  PhysicalDeviceMemoryBudgetPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    heapBudget*: DeviceSize
    heapUsage*: DeviceSize

const ExtMemoryBudgetSpecVersion* = 1
const ExtMemoryBudgetExtensionName* = "VK_EXT_memory_budget"

