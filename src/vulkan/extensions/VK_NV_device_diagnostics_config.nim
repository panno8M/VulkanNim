# Generated at 2021-12-25T07:50:19Z
# VK_NV_device_diagnostics_config

import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

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



