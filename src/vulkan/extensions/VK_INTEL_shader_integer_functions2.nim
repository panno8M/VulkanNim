# Generated at 2021-09-22T15:02:54Z
# VK_INTEL_shader_integer_functions2


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  IntelShaderIntegerFunctions2SpecVersion* = 1
  IntelShaderIntegerFunctions2ExtensionName* = "VK_INTEL_shader_integer_functions2"

type
  PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL* = object
    sType* {.constant: (StructureType.physicalDeviceShaderIntegerFunctions2FeaturesIntel).}: StructureType
    pNext* {.optional.}: pointer
    shaderIntegerFunctions2*: Bool32



