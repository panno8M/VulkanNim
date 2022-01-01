# VK_NV_coverage_reduction_mode

import ../features/vk10
import VK_NV_framebuffer_mixed_samples
import ../platform
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
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV", InstanceLevel).}

proc loadAllVK_NV_coverage_reduction_mode*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV
proc loadVK_NV_coverage_reduction_mode*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV
