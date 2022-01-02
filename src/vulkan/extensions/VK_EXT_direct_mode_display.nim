# VK_EXT_direct_mode_display

import ../features/vk10
import ../platform
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
