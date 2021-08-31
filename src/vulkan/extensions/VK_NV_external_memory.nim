# Generated at 2021-08-31T05:18:46Z
# VK_NV_external_memory


import ../platform
import ../features/vk10
import ./VK_NV_external_memory_capabilities
export VK_NV_external_memory_capabilities

const
  NvExternalMemorySpecVersion* = 1
  NvExternalMemoryExtensionName* = "VK_NV_external_memory"

type
  ExternalMemoryImageCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    handleTypes*: ExternalMemoryHandleTypeFlagsNV
  ExportMemoryAllocateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    handleTypes*: ExternalMemoryHandleTypeFlagsNV



