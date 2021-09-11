# Generated at 2021-09-10T05:27:58Z
# VK_NV_win32_keyed_mutex


import ../platform
import ../features/vk10
import ./VK_NV_external_memory_win32
import ./VK_KHR_win32_keyed_mutex
export VK_NV_external_memory_win32
export VK_KHR_win32_keyed_mutex

const
  NvWin32KeyedMutexSpecVersion* = 2
  NvWin32KeyedMutexExtensionName* = "VK_NV_win32_keyed_mutex"

type
  Win32KeyedMutexAcquireReleaseInfoNV* = object
    sType* {.constant: (StructureType.win32KeyedMutexAcquireReleaseInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    acquireCount* {.optional.}: uint32
    pAcquireSyncs*: ptr DeviceMemory
    pAcquireKeys*: ptr uint64
    pAcquireTimeoutMilliseconds*: ptr uint32
    releaseCount* {.optional.}: uint32
    pReleaseSyncs*: ptr DeviceMemory
    pReleaseKeys*: ptr uint64



