# Generated at 2021-10-24T09:33:17Z
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
      successCodes(success),
      lazyload("vkReleaseDisplayEXT", InstanceLevel).}

proc loadAllVK_EXT_direct_mode_display*(instance: Instance) =
  instance.loadCommand releaseDisplayEXT

proc loadVK_EXT_direct_mode_display*(instance: Instance) =
  instance.loadCommand releaseDisplayEXT

