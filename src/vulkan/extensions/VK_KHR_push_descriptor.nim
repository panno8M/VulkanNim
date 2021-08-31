# Generated at 2021-08-31T05:19:03Z
# VK_KHR_push_descriptor


import ../platform
import ../features/vk11
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_descriptor_update_template
export VK_KHR_get_physical_device_properties2
export VK_KHR_descriptor_update_template

const
  KhrPushDescriptorSpecVersion* = 2
  KhrPushDescriptorExtensionName* = "VK_KHR_push_descriptor"

  DescriptorUpdateTemplateTypePushDescriptorsKhr* = 1

type
  PhysicalDevicePushDescriptorPropertiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    maxPushDescriptors*: uint32

var # command cages
  cmdPushDescriptorSetKHRCage: proc(commandBuffer: CommandBuffer; pipelineBindPoint: PipelineBindPoint; layout: PipelineLayout; set: uint32; descriptorWriteCount: uint32; pDescriptorWrites: ptr WriteDescriptorSet;): void {.cdecl.}
proc cmdPushDescriptorSetKHR*(
      commandBuffer: CommandBuffer;
      pipelineBindPoint: PipelineBindPoint;
      layout: PipelineLayout;
      set: uint32;
      descriptorWriteCount: uint32;
      pDescriptorWrites: ptr WriteDescriptorSet;
    ): void {.cdecl.} =
  cmdPushDescriptorSetKHRCage(commandBuffer,pipelineBindPoint,layout,set,descriptorWriteCount,pDescriptorWrites)


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

proc loadVK_KHR_push_descriptor*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdPushDescriptorSetKHRCage << "vkCmdPushDescriptorSetKHR"

  cmdPushDescriptorSetWithTemplateKHRCage << "vkCmdPushDescriptorSetWithTemplateKHR"

  cmdPushDescriptorSetWithTemplateKHRCage << "vkCmdPushDescriptorSetWithTemplateKHR"