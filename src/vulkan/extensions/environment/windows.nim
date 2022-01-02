# VK_KHR_win32_surface
# VK_NV_external_memory_win32
# VK_NV_win32_keyed_mutex
# VK_KHR_external_memory_win32
# VK_KHR_win32_keyed_mutex
# VK_KHR_external_semaphore_win32
# VK_KHR_external_fence_win32

import ../../features/vk10
import ../../platform
prepareVulkanLibDef()

const
  KhrWin32SurfaceSpecVersion* = 6
  KhrWin32SurfaceExtensionName* = "VK_KHR_win32_surface"

  NvExternalMemoryWin32SpecVersion* = 1
  NvExternalMemoryWin32ExtensionName* = "VK_NV_external_memory_win32"

  NvWin32KeyedMutexSpecVersion* = 2
  NvWin32KeyedMutexExtensionName* = "VK_NV_win32_keyed_mutex"

  KhrExternalMemoryWin32SpecVersion* = 1
  KhrExternalMemoryWin32ExtensionName* = "VK_KHR_external_memory_win32"

  KhrWin32KeyedMutexSpecVersion* = 1
  KhrWin32KeyedMutexExtensionName* = "VK_KHR_win32_keyed_mutex"

  KhrExternalSemaphoreWin32SpecVersion* = 1
  KhrExternalSemaphoreWin32ExtensionName* = "VK_KHR_external_semaphore_win32"

  KhrExternalFenceWin32SpecVersion* = 1
  KhrExternalFenceWin32ExtensionName* = "VK_KHR_external_fence_win32"

type
  Win32SurfaceCreateInfoKHR* = object
    sType* {.constant: (StructureType.win32SurfaceCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: Win32SurfaceCreateFlagsKHR
    hinstance*: HINSTANCE
    hwnd*: HWND

  ImportMemoryWin32HandleInfoNV* = object
    sType* {.constant: (StructureType.importMemoryWin32HandleInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    handleType* {.optional.}: ExternalMemoryHandleTypeFlagsNV
    handle* {.optional.}: Win32Handle
  ExportMemoryWin32HandleInfoNV* = object
    sType* {.constant: (StructureType.exportMemoryWin32HandleInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    pAttributes* {.optional.}: ptr SECURITY_ATTRIBUTES
    dwAccess* {.optional.}: DWORD

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

  ImportMemoryWin32HandleInfoKHR* = object
    sType* {.constant: (StructureType.importMemoryWin32HandleInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    handleType* {.optional.}: ExternalMemoryHandleTypeFlagBits
    handle* {.optional.}: Win32Handle
    name* {.optional.}: LPCWSTR
  ExportMemoryWin32HandleInfoKHR* = object
    sType* {.constant: (StructureType.exportMemoryWin32HandleInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    pAttributes* {.optional.}: ptr SECURITY_ATTRIBUTES
    dwAccess*: DWORD
    name*: LPCWSTR
  MemoryWin32HandlePropertiesKHR* = object
    sType* {.constant: (StructureType.memoryWin32HandlePropertiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    memoryTypeBits*: uint32
  MemoryGetWin32HandleInfoKHR* = object
    sType* {.constant: (StructureType.memoryGetWin32HandleInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    memory*: DeviceMemory
    handleType*: ExternalMemoryHandleTypeFlagBits

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

  ImportSemaphoreWin32HandleInfoKHR* = object
    sType* {.constant: (StructureType.importSemaphoreWin32HandleInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    semaphore*: Semaphore
    flags* {.optional.}: SemaphoreImportFlags
    handleType*: ExternalSemaphoreHandleTypeFlagBits
    handle* {.optional.}: Win32Handle
    name* {.optional.}: LPCWSTR
  ExportSemaphoreWin32HandleInfoKHR* = object
    sType* {.constant: (StructureType.exportSemaphoreWin32HandleInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    pAttributes* {.optional.}: ptr SECURITY_ATTRIBUTES
    dwAccess*: DWORD
    name*: LPCWSTR
  D3D12FenceSubmitInfoKHR* = object
    sType* {.constant: (StructureType.d3d12FenceSubmitInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    waitSemaphoreValuesCount* {.optional.}: uint32
    pWaitSemaphoreValues* {.optional, length: waitSemaphoreValuesCount.}: arrPtr[uint64]
    signalSemaphoreValuesCount* {.optional.}: uint32
    pSignalSemaphoreValues* {.optional, length: signalSemaphoreValuesCount.}: arrPtr[uint64]
  SemaphoreGetWin32HandleInfoKHR* = object
    sType* {.constant: (StructureType.semaphoreGetWin32HandleInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    semaphore*: Semaphore
    handleType*: ExternalSemaphoreHandleTypeFlagBits

  ImportFenceWin32HandleInfoKHR* = object
    sType* {.constant: (StructureType.importFenceWin32HandleInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    fence*: Fence
    flags* {.optional.}: FenceImportFlags
    handleType*: ExternalFenceHandleTypeFlagBits
    handle* {.optional.}: Win32Handle
    name* {.optional.}: LPCWSTR
  ExportFenceWin32HandleInfoKHR* = object
    sType* {.constant: (StructureType.exportFenceWin32HandleInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    pAttributes* {.optional.}: ptr SECURITY_ATTRIBUTES
    dwAccess*: DWORD
    name*: LPCWSTR
  FenceGetWin32HandleInfoKHR* = object
    sType* {.constant: (StructureType.fenceGetWin32HandleInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    fence*: Fence
    handleType*: ExternalFenceHandleTypeFlagBits

proc createWin32SurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr Win32SurfaceCreateInfoKHR;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkCreateWin32SurfaceKHR", InstanceLevel).}
proc getPhysicalDeviceWin32PresentationSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
    ): Bool32 {.cdecl, lazyload("vkGetPhysicalDeviceWin32PresentationSupportKHR", InstanceLevel).}


proc getMemoryWin32HandleNV*(
      device: Device;
      memory: DeviceMemory;
      handleType: ExternalMemoryHandleTypeFlagsNV;
      pHandle: ptr Win32Handle;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorTooManyObjects, Result.errorOutOfHostMemory],
      lazyload("vkGetMemoryWin32HandleNV", DeviceLevel).}


proc getMemoryWin32HandleKHR*(
      device: Device;
      pGetWin32HandleInfo: ptr MemoryGetWin32HandleInfoKHR;
      pHandle: ptr Win32Handle;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorTooManyObjects, Result.errorOutOfHostMemory],
      lazyload("vkGetMemoryWin32HandleKHR", DeviceLevel).}
proc getMemoryWin32HandlePropertiesKHR*(
      device: Device;
      handleType: ExternalMemoryHandleTypeFlagBits;
      handle: Win32Handle;
      pMemoryWin32HandleProperties: ptr MemoryWin32HandlePropertiesKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorInvalidExternalHandle],
      lazyload("vkGetMemoryWin32HandlePropertiesKHR", DeviceLevel).}


proc importSemaphoreWin32HandleKHR*(
      device: Device;
      pImportSemaphoreWin32HandleInfo: ptr ImportSemaphoreWin32HandleInfoKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorInvalidExternalHandle],
      lazyload("vkImportSemaphoreWin32HandleKHR", DeviceLevel).}
proc getSemaphoreWin32HandleKHR*(
      device: Device;
      pGetWin32HandleInfo: ptr SemaphoreGetWin32HandleInfoKHR;
      pHandle: ptr Win32Handle;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorTooManyObjects, Result.errorOutOfHostMemory],
      lazyload("vkGetSemaphoreWin32HandleKHR", DeviceLevel).}


proc importFenceWin32HandleKHR*(
      device: Device;
      pImportFenceWin32HandleInfo: ptr ImportFenceWin32HandleInfoKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorInvalidExternalHandle],
      lazyload("vkImportFenceWin32HandleKHR", DeviceLevel).}
proc getFenceWin32HandleKHR*(
      device: Device;
      pGetWin32HandleInfo: ptr FenceGetWin32HandleInfoKHR;
      pHandle: ptr Win32Handle;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorTooManyObjects, Result.errorOutOfHostMemory],
      lazyload("vkGetFenceWin32HandleKHR", DeviceLevel).}

proc loadAllVK_KHR_win32_surface*(instance: Instance) = instance.loadCommands:
  createWin32SurfaceKHR
  getPhysicalDeviceWin32PresentationSupportKHR
proc loadAllVK_NV_external_memory_win32*(instance: Instance) = instance.loadCommands:
  getMemoryWin32HandleNV
proc loadAllVK_KHR_external_memory_win32*(instance: Instance) = instance.loadCommands:
  getMemoryWin32HandleKHR
  getMemoryWin32HandlePropertiesKHR
proc loadAllVK_KHR_external_semaphore_win32*(instance: Instance) = instance.loadCommands:
  importSemaphoreWin32HandleKHR
  getSemaphoreWin32HandleKHR
proc loadAllVK_KHR_external_fence_win32*(instance: Instance) = instance.loadCommands:
  importFenceWin32HandleKHR
  getFenceWin32HandleKHR
proc loadVK_KHR_win32_surface*(instance: Instance) = instance.loadCommands:
  createWin32SurfaceKHR
  getPhysicalDeviceWin32PresentationSupportKHR
proc loadVK_NV_external_memory_win32*(device: Device) = device.loadCommands:
  getMemoryWin32HandleNV
proc loadVK_KHR_external_memory_win32*(device: Device) = device.loadCommands:
  getMemoryWin32HandleKHR
  getMemoryWin32HandlePropertiesKHR
proc loadVK_KHR_external_semaphore_win32*(device: Device) = device.loadCommands:
  importSemaphoreWin32HandleKHR
  getSemaphoreWin32HandleKHR
proc loadVK_KHR_external_fence_win32*(device: Device) = device.loadCommands:
  importFenceWin32HandleKHR
  getFenceWin32HandleKHR
