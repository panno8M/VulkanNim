
import ../platform
import ../features/vk10


type
  ExternalMemoryFeatureFlagBitsNV* {.size: sizeof(int32), pure.} = enum
    DedicatedOnly = 0x00000001
    Exportable = 0x00000002
    Importable = 0x00000004
  ExternalImageFormatPropertiesNV* = object
    imageFormatProperties*: ImageFormatProperties
    externalMemoryFeatures*: ExternalMemoryFeatureFlagsNV
    exportFromImportedHandleTypes*: ExternalMemoryHandleTypeFlagsNV
    compatibleHandleTypes*: ExternalMemoryHandleTypeFlagsNV
  ExternalMemoryFeatureFlagsNV* = Flags
  ExternalMemoryHandleTypeFlagBitsNV* {.size: sizeof(int32), pure.} = enum
    OpaqueWin32 = 0x00000001
    OpaqueWin32Kmt = 0x00000002
    D3d11Image = 0x00000004
    D3d11ImageKmt = 0x00000008
  ExternalMemoryHandleTypeFlagsNV* = Flags

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