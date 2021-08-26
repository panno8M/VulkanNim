
import ../platform
import ../features/vk10
import VK_KHR_external_memory_capabilities


template QueueFamilyExternalKhr*(): untyped =
  VkQueueFamilyExternal

type
  ExternalMemoryImageCreateInfoKHR* = object
  ExternalMemoryBufferCreateInfoKHR* = object
  ExportMemoryAllocateInfoKHR* = object


