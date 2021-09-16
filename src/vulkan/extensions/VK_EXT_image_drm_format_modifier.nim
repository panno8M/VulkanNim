# Generated at 2021-09-16T07:11:43Z
# VK_EXT_image_drm_format_modifier


import ../platform
import ../features/vk10
import ./VK_KHR_bind_memory2
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_image_format_list
import ./VK_KHR_sampler_ycbcr_conversion
export VK_KHR_bind_memory2
export VK_KHR_get_physical_device_properties2
export VK_KHR_image_format_list
export VK_KHR_sampler_ycbcr_conversion

const
  ExtImageDrmFormatModifierSpecVersion* = 1
  ExtImageDrmFormatModifierExtensionName* = "VK_EXT_image_drm_format_modifier"

type
  DrmFormatModifierPropertiesListEXT* = object
    sType* {.constant: (StructureType.drmFormatModifierPropertiesListExt).}: StructureType
    pNext* {.optional.}: pointer
    drmFormatModifierCount* {.optional.}: uint32
    pDrmFormatModifierProperties*: ptr DrmFormatModifierPropertiesEXT
  DrmFormatModifierPropertiesEXT* = object
    drmFormatModifier*: uint64
    drmFormatModifierPlaneCount*: uint32
    drmFormatModifierTilingFeatures*: FormatFeatureFlags
  PhysicalDeviceImageDrmFormatModifierInfoEXT* = object
    sType* {.constant: (StructureType.physicalDeviceImageDrmFormatModifierInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    drmFormatModifier*: uint64
    sharingMode*: SharingMode
    queueFamilyIndexCount* {.optional.}: uint32
    pQueueFamilyIndices*: ptr uint32
  ImageDrmFormatModifierListCreateInfoEXT* = object
    sType* {.constant: (StructureType.imageDrmFormatModifierListCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    drmFormatModifierCount*: uint32
    pDrmFormatModifiers*: ptr uint64
  ImageDrmFormatModifierExplicitCreateInfoEXT* = object
    sType* {.constant: (StructureType.imageDrmFormatModifierExplicitCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    drmFormatModifier*: uint64
    drmFormatModifierPlaneCount*: uint32
    pPlaneLayouts*: ptr SubresourceLayout
  ImageDrmFormatModifierPropertiesEXT* = object
    sType* {.constant: (StructureType.imageDrmFormatModifierPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    drmFormatModifier*: uint64

proc getImageDrmFormatModifierPropertiesEXT*(
      device: Device;
      image: Image;
      pProperties: ptr ImageDrmFormatModifierPropertiesEXT;
    ): Result {.cdecl, lazyload("vkGetImageDrmFormatModifierPropertiesEXT", DeviceLevel).}

proc loadAllVK_EXT_image_drm_format_modifier*(instance: Instance) =
  getImageDrmFormatModifierPropertiesEXT.load(instance)

proc loadVK_EXT_image_drm_format_modifier*(device: Device) =
  getImageDrmFormatModifierPropertiesEXT.load(device)

