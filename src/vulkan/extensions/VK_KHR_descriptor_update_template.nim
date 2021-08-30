# Generated at 2021-08-30T22:51:48Z
# VK_KHR_descriptor_update_template


import ../platform
import ../features/vk10

const
  KhrDescriptorUpdateTemplateSpecVersion* = 1
  KhrDescriptorUpdateTemplateExtensionName* = "VK_KHR_descriptor_update_template"

  DescriptorUpdateTemplateTypePushDescriptorsKhr* = 1

type
  DescriptorUpdateTemplateKHR* = DescriptorUpdateTemplate
  {name}* = {Alias}
  DescriptorUpdateTemplateTypeKHR* = distinct UnusedEnum
  DescriptorUpdateTemplateEntryKHR* = object
  DescriptorUpdateTemplateCreateInfoKHR* = object

const createDescriptorUpdateTemplateKHR* = createDescriptorUpdateTemplate
const destroyDescriptorUpdateTemplateKHR* = destroyDescriptorUpdateTemplate
const updateDescriptorSetWithTemplateKHR* = updateDescriptorSetWithTemplate
ObjectType.defineAliases:
  descriptorUpdateTemplate as descriptorUpdateTemplateKhr

StructureType.defineAliases:
  descriptorUpdateTemplateCreateInfo as descriptorUpdateTemplateCreateInfoKhr

DescriptorUpdateTemplateType.defineAliases:
  descriptorSet as descriptorSetKhr



var # command cages
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
  descriptorUpdateTemplateExt as descriptorUpdateTemplateKhrExt

proc loadVK_KHR_descriptor_update_template*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdPushDescriptorSetWithTemplateKHRCage << "vkCmdPushDescriptorSetWithTemplateKHR"