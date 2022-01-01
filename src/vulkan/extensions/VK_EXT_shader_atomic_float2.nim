# VK_EXT_shader_atomic_float2

import ../features/vk10
import VK_EXT_shader_atomic_float
import ../platform
prepareVulkanLibDef()

const
  ExtShaderAtomicFloat2SpecVersion* = 1
  ExtShaderAtomicFloat2ExtensionName* = "VK_EXT_shader_atomic_float2"

type
  PhysicalDeviceShaderAtomicFloat2FeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceShaderAtomicFloat2FeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    shaderBufferFloat16Atomics*: Bool32
    shaderBufferFloat16AtomicAdd*: Bool32
    shaderBufferFloat16AtomicMinMax*: Bool32
    shaderBufferFloat32AtomicMinMax*: Bool32
    shaderBufferFloat64AtomicMinMax*: Bool32
    shaderSharedFloat16Atomics*: Bool32
    shaderSharedFloat16AtomicAdd*: Bool32
    shaderSharedFloat16AtomicMinMax*: Bool32
    shaderSharedFloat32AtomicMinMax*: Bool32
    shaderSharedFloat64AtomicMinMax*: Bool32
    shaderImageFloat32AtomicMinMax*: Bool32
    sparseImageFloat32AtomicMinMax*: Bool32



