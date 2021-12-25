# Generated at 2021-12-25T07:50:19Z
# VK_AMD_buffer_marker

import ../platform
import ../features/vk10

prepareVulkanLibDef()

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
  instance.loadCommand cmdWriteBufferMarkerAMD

proc loadVK_AMD_buffer_marker*(device: Device) =
  device.loadCommand cmdWriteBufferMarkerAMD

