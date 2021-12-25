# Generated at 2021-12-25T07:50:19Z
# VK_NV_coverage_reduction_mode

import ../platform
import ../features/vk10
import ./VK_NV_framebuffer_mixed_samples
export VK_NV_framebuffer_mixed_samples

prepareVulkanLibDef()

const
  NvCoverageReductionModeSpecVersion* = 1
  NvCoverageReductionModeExtensionName* = "VK_NV_coverage_reduction_mode"

type
  PhysicalDeviceCoverageReductionModeFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceCoverageReductionModeFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    coverageReductionMode*: Bool32
  PipelineCoverageReductionStateCreateInfoNV* = object
    sType* {.constant: (StructureType.pipelineCoverageReductionStateCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineCoverageReductionStateCreateFlagsNV
    coverageReductionMode*: CoverageReductionModeNV
  FramebufferMixedSamplesCombinationNV* = object
    sType* {.constant: (StructureType.framebufferMixedSamplesCombinationNv).}: StructureType
    pNext* {.optional.}: pointer
    coverageReductionMode*: CoverageReductionModeNV
    rasterizationSamples*: SampleCountFlagBits
    depthStencilSamples*: SampleCountFlags
    colorSamples*: SampleCountFlags

proc getPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV*(
      physicalDevice: PhysicalDevice;
      pCombinationCount: ptr uint32;
      pCombinations {.length: pCombinationCount.} = default(arrPtr[FramebufferMixedSamplesCombinationNV]);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV", InstanceLevel).}

proc loadAllVK_NV_coverage_reduction_mode*(instance: Instance) =
  instance.loadCommand getPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV

proc loadVK_NV_coverage_reduction_mode*(instance: Instance) =
  instance.loadCommand getPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV

