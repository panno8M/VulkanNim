
import ../platform
import ../features/vk10
import VK_KHR_swapchain




type
  HdrMetadataEXT* = object
    sType*: StructureType
    pNext*: pointer
    displayPrimaryRed*: XYColorEXT
    displayPrimaryGreen*: XYColorEXT
    displayPrimaryBlue*: XYColorEXT
    whitePoint*: XYColorEXT
    maxLuminance*: float32
    minLuminance*: float32
    maxContentLightLevel*: float32
    maxFrameAverageLightLevel*: float32
  # Chromaticity coordinate
  XYColorEXT* = object
    x*: float32
    y*: float32

var # commands
  setHdrMetadataEXTCage: proc(device: Device; swapchainCount: uint32; pSwapchains: ptr SwapchainKHR; pMetadata: ptr HdrMetadataEXT;): void {.cdecl.}
proc setHdrMetadataEXT*(
      device: Device;
      swapchainCount: uint32;
      pSwapchains: ptr SwapchainKHR;
      pMetadata: ptr HdrMetadataEXT;
    ): void {.cdecl.} =
  setHdrMetadataEXTCage(device,swapchainCount,pSwapchains,pMetadata)
proc loadVK_EXT_hdr_metadata*(instance: Instance) =
  instance.defineLoader(`<<`)

  setHdrMetadataEXTCage << "vkSetHdrMetadataEXT"