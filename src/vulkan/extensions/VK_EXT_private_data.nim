# Generated at 2021-09-10T05:27:58Z
# VK_EXT_private_data


import ../platform
import ../features/vk10

const
  ExtPrivateDataSpecVersion* = 1
  ExtPrivateDataExtensionName* = "VK_EXT_private_data"

type # enums and bitmasks
  PrivateDataSlotCreateFlagsEXT* = Flags[PrivateDataSlotCreateFlagBitsEXT]
  PrivateDataSlotCreateFlagBitsEXT* = distinct UnusedEnum

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
  HtPrivateDataSlotEXT = object of HandleType
  PrivateDataSlotEXT* = NonDispatchableHandle[HtPrivateDataSlotEXT]

proc createPrivateDataSlotEXT*(
      device: Device;
      pCreateInfo: ptr PrivateDataSlotCreateInfoEXT;
      pAllocator: ptr AllocationCallbacks;
      pPrivateDataSlot: ptr PrivateDataSlotEXT;
    ): Result {.cdecl, lazyload("vkCreatePrivateDataSlotEXT", DeviceLevel).}
proc destroyPrivateDataSlotEXT*(
      device: Device;
      privateDataSlot: PrivateDataSlotEXT;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl, lazyload("vkDestroyPrivateDataSlotEXT", DeviceLevel).}
proc setPrivateDataEXT*(
      device: Device;
      objectType: ObjectType;
      objectHandle: uint64;
      privateDataSlot: PrivateDataSlotEXT;
      data: uint64;
    ): Result {.cdecl, lazyload("vkSetPrivateDataEXT", DeviceLevel).}
proc getPrivateDataEXT*(
      device: Device;
      objectType: ObjectType;
      objectHandle: uint64;
      privateDataSlot: PrivateDataSlotEXT;
      pData: ptr uint64;
    ): void {.cdecl, lazyload("vkGetPrivateDataEXT", DeviceLevel).}

proc loadAllVK_EXT_private_data*(instance: Instance) =
  createPrivateDataSlotEXT.smartLoad(instance)
  destroyPrivateDataSlotEXT.smartLoad(instance)
  setPrivateDataEXT.smartLoad(instance)
  getPrivateDataEXT.smartLoad(instance)

proc loadVK_EXT_private_data*(device: Device) =
  createPrivateDataSlotEXT.smartLoad(device)
  destroyPrivateDataSlotEXT.smartLoad(device)
  setPrivateDataEXT.smartLoad(device)
  getPrivateDataEXT.smartLoad(device)

