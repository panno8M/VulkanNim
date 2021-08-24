
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  DeviceDiagnosticsConfigFlagsNV* = distinct Flags
  PhysicalDeviceDiagnosticsConfigFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    diagnosticsConfig*: Bool32
  DeviceDiagnosticsConfigFlagBitsNV* {.size: sizeof(int32), pure.} = enum
    EnableShaderDebugInfo = 0x00000001
    EnableResourceTracking = 0x00000002
    EnableAutomaticCheckpoints = 0x00000004
  DeviceDiagnosticsConfigCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DeviceDiagnosticsConfigFlagsNV

const NvDeviceDiagnosticsConfigSpecVersion* = 1
const NvDeviceDiagnosticsConfigExtensionName* = "VK_NV_device_diagnostics_config"

