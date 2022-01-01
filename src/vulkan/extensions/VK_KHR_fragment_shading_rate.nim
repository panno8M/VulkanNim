# Generated at 2021-12-31T11:28:24Z
# VK_KHR_fragment_shading_rate

import ../platform

import ../features/vk10
import ./VK_KHR_create_renderpass2
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_format_feature_flags2
export VK_KHR_create_renderpass2
export VK_KHR_get_physical_device_properties2
export VK_KHR_format_feature_flags2
prepareVulkanLibDef()

const
  KhrFragmentShadingRateSpecVersion* = 2
  KhrFragmentShadingRateExtensionName* = "VK_KHR_fragment_shading_rate"

type
  FragmentShadingRateAttachmentInfoKHR* = object
    sType* {.constant: (StructureType.fragmentShadingRateAttachmentInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    pFragmentShadingRateAttachment* {.optional.}: ptr AttachmentReference2
    shadingRateAttachmentTexelSize*: Extent2D
  PipelineFragmentShadingRateStateCreateInfoKHR* = object
    sType* {.constant: (StructureType.pipelineFragmentShadingRateStateCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    fragmentSize*: Extent2D
    combinerOps*: array[2, FragmentShadingRateCombinerOpKHR]
  PhysicalDeviceFragmentShadingRateFeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceFragmentShadingRateFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    pipelineFragmentShadingRate*: Bool32
    primitiveFragmentShadingRate*: Bool32
    attachmentFragmentShadingRate*: Bool32
  PhysicalDeviceFragmentShadingRatePropertiesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceFragmentShadingRatePropertiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    minFragmentShadingRateAttachmentTexelSize*: Extent2D
    maxFragmentShadingRateAttachmentTexelSize*: Extent2D
    maxFragmentShadingRateAttachmentTexelSizeAspectRatio*: uint32
    primitiveFragmentShadingRateWithMultipleViewports*: Bool32
    layeredShadingRateAttachments*: Bool32
    fragmentShadingRateNonTrivialCombinerOps*: Bool32
    maxFragmentSize*: Extent2D
    maxFragmentSizeAspectRatio*: uint32
    maxFragmentShadingRateCoverageSamples*: uint32
    maxFragmentShadingRateRasterizationSamples*: SampleCountFlagBits
    fragmentShadingRateWithShaderDepthStencilWrites*: Bool32
    fragmentShadingRateWithSampleMask*: Bool32
    fragmentShadingRateWithShaderSampleMask*: Bool32
    fragmentShadingRateWithConservativeRasterization*: Bool32
    fragmentShadingRateWithFragmentShaderInterlock*: Bool32
    fragmentShadingRateWithCustomSampleLocations*: Bool32
    fragmentShadingRateStrictMultiplyCombiner*: Bool32
  PhysicalDeviceFragmentShadingRateKHR* = object
    sType* {.constant: (StructureType.physicalDeviceFragmentShadingRateKhr).}: StructureType
    pNext* {.optional.}: pointer
    sampleCounts*: SampleCountFlags
    fragmentSize*: Extent2D

proc getPhysicalDeviceFragmentShadingRatesKHR*(
      physicalDevice: PhysicalDevice;
      pFragmentShadingRateCount: ptr uint32;
      pFragmentShadingRates {.length: pFragmentShadingRateCount.} = default(arrPtr[PhysicalDeviceFragmentShadingRateKHR]);
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.incomplete],
      errorCodes: @[Result.errorOutOfHostMemory],
      lazyload("vkGetPhysicalDeviceFragmentShadingRatesKHR", InstanceLevel).}
proc cmdSetFragmentShadingRateKHR*(
      commandBuffer: CommandBuffer;
      pFragmentSize: ptr Extent2D;
      combinerOps: FragmentShadingRateCombinerOpKHR;
    ): void {.cdecl, lazyload("vkCmdSetFragmentShadingRateKHR", DeviceLevel).}

proc loadAllVK_KHR_fragment_shading_rate*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceFragmentShadingRatesKHR
  cmdSetFragmentShadingRateKHR
proc loadVK_KHR_fragment_shading_rate*(instance: Instance) = instance.loadCommands:
  getPhysicalDeviceFragmentShadingRatesKHR
proc loadVK_KHR_fragment_shading_rate*(device: Device) = device.loadCommands:
  cmdSetFragmentShadingRateKHR
