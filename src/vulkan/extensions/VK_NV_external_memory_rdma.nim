# VK_NV_external_memory_rdma

import ../features/vk10
import VK_KHR_external_memory
import ../platform
prepareVulkanLibDef()

const
  NvExternalMemoryRdmaSpecVersion* = 1
  NvExternalMemoryRdmaExtensionName* = "VK_NV_external_memory_rdma"

type
  MemoryGetRemoteAddressInfoNV* = object
    sType* {.constant: (StructureType.memoryGetRemoteAddressInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    memory*: DeviceMemory
    handleType*: ExternalMemoryHandleTypeFlagBits
  PhysicalDeviceExternalMemoryRDMAFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceExternalMemoryRdmaFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    externalMemoryRDMA*: Bool32

proc getMemoryRemoteAddressNV*(
      device: Device;
      pMemoryGetRemoteAddressInfo: ptr MemoryGetRemoteAddressInfoNV;
      pAddress: ptr RemoteAddressNV;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorInvalidExternalHandle],
      lazyload("vkGetMemoryRemoteAddressNV", DeviceLevel).}

proc loadAllVK_NV_external_memory_rdma*(instance: Instance) = instance.loadCommands:
  getMemoryRemoteAddressNV
proc loadVK_NV_external_memory_rdma*(device: Device) = device.loadCommands:
  getMemoryRemoteAddressNV
