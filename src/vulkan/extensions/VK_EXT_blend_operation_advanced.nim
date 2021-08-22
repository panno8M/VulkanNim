
import ../platform
import ../features/vk10


type
  PipelineColorBlendAdvancedStateCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    srcPremultiplied*: Bool32
    dstPremultiplied*: Bool32
    blendOverlap*: BlendOverlapEXT
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
  BlendOverlapEXT* {.size: sizeof(int32), pure.} = enum
    Uncorrelated = 0
    Disjoint = 1
    Conjoint = 2

const ExtBlendOperationAdvancedSpecVersion* = 2
const ExtBlendOperationAdvancedExtensionName* = "VK_EXT_blend_operation_advanced"

