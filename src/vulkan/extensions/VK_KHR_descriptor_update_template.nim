# Generated at 2021-12-25T14:19:30Z
# VK_KHR_descriptor_update_template

import ../platform
import ../features/vk10
import ../features/vk11
import ./VK_KHR_push_descriptor
import ./VK_EXT_debug_report
export VK_KHR_push_descriptor
export VK_EXT_debug_report

prepareVulkanLibDef()

const
  KhrDescriptorUpdateTemplateSpecVersion* = 1
  KhrDescriptorUpdateTemplateExtensionName* = "VK_KHR_descriptor_update_template"

  DescriptorUpdateTemplateTypePushDescriptorsKhr* = 1

type
  DescriptorUpdateTemplateKHR* = DescriptorUpdateTemplate
  DescriptorUpdateTemplateEntryKHR* = object
  DescriptorUpdateTemplateCreateInfoKHR* = object

const createDescriptorUpdateTemplateKHR* = createDescriptorUpdateTemplate
const destroyDescriptorUpdateTemplateKHR* = destroyDescriptorUpdateTemplate
const updateDescriptorSetWithTemplateKHR* = updateDescriptorSetWithTemplate


proc cmdPushDescriptorSetWithTemplateKHR*(
      commandBuffer: CommandBuffer;
      descriptorUpdateTemplate: DescriptorUpdateTemplate;
      layout: PipelineLayout;
      set: uint32;
      pData: pointer;
    ): void {.cdecl, lazyload("vkCmdPushDescriptorSetWithTemplateKHR", DeviceLevel).}

proc loadAllVK_KHR_descriptor_update_template*(instance: Instance) =
  instance.loadCommand cmdPushDescriptorSetWithTemplateKHR

proc loadVK_KHR_descriptor_update_template*(device: Device) =
  device.loadCommand cmdPushDescriptorSetWithTemplateKHR

