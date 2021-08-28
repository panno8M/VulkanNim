# Generated at 2021-08-28T00:52:26Z
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
  SemaphoreImportFlagBitsKHR* = UnusedEnum
  ExportSemaphoreCreateInfoKHR* = object

StructureType.defineAliases:
  ExportSemaphoreCreateInfo as ExportSemaphoreCreateInfoKhr

SemaphoreImportFlagBits.defineAliases:
  Temporary as TemporaryBitKhr

