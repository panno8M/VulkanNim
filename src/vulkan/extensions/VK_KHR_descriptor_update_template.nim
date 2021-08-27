# Generated at 2021-08-27T06:01:02Z
# VK_KHR_descriptor_update_template
# =================================

import ../platform
import ../features/vk10


const
  KhrDescriptorUpdateTemplateSpecVersion* = 1
  KhrDescriptorUpdateTemplateExtensionName* = "VK_KHR_descriptor_update_template"

type
  DescriptorUpdateTemplateKHR* = DescriptorUpdateTemplate
  {name}* = {Alias}
  DescriptorUpdateTemplateTypeKHR* = UnusedEnum
  DescriptorUpdateTemplateEntryKHR* = object
  DescriptorUpdateTemplateCreateInfoKHR* = object

var # commands
  
  
  
const createDescriptorUpdateTemplateKHR* = createDescriptorUpdateTemplate
const destroyDescriptorUpdateTemplateKHR* = destroyDescriptorUpdateTemplate
const updateDescriptorSetWithTemplateKHR* = updateDescriptorSetWithTemplate


var # commands
  cmdPushDescriptorSetWithTemplateKHRCage: proc(commandBuffer: CommandBuffer; descriptorUpdateTemplate: DescriptorUpdateTemplate; layout: PipelineLayout; set: uint32; pData: pointer;): void {.cdecl.}
proc cmdPushDescriptorSetWithTemplateKHR*(
      commandBuffer: CommandBuffer;
      descriptorUpdateTemplate: DescriptorUpdateTemplate;
      layout: PipelineLayout;
      set: uint32;
      pData: pointer;
    ): void {.cdecl.} =
  cmdPushDescriptorSetWithTemplateKHRCage(commandBuffer,descriptorUpdateTemplate,layout,set,pData)
proc loadVK_KHR_descriptor_update_template*(instance: Instance) =
  instance.defineLoader(`<<`)

  createDescriptorUpdateTemplateKHRCage << "vkCreateDescriptorUpdateTemplateKHR"
  destroyDescriptorUpdateTemplateKHRCage << "vkDestroyDescriptorUpdateTemplateKHR"
  updateDescriptorSetWithTemplateKHRCage << "vkUpdateDescriptorSetWithTemplateKHR"

  cmdPushDescriptorSetWithTemplateKHRCage << "vkCmdPushDescriptorSetWithTemplateKHR"