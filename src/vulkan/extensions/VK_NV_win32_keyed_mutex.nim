# Generated at 2021-12-26T10:16:14Z
# VK_NV_win32_keyed_mutex

import ../platform

import ../features/vk10
import ./VK_NV_external_memory_win32
import ./VK_KHR_win32_keyed_mutex
export VK_NV_external_memory_win32
export VK_KHR_win32_keyed_mutex

prepareVulkanLibDef()

const
  NvWin32KeyedMutexSpecVersion* = 2
  NvWin32KeyedMutexExtensionName* = "VK_NV_win32_keyed_mutex"

type
  Win32KeyedMutexAcquireReleaseInfoNV* = object
    sType* {.constant: (StructureType.win32KeyedMutexAcquireReleaseInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    acquireCount* {.optional.}: uint32
    pAcquireSyncs* {.length: acquireCount.}: arrPtr[DeviceMemory]
    pAcquireKeys* {.length: acquireCount.}: arrPtr[uint64]
    pAcquireTimeoutMilliseconds* {.length: acquireCount.}: arrPtr[uint32]
    releaseCount* {.optional.}: uint32
    pReleaseSyncs* {.length: releaseCount.}: arrPtr[DeviceMemory]
    pReleaseKeys* {.length: releaseCount.}: arrPtr[uint64]



