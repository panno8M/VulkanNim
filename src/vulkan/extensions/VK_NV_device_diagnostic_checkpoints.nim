# VK_NV_device_diagnostic_checkpoints

import ../features/vk10
import ../platform
prepareVulkanLibDef()

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
      pCheckpointData {.length: pCheckpointDataCount.} = default(arrPtr[CheckpointDataNV]);
    ): void {.cdecl, lazyload("vkGetQueueCheckpointDataNV", DeviceLevel).}

proc loadAllVK_NV_device_diagnostic_checkpoints*(instance: Instance) = instance.loadCommands:
  cmdSetCheckpointNV
  getQueueCheckpointDataNV
proc loadVK_NV_device_diagnostic_checkpoints*(device: Device) = device.loadCommands:
  cmdSetCheckpointNV
  getQueueCheckpointDataNV
