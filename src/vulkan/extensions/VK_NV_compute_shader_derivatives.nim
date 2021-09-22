# Generated at 2021-09-22T15:02:54Z
# VK_NV_compute_shader_derivatives


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  NvComputeShaderDerivativesSpecVersion* = 1
  NvComputeShaderDerivativesExtensionName* = "VK_NV_compute_shader_derivatives"

type
  PhysicalDeviceComputeShaderDerivativesFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceComputeShaderDerivativesFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    computeDerivativeGroupQuads*: Bool32
    computeDerivativeGroupLinear*: Bool32



