# Generated at 2021-08-28T00:52:26Z
# VK_KHR_external_memory
# =================================

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

Result.defineAliases:
  ErrorInvalidExternalHandle as ErrorInvalidExternalHandleKhr

StructureType.defineAliases:
  ExternalMemoryBufferCreateInfo as ExternalMemoryBufferCreateInfoKhr
  ExternalMemoryImageCreateInfo as ExternalMemoryImageCreateInfoKhr
  ExportMemoryAllocateInfo as ExportMemoryAllocateInfoKhr

