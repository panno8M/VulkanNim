
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2
import VK_KHR_get_surface_capabilities2
import VK_KHR_swapchain


type
  DisplayNativeHdrSurfaceCapabilitiesAMD* = object
    sType*: StructureType
    pNext*: pointer
    localDimmingSupport*: Bool32
  SwapchainDisplayNativeHdrCreateInfoAMD* = object
    sType*: StructureType
    pNext*: pointer
    localDimmingEnable*: Bool32

const AmdDisplayNativeHdrExtensionName* = "VK_AMD_display_native_hdr"
const AmdDisplayNativeHdrSpecVersion* = 1
var # commands
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