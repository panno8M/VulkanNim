
import ../platform
import ../features/vk10
import VK_KHR_external_memory


type
  PhysicalDeviceExternalMemoryHostPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    minImportedHostPointerAlignment*: DeviceSize
  MemoryHostPointerPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    memoryTypeBits*: uint32
  ImportMemoryHostPointerInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    handleType*: ExternalMemoryHandleTypeFlagBits
    pHostPointer*: pointer

const ExtExternalMemoryHostExtensionName* = "VK_EXT_external_memory_host"
const ExtExternalMemoryHostSpecVersion* = 1
var # commands
  getMemoryHostPointerPropertiesEXTCage: proc(device: Device; handleType: ExternalMemoryHandleTypeFlagBits; pHostPointer: pointer; pMemoryHostPointerProperties: ptr MemoryHostPointerPropertiesEXT;): Result {.cdecl.}

proc getMemoryHostPointerPropertiesEXT*(
      device: Device;
      handleType: ExternalMemoryHandleTypeFlagBits;
      pHostPointer: pointer;
      pMemoryHostPointerProperties: ptr MemoryHostPointerPropertiesEXT;
    ): Result {.cdecl, discardable.} =
  getMemoryHostPointerPropertiesEXTCage(device,handleType,pHostPointer,pMemoryHostPointerProperties)


proc loadVK_EXT_external_memory_host*(instance: Instance) =
  instance.defineLoader(`<<`)

  getMemoryHostPointerPropertiesEXTCage << "vkGetMemoryHostPointerPropertiesEXT"