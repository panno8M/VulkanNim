# Generated at 2021-08-31T05:19:03Z
# VK_KHR_descriptor_update_template


import ../platform
import ../features/vk10
import ../features/vk11
import ./VK_KHR_push_descriptor
import ./VK_EXT_debug_report
export VK_KHR_push_descriptor
export VK_EXT_debug_report

const
  KhrDescriptorUpdateTemplateSpecVersion* = 1
  KhrDescriptorUpdateTemplateExtensionName* = "VK_KHR_descriptor_update_template"

  DescriptorUpdateTemplateTypePushDescriptorsKhr* = 1

type # enums and bitmasks
  DescriptorUpdateTemplateCreateFlagsKHR* = DescriptorUpdateTemplateCreateFlags
  DescriptorUpdateTemplateTypeKHR* = distinct UnusedEnum

type
  DescriptorUpdateTemplateKHR* = DescriptorUpdateTemplate
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