# Generated at 2021-12-30T16:35:41Z
# VK_NV_fragment_shading_rate_enums

import ../platform

import ../features/vk10
import ./VK_KHR_fragment_shading_rate
export VK_KHR_fragment_shading_rate
prepareVulkanLibDef()

const
  NvFragmentShadingRateEnumsSpecVersion* = 1
  NvFragmentShadingRateEnumsExtensionName* = "VK_NV_fragment_shading_rate_enums"

type
  PhysicalDeviceFragmentShadingRateEnumsFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceFragmentShadingRateEnumsFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    fragmentShadingRateEnums*: Bool32
    supersampleFragmentShadingRates*: Bool32
    noInvocationFragmentShadingRates*: Bool32
  PhysicalDeviceFragmentShadingRateEnumsPropertiesNV* = object
    sType* {.constant: (StructureType.physicalDeviceFragmentShadingRateEnumsPropertiesNv).}: StructureType
    pNext* {.optional.}: pointer
    maxFragmentShadingRateInvocationCount*: SampleCountFlagBits
  PipelineFragmentShadingRateEnumStateCreateInfoNV* = object
    sType* {.constant: (StructureType.pipelineFragmentShadingRateEnumStateCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    shadingRateType*: FragmentShadingRateTypeNV
    shadingRate*: FragmentShadingRateNV
    combinerOps*: array[2, FragmentShadingRateCombinerOpKHR]

proc cmdSetFragmentShadingRateEnumNV*(
      commandBuffer: CommandBuffer;
      shadingRate: FragmentShadingRateNV;
      combinerOps: FragmentShadingRateCombinerOpKHR;
    ): void {.cdecl, lazyload("vkCmdSetFragmentShadingRateEnumNV", DeviceLevel).}

proc loadAllVK_NV_fragment_shading_rate_enums*(instance: Instance) =
  instance.loadCommand cmdSetFragmentShadingRateEnumNV
proc loadVK_NV_fragment_shading_rate_enums*(device: Device) =
  device.loadCommand cmdSetFragmentShadingRateEnumNV
