# Generated at 2021-12-26T10:42:47Z
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
prepareVulkanLibDef()

const
  ExtImageDrmFormatModifierSpecVersion* = 1
  ExtImageDrmFormatModifierExtensionName* = "VK_EXT_image_drm_format_modifier"

type
  DrmFormatModifierPropertiesListEXT* = object
    sType* {.constant: (StructureType.drmFormatModifierPropertiesListExt).}: StructureType
    pNext* {.optional.}: pointer
    drmFormatModifierCount* {.optional.}: uint32
    pDrmFormatModifierProperties* {.length: drmFormatModifierCount.}: arrPtr[DrmFormatModifierPropertiesEXT]
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
    pQueueFamilyIndices* {.length: queueFamilyIndexCount.}: arrPtr[uint32]
  ImageDrmFormatModifierListCreateInfoEXT* = object
    sType* {.constant: (StructureType.imageDrmFormatModifierListCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    drmFormatModifierCount*: uint32
    pDrmFormatModifiers* {.length: drmFormatModifierCount.}: arrPtr[uint64]
  ImageDrmFormatModifierExplicitCreateInfoEXT* = object
    sType* {.constant: (StructureType.imageDrmFormatModifierExplicitCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    drmFormatModifier*: uint64
    drmFormatModifierPlaneCount*: uint32
    pPlaneLayouts* {.length: drmFormatModifierPlaneCount.}: arrPtr[SubresourceLayout]
  ImageDrmFormatModifierPropertiesEXT* = object
    sType* {.constant: (StructureType.imageDrmFormatModifierPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    drmFormatModifier*: uint64

proc getImageDrmFormatModifierPropertiesEXT*(
      device: Device;
      image: Image;
      pProperties: ptr ImageDrmFormatModifierPropertiesEXT;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory),
      lazyload("vkGetImageDrmFormatModifierPropertiesEXT", DeviceLevel).}

proc loadAllVK_EXT_image_drm_format_modifier*(instance: Instance) =
  instance.loadCommand getImageDrmFormatModifierPropertiesEXT

proc loadVK_EXT_image_drm_format_modifier*(device: Device) =
  device.loadCommand getImageDrmFormatModifierPropertiesEXT

