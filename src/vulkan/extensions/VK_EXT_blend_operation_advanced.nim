# Generated at 2021-08-31T05:18:46Z
# VK_EXT_blend_operation_advanced


import ../platform
import ../features/vk10

const
  ExtBlendOperationAdvancedSpecVersion* = 2
  ExtBlendOperationAdvancedExtensionName* = "VK_EXT_blend_operation_advanced"

type # enums and bitmasks
  BlendOverlapEXT* {.size: sizeof(int32), pure.} = enum
    uncorrelatedExt = 0
    disjointExt = 1
    conjointExt = 2

type
  PhysicalDeviceBlendOperationAdvancedFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    advancedBlendCoherentOperations*: Bool32
  PhysicalDeviceBlendOperationAdvancedPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    advancedBlendMaxColorAttachments*: uint32
    advancedBlendIndependentBlend*: Bool32
    advancedBlendNonPremultipliedSrcColor*: Bool32
    advancedBlendNonPremultipliedDstColor*: Bool32
    advancedBlendCorrelatedOverlap*: Bool32
    advancedBlendAllOperations*: Bool32
  PipelineColorBlendAdvancedStateCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    srcPremultiplied*: Bool32
    dstPremultiplied*: Bool32
    blendOverlap*: BlendOverlapEXT



