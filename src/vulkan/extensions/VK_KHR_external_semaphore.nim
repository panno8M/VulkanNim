# Generated at 2021-08-28T12:28:00Z
# VK_KHR_external_semaphore
# =================================

import ../platform
import ../features/vk10
import VK_KHR_external_semaphore_capabilities


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


