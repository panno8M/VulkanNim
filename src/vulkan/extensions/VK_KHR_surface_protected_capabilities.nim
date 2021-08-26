
import ../platform
import ../features/vk10
import VK_KHR_get_surface_capabilities2




type
  SurfaceProtectedCapabilitiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    supportsProtected*: Bool32


