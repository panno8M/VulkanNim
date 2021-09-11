# Generated at 2021-09-10T05:27:58Z
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
      pCheckpointData: ptr CheckpointDataNV;
    ): void {.cdecl, lazyload("vkGetQueueCheckpointDataNV", DeviceLevel).}

proc loadAllVK_NV_device_diagnostic_checkpoints*(instance: Instance) =
  cmdSetCheckpointNV.smartLoad(instance)
  getQueueCheckpointDataNV.smartLoad(instance)

proc loadVK_NV_device_diagnostic_checkpoints*(device: Device) =
  cmdSetCheckpointNV.smartLoad(device)
  getQueueCheckpointDataNV.smartLoad(device)

