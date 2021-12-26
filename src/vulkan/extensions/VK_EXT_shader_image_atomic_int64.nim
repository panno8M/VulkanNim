# Generated at 2021-12-26T16:57:02Z
# VK_EXT_shader_image_atomic_int64

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2
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



