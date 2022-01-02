# VK_KHR_push_descriptor

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  KhrPushDescriptorSpecVersion* = 2
  KhrPushDescriptorExtensionName* = "VK_KHR_push_descriptor"

  DescriptorUpdateTemplateTypePushDescriptorsKhr* = 1

type
  PhysicalDevicePushDescriptorPropertiesKHR* = object
    sType* {.constant: (StructureType.physicalDevicePushDescriptorPropertiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    maxPushDescriptors*: uint32

proc cmdPushDescriptorSetKHR*(
      commandBuffer: CommandBuffer;
      pipelineBindPoint: PipelineBindPoint;
      layout: PipelineLayout;
      set: uint32;
      descriptorWriteCount: uint32;
      pDescriptorWrites {.length: descriptorWriteCount.}: arrPtr[WriteDescriptorSet];
    ): void {.cdecl, lazyload("vkCmdPushDescriptorSetKHR", DeviceLevel).}


proc cmdPushDescriptorSetWithTemplateKHR*(
      commandBuffer: CommandBuffer;
      descriptorUpdateTemplate: DescriptorUpdateTemplate;
      layout: PipelineLayout;
      set: uint32;
      pData: pointer;
    ): void {.cdecl, lazyload("vkCmdPushDescriptorSetWithTemplateKHR", DeviceLevel).}

proc loadAllVK_KHR_push_descriptor*(instance: Instance) = instance.loadCommands:
  cmdPushDescriptorSetKHR
  cmdPushDescriptorSetWithTemplateKHR
  cmdPushDescriptorSetWithTemplateKHR
proc loadVK_KHR_push_descriptor*(device: Device) = device.loadCommands:
  cmdPushDescriptorSetKHR
  cmdPushDescriptorSetWithTemplateKHR
  cmdPushDescriptorSetWithTemplateKHR
