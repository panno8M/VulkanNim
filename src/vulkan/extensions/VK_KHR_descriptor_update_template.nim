# Generated at 2021-08-28T00:52:26Z
# VK_KHR_descriptor_update_template
# =================================

import ../platform
import ../features/vk10


const
  KhrDescriptorUpdateTemplateSpecVersion* = 1
  KhrDescriptorUpdateTemplateExtensionName* = "VK_KHR_descriptor_update_template"

  DescriptorUpdateTemplateTypePushDescriptorsKhr* = 1

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
ObjectType.defineAliases:
  DescriptorUpdateTemplate as DescriptorUpdateTemplateKhr

StructureType.defineAliases:
  DescriptorUpdateTemplateCreateInfo as DescriptorUpdateTemplateCreateInfoKhr

DescriptorUpdateTemplateType.defineAliases:
  DescriptorSet as DescriptorSetKhr



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


DebugReportObjectTypeEXT.defineAliases:
  DescriptorUpdateTemplateExt as DescriptorUpdateTemplateKhrExt

proc loadVK_KHR_descriptor_update_template*(instance: Instance) =
  instance.defineLoader(`<<`)

  createDescriptorUpdateTemplateKHRCage << "vkCreateDescriptorUpdateTemplateKHR"
  destroyDescriptorUpdateTemplateKHRCage << "vkDestroyDescriptorUpdateTemplateKHR"
  updateDescriptorSetWithTemplateKHRCage << "vkUpdateDescriptorSetWithTemplateKHR"

  cmdPushDescriptorSetWithTemplateKHRCage << "vkCmdPushDescriptorSetWithTemplateKHR"