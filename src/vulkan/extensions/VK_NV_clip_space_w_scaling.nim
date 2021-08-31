# Generated at 2021-08-31T05:19:03Z
# VK_NV_clip_space_w_scaling


import ../platform
import ../features/vk10

const
  NvClipSpaceWScalingSpecVersion* = 1
  NvClipSpaceWScalingExtensionName* = "VK_NV_clip_space_w_scaling"

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

var # command cages
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