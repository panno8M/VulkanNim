# VK_KHR_portability_subset

import ../features/vk10
import VK_KHR_get_physical_device_properties2
import ../platform
prepareVulkanLibDef()

const
  KhrPortabilitySubsetSpecVersion* = 1
  KhrPortabilitySubsetExtensionName* = "VK_KHR_portability_subset"

type
  PhysicalDevicePortabilitySubsetFeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDevicePortabilitySubsetFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    constantAlphaColorBlendFactors*: Bool32
    events*: Bool32
    imageViewFormatReinterpretation*: Bool32
    imageViewFormatSwizzle*: Bool32
    imageView2DOn3DImage*: Bool32
    multisampleArrayImage*: Bool32
    mutableComparisonSamplers*: Bool32
    pointPolygons*: Bool32
    samplerMipLodBias*: Bool32
    separateStencilMaskRef*: Bool32
    shaderSampleRateInterpolationFunctions*: Bool32
    tessellationIsolines*: Bool32
    tessellationPointMode*: Bool32
    triangleFans*: Bool32
    vertexAttributeAccessBeyondStride*: Bool32
  PhysicalDevicePortabilitySubsetPropertiesKHR* = object
    sType* {.constant: (StructureType.physicalDevicePortabilitySubsetPropertiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    minVertexInputBindingStrideAlignment*: uint32



