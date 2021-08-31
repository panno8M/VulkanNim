# Generated at 2021-08-31T05:19:02Z
# VK_EXT_hdr_metadata


import ../platform
import ../features/vk10
import ./VK_KHR_swapchain
export VK_KHR_swapchain

const
  ExtHdrMetadataSpecVersion* = 2
  ExtHdrMetadataExtensionName* = "VK_EXT_hdr_metadata"

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

var # command cages
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