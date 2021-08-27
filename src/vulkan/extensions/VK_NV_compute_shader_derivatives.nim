# Generated at 2021-08-27T06:01:03Z
# VK_NV_compute_shader_derivatives
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  NvComputeShaderDerivativesSpecVersion* = 1
  NvComputeShaderDerivativesExtensionName* = "VK_NV_compute_shader_derivatives"

type
  PhysicalDeviceComputeShaderDerivativesFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    computeDerivativeGroupQuads*: Bool32
    computeDerivativeGroupLinear*: Bool32


