# VK_KHR_surface_protected_capabilities

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  KhrSurfaceProtectedCapabilitiesSpecVersion* = 1
  KhrSurfaceProtectedCapabilitiesExtensionName* = "VK_KHR_surface_protected_capabilities"

type
  SurfaceProtectedCapabilitiesKHR* = object
    sType* {.constant: (StructureType.surfaceProtectedCapabilitiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    supportsProtected*: Bool32



