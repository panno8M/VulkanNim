# Generated at 2021-08-30T14:31:10Z
# VK_KHR_external_fence


import ../platform
import ../features/vk10
import ./VK_KHR_external_fence_capabilities

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

