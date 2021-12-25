# Generated at 2021-12-25T07:50:19Z
# VK_EXT_external_memory_host

import ../platform
import ../features/vk11
import ./VK_KHR_external_memory
export VK_KHR_external_memory

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
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorInvalidExternalHandle),
      lazyload("vkGetMemoryHostPointerPropertiesEXT", DeviceLevel).}

proc loadAllVK_EXT_external_memory_host*(instance: Instance) =
  instance.loadCommand getMemoryHostPointerPropertiesEXT

proc loadVK_EXT_external_memory_host*(device: Device) =
  device.loadCommand getMemoryHostPointerPropertiesEXT

