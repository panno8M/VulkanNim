# Generated at 2021-12-26T16:57:02Z
# VK_NV_external_memory_rdma

import ../platform

import ../features/vk10
import ./VK_KHR_external_memory
export VK_KHR_external_memory
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
      successCodes(success),
      errorCodes(errorInvalidExternalHandle),
      lazyload("vkGetMemoryRemoteAddressNV", DeviceLevel).}

proc loadAllVK_NV_external_memory_rdma*(instance: Instance) =
  instance.loadCommand getMemoryRemoteAddressNV

proc loadVK_NV_external_memory_rdma*(device: Device) =
  device.loadCommand getMemoryRemoteAddressNV

