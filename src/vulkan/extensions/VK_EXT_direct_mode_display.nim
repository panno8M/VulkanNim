# Generated at 2021-09-16T07:11:43Z
# VK_EXT_direct_mode_display


import ../platform
import ../features/vk10
import ./VK_KHR_surface
export VK_KHR_surface

const
  ExtDirectModeDisplaySpecVersion* = 1
  ExtDirectModeDisplayExtensionName* = "VK_EXT_direct_mode_display"

proc releaseDisplayEXT*(
      physicalDevice: PhysicalDevice;
      display: DisplayKHR;
    ): Result {.cdecl, lazyload("vkReleaseDisplayEXT", InstanceLevel).}

proc loadAllVK_EXT_direct_mode_display*(instance: Instance) =
  releaseDisplayEXT.load(instance)

proc loadVK_EXT_direct_mode_display*(instance: Instance) =
  releaseDisplayEXT.load(instance)

