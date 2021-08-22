
import ../platform
import ../features/vk10


type
  ShaderStatisticsInfoAMD* = object
    shaderStageMask*: ShaderStageFlags
    resourceUsage*: ShaderResourceUsageAMD
    numPhysicalVgprs*: uint32
    numPhysicalSgprs*: uint32
    numAvailableVgprs*: uint32
    numAvailableSgprs*: uint32
    computeWorkGroupSize*: array[3, uint32]
  ShaderResourceUsageAMD* = object
    numUsedVgprs*: uint32
    numUsedSgprs*: uint32
    ldsSizePerLocalWorkGroup*: uint32
    ldsUsageSizeInBytes*: uint
    scratchMemUsageInBytes*: uint
  ShaderInfoTypeAMD* {.size: sizeof(int32), pure.} = enum
    Statistics = 0
    Binary = 1
    Disassembly = 2

const AmdShaderInfoExtensionName* = "VK_AMD_shader_info"
const AmdShaderInfoSpecVersion* = 1
var # commands
  getShaderInfoAMDCage: proc(device: Device; pipeline: Pipeline; shaderStage: ShaderStageFlagBits; infoType: ShaderInfoTypeAMD; pInfoSize: ptr uint; pInfo: pointer;): Result {.cdecl.}

proc getShaderInfoAMD*(
      device: Device;
      pipeline: Pipeline;
      shaderStage: ShaderStageFlagBits;
      infoType: ShaderInfoTypeAMD;
      pInfoSize: ptr uint;
      pInfo: pointer;
    ): Result {.cdecl.} =
  getShaderInfoAMDCage(device,pipeline,shaderStage,infoType,pInfoSize,pInfo)


proc loadVK_AMD_shader_info*(instance: Instance) =
  instance.defineLoader(`<<`)

  getShaderInfoAMDCage << "vkGetShaderInfoAMD"