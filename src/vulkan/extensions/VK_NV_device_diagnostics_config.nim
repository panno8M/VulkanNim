# Generated at 2021-08-31T01:03:35Z
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
    sType*: StructureType
    pNext*: pointer
    diagnosticsConfig*: Bool32
  DeviceDiagnosticsConfigCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DeviceDiagnosticsConfigFlagsNV


