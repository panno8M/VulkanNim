
import ../platform
import ../features/vk10




type
  ExternalMemoryHandleTypeFlagsNV* = distinct Flags
  ExternalMemoryHandleTypeFlagBitsNV* {.size: sizeof(int32), pure.} = enum
    OpaqueWin32BitNv = 0x00000001
    OpaqueWin32KmtBitNv = 0x00000002
    D3d11ImageBitNv = 0x00000004
    D3d11ImageKmtBitNv = 0x00000008
  ExternalMemoryFeatureFlagsNV* = distinct Flags
  ExternalMemoryFeatureFlagBitsNV* {.size: sizeof(int32), pure.} = enum
    DedicatedOnlyBitNv = 0x00000001
    ExportableBitNv = 0x00000002
    ImportableBitNv = 0x00000004
  ExternalImageFormatPropertiesNV* = object
    imageFormatProperties*: ImageFormatProperties
    externalMemoryFeatures*: ExternalMemoryFeatureFlagsNV
    exportFromImportedHandleTypes*: ExternalMemoryHandleTypeFlagsNV
    compatibleHandleTypes*: ExternalMemoryHandleTypeFlagsNV

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
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceExternalImageFormatPropertiesNVCage(physicalDevice,format,theType,tiling,usage,flags,externalHandleType,pExternalImageFormatProperties)
proc loadVK_NV_external_memory_capabilities*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceExternalImageFormatPropertiesNVCage << "vkGetPhysicalDeviceExternalImageFormatPropertiesNV"