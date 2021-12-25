# Generated at 2021-12-25T07:50:19Z
# VK_EXT_blend_operation_advanced

import ../platform
import ../features/vk10

prepareVulkanLibDef()

const
  ExtBlendOperationAdvancedSpecVersion* = 2
  ExtBlendOperationAdvancedExtensionName* = "VK_EXT_blend_operation_advanced"

type
  PhysicalDeviceBlendOperationAdvancedFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceBlendOperationAdvancedFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    advancedBlendCoherentOperations*: Bool32
  PhysicalDeviceBlendOperationAdvancedPropertiesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceBlendOperationAdvancedPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    advancedBlendMaxColorAttachments*: uint32
    advancedBlendIndependentBlend*: Bool32
    advancedBlendNonPremultipliedSrcColor*: Bool32
    advancedBlendNonPremultipliedDstColor*: Bool32
    advancedBlendCorrelatedOverlap*: Bool32
    advancedBlendAllOperations*: Bool32
  PipelineColorBlendAdvancedStateCreateInfoEXT* = object
    sType* {.constant: (StructureType.pipelineColorBlendAdvancedStateCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    srcPremultiplied*: Bool32
    dstPremultiplied*: Bool32
    blendOverlap*: BlendOverlapEXT



