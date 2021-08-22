
import ../platform
import ../features/vk10
import VK_KHR_external_memory


type
  ExportMemoryWin32HandleInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    pAttributes*: ptr SECURITY_ATTRIBUTES
    dwAccess*: DWORD
    name*: LPCWSTR
  ImportMemoryWin32HandleInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    handleType*: ExternalMemoryHandleTypeFlagBits
    handle*: HANDLE
    name*: LPCWSTR
  MemoryWin32HandlePropertiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    memoryTypeBits*: uint32
  MemoryGetWin32HandleInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    memory*: DeviceMemory
    handleType*: ExternalMemoryHandleTypeFlagBits

const KhrExternalMemoryWin32ExtensionName* = "VK_KHR_external_memory_win32"
const KhrExternalMemoryWin32SpecVersion* = 1
var # commands
  getMemoryWin32HandleKHRCage: proc(device: Device; pGetWin32HandleInfo: ptr MemoryGetWin32HandleInfoKHR; pHandle: ptr HANDLE;): Result {.cdecl.}
  getMemoryWin32HandlePropertiesKHRCage: proc(device: Device; handleType: ExternalMemoryHandleTypeFlagBits; handle: HANDLE; pMemoryWin32HandleProperties: ptr MemoryWin32HandlePropertiesKHR;): Result {.cdecl.}

proc getMemoryWin32HandleKHR*(
      device: Device;
      pGetWin32HandleInfo: ptr MemoryGetWin32HandleInfoKHR;
      pHandle: ptr HANDLE;
    ): Result {.cdecl.} =
  getMemoryWin32HandleKHRCage(device,pGetWin32HandleInfo,pHandle)

proc getMemoryWin32HandlePropertiesKHR*(
      device: Device;
      handleType: ExternalMemoryHandleTypeFlagBits;
      handle: HANDLE;
      pMemoryWin32HandleProperties: ptr MemoryWin32HandlePropertiesKHR;
    ): Result {.cdecl.} =
  getMemoryWin32HandlePropertiesKHRCage(device,handleType,handle,pMemoryWin32HandleProperties)


proc loadVK_KHR_external_memory_win32*(instance: Instance) =
  instance.defineLoader(`<<`)

  getMemoryWin32HandleKHRCage << "vkGetMemoryWin32HandleKHR"
  getMemoryWin32HandlePropertiesKHRCage << "vkGetMemoryWin32HandlePropertiesKHR"