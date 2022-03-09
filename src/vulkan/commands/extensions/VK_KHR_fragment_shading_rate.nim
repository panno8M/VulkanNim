# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_KHR_fragment_shading_rate

import ../tools
const
  # VK_KHR_fragment_shading_rate
  KhrFragmentShadingRateSpecVersion* = 2
  KhrFragmentShadingRateExtensionName* = "VK_KHR_fragment_shading_rate"


# VK_KHR_fragment_shading_rate
# ============================
proc getPhysicalDeviceFragmentShadingRatesKHR*(
      physicalDevice: PhysicalDevice;
      pFragmentShadingRateCount: ptr uint32;
      pFragmentShadingRates {.length: pFragmentShadingRateCount.} = default(arrPtr[PhysicalDeviceFragmentShadingRateKHR]);
    ): Result {.lazyload("vkGetPhysicalDeviceFragmentShadingRatesKHR", InstanceLevel),
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory].}
proc cmdSetFragmentShadingRateKHR*(
      commandBuffer: CommandBuffer;
      pFragmentSize: ptr Extent2D;
      combinerOps: FragmentShadingRateCombinerOpKHR;
    ): void {.lazyload("vkCmdSetFragmentShadingRateKHR", DeviceLevel), cmdchain.}


proc loadAllVK_KHR_fragment_shading_rate*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceFragmentShadingRatesKHR
  cmdSetFragmentShadingRateKHR
proc loadVK_KHR_fragment_shading_rate*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceFragmentShadingRatesKHR
proc loadVK_KHR_fragment_shading_rate*(device: Device) = device.loadCommands:
  cmdSetFragmentShadingRateKHR