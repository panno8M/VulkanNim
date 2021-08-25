
import ../platform
import ../features/vk10
import VK_NV_framebuffer_mixed_samples


type
  PhysicalDeviceCoverageReductionModeFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    coverageReductionMode*: Bool32
  PipelineCoverageReductionStateCreateFlagsNV* = distinct Flags
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
  CoverageReductionModeNV* {.size: sizeof(int32), pure.} = enum
    Merge = 0
    Truncate = 1

const NvCoverageReductionModeExtensionName* = "VK_NV_coverage_reduction_mode"
const NvCoverageReductionModeSpecVersion* = 1
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