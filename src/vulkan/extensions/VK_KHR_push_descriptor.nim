# Generated at 2021-12-26T10:16:14Z
# VK_KHR_push_descriptor

import ../platform

import ../features/vk11
import ./VK_KHR_get_physical_device_properties2
import ./VK_KHR_descriptor_update_template
export VK_KHR_get_physical_device_properties2
export VK_KHR_descriptor_update_template

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

proc loadAllVK_KHR_push_descriptor*(instance: Instance) =
  instance.loadCommand cmdPushDescriptorSetKHR

  instance.loadCommand cmdPushDescriptorSetWithTemplateKHR

  instance.loadCommand cmdPushDescriptorSetWithTemplateKHR

proc loadVK_KHR_push_descriptor*(device: Device) =
  device.loadCommand cmdPushDescriptorSetKHR

  device.loadCommand cmdPushDescriptorSetWithTemplateKHR

  device.loadCommand cmdPushDescriptorSetWithTemplateKHR

