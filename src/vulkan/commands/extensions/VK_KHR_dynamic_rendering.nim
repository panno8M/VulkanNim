# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_KHR_dynamic_rendering

import ../tools
const
  # VK_KHR_dynamic_rendering
  KhrDynamicRenderingSpecVersion* = 1
  KhrDynamicRenderingExtensionName* = "VK_KHR_dynamic_rendering"


# VK_KHR_dynamic_rendering
# ========================
proc cmdBeginRenderingKHR*(
      commandBuffer: CommandBuffer;
      pRenderingInfo: ptr RenderingInfoKHR;
    ): void {.cdecl, lazyload("vkCmdBeginRenderingKHR", DeviceLevel).}
proc cmdEndRenderingKHR*(
      commandBuffer: CommandBuffer;
    ): void {.cdecl, lazyload("vkCmdEndRenderingKHR", DeviceLevel).}


proc loadAllVK_KHR_dynamic_rendering*(instance: Instance) = instance.loadCommands:
  cmdBeginRenderingKHR
  cmdEndRenderingKHR
proc loadVK_KHR_dynamic_rendering*(device: Device) = device.loadCommands:
  cmdBeginRenderingKHR
  cmdEndRenderingKHR