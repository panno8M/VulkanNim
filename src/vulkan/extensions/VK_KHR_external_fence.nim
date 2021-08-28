# Generated at 2021-08-28T00:52:26Z
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
  FenceImportFlagBitsKHR* = UnusedEnum
  ExportFenceCreateInfoKHR* = object

StructureType.defineAliases:
  ExportFenceCreateInfo as ExportFenceCreateInfoKhr

FenceImportFlagBits.defineAliases:
  Temporary as TemporaryBitKhr

