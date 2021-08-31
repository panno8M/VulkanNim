# Generated at 2021-08-31T00:07:47Z
# VK_KHR_surface_protected_capabilities


import ../platform
import ../features/vk10
import ./VK_KHR_get_surface_capabilities2
export VK_KHR_get_surface_capabilities2

const
  KhrSurfaceProtectedCapabilitiesSpecVersion* = 1
  KhrSurfaceProtectedCapabilitiesExtensionName* = "VK_KHR_surface_protected_capabilities"

type
  SurfaceProtectedCapabilitiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    supportsProtected*: Bool32


