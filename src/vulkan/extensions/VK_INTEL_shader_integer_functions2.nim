
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  IntelShaderIntegerFunctions2SpecVersion* = 1
  IntelShaderIntegerFunctions2ExtensionName* = "VK_INTEL_shader_integer_functions2"

type
  PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL* = object
    sType*: StructureType
    pNext*: pointer
    shaderIntegerFunctions2*: Bool32


