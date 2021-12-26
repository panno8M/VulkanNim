# Generated at 2021-12-26T10:42:47Z
# VK_KHR_incremental_present

import ../platform

import ../features/vk10
import ./VK_KHR_swapchain
export VK_KHR_swapchain
prepareVulkanLibDef()

const
  KhrIncrementalPresentSpecVersion* = 1
  KhrIncrementalPresentExtensionName* = "VK_KHR_incremental_present"

type
  PresentRegionsKHR* = object
    sType* {.constant: (StructureType.presentRegionsKhr).}: StructureType
    pNext* {.optional.}: pointer
    swapchainCount*: uint32
    pRegions* {.optional, length: swapchainCount.}: arrPtr[PresentRegionKHR]
  PresentRegionKHR* = object
    rectangleCount* {.optional.}: uint32
    pRectangles* {.optional, length: rectangleCount.}: arrPtr[RectLayerKHR]
  RectLayerKHR* = object
    offset*: Offset2D
    extent*: Extent2D
    layer*: uint32



