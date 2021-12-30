# Generated at 2021-12-30T17:13:13Z
# VK_AMD_buffer_marker

import ../platform

import ../features/vk10

prepareVulkanLibDef()

const
  AmdBufferMarkerSpecVersion* = 1
  AmdBufferMarkerExtensionName* = "VK_AMD_buffer_marker"

proc cmdWriteBufferMarkerAMD*(
      commandBuffer: CommandBuffer;
      pipelineStage = default(PipelineStageFlagBits);
      dstBuffer: Buffer;
      dstOffset: DeviceSize;
      marker: uint32;
    ): void {.cdecl, lazyload("vkCmdWriteBufferMarkerAMD", DeviceLevel).}

proc loadAllVK_AMD_buffer_marker*(instance: Instance) = instance.loadCommands:
  cmdWriteBufferMarkerAMD
proc loadVK_AMD_buffer_marker*(device: Device) = device.loadCommands:
  cmdWriteBufferMarkerAMD
