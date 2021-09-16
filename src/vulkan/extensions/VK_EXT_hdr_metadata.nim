# Generated at 2021-09-16T07:11:43Z
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
    sType* {.constant: (StructureType.hdrMetadataExt).}: StructureType
    pNext* {.optional.}: pointer
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

proc setHdrMetadataEXT*(
      device: Device;
      swapchainCount: uint32;
      pSwapchains: ptr SwapchainKHR;
      pMetadata: ptr HdrMetadataEXT;
    ): void {.cdecl, lazyload("vkSetHdrMetadataEXT", DeviceLevel).}

proc loadAllVK_EXT_hdr_metadata*(instance: Instance) =
  setHdrMetadataEXT.load(instance)

proc loadVK_EXT_hdr_metadata*(device: Device) =
  setHdrMetadataEXT.load(device)

