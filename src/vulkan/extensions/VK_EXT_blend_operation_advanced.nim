
import ../platform
import ../features/vk10




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
  BlendOverlapEXT* {.size: sizeof(int32), pure.} = enum
    UncorrelatedExt = 0
    DisjointExt = 1
    ConjointExt = 2


