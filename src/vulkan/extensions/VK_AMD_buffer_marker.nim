# Generated at 2021-09-12T04:58:23Z
# VK_AMD_buffer_marker


import ../platform
import ../features/vk10

const
  AmdBufferMarkerSpecVersion* = 1
  AmdBufferMarkerExtensionName* = "VK_AMD_buffer_marker"

proc cmdWriteBufferMarkerAMD*(
      commandBuffer: CommandBuffer;
      pipelineStage: PipelineStageFlagBits;
      dstBuffer: Buffer;
      dstOffset: DeviceSize;
      marker: uint32;
    ): void {.cdecl, lazyload("vkCmdWriteBufferMarkerAMD", DeviceLevel).}

proc loadAllVK_AMD_buffer_marker*(instance: Instance) =
  cmdWriteBufferMarkerAMD.load(instance)

proc loadVK_AMD_buffer_marker*(device: Device) =
  cmdWriteBufferMarkerAMD.load(device)

