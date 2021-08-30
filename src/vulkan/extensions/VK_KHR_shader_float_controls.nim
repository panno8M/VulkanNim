# Generated at 2021-08-30T23:05:46Z
# VK_KHR_shader_float_controls


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk12

const
  KhrShaderFloatControlsSpecVersion* = 4
  KhrShaderFloatControlsExtensionName* = "VK_KHR_shader_float_controls"

type
  PhysicalDeviceFloatControlsPropertiesKHR* = object
  ShaderFloatControlsIndependenceKHR* = distinct UnusedEnum

StructureType.defineAliases:
  physicalDeviceFloatControlsProperties as physicalDeviceFloatControlsPropertiesKhr

ShaderFloatControlsIndependence.defineAliases:
  vk32Only as vk32OnlyKhr
  all as allKhr
  none as noneKhr

