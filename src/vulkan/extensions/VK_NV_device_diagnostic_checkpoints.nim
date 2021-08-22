
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  CheckpointDataNV* = object
    sType*: StructureType
    pNext*: pointer
    stage*: PipelineStageFlagBits
    pCheckpointMarker*: pointer
  QueueFamilyCheckpointPropertiesNV* = object
    sType*: StructureType
    pNext*: pointer
    checkpointExecutionStageMask*: PipelineStageFlags

const NvDeviceDiagnosticCheckpointsSpecVersion* = 2
const NvDeviceDiagnosticCheckpointsExtensionName* = "VK_NV_device_diagnostic_checkpoints"
var # commands
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