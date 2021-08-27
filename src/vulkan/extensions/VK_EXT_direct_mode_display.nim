# Generated at 2021-08-27T06:01:02Z
# VK_EXT_direct_mode_display
# =================================

import ../platform
import ../features/vk10
import VK_KHR_display


const
  ExtDirectModeDisplaySpecVersion* = 1
  ExtDirectModeDisplayExtensionName* = "VK_EXT_direct_mode_display"

var # commands
  releaseDisplayEXTCage: proc(physicalDevice: PhysicalDevice; display: DisplayKHR;): Result {.cdecl.}
proc releaseDisplayEXT*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
    ): Result {.cdecl, discardable.} =
  releaseDisplayEXTCage(physicalDevice,display)
proc loadVK_EXT_direct_mode_display*(instance: Instance) =
  instance.defineLoader(`<<`)

  releaseDisplayEXTCage << "vkReleaseDisplayEXT"