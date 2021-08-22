
import ../platform
import ../features/vk10
import VK_KHR_bind_memory2
import VK_KHR_get_physical_device_properties2
import VK_KHR_image_format_list
import VK_KHR_sampler_ycbcr_conversion


type
  PhysicalDeviceImageDrmFormatModifierInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    drmFormatModifier*: uint64
    sharingMode*: SharingMode
    queueFamilyIndexCount*: uint32
    pQueueFamilyIndices*: ptr uint32
  ImageDrmFormatModifierExplicitCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    drmFormatModifier*: uint64
    drmFormatModifierPlaneCount*: uint32
    pPlaneLayouts*: ptr SubresourceLayout
  ImageDrmFormatModifierPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    drmFormatModifier*: uint64
  ImageDrmFormatModifierListCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    drmFormatModifierCount*: uint32
    pDrmFormatModifiers*: ptr uint64
  DrmFormatModifierPropertiesListEXT* = object
    sType*: StructureType
    pNext*: pointer
    drmFormatModifierCount*: uint32
    pDrmFormatModifierProperties*: ptr DrmFormatModifierPropertiesEXT
  DrmFormatModifierPropertiesEXT* = object
    drmFormatModifier*: uint64
    drmFormatModifierPlaneCount*: uint32
    drmFormatModifierTilingFeatures*: FormatFeatureFlags

const ExtImageDrmFormatModifierExtensionName* = "VK_EXT_image_drm_format_modifier"
const ExtImageDrmFormatModifierSpecVersion* = 1
var # commands
  getImageDrmFormatModifierPropertiesEXTCage: proc(device: Device; image: Image; pProperties: ptr ImageDrmFormatModifierPropertiesEXT;): Result {.cdecl.}

proc getImageDrmFormatModifierPropertiesEXT*(
      device: Device;
      image: Image;
      pProperties: ptr ImageDrmFormatModifierPropertiesEXT;
    ): Result {.cdecl.} =
  getImageDrmFormatModifierPropertiesEXTCage(device,image,pProperties)


proc loadVK_EXT_image_drm_format_modifier*(instance: Instance) =
  instance.defineLoader(`<<`)

  getImageDrmFormatModifierPropertiesEXTCage << "vkGetImageDrmFormatModifierPropertiesEXT"