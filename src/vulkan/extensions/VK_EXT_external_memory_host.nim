# VK_EXT_external_memory_host

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtExternalMemoryHostSpecVersion* = 1
  ExtExternalMemoryHostExtensionName* = "VK_EXT_external_memory_host"

type
  ImportMemoryHostPointerInfoEXT* = object
    sType* {.constant: (StructureType.importMemoryHostPointerInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    handleType*: ExternalMemoryHandleTypeFlagBits
    pHostPointer*: pointer
  MemoryHostPointerPropertiesEXT* = object
    sType* {.constant: (StructureType.memoryHostPointerPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    memoryTypeBits*: uint32
  PhysicalDeviceExternalMemoryHostPropertiesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceExternalMemoryHostPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    minImportedHostPointerAlignment*: DeviceSize

proc getMemoryHostPointerPropertiesEXT*(
      device: Device;
      handleType: ExternalMemoryHandleTypeFlagBits;
      pHostPointer: pointer;
      pMemoryHostPointerProperties: ptr MemoryHostPointerPropertiesEXT;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorInvalidExternalHandle],
      lazyload("vkGetMemoryHostPointerPropertiesEXT", DeviceLevel).}

proc loadAllVK_EXT_external_memory_host*(instance: Instance) = instance.loadCommands:
  getMemoryHostPointerPropertiesEXT
proc loadVK_EXT_external_memory_host*(device: Device) = device.loadCommands:
  getMemoryHostPointerPropertiesEXT
