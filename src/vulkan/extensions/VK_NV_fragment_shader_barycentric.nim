# VK_NV_fragment_shader_barycentric

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  NvFragmentShaderBarycentricSpecVersion* = 1
  NvFragmentShaderBarycentricExtensionName* = "VK_NV_fragment_shader_barycentric"

type
  PhysicalDeviceFragmentShaderBarycentricFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceFragmentShaderBarycentricFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    fragmentShaderBarycentric*: Bool32



