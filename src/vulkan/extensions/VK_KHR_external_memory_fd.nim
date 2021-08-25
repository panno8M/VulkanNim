
import ../platform
import ../features/vk10
import VK_KHR_external_memory


type
  ImportMemoryFdInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    handleType*: ExternalMemoryHandleTypeFlagBits
    fd*: int
  MemoryGetFdInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    memory*: DeviceMemory
    handleType*: ExternalMemoryHandleTypeFlagBits
  MemoryFdPropertiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    memoryTypeBits*: uint32

const KhrExternalMemoryFdExtensionName* = "VK_KHR_external_memory_fd"
const KhrExternalMemoryFdSpecVersion* = 1
var # commands
  getMemoryFdPropertiesKHRCage: proc(device: Device; handleType: ExternalMemoryHandleTypeFlagBits; fd: int; pMemoryFdProperties: ptr MemoryFdPropertiesKHR;): Result {.cdecl.}
  getMemoryFdKHRCage: proc(device: Device; pGetFdInfo: ptr MemoryGetFdInfoKHR; pFd: ptr int;): Result {.cdecl.}

proc getMemoryFdPropertiesKHR*(
      device: Device;
      handleType: ExternalMemoryHandleTypeFlagBits;
      fd: int;
      pMemoryFdProperties: ptr MemoryFdPropertiesKHR;
    ): Result {.cdecl, discardable.} =
  getMemoryFdPropertiesKHRCage(device,handleType,fd,pMemoryFdProperties)

proc getMemoryFdKHR*(
      device: Device;
      pGetFdInfo: ptr MemoryGetFdInfoKHR;
      pFd: ptr int;
    ): Result {.cdecl, discardable.} =
  getMemoryFdKHRCage(device,pGetFdInfo,pFd)


proc loadVK_KHR_external_memory_fd*(instance: Instance) =
  instance.defineLoader(`<<`)

  getMemoryFdPropertiesKHRCage << "vkGetMemoryFdPropertiesKHR"
  getMemoryFdKHRCage << "vkGetMemoryFdKHR"