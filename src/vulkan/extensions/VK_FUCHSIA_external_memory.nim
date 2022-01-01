# VK_FUCHSIA_external_memory

import ../features/vk10
import VK_KHR_external_memory_capabilities
import VK_KHR_external_memory
import ../platform
prepareVulkanLibDef()

const
  FuchsiaExternalMemorySpecVersion* = 1
  FuchsiaExternalMemoryExtensionName* = "VK_FUCHSIA_external_memory"

type
  ImportMemoryZirconHandleInfoFUCHSIA* = object
    sType* {.constant: (StructureType.importMemoryZirconHandleInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    handleType* {.optional.}: ExternalMemoryHandleTypeFlagBits
    handle* {.optional.}: zx_handle_t
  MemoryZirconHandlePropertiesFUCHSIA* = object
    sType* {.constant: (StructureType.memoryZirconHandlePropertiesFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    memoryTypeBits*: uint32
  MemoryGetZirconHandleInfoFUCHSIA* = object
    sType* {.constant: (StructureType.memoryGetZirconHandleInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    memory*: DeviceMemory
    handleType*: ExternalMemoryHandleTypeFlagBits

proc getMemoryZirconHandleFUCHSIA*(
      device: Device;
      pGetZirconHandleInfo: ptr MemoryGetZirconHandleInfoFUCHSIA;
      pZirconHandle: ptr zx_handle_t;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorTooManyObjects, Result.errorOutOfHostMemory],
      lazyload("vkGetMemoryZirconHandleFUCHSIA", DeviceLevel).}
proc getMemoryZirconHandlePropertiesFUCHSIA*(
      device: Device;
      handleType: ExternalMemoryHandleTypeFlagBits;
      zirconHandle: zx_handle_t;
      pMemoryZirconHandleProperties: ptr MemoryZirconHandlePropertiesFUCHSIA;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorInvalidExternalHandle],
      lazyload("vkGetMemoryZirconHandlePropertiesFUCHSIA", DeviceLevel).}

proc loadAllVK_FUCHSIA_external_memory*(instance: Instance) = instance.loadCommands:
  getMemoryZirconHandleFUCHSIA
  getMemoryZirconHandlePropertiesFUCHSIA
proc loadVK_FUCHSIA_external_memory*(device: Device) = device.loadCommands:
  getMemoryZirconHandleFUCHSIA
  getMemoryZirconHandlePropertiesFUCHSIA
