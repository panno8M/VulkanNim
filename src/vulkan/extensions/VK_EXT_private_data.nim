
import ../platform
import ../features/vk10


type
  PrivateDataSlotCreateFlagBitsEXT* = UnusedEnum
  PhysicalDevicePrivateDataFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    privateData*: Bool32
  PrivateDataSlotCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PrivateDataSlotCreateFlagsEXT
  PrivateDataSlotEXT* = distinct NonDispatchableHandle
  DevicePrivateDataCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    privateDataSlotRequestCount*: uint32
  PrivateDataSlotCreateFlagsEXT* = distinct Flags

const ExtPrivateDataExtensionName* = "VK_EXT_private_data"
const ExtPrivateDataSpecVersion* = 1
var # commands
  destroyPrivateDataSlotEXTCage: proc(device: Device; privateDataSlot: PrivateDataSlotEXT; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  getPrivateDataEXTCage: proc(device: Device; objectType: ObjectType; objectHandle: uint64; privateDataSlot: PrivateDataSlotEXT; pData: ptr uint64;): void {.cdecl.}
  createPrivateDataSlotEXTCage: proc(device: Device; pCreateInfo: ptr PrivateDataSlotCreateInfoEXT; pAllocator: ptr AllocationCallbacks; pPrivateDataSlot: ptr PrivateDataSlotEXT;): Result {.cdecl.}
  setPrivateDataEXTCage: proc(device: Device; objectType: ObjectType; objectHandle: uint64; privateDataSlot: PrivateDataSlotEXT; data: uint64;): Result {.cdecl.}

proc destroyPrivateDataSlotEXT*(
      device: Device;
      privateDataSlot: PrivateDataSlotEXT;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyPrivateDataSlotEXTCage(device,privateDataSlot,pAllocator)

proc getPrivateDataEXT*(
      device: Device;
      objectType: ObjectType;
      objectHandle: uint64;
      privateDataSlot: PrivateDataSlotEXT;
      pData: ptr uint64;
    ): void {.cdecl.} =
  getPrivateDataEXTCage(device,objectType,objectHandle,privateDataSlot,pData)

proc createPrivateDataSlotEXT*(
      device: Device;
      pCreateInfo: ptr PrivateDataSlotCreateInfoEXT;
      pAllocator: ptr AllocationCallbacks;
      pPrivateDataSlot: ptr PrivateDataSlotEXT;
    ): Result {.cdecl.} =
  createPrivateDataSlotEXTCage(device,pCreateInfo,pAllocator,pPrivateDataSlot)

proc setPrivateDataEXT*(
      device: Device;
      objectType: ObjectType;
      objectHandle: uint64;
      privateDataSlot: PrivateDataSlotEXT;
      data: uint64;
    ): Result {.cdecl.} =
  setPrivateDataEXTCage(device,objectType,objectHandle,privateDataSlot,data)


proc loadVK_EXT_private_data*(instance: Instance) =
  instance.defineLoader(`<<`)

  destroyPrivateDataSlotEXTCage << "vkDestroyPrivateDataSlotEXT"
  getPrivateDataEXTCage << "vkGetPrivateDataEXT"
  createPrivateDataSlotEXTCage << "vkCreatePrivateDataSlotEXT"
  setPrivateDataEXTCage << "vkSetPrivateDataEXT"