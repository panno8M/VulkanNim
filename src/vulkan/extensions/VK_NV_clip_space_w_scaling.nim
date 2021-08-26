
import ../platform
import ../features/vk10




type
  ViewportWScalingNV* = object
    xcoeff*: float32
    ycoeff*: float32
  PipelineViewportWScalingStateCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    viewportWScalingEnable*: Bool32
    viewportCount*: uint32
    pViewportWScalings*: ptr ViewportWScalingNV

var # commands
  cmdSetViewportWScalingNVCage: proc(commandBuffer: CommandBuffer; firstViewport: uint32; viewportCount: uint32; pViewportWScalings: ptr ViewportWScalingNV;): void {.cdecl.}
proc cmdSetViewportWScalingNV*(
      commandBuffer: CommandBuffer;
      firstViewport: uint32;
      viewportCount: uint32;
      pViewportWScalings: ptr ViewportWScalingNV;
    ): void {.cdecl.} =
  cmdSetViewportWScalingNVCage(commandBuffer,firstViewport,viewportCount,pViewportWScalings)
proc loadVK_NV_clip_space_w_scaling*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdSetViewportWScalingNVCage << "vkCmdSetViewportWScalingNV"