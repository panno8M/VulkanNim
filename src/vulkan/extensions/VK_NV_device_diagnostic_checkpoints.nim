# Generated at 2021-08-31T00:07:47Z
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
    sType*: StructureType
    pNext*: pointer
    checkpointExecutionStageMask*: PipelineStageFlags
  CheckpointDataNV* = object
    sType*: StructureType
    pNext*: pointer
    stage*: PipelineStageFlagBits
    pCheckpointMarker*: pointer

var # command cages
  cmdSetCheckpointNVCage: proc(commandBuffer: CommandBuffer; pCheckpointMarker: pointer;): void {.cdecl.}
  getQueueCheckpointDataNVCage: proc(queue: Queue; pCheckpointDataCount: ptr uint32; pCheckpointData: ptr CheckpointDataNV;): void {.cdecl.}
proc cmdSetCheckpointNV*(
      commandBuffer: CommandBuffer;
      pCheckpointMarker: pointer;
    ): void {.cdecl.} =
  cmdSetCheckpointNVCage(commandBuffer,pCheckpointMarker)
proc getQueueCheckpointDataNV*(
      queue: Queue;
      pCheckpointDataCount: ptr uint32;
      pCheckpointData: ptr CheckpointDataNV;
    ): void {.cdecl.} =
  getQueueCheckpointDataNVCage(queue,pCheckpointDataCount,pCheckpointData)
proc loadVK_NV_device_diagnostic_checkpoints*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdSetCheckpointNVCage << "vkCmdSetCheckpointNV"
  getQueueCheckpointDataNVCage << "vkGetQueueCheckpointDataNV"