# Generated at 2021-08-28T12:28:00Z
# VK_NV_external_memory
# =================================

import ../platform
import ../features/vk10
import VK_NV_external_memory_capabilities


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



