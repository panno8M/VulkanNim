# Generated at 2021-09-10T05:27:58Z
# VK_KHR_win32_keyed_mutex


import ../platform
import ../features/vk10
import ./VK_KHR_external_memory_win32
export VK_KHR_external_memory_win32

const
  KhrWin32KeyedMutexSpecVersion* = 1
  KhrWin32KeyedMutexExtensionName* = "VK_KHR_win32_keyed_mutex"

type
  Win32KeyedMutexAcquireReleaseInfoKHR* = object
    sType* {.constant: (StructureType.win32KeyedMutexAcquireReleaseInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    acquireCount* {.optional.}: uint32
    pAcquireSyncs*: ptr DeviceMemory
    pAcquireKeys*: ptr uint64
    pAcquireTimeouts*: ptr uint32
    releaseCount* {.optional.}: uint32
    pReleaseSyncs*: ptr DeviceMemory
    pReleaseKeys*: ptr uint64



