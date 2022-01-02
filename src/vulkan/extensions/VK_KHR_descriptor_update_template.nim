# VK_KHR_descriptor_update_template

import ../features/vk10
import ../features/vk11
import ../platform
prepareVulkanLibDef()

const
  KhrDescriptorUpdateTemplateSpecVersion* = 1
  KhrDescriptorUpdateTemplateExtensionName* = "VK_KHR_descriptor_update_template"

  DescriptorUpdateTemplateTypePushDescriptorsKhr* = 1

type
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

proc loadAllVK_KHR_descriptor_update_template*(instance: Instance) = instance.loadCommands:
  cmdPushDescriptorSetWithTemplateKHR
proc loadVK_KHR_descriptor_update_template*(device: Device) = device.loadCommands:
  cmdPushDescriptorSetWithTemplateKHR
