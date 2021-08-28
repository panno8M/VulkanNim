# Generated at 2021-08-28T12:28:01Z
# VK_KHR_shader_float_controls
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


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


