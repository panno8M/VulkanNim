# Generated at 2021-12-30T17:13:13Z
# VK_EXT_hdr_metadata

import ../platform

import ../features/vk10
import ./VK_KHR_swapchain
export VK_KHR_swapchain
prepareVulkanLibDef()

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
      pSwapchains {.length: swapchainCount.}: arrPtr[SwapchainKHR];
      pMetadata {.length: swapchainCount.}: arrPtr[HdrMetadataEXT];
    ): void {.cdecl, lazyload("vkSetHdrMetadataEXT", DeviceLevel).}

proc loadAllVK_EXT_hdr_metadata*(instance: Instance) = instance.loadCommands:
  setHdrMetadataEXT
proc loadVK_EXT_hdr_metadata*(device: Device) = device.loadCommands:
  setHdrMetadataEXT
