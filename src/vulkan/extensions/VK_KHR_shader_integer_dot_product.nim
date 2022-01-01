# VK_KHR_shader_integer_dot_product

import ../features/vk10
import VK_KHR_get_physical_device_properties2
import ../platform
prepareVulkanLibDef()

const
  KhrShaderIntegerDotProductSpecVersion* = 1
  KhrShaderIntegerDotProductExtensionName* = "VK_KHR_shader_integer_dot_product"

type
  PhysicalDeviceShaderIntegerDotProductFeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceShaderIntegerDotProductFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    shaderIntegerDotProduct*: Bool32
  PhysicalDeviceShaderIntegerDotProductPropertiesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceShaderIntegerDotProductPropertiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    integerDotProduct8BitUnsignedAccelerated*: Bool32
    integerDotProduct8BitSignedAccelerated*: Bool32
    integerDotProduct8BitMixedSignednessAccelerated*: Bool32
    integerDotProduct4x8BitPackedUnsignedAccelerated*: Bool32
    integerDotProduct4x8BitPackedSignedAccelerated*: Bool32
    integerDotProduct4x8BitPackedMixedSignednessAccelerated*: Bool32
    integerDotProduct16BitUnsignedAccelerated*: Bool32
    integerDotProduct16BitSignedAccelerated*: Bool32
    integerDotProduct16BitMixedSignednessAccelerated*: Bool32
    integerDotProduct32BitUnsignedAccelerated*: Bool32
    integerDotProduct32BitSignedAccelerated*: Bool32
    integerDotProduct32BitMixedSignednessAccelerated*: Bool32
    integerDotProduct64BitUnsignedAccelerated*: Bool32
    integerDotProduct64BitSignedAccelerated*: Bool32
    integerDotProduct64BitMixedSignednessAccelerated*: Bool32
    integerDotProductAccumulatingSaturating8BitUnsignedAccelerated*: Bool32
    integerDotProductAccumulatingSaturating8BitSignedAccelerated*: Bool32
    integerDotProductAccumulatingSaturating8BitMixedSignednessAccelerated*: Bool32
    integerDotProductAccumulatingSaturating4x8BitPackedUnsignedAccelerated*: Bool32
    integerDotProductAccumulatingSaturating4x8BitPackedSignedAccelerated*: Bool32
    integerDotProductAccumulatingSaturating4x8BitPackedMixedSignednessAccelerated*: Bool32
    integerDotProductAccumulatingSaturating16BitUnsignedAccelerated*: Bool32
    integerDotProductAccumulatingSaturating16BitSignedAccelerated*: Bool32
    integerDotProductAccumulatingSaturating16BitMixedSignednessAccelerated*: Bool32
    integerDotProductAccumulatingSaturating32BitUnsignedAccelerated*: Bool32
    integerDotProductAccumulatingSaturating32BitSignedAccelerated*: Bool32
    integerDotProductAccumulatingSaturating32BitMixedSignednessAccelerated*: Bool32
    integerDotProductAccumulatingSaturating64BitUnsignedAccelerated*: Bool32
    integerDotProductAccumulatingSaturating64BitSignedAccelerated*: Bool32
    integerDotProductAccumulatingSaturating64BitMixedSignednessAccelerated*: Bool32



