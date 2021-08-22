
import ../platform
import ../features/vk10
import VK_KHR_external_memory_win32


type
  Win32KeyedMutexAcquireReleaseInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    acquireCount*: uint32
    pAcquireSyncs*: ptr DeviceMemory
    pAcquireKeys*: ptr uint64
    pAcquireTimeouts*: ptr uint32
    releaseCount*: uint32
    pReleaseSyncs*: ptr DeviceMemory
    pReleaseKeys*: ptr uint64

const KhrWin32KeyedMutexExtensionName* = "VK_KHR_win32_keyed_mutex"
const KhrWin32KeyedMutexSpecVersion* = 1

