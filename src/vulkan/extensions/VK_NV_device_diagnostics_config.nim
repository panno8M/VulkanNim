# Generated at 2021-09-22T15:02:54Z
# VK_NV_device_diagnostics_config


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  NvDeviceDiagnosticsConfigSpecVersion* = 1
  NvDeviceDiagnosticsConfigExtensionName* = "VK_NV_device_diagnostics_config"

type # enums and bitmasks
  DeviceDiagnosticsConfigFlagsNV* = Flags[DeviceDiagnosticsConfigFlagBitsNV]
  DeviceDiagnosticsConfigFlagBitsNV* {.size: sizeof(int32), pure.} = enum
    enableShaderDebugInfoNv = 0x00000001
    enableResourceTrackingNv = 0x00000002
    enableAutomaticCheckpointsNv = 0x00000004

type
  PhysicalDeviceDiagnosticsConfigFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceDiagnosticsConfigFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    diagnosticsConfig*: Bool32
  DeviceDiagnosticsConfigCreateInfoNV* = object
    sType* {.constant: (StructureType.deviceDiagnosticsConfigCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DeviceDiagnosticsConfigFlagsNV



