# VK_AMD_display_native_hdr

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  AmdDisplayNativeHdrSpecVersion* = 1
  AmdDisplayNativeHdrExtensionName* = "VK_AMD_display_native_hdr"

type
  DisplayNativeHdrSurfaceCapabilitiesAMD* = object
    sType* {.constant: (StructureType.displayNativeHdrSurfaceCapabilitiesAmd).}: StructureType
    pNext* {.optional.}: pointer
    localDimmingSupport*: Bool32
  SwapchainDisplayNativeHdrCreateInfoAMD* = object
    sType* {.constant: (StructureType.swapchainDisplayNativeHdrCreateInfoAmd).}: StructureType
    pNext* {.optional.}: pointer
    localDimmingEnable*: Bool32

proc setLocalDimmingAMD*(
      device: Device;
      swapChain: SwapchainKHR;
      localDimmingEnable: Bool32;
    ): void {.cdecl, lazyload("vkSetLocalDimmingAMD", DeviceLevel).}

proc loadAllVK_AMD_display_native_hdr*(instance: Instance) = instance.loadCommands:
  setLocalDimmingAMD
proc loadVK_AMD_display_native_hdr*(device: Device) = device.loadCommands:
  setLocalDimmingAMD
