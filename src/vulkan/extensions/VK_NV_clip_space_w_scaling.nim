# Generated at 2021-09-16T07:11:43Z
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
    sType* {.constant: (StructureType.pipelineViewportWScalingStateCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    viewportWScalingEnable*: Bool32
    viewportCount*: uint32
    pViewportWScalings* {.optional.}: ptr ViewportWScalingNV

proc cmdSetViewportWScalingNV*(
      commandBuffer: CommandBuffer;
      firstViewport: uint32;
      viewportCount: uint32;
      pViewportWScalings: ptr ViewportWScalingNV;
    ): void {.cdecl, lazyload("vkCmdSetViewportWScalingNV", DeviceLevel).}

proc loadAllVK_NV_clip_space_w_scaling*(instance: Instance) =
  cmdSetViewportWScalingNV.load(instance)

proc loadVK_NV_clip_space_w_scaling*(device: Device) =
  cmdSetViewportWScalingNV.load(device)

