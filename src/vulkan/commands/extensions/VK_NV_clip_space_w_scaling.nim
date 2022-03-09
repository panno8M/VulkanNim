# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_NV_clip_space_w_scaling

import ../tools
const
  # VK_NV_clip_space_w_scaling
  NvClipSpaceWScalingSpecVersion* = 1
  NvClipSpaceWScalingExtensionName* = "VK_NV_clip_space_w_scaling"


# VK_NV_clip_space_w_scaling
# ==========================
proc cmdSetViewportWScalingNV*(
      commandBuffer: CommandBuffer;
      firstViewport: uint32;
      viewportCount: uint32;
      pViewportWScalings {.length: viewportCount.}: arrPtr[ViewportWScalingNV];
    ): void {.lazyload("vkCmdSetViewportWScalingNV", DeviceLevel), cmdchain.}


proc loadAllVK_NV_clip_space_w_scaling*(instance: Instance) = instance.loadCommands:
  cmdSetViewportWScalingNV
proc loadVK_NV_clip_space_w_scaling*(device: Device) = device.loadCommands:
  cmdSetViewportWScalingNV