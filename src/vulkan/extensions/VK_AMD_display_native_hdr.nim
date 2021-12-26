# Generated at 2021-12-26T10:42:47Z
# VK_AMD_display_native_hdr

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_get_surface_capabilities2
import ./VK_KHR_swapchain
export VK_KHR_get_physical_device_properties2
export VK_KHR_get_surface_capabilities2
export VK_KHR_swapchain
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

proc loadAllVK_AMD_display_native_hdr*(instance: Instance) =
  instance.loadCommand setLocalDimmingAMD

proc loadVK_AMD_display_native_hdr*(device: Device) =
  device.loadCommand setLocalDimmingAMD

