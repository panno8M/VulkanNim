
import ../platform
import ../features/vk10


const MaxExtensionNameSize* = 256
const MaxDescriptionSize* = 256

type
  ToolPurposeFlagBitsEXT* {.size: sizeof(int32), pure.} = enum
    ValidationBitExt = 0x00000001
    ProfilingBitExt = 0x00000002
    TracingBitExt = 0x00000004
    AdditionalFeaturesBitExt = 0x00000008
    ModifyingFeaturesBitExt = 0x00000010
    # Provided by VK_EXT_tooling_info
    DebugReportingBitExt = 0x00000020
    # Provided by VK_EXT_tooling_info
    DebugReportingBitExt = 0x00000020
    # Provided by VK_EXT_tooling_info
    DebugMarkersBitExt = 0x00000040
    # Provided by VK_EXT_tooling_info
    DebugMarkersBitExt = 0x00000040
  ToolPurposeFlagsEXT* = distinct Flags
  PhysicalDeviceToolPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    name*: array[MaxExtensionNameSize, char]
    version*: array[MaxExtensionNameSize, char]
    purposes*: ToolPurposeFlagsEXT
    description*: array[MaxDescriptionSize, char]
    layer*: array[MaxExtensionNameSize, char]

var # commands
  getPhysicalDeviceToolPropertiesEXTCage: proc(physicalDevice: PhysicalDevice; pToolCount: ptr uint32; pToolProperties: ptr PhysicalDeviceToolPropertiesEXT;): Result {.cdecl.}
proc getPhysicalDeviceToolPropertiesEXT*(
      physicalDevice: PhysicalDevice;
      pToolCount: ptr uint32;
      pToolProperties: ptr PhysicalDeviceToolPropertiesEXT;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceToolPropertiesEXTCage(physicalDevice,pToolCount,pToolProperties)
proc loadVK_EXT_tooling_info*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceToolPropertiesEXTCage << "vkGetPhysicalDeviceToolPropertiesEXT"