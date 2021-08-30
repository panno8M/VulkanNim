# Generated at 2021-08-30T22:51:48Z
# VK_NV_external_memory_capabilities


import ../platform
import ../features/vk10

const
  NvExternalMemoryCapabilitiesSpecVersion* = 1
  NvExternalMemoryCapabilitiesExtensionName* = "VK_NV_external_memory_capabilities"

type
  ExternalMemoryHandleTypeFlagsNV* = Flags[ExternalMemoryHandleTypeFlagBitsNV]
  ExternalMemoryHandleTypeFlagBitsNV* {.size: sizeof(int32), pure.} = enum
    opaqueWin32Nv = 0x00000001
    opaqueWin32KmtNv = 0x00000002
    d3d11ImageNv = 0x00000004
    d3d11ImageKmtNv = 0x00000008
  ExternalMemoryFeatureFlagsNV* = Flags[ExternalMemoryFeatureFlagBitsNV]
  ExternalMemoryFeatureFlagBitsNV* {.size: sizeof(int32), pure.} = enum
    dedicatedOnlyNv = 0x00000001
    exportableNv = 0x00000002
    importableNv = 0x00000004
  ExternalImageFormatPropertiesNV* = object
    imageFormatProperties*: ImageFormatProperties
    externalMemoryFeatures*: ExternalMemoryFeatureFlagsNV
    exportFromImportedHandleTypes*: ExternalMemoryHandleTypeFlagsNV
    compatibleHandleTypes*: ExternalMemoryHandleTypeFlagsNV

var # command cages
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
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceExternalImageFormatPropertiesNVCage(physicalDevice,format,theType,tiling,usage,flags,externalHandleType,pExternalImageFormatProperties)
proc loadVK_NV_external_memory_capabilities*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceExternalImageFormatPropertiesNVCage << "vkGetPhysicalDeviceExternalImageFormatPropertiesNV"