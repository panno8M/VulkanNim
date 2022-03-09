# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_EXT_multi_draw

import ../tools
const
  # VK_EXT_multi_draw
  ExtMultiDrawSpecVersion* = 1
  ExtMultiDrawExtensionName* = "VK_EXT_multi_draw"


# VK_EXT_multi_draw
# =================
proc cmdDrawMultiEXT*(
      commandBuffer: CommandBuffer;
      drawCount = default(uint32);
      pVertexInfo {.length: drawCount.}: arrPtr[MultiDrawInfoEXT];
      instanceCount: uint32;
      firstInstance: uint32;
      stride: uint32;
    ): void {.lazyload("vkCmdDrawMultiEXT", DeviceLevel),
      queues: QueueFlags{graphics}, cmdchain.}
proc cmdDrawMultiIndexedEXT*(
      commandBuffer: CommandBuffer;
      drawCount = default(uint32);
      pIndexInfo {.length: drawCount.}: arrPtr[MultiDrawIndexedInfoEXT];
      instanceCount: uint32;
      firstInstance: uint32;
      stride: uint32;
      pVertexOffset = default(ptr int32);
    ): void {.lazyload("vkCmdDrawMultiIndexedEXT", DeviceLevel),
      queues: QueueFlags{graphics}, cmdchain.}


proc loadAllVK_EXT_multi_draw*(instance: Instance) = instance.loadCommands:
  cmdDrawMultiEXT
  cmdDrawMultiIndexedEXT
proc loadVK_EXT_multi_draw*(device: Device) = device.loadCommands:
  cmdDrawMultiEXT
  cmdDrawMultiIndexedEXT