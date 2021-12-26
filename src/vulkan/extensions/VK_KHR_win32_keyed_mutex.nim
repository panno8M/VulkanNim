# Generated at 2021-12-26T10:42:47Z
# VK_KHR_win32_keyed_mutex

import ../platform

import ../features/vk10
import ./VK_KHR_external_memory_win32
export VK_KHR_external_memory_win32
prepareVulkanLibDef()

const
  KhrWin32KeyedMutexSpecVersion* = 1
  KhrWin32KeyedMutexExtensionName* = "VK_KHR_win32_keyed_mutex"

type
  Win32KeyedMutexAcquireReleaseInfoKHR* = object
    sType* {.constant: (StructureType.win32KeyedMutexAcquireReleaseInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    acquireCount* {.optional.}: uint32
    pAcquireSyncs* {.length: acquireCount.}: arrPtr[DeviceMemory]
    pAcquireKeys* {.length: acquireCount.}: arrPtr[uint64]
    pAcquireTimeouts* {.length: acquireCount.}: arrPtr[uint32]
    releaseCount* {.optional.}: uint32
    pReleaseSyncs* {.length: releaseCount.}: arrPtr[DeviceMemory]
    pReleaseKeys* {.length: releaseCount.}: arrPtr[uint64]



