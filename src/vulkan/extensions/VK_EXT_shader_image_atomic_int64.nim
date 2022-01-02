# VK_EXT_shader_image_atomic_int64

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtShaderImageAtomicInt64SpecVersion* = 1
  ExtShaderImageAtomicInt64ExtensionName* = "VK_EXT_shader_image_atomic_int64"

type
  PhysicalDeviceShaderImageAtomicInt64FeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceShaderImageAtomicInt64FeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    shaderImageInt64Atomics*: Bool32
    sparseImageInt64Atomics*: Bool32



