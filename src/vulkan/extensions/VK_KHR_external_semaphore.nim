# Generated at 2021-08-31T05:18:46Z
# VK_KHR_external_semaphore


import ../platform
import ../features/vk10
import ./VK_KHR_external_semaphore_capabilities
import ../features/vk11
export VK_KHR_external_semaphore_capabilities

const
  KhrExternalSemaphoreSpecVersion* = 1
  KhrExternalSemaphoreExtensionName* = "VK_KHR_external_semaphore"

type # enums and bitmasks
  SemaphoreImportFlagsKHR* = SemaphoreImportFlags
  SemaphoreImportFlagBitsKHR* = distinct UnusedEnum

type
  ExportSemaphoreCreateInfoKHR* = object

StructureType.defineAliases:
  exportSemaphoreCreateInfo as exportSemaphoreCreateInfoKhr

SemaphoreImportFlagBits.defineAliases:
  temporary as temporaryKhr


