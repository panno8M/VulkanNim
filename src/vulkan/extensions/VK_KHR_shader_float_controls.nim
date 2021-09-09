# Generated at 2021-09-09T01:49:36Z
# VK_KHR_shader_float_controls


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk12
export VK_KHR_get_physical_device_properties2

const
  KhrShaderFloatControlsSpecVersion* = 4
  KhrShaderFloatControlsExtensionName* = "VK_KHR_shader_float_controls"

type # enums and bitmasks
  ShaderFloatControlsIndependenceKHR* = distinct UnusedEnum

type
  PhysicalDeviceFloatControlsPropertiesKHR* = object

StructureType.defineAliases:
  physicalDeviceFloatControlsProperties as physicalDeviceFloatControlsPropertiesKhr

ShaderFloatControlsIndependence.defineAliases:
  e32Only as e32OnlyKhr
  all as allKhr
  none as noneKhr


