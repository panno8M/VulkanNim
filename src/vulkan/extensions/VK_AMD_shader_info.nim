# Generated at 2021-08-31T05:19:03Z
# VK_AMD_shader_info


import ../platform
import ../features/vk10

const
  AmdShaderInfoSpecVersion* = 1
  AmdShaderInfoExtensionName* = "VK_AMD_shader_info"

type # enums and bitmasks
  ShaderInfoTypeAMD* {.size: sizeof(int32), pure.} = enum
    statisticsAmd = 0
    binaryAmd = 1
    disassemblyAmd = 2

type
  ShaderResourceUsageAMD* = object
    numUsedVgprs*: uint32
    numUsedSgprs*: uint32
    ldsSizePerLocalWorkGroup*: uint32
    ldsUsageSizeInBytes*: uint
    scratchMemUsageInBytes*: uint
  ShaderStatisticsInfoAMD* = object
    shaderStageMask*: ShaderStageFlags
    resourceUsage*: ShaderResourceUsageAMD
    numPhysicalVgprs*: uint32
    numPhysicalSgprs*: uint32
    numAvailableVgprs*: uint32
    numAvailableSgprs*: uint32
    computeWorkGroupSize*: array[3, uint32]

var # command cages
  getShaderInfoAMDCage: proc(device: Device; pipeline: Pipeline; shaderStage: ShaderStageFlagBits; infoType: ShaderInfoTypeAMD; pInfoSize: ptr uint; pInfo: pointer;): Result {.cdecl.}
proc getShaderInfoAMD*(
      device: Device;
      pipeline: Pipeline;
      shaderStage: ShaderStageFlagBits;
      infoType: ShaderInfoTypeAMD;
      pInfoSize: ptr uint;
      pInfo: pointer;
    ): Result {.cdecl, discardable.} =
  getShaderInfoAMDCage(device,pipeline,shaderStage,infoType,pInfoSize,pInfo)

proc loadVK_AMD_shader_info*(instance: Instance) =
  instance.defineLoader(`<<`)

  getShaderInfoAMDCage << "vkGetShaderInfoAMD"