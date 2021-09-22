# Generated at 2021-09-23T04:24:54Z
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
  cmdPushDescriptorSetKHR.load(instance)

  cmdPushDescriptorSetWithTemplateKHR.load(instance)

  cmdPushDescriptorSetWithTemplateKHR.load(instance)

proc loadVK_KHR_push_descriptor*(device: Device) =
  cmdPushDescriptorSetKHR.load(device)

  cmdPushDescriptorSetWithTemplateKHR.load(device)

  cmdPushDescriptorSetWithTemplateKHR.load(device)

