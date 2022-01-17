# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_KHR_push_descriptor

import ../tools
const
  # VK_KHR_push_descriptor
  KhrPushDescriptorSpecVersion* = 2
  KhrPushDescriptorExtensionName* = "VK_KHR_push_descriptor"
  DescriptorUpdateTemplateTypePushDescriptorsKhr* = 1


# VK_KHR_push_descriptor
# ======================
proc cmdPushDescriptorSetKHR*(
      commandBuffer: CommandBuffer;
      pipelineBindPoint: PipelineBindPoint;
      layout: PipelineLayout;
      set: uint32;
      descriptorWriteCount: uint32;
      pDescriptorWrites {.length: descriptorWriteCount.}: arrPtr[WriteDescriptorSet];
    ): void {.lazyload("vkCmdPushDescriptorSetKHR", DeviceLevel), cmdchain.}
proc cmdPushDescriptorSetWithTemplateKHR*(
      commandBuffer: CommandBuffer;
      descriptorUpdateTemplate: DescriptorUpdateTemplate;
      layout: PipelineLayout;
      set: uint32;
      pData: pointer;
    ): void {.lazyload("vkCmdPushDescriptorSetWithTemplateKHR", DeviceLevel), cmdchain.}


proc loadAllVK_KHR_push_descriptor*(instance: Instance) = instance.loadCommands:
  cmdPushDescriptorSetKHR
  cmdPushDescriptorSetWithTemplateKHR
  cmdPushDescriptorSetWithTemplateKHR
proc loadVK_KHR_push_descriptor*(device: Device) = device.loadCommands:
  cmdPushDescriptorSetKHR
  cmdPushDescriptorSetWithTemplateKHR
  cmdPushDescriptorSetWithTemplateKHR