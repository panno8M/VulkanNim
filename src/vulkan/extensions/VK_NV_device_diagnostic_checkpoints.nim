# Generated at 2021-09-16T07:11:43Z
# VK_NV_device_diagnostic_checkpoints


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  NvDeviceDiagnosticCheckpointsSpecVersion* = 2
  NvDeviceDiagnosticCheckpointsExtensionName* = "VK_NV_device_diagnostic_checkpoints"

type
  QueueFamilyCheckpointPropertiesNV* = object
    sType* {.constant: (StructureType.queueFamilyCheckpointPropertiesNv).}: StructureType
    pNext* {.optional.}: pointer
    checkpointExecutionStageMask*: PipelineStageFlags
  CheckpointDataNV* = object
    sType* {.constant: (StructureType.checkpointDataNv).}: StructureType
    pNext* {.optional.}: pointer
    stage*: PipelineStageFlagBits
    pCheckpointMarker*: pointer

proc cmdSetCheckpointNV*(
      commandBuffer: CommandBuffer;
      pCheckpointMarker: pointer;
    ): void {.cdecl, lazyload("vkCmdSetCheckpointNV", DeviceLevel).}
proc getQueueCheckpointDataNV*(
      queue: Queue;
      pCheckpointDataCount: ptr uint32;
      pCheckpointData = default(ptr CheckpointDataNV); # optional
    ): void {.cdecl, lazyload("vkGetQueueCheckpointDataNV", DeviceLevel).}

proc loadAllVK_NV_device_diagnostic_checkpoints*(instance: Instance) =
  cmdSetCheckpointNV.load(instance)
  getQueueCheckpointDataNV.load(instance)

proc loadVK_NV_device_diagnostic_checkpoints*(device: Device) =
  cmdSetCheckpointNV.load(device)
  getQueueCheckpointDataNV.load(device)

