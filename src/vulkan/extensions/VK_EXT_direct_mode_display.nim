# Generated at 2021-12-31T11:28:23Z
# VK_EXT_direct_mode_display

import ../platform

import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface
prepareVulkanLibDef()

const
  ExtDirectModeDisplaySpecVersion* = 1
  ExtDirectModeDisplayExtensionName* = "VK_EXT_direct_mode_display"

proc releaseDisplayEXT*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      lazyload("vkReleaseDisplayEXT", InstanceLevel).}

proc loadAllVK_EXT_direct_mode_display*(instance: Instance) = instance.loadCommands:
  releaseDisplayEXT
proc loadVK_EXT_direct_mode_display*(instance: Instance) = instance.loadCommands:
  releaseDisplayEXT
