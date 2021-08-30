# Generated at 2021-08-30T14:31:10Z
# VK_KHR_incremental_present


import ../platform
import ../features/vk10
import ./VK_KHR_swapchain

const
  KhrIncrementalPresentSpecVersion* = 1
  KhrIncrementalPresentExtensionName* = "VK_KHR_incremental_present"

type
  PresentRegionsKHR* = object
    sType*: StructureType
    pNext*: pointer
    swapchainCount*: uint32
    pRegions*: ptr PresentRegionKHR
  PresentRegionKHR* = object
    rectangleCount*: uint32
    pRectangles*: ptr RectLayerKHR
  RectLayerKHR* = object
    offset*: Offset2D
    extent*: Extent2D
    layer*: uint32


