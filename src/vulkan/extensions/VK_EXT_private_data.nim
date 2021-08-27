# Generated at 2021-08-27T06:01:03Z
# VK_EXT_private_data
# =================================

import ../platform
import ../features/vk10


const
  ExtPrivateDataSpecVersion* = 1
  ExtPrivateDataExtensionName* = "VK_EXT_private_data"

type
  PhysicalDevicePrivateDataFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    privateData*: Bool32
  DevicePrivateDataCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    privateDataSlotRequestCount*: uint32
  PrivateDataSlotCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PrivateDataSlotCreateFlagsEXT
  PrivateDataSlotEXT* = distinct NonDispatchableHandle
  PrivateDataSlotCreateFlagsEXT* = distinct Flags
  PrivateDataSlotCreateFlagBitsEXT* = UnusedEnum

var # commands
  createPrivateDataSlotEXTCage: proc(device: Device; pCreateInfo: ptr PrivateDataSlotCreateInfoEXT; pAllocator: ptr AllocationCallbacks; pPrivateDataSlot: ptr PrivateDataSlotEXT;): Result {.cdecl.}
  destroyPrivateDataSlotEXTCage: proc(device: Device; privateDataSlot: PrivateDataSlotEXT; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  setPrivateDataEXTCage: proc(device: Device; objectType: ObjectType; objectHandle: uint64; privateDataSlot: PrivateDataSlotEXT; data: uint64;): Result {.cdecl.}
  getPrivateDataEXTCage: proc(device: Device; objectType: ObjectType; objectHandle: uint64; privateDataSlot: PrivateDataSlotEXT; pData: ptr uint64;): void {.cdecl.}
proc createPrivateDataSlotEXT*(
      device: Device;
      pCreateInfo: ptr PrivateDataSlotCreateInfoEXT;
      pAllocator: ptr AllocationCallbacks;
      pPrivateDataSlot: ptr PrivateDataSlotEXT;
    ): Result {.cdecl, discardable.} =
  createPrivateDataSlotEXTCage(device,pCreateInfo,pAllocator,pPrivateDataSlot)
proc destroyPrivateDataSlotEXT*(
      device: Device;
      privateDataSlot: PrivateDataSlotEXT;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyPrivateDataSlotEXTCage(device,privateDataSlot,pAllocator)
proc setPrivateDataEXT*(
      device: Device;
      objectType: ObjectType;
      objectHandle: uint64;
      privateDataSlot: PrivateDataSlotEXT;
      data: uint64;
    ): Result {.cdecl, discardable.} =
  setPrivateDataEXTCage(device,objectType,objectHandle,privateDataSlot,data)
proc getPrivateDataEXT*(
      device: Device;
      objectType: ObjectType;
      objectHandle: uint64;
      privateDataSlot: PrivateDataSlotEXT;
      pData: ptr uint64;
    ): void {.cdecl.} =
  getPrivateDataEXTCage(device,objectType,objectHandle,privateDataSlot,pData)
proc loadVK_EXT_private_data*(instance: Instance) =
  instance.defineLoader(`<<`)

  createPrivateDataSlotEXTCage << "vkCreatePrivateDataSlotEXT"
  destroyPrivateDataSlotEXTCage << "vkDestroyPrivateDataSlotEXT"
  setPrivateDataEXTCage << "vkSetPrivateDataEXT"
  getPrivateDataEXTCage << "vkGetPrivateDataEXT"