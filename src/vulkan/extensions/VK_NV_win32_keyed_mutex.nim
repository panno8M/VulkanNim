
import ../platform
import ../features/vk10
import VK_NV_external_memory_win32




type
  Win32KeyedMutexAcquireReleaseInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    acquireCount*: uint32
    pAcquireSyncs*: ptr DeviceMemory
    pAcquireKeys*: ptr uint64
    pAcquireTimeoutMilliseconds*: ptr uint32
    releaseCount*: uint32
    pReleaseSyncs*: ptr DeviceMemory
    pReleaseKeys*: ptr uint64


