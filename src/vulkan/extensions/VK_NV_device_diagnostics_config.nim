# VK_NV_device_diagnostics_config

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  NvDeviceDiagnosticsConfigSpecVersion* = 1
  NvDeviceDiagnosticsConfigExtensionName* = "VK_NV_device_diagnostics_config"

type
  PhysicalDeviceDiagnosticsConfigFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceDiagnosticsConfigFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    diagnosticsConfig*: Bool32
  DeviceDiagnosticsConfigCreateInfoNV* = object
    sType* {.constant: (StructureType.deviceDiagnosticsConfigCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DeviceDiagnosticsConfigFlagsNV



