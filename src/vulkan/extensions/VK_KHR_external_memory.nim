
import ../platform
import ../features/vk10
import VK_KHR_external_memory_capabilities


type
  ExportMemoryAllocateInfoKHR* = object
  ExternalMemoryBufferCreateInfoKHR* = object
  ExternalMemoryImageCreateInfoKHR* = object

const KhrExternalMemoryExtensionName* = "VK_KHR_external_memory"
const KhrExternalMemorySpecVersion* = 1
template QueueFamilyExternalKhr*(): untyped =
  VkQueueFamilyExternal

