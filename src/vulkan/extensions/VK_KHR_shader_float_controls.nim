# Generated at 2021-08-31T05:18:46Z
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
  vk32Only as vk32OnlyKhr
  all as allKhr
  none as noneKhr


