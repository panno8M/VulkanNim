# Generated at 2021-09-09T01:49:36Z
# VK_NV_coverage_reduction_mode


import ../platform
import ../features/vk10
import ./VK_NV_framebuffer_mixed_samples
export VK_NV_framebuffer_mixed_samples

const
  NvCoverageReductionModeSpecVersion* = 1
  NvCoverageReductionModeExtensionName* = "VK_NV_coverage_reduction_mode"

type # enums and bitmasks
  PipelineCoverageReductionStateCreateFlagsNV* = Flags[distinct UnusedEnum]
  CoverageReductionModeNV* {.size: sizeof(int32), pure.} = enum
    mergeNv = 0
    truncateNv = 1

type
  PhysicalDeviceCoverageReductionModeFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    coverageReductionMode*: Bool32
  PipelineCoverageReductionStateCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineCoverageReductionStateCreateFlagsNV
    coverageReductionMode*: CoverageReductionModeNV
  FramebufferMixedSamplesCombinationNV* = object
    sType*: StructureType
    pNext*: pointer
    coverageReductionMode*: CoverageReductionModeNV
    rasterizationSamples*: SampleCountFlagBits
    depthStencilSamples*: SampleCountFlags
    colorSamples*: SampleCountFlags

proc getPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV*(
      physicalDevice: PhysicalDevice;
      pCombinationCount: ptr uint32;
      pCombinations: ptr FramebufferMixedSamplesCombinationNV;
    ): Result {.cdecl, lazyload("vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV", InstanceLevel).}

proc loadAllVK_NV_coverage_reduction_mode*(instance: Instance) =
  getPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV.smartLoad(instance)

proc loadVK_NV_coverage_reduction_mode*(instance: Instance) =
  getPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV.smartLoad(instance)

