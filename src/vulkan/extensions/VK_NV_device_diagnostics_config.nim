
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2




type
  PhysicalDeviceDiagnosticsConfigFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    diagnosticsConfig*: Bool32
  DeviceDiagnosticsConfigCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DeviceDiagnosticsConfigFlagsNV
  DeviceDiagnosticsConfigFlagsNV* = distinct Flags
  DeviceDiagnosticsConfigFlagBitsNV* {.size: sizeof(int32), pure.} = enum
    EnableShaderDebugInfoBitNv = 0x00000001
    EnableResourceTrackingBitNv = 0x00000002
    EnableAutomaticCheckpointsBitNv = 0x00000004


