# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_AMD_shader_info

import ../tools
const
  # VK_AMD_shader_info
  AmdShaderInfoSpecVersion* = 1
  AmdShaderInfoExtensionName* = "VK_AMD_shader_info"


# VK_AMD_shader_info
# ==================
proc getShaderInfoAMD*(
      device: Device;
      pipeline: Pipeline;
      shaderStage: ShaderStageFlagBits;
      infoType: ShaderInfoTypeAMD;
      pInfoSize: ptr uint;
      pInfo {.length: pInfoSize.} = default(pointer);
    ): Result {.lazyload("vkGetShaderInfoAMD", DeviceLevel),
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorFeatureNotPresent, Result.errorOutOfHostMemory].}


proc loadAllVK_AMD_shader_info*(instance: Instance) = instance.loadCommands:
  getShaderInfoAMD
proc loadVK_AMD_shader_info*(device: Device) = device.loadCommands:
  getShaderInfoAMD