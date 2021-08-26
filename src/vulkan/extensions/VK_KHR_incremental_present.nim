
import ../platform
import ../features/vk10
import VK_KHR_swapchain




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


