# Generated at 2021-08-27T06:01:02Z
# VK_KHR_push_descriptor
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  KhrPushDescriptorSpecVersion* = 2
  KhrPushDescriptorExtensionName* = "VK_KHR_push_descriptor"

type
  PhysicalDevicePushDescriptorPropertiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    maxPushDescriptors*: uint32

var # commands
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


var # commands
proc loadVK_KHR_push_descriptor*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdPushDescriptorSetKHRCage << "vkCmdPushDescriptorSetKHR"

  cmdPushDescriptorSetWithTemplateKHRCage << "vkCmdPushDescriptorSetWithTemplateKHR"

  cmdPushDescriptorSetWithTemplateKHRCage << "vkCmdPushDescriptorSetWithTemplateKHR"