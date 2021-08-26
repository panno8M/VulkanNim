
import ../platform
import ../features/vk10




type
  PhysicalDeviceShaderSMBuiltinsPropertiesNV* = object
    sType*: StructureType
    pNext*: pointer
    shaderSMCount*: uint32
    shaderWarpsPerSM*: uint32
  PhysicalDeviceShaderSMBuiltinsFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    shaderSMBuiltins*: Bool32


