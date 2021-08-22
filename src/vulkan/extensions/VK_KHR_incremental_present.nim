
import ../platform
import ../features/vk10
import VK_KHR_swapchain


type
  PresentRegionKHR* = object
    rectangleCount*: uint32
    pRectangles*: ptr RectLayerKHR
  PresentRegionsKHR* = object
    sType*: StructureType
    pNext*: pointer
    swapchainCount*: uint32
    pRegions*: ptr PresentRegionKHR
  RectLayerKHR* = object
    offset*: Offset2D
    extent*: Extent2D
    layer*: uint32

const KhrIncrementalPresentExtensionName* = "VK_KHR_incremental_present"
const KhrIncrementalPresentSpecVersion* = 1

