# Generated at 2021-08-27T06:01:02Z
# VK_NV_win32_keyed_mutex
# =================================

import ../platform
import ../features/vk10
import VK_NV_external_memory_win32


const
  NvWin32KeyedMutexSpecVersion* = 2
  NvWin32KeyedMutexExtensionName* = "VK_NV_win32_keyed_mutex"

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


