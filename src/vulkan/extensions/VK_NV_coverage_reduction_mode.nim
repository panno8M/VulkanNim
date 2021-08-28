# Generated at 2021-08-28T12:28:01Z
# VK_NV_coverage_reduction_mode
# =================================

import ../platform
import ../features/vk10
import VK_NV_framebuffer_mixed_samples


const
  NvCoverageReductionModeSpecVersion* = 1
  NvCoverageReductionModeExtensionName* = "VK_NV_coverage_reduction_mode"

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
  PipelineCoverageReductionStateCreateFlagsNV* = Flags[distinct UnusedEnum]
  CoverageReductionModeNV* {.size: sizeof(int32), pure.} = enum
    mergeNv = 0
    truncateNv = 1
  FramebufferMixedSamplesCombinationNV* = object
    sType*: StructureType
    pNext*: pointer
    coverageReductionMode*: CoverageReductionModeNV
    rasterizationSamples*: SampleCountFlagBits
    depthStencilSamples*: SampleCountFlags
    colorSamples*: SampleCountFlags

var # commands
  getPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNVCage: proc(physicalDevice: PhysicalDevice; pCombinationCount: ptr uint32; pCombinations: ptr FramebufferMixedSamplesCombinationNV;): Result {.cdecl.}
proc getPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV*(
      physicalDevice: PhysicalDevice;
      pCombinationCount: ptr uint32;
      pCombinations: ptr FramebufferMixedSamplesCombinationNV;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNVCage(physicalDevice,pCombinationCount,pCombinations)
proc loadVK_NV_coverage_reduction_mode*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNVCage << "vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV"
