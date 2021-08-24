
import ../platform
import ../features/vk10


type
  ToolPurposeFlagsEXT* = distinct Flags
  PhysicalDeviceToolPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    name*: char
    version*: char
    purposes*: ToolPurposeFlagsEXT
    description*: char
    layer*: char
  ToolPurposeFlagBitsEXT* {.size: sizeof(int32), pure.} = enum
    Validation = 0x00000001
    Profiling = 0x00000002
    Tracing = 0x00000004
    AdditionalFeatures = 0x00000008
    ModifyingFeatures = 0x00000010
    # Provided by VK_EXT_tooling_info
    DebugReporting = 0x00000020
    # Provided by VK_EXT_tooling_info
    DebugMarkers = 0x00000040

const ExtToolingInfoSpecVersion* = 1
const ExtToolingInfoExtensionName* = "VK_EXT_tooling_info"
var # commands
  getPhysicalDeviceToolPropertiesEXTCage: proc(physicalDevice: PhysicalDevice; pToolCount: ptr uint32; pToolProperties: ptr PhysicalDeviceToolPropertiesEXT;): Result {.cdecl.}

proc getPhysicalDeviceToolPropertiesEXT*(
      physicalDevice: PhysicalDevice;
      pToolCount: ptr uint32;
      pToolProperties: ptr PhysicalDeviceToolPropertiesEXT;
    ): Result {.cdecl.} =
  getPhysicalDeviceToolPropertiesEXTCage(physicalDevice,pToolCount,pToolProperties)





proc loadVK_EXT_tooling_info*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceToolPropertiesEXTCage << "vkGetPhysicalDeviceToolPropertiesEXT"