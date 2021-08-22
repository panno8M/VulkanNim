
import ../platform
import ../features/vk10
import VK_NV_external_memory_capabilities


type
  ExportMemoryAllocateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    handleTypes*: ExternalMemoryHandleTypeFlagsNV
  ExternalMemoryImageCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    handleTypes*: ExternalMemoryHandleTypeFlagsNV

const NvExternalMemoryExtensionName* = "VK_NV_external_memory"
const NvExternalMemorySpecVersion* = 1

