# Generated at 2021-08-27T06:01:03Z
# VK_KHR_surface_protected_capabilities
# =====================================

import ../platform
import ../features/vk10
import VK_KHR_get_surface_capabilities2


const
  KhrSurfaceProtectedCapabilitiesSpecVersion* = 1
  KhrSurfaceProtectedCapabilitiesExtensionName* = "VK_KHR_surface_protected_capabilities"

type
  SurfaceProtectedCapabilitiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    supportsProtected*: Bool32


