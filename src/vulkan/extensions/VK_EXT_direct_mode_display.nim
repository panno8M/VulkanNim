
import ../platform
import ../features/vk10
import VK_KHR_display


# type


const ExtDirectModeDisplaySpecVersion* = 1
const ExtDirectModeDisplayExtensionName* = "VK_EXT_direct_mode_display"
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