# Generated at 2021-08-30T23:05:46Z
# VK_KHR_external_semaphore


import ../platform
import ../features/vk10
import ./VK_KHR_external_semaphore_capabilities
import ../features/vk11

const
  KhrExternalSemaphoreSpecVersion* = 1
  KhrExternalSemaphoreExtensionName* = "VK_KHR_external_semaphore"

type
  {name}* = {Alias}
  SemaphoreImportFlagBitsKHR* = distinct UnusedEnum
  ExportSemaphoreCreateInfoKHR* = object

StructureType.defineAliases:
  exportSemaphoreCreateInfo as exportSemaphoreCreateInfoKhr

SemaphoreImportFlagBits.defineAliases:
  temporary as temporaryKhr

