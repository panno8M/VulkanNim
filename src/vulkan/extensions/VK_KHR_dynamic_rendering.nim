# Generated at 2021-12-30T16:35:41Z
# VK_KHR_dynamic_rendering

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_fragment_shading_rate
import ./VK_EXT_fragment_density_map
import ./VK_AMD_mixed_attachment_samples
import ./VK_NV_framebuffer_mixed_samples
import ./VK_NVX_multiview_per_view_attributes
export VK_KHR_get_physical_device_properties2
export VK_KHR_fragment_shading_rate
export VK_EXT_fragment_density_map
export VK_AMD_mixed_attachment_samples
export VK_NV_framebuffer_mixed_samples
export VK_NVX_multiview_per_view_attributes
prepareVulkanLibDef()

const
  KhrDynamicRenderingSpecVersion* = 1
  KhrDynamicRenderingExtensionName* = "VK_KHR_dynamic_rendering"

type
  RenderingInfoKHR* = object
    sType* {.constant: (StructureType.renderingInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: RenderingFlagsKHR
    renderArea*: Rect2D
    layerCount*: uint32
    viewMask*: uint32
    colorAttachmentCount* {.optional.}: uint32
    pColorAttachments* {.length: colorAttachmentCount.}: arrPtr[RenderingAttachmentInfoKHR]
    pDepthAttachment* {.optional.}: ptr RenderingAttachmentInfoKHR
    pStencilAttachment* {.optional.}: ptr RenderingAttachmentInfoKHR
  RenderingAttachmentInfoKHR* = object
    sType* {.constant: (StructureType.renderingAttachmentInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    imageView* {.optional.}: ImageView
    imageLayout*: ImageLayout
    resolveMode* {.optional.}: ResolveModeFlagBits
    resolveImageView* {.optional.}: ImageView
    resolveImageLayout*: ImageLayout
    loadOp*: AttachmentLoadOp
    storeOp*: AttachmentStoreOp
    clearValue*: ClearValue
  PipelineRenderingCreateInfoKHR* = object
    sType* {.constant: (StructureType.pipelineRenderingCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    viewMask*: uint32
    colorAttachmentCount* {.optional.}: uint32
    pColorAttachmentFormats* {.length: colorAttachmentCount.}: arrPtr[Format]
    depthAttachmentFormat*: Format
    stencilAttachmentFormat*: Format
  PhysicalDeviceDynamicRenderingFeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDeviceDynamicRenderingFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    dynamicRendering*: Bool32
  CommandBufferInheritanceRenderingInfoKHR* = object
    sType* {.constant: (StructureType.commandBufferInheritanceRenderingInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: RenderingFlagsKHR
    viewMask*: uint32
    colorAttachmentCount* {.optional.}: uint32
    pColorAttachmentFormats* {.length: colorAttachmentCount.}: arrPtr[Format]
    depthAttachmentFormat*: Format
    stencilAttachmentFormat*: Format
    rasterizationSamples* {.optional.}: SampleCountFlagBits

  RenderingFragmentShadingRateAttachmentInfoKHR* = object
    sType* {.constant: (StructureType.renderingFragmentShadingRateAttachmentInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    imageView* {.optional.}: ImageView
    imageLayout*: ImageLayout
    shadingRateAttachmentTexelSize*: Extent2D

  RenderingFragmentDensityMapAttachmentInfoEXT* = object
    sType* {.constant: (StructureType.renderingFragmentDensityMapAttachmentInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    imageView*: ImageView
    imageLayout*: ImageLayout

  AttachmentSampleCountInfoAMD* = object
    sType* {.constant: (StructureType.attachmentSampleCountInfoAmd).}: StructureType
    pNext* {.optional.}: pointer
    colorAttachmentCount*: uint32
    pColorAttachmentSamples* {.length: colorAttachmentCount.}: arrPtr[SampleCountFlagBits]
    depthStencilAttachmentSamples* {.optional.}: SampleCountFlagBits

  AttachmentSampleCountInfoNV* = object

  MultiviewPerViewAttributesInfoNVX* = object
    sType* {.constant: (StructureType.multiviewPerViewAttributesInfoNvx).}: StructureType
    pNext* {.optional.}: pointer
    perViewAttributes*: Bool32
    perViewAttributesPositionXOnly*: Bool32

proc cmdBeginRenderingKHR*(
      commandBuffer: CommandBuffer;
      pRenderingInfo: ptr RenderingInfoKHR;
    ): void {.cdecl, lazyload("vkCmdBeginRenderingKHR", DeviceLevel).}
proc cmdEndRenderingKHR*(
      commandBuffer: CommandBuffer;
    ): void {.cdecl, lazyload("vkCmdEndRenderingKHR", DeviceLevel).}

proc loadAllVK_KHR_dynamic_rendering*(instance: Instance) =
  instance.loadCommand cmdBeginRenderingKHR
  instance.loadCommand cmdEndRenderingKHR
proc loadVK_KHR_dynamic_rendering*(device: Device) =
  device.loadCommand cmdBeginRenderingKHR
  device.loadCommand cmdEndRenderingKHR
