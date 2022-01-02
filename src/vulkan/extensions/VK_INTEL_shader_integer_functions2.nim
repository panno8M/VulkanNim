# VK_INTEL_shader_integer_functions2

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  IntelShaderIntegerFunctions2SpecVersion* = 1
  IntelShaderIntegerFunctions2ExtensionName* = "VK_INTEL_shader_integer_functions2"

type
  PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL* = object
    sType* {.constant: (StructureType.physicalDeviceShaderIntegerFunctions2FeaturesIntel).}: StructureType
    pNext* {.optional.}: pointer
    shaderIntegerFunctions2*: Bool32



