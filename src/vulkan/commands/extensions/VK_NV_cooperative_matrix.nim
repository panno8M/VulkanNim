# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_NV_cooperative_matrix

import ../tools
const
  # VK_NV_cooperative_matrix
  NvCooperativeMatrixSpecVersion* = 1
  NvCooperativeMatrixExtensionName* = "VK_NV_cooperative_matrix"


# VK_NV_cooperative_matrix
# ========================
proc getPhysicalDeviceCooperativeMatrixPropertiesNV*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[CooperativeMatrixPropertiesNV]);
    ): Result {.lazyload("vkGetPhysicalDeviceCooperativeMatrixPropertiesNV", InstanceLevel),
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory].}


proc loadAllVK_NV_cooperative_matrix*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceCooperativeMatrixPropertiesNV
proc loadVK_NV_cooperative_matrix*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceCooperativeMatrixPropertiesNV