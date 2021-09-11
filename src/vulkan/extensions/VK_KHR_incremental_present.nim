# Generated at 2021-09-10T05:27:58Z
# VK_KHR_incremental_present


import ../platform
import ../features/vk10
import ./VK_KHR_swapchain
export VK_KHR_swapchain

const
  KhrIncrementalPresentSpecVersion* = 1
  KhrIncrementalPresentExtensionName* = "VK_KHR_incremental_present"

type
  PresentRegionsKHR* = object
    sType* {.constant: (StructureType.presentRegionsKhr).}: StructureType
    pNext* {.optional.}: pointer
    swapchainCount*: uint32
    pRegions* {.optional.}: ptr PresentRegionKHR
  PresentRegionKHR* = object
    rectangleCount* {.optional.}: uint32
    pRectangles* {.optional.}: ptr RectLayerKHR
  RectLayerKHR* = object
    offset*: Offset2D
    extent*: Extent2D
    layer*: uint32



