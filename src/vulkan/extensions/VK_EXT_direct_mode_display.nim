# Generated at 2021-08-31T05:19:03Z
# VK_EXT_direct_mode_display


import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

const
  ExtDirectModeDisplaySpecVersion* = 1
  ExtDirectModeDisplayExtensionName* = "VK_EXT_direct_mode_display"

var # command cages
  releaseDisplayEXTCage: proc(physicalDevice: PhysicalDevice; display: DisplayKHR;): Result {.cdecl.}
proc releaseDisplayEXT*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
    ): Result {.cdecl, discardable.} =
  releaseDisplayEXTCage(physicalDevice,display)

proc loadVK_EXT_direct_mode_display*(instance: Instance) =
  instance.defineLoader(`<<`)

  releaseDisplayEXTCage << "vkReleaseDisplayEXT"