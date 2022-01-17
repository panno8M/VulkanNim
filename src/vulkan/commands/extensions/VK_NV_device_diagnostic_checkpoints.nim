# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_NV_device_diagnostic_checkpoints

import ../tools
const
  # VK_NV_device_diagnostic_checkpoints
  NvDeviceDiagnosticCheckpointsSpecVersion* = 2
  NvDeviceDiagnosticCheckpointsExtensionName* = "VK_NV_device_diagnostic_checkpoints"


# VK_NV_device_diagnostic_checkpoints
# ===================================
proc cmdSetCheckpointNV*(
      commandBuffer: CommandBuffer;
      pCheckpointMarker: pointer;
    ): void {.lazyload("vkCmdSetCheckpointNV", DeviceLevel), cmdchain.}
proc getQueueCheckpointDataNV*(
      queue: Queue;
      pCheckpointDataCount: ptr uint32;
      pCheckpointData {.length: pCheckpointDataCount.} = default(arrPtr[CheckpointDataNV]);
    ): void {.lazyload("vkGetQueueCheckpointDataNV", DeviceLevel).}


proc loadAllVK_NV_device_diagnostic_checkpoints*(instance: Instance) = instance.loadCommands:
  cmdSetCheckpointNV
  getQueueCheckpointDataNV
proc loadVK_NV_device_diagnostic_checkpoints*(device: Device) = device.loadCommands:
  cmdSetCheckpointNV
  getQueueCheckpointDataNV