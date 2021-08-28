# Generated at 2021-08-28T12:28:00Z
# VK_KHR_external_fence
# =================================

import ../platform
import ../features/vk10
import VK_KHR_external_fence_capabilities


const
  KhrExternalFenceSpecVersion* = 1
  KhrExternalFenceExtensionName* = "VK_KHR_external_fence"

type
  {name}* = {Alias}
  FenceImportFlagBitsKHR* = distinct UnusedEnum
  ExportFenceCreateInfoKHR* = object

StructureType.defineAliases:
  exportFenceCreateInfo as exportFenceCreateInfoKhr

FenceImportFlagBits.defineAliases:
  temporary as temporaryKhr


