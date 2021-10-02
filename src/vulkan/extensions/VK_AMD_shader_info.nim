# Generated at 2021-10-02T09:29:45Z
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

proc getShaderInfoAMD*(
      device: Device;
      pipeline: Pipeline;
      shaderStage: ShaderStageFlagBits;
      infoType: ShaderInfoTypeAMD;
      pInfoSize: ptr uint;
      pInfo {.length: pInfoSize.} = default(pointer);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorFeatureNotPresent, errorOutOfHostMemory),
      lazyload("vkGetShaderInfoAMD", DeviceLevel).}

proc loadAllVK_AMD_shader_info*(instance: Instance) =
  getShaderInfoAMD.load(instance)

proc loadVK_AMD_shader_info*(device: Device) =
  getShaderInfoAMD.load(device)

