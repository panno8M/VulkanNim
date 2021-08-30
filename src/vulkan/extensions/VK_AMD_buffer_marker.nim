# Generated at 2021-08-30T22:51:48Z
# VK_AMD_buffer_marker


import ../platform
import ../features/vk10

const
  AmdBufferMarkerSpecVersion* = 1
  AmdBufferMarkerExtensionName* = "VK_AMD_buffer_marker"

var # command cages
  cmdWriteBufferMarkerAMDCage: proc(commandBuffer: CommandBuffer; pipelineStage: PipelineStageFlagBits; dstBuffer: Buffer; dstOffset: DeviceSize; marker: uint32;): void {.cdecl.}
proc cmdWriteBufferMarkerAMD*(
      commandBuffer: CommandBuffer;
      pipelineStage: PipelineStageFlagBits;
      dstBuffer: Buffer;
      dstOffset: DeviceSize;
      marker: uint32;
    ): void {.cdecl.} =
  cmdWriteBufferMarkerAMDCage(commandBuffer,pipelineStage,dstBuffer,dstOffset,marker)
proc loadVK_AMD_buffer_marker*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdWriteBufferMarkerAMDCage << "vkCmdWriteBufferMarkerAMD"