# VK_AMD_shader_info

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  AmdShaderInfoSpecVersion* = 1
  AmdShaderInfoExtensionName* = "VK_AMD_shader_info"

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
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorFeatureNotPresent, Result.errorOutOfHostMemory],
      lazyload("vkGetShaderInfoAMD", DeviceLevel).}

proc loadAllVK_AMD_shader_info*(instance: Instance) = instance.loadCommands:
  getShaderInfoAMD
proc loadVK_AMD_shader_info*(device: Device) = device.loadCommands:
  getShaderInfoAMD
