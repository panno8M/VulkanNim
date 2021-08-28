# Generated at 2021-08-28T00:52:26Z
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
  ShaderFloatControlsIndependenceKHR* = UnusedEnum

StructureType.defineAliases:
  PhysicalDeviceFloatControlsProperties as PhysicalDeviceFloatControlsPropertiesKhr

ShaderFloatControlsIndependence.defineAliases:
  Vk32BitOnly as Vk32BitOnlyKhr
  All as AllKhr
  None as NoneKhr

