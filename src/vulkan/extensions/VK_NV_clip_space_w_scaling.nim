# Generated at 2021-12-30T17:13:13Z
# VK_NV_clip_space_w_scaling

import ../platform

import ../features/vk10

prepareVulkanLibDef()

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
    pViewportWScalings* {.optional, length: viewportCount.}: arrPtr[ViewportWScalingNV]

proc cmdSetViewportWScalingNV*(
      commandBuffer: CommandBuffer;
      firstViewport: uint32;
      viewportCount: uint32;
      pViewportWScalings {.length: viewportCount.}: arrPtr[ViewportWScalingNV];
    ): void {.cdecl, lazyload("vkCmdSetViewportWScalingNV", DeviceLevel).}

proc loadAllVK_NV_clip_space_w_scaling*(instance: Instance) = instance.loadCommands:
  cmdSetViewportWScalingNV
proc loadVK_NV_clip_space_w_scaling*(device: Device) = device.loadCommands:
  cmdSetViewportWScalingNV
