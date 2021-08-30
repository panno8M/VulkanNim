# Generated at 2021-08-30T23:05:46Z
# VK_KHR_external_memory


import ../platform
import ../features/vk10
import ./VK_KHR_external_memory_capabilities
import ../features/vk11

const
  KhrExternalMemorySpecVersion* = 1
  KhrExternalMemoryExtensionName* = "VK_KHR_external_memory"
  QueueFamilyExternalKhr* = QueueFamilyExternal

type
  ExternalMemoryImageCreateInfoKHR* = object
  ExternalMemoryBufferCreateInfoKHR* = object
  ExportMemoryAllocateInfoKHR* = object

Result.defineAliases:
  errorInvalidExternalHandle as errorInvalidExternalHandleKhr

StructureType.defineAliases:
  externalMemoryBufferCreateInfo as externalMemoryBufferCreateInfoKhr
  externalMemoryImageCreateInfo as externalMemoryImageCreateInfoKhr
  exportMemoryAllocateInfo as exportMemoryAllocateInfoKhr

