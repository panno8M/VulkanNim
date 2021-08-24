
import ../platform
import ../features/vk10


type
  ExternalMemoryFeatureFlagBitsNV* = UnusedEnum
  ExternalImageFormatPropertiesNV* = object
    imageFormatProperties*: ImageFormatProperties
    externalMemoryFeatures*: ExternalMemoryFeatureFlagsNV
    exportFromImportedHandleTypes*: ExternalMemoryHandleTypeFlagsNV
    compatibleHandleTypes*: ExternalMemoryHandleTypeFlagsNV
  ExternalMemoryFeatureFlagsNV* = distinct Flags
  ExternalMemoryHandleTypeFlagBitsNV* = UnusedEnum
  ExternalMemoryHandleTypeFlagsNV* = distinct Flags

const NvExternalMemoryCapabilitiesSpecVersion* = 1
const NvExternalMemoryCapabilitiesExtensionName* = "VK_NV_external_memory_capabilities"
var # commands
  getPhysicalDeviceExternalImageFormatPropertiesNVCage: proc(physicalDevice: PhysicalDevice; format: Format; theType: ImageType; tiling: ImageTiling; usage: ImageUsageFlags; flags: ImageCreateFlags; externalHandleType: ExternalMemoryHandleTypeFlagsNV; pExternalImageFormatProperties: ptr ExternalImageFormatPropertiesNV;): Result {.cdecl.}

proc getPhysicalDeviceExternalImageFormatPropertiesNV*(
      physicalDevice: PhysicalDevice;
      format: Format;
      theType: ImageType;
      tiling: ImageTiling;
      usage: ImageUsageFlags;
      flags: ImageCreateFlags;
      externalHandleType: ExternalMemoryHandleTypeFlagsNV;
      pExternalImageFormatProperties: ptr ExternalImageFormatPropertiesNV;
    ): Result {.cdecl.} =
  getPhysicalDeviceExternalImageFormatPropertiesNVCage(physicalDevice,format,theType,tiling,usage,flags,externalHandleType,pExternalImageFormatProperties)


proc loadVK_NV_external_memory_capabilities*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceExternalImageFormatPropertiesNVCage << "vkGetPhysicalDeviceExternalImageFormatPropertiesNV"