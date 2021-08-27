
import ../platform
import ../features/vk10
import VK_KHR_external_memory_capabilities


const
  KhrExternalMemorySpecVersion* = 1
  KhrExternalMemoryExtensionName* = "VK_KHR_external_memory"
  QueueFamilyExternalKhr* = QueueFamilyExternal

type
  ExternalMemoryImageCreateInfoKHR* = object
  ExternalMemoryBufferCreateInfoKHR* = object
  ExportMemoryAllocateInfoKHR* = object


