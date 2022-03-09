# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_EXT_private_data

import ../tools
const
  # VK_EXT_private_data
  ExtPrivateDataSpecVersion* = 1
  ExtPrivateDataExtensionName* = "VK_EXT_private_data"


# VK_EXT_private_data
# ===================
proc createPrivateDataSlotEXT*(
      device: Device;
      pCreateInfo: ptr PrivateDataSlotCreateInfoEXT;
      pAllocator = default(ptr AllocationCallbacks);
      pPrivateDataSlot: ptr PrivateDataSlotEXT;
    ): Result {.lazyload("vkCreatePrivateDataSlotEXT", DeviceLevel),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory].}
proc destroyPrivateDataSlotEXT*(
      device: Device;
      privateDataSlot = default(PrivateDataSlotEXT);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.lazyload("vkDestroyPrivateDataSlotEXT", DeviceLevel).}
proc setPrivateDataEXT*(
      device: Device;
      objectType: ObjectType;
      objectHandle: uint64;
      privateDataSlot: PrivateDataSlotEXT;
      data: uint64;
    ): Result {.lazyload("vkSetPrivateDataEXT", DeviceLevel),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory].}
proc getPrivateDataEXT*(
      device: Device;
      objectType: ObjectType;
      objectHandle: uint64;
      privateDataSlot: PrivateDataSlotEXT;
      pData: ptr uint64;
    ): void {.lazyload("vkGetPrivateDataEXT", DeviceLevel).}


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