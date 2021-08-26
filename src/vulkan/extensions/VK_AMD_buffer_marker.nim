
import ../platform
import ../features/vk10




type


var # commands
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