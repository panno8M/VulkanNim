# Generated at 2021-08-31T00:07:47Z
# VK_AMD_display_native_hdr


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_get_surface_capabilities2
import ./VK_KHR_swapchain
export VK_KHR_get_physical_device_properties2
export VK_KHR_get_surface_capabilities2
export VK_KHR_swapchain

const
  AmdDisplayNativeHdrSpecVersion* = 1
  AmdDisplayNativeHdrExtensionName* = "VK_AMD_display_native_hdr"

type
  DisplayNativeHdrSurfaceCapabilitiesAMD* = object
    sType*: StructureType
    pNext*: pointer
    localDimmingSupport*: Bool32
  SwapchainDisplayNativeHdrCreateInfoAMD* = object
    sType*: StructureType
    pNext*: pointer
    localDimmingEnable*: Bool32

var # command cages
  setLocalDimmingAMDCage: proc(device: Device; swapChain: SwapchainKHR; localDimmingEnable: Bool32;): void {.cdecl.}
proc setLocalDimmingAMD*(
      device: Device;
      swapChain: SwapchainKHR;
      localDimmingEnable: Bool32;
    ): void {.cdecl.} =
  setLocalDimmingAMDCage(device,swapChain,localDimmingEnable)
proc loadVK_AMD_display_native_hdr*(instance: Instance) =
  instance.defineLoader(`<<`)

  setLocalDimmingAMDCage << "vkSetLocalDimmingAMD"