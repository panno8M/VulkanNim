# Generated at 2021-12-31T11:28:23Z
# VK_EXT_private_data

import ../platform

import ../features/vk10

prepareVulkanLibDef()

const
  ExtPrivateDataSpecVersion* = 1
  ExtPrivateDataExtensionName* = "VK_EXT_private_data"

type
  PhysicalDevicePrivateDataFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDevicePrivateDataFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    privateData*: Bool32
  DevicePrivateDataCreateInfoEXT* = object
    sType* {.constant: (StructureType.devicePrivateDataCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    privateDataSlotRequestCount*: uint32
  PrivateDataSlotCreateInfoEXT* = object
    sType* {.constant: (StructureType.privateDataSlotCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    flags*: PrivateDataSlotCreateFlagsEXT

proc createPrivateDataSlotEXT*(
      device: Device;
      pCreateInfo: ptr PrivateDataSlotCreateInfoEXT;
      pAllocator = default(ptr AllocationCallbacks);
      pPrivateDataSlot: ptr PrivateDataSlotEXT;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory],
      lazyload("vkCreatePrivateDataSlotEXT", DeviceLevel).}
proc destroyPrivateDataSlotEXT*(
      device: Device;
      privateDataSlot = default(PrivateDataSlotEXT);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, lazyload("vkDestroyPrivateDataSlotEXT", DeviceLevel).}
proc setPrivateDataEXT*(
      device: Device;
      objectType: ObjectType;
      objectHandle: uint64;
      privateDataSlot: PrivateDataSlotEXT;
      data: uint64;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory],
      lazyload("vkSetPrivateDataEXT", DeviceLevel).}
proc getPrivateDataEXT*(
      device: Device;
      objectType: ObjectType;
      objectHandle: uint64;
      privateDataSlot: PrivateDataSlotEXT;
      pData: ptr uint64;
    ): void {.cdecl, lazyload("vkGetPrivateDataEXT", DeviceLevel).}

proc loadAllVK_EXT_private_data*(instance: Instance) = instance.loadCommands:
  createPrivateDataSlotEXT
  destroyPrivateDataSlotEXT
  setPrivateDataEXT
  getPrivateDataEXT
proc loadVK_EXT_private_data*(device: Device) = device.loadCommands:
  createPrivateDataSlotEXT
  destroyPrivateDataSlotEXT
  setPrivateDataEXT
  getPrivateDataEXT
