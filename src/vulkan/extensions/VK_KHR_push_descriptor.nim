
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  PhysicalDevicePushDescriptorPropertiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    maxPushDescriptors*: uint32

const KhrPushDescriptorSpecVersion* = 2
const KhrPushDescriptorExtensionName* = "VK_KHR_push_descriptor"
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