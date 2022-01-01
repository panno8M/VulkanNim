# VK_NV_external_memory_capabilities

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  NvExternalMemoryCapabilitiesSpecVersion* = 1
  NvExternalMemoryCapabilitiesExtensionName* = "VK_NV_external_memory_capabilities"

type
  ExternalImageFormatPropertiesNV* = object
    imageFormatProperties*: ImageFormatProperties
    externalMemoryFeatures* {.optional.}: ExternalMemoryFeatureFlagsNV
    exportFromImportedHandleTypes* {.optional.}: ExternalMemoryHandleTypeFlagsNV
    compatibleHandleTypes* {.optional.}: ExternalMemoryHandleTypeFlagsNV

proc getPhysicalDeviceExternalImageFormatPropertiesNV*(
      physicalDevice: PhysicalDevice;
      format: Format;
      theType: ImageType;
      tiling: ImageTiling;
      usage: ImageUsageFlags;
      flags = default(ImageCreateFlags);
      externalHandleType = default(ExternalMemoryHandleTypeFlagsNV);
      pExternalImageFormatProperties: ptr ExternalImageFormatPropertiesNV;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorFormatNotSupported],
      lazyload("vkGetPhysicalDeviceExternalImageFormatPropertiesNV", InstanceLevel).}

proc loadAllVK_NV_external_memory_capabilities*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceExternalImageFormatPropertiesNV
proc loadVK_NV_external_memory_capabilities*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceExternalImageFormatPropertiesNV
