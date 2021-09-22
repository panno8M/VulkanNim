# Generated at 2021-09-22T15:02:54Z
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
    sType* {.constant: (StructureType.surfaceProtectedCapabilitiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    supportsProtected*: Bool32



