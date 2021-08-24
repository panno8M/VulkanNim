
import ../platform
import ../features/vk10


type
  DescriptorUpdateTemplateTypeKHR* = UnusedEnum
  {name}* = {Alias}
  DescriptorUpdateTemplateCreateInfoKHR* = object
  # TODO: [Unsupported Type]
  # (name: "VkDescriptorUpdateTemplateKHR", kind: nkrType)
  DescriptorUpdateTemplateEntryKHR* = object

const KhrDescriptorUpdateTemplateSpecVersion* = 1
const KhrDescriptorUpdateTemplateExtensionName* = "VK_KHR_descriptor_update_template"
var # commands
  
  
  

const destroyDescriptorUpdateTemplateKHR* = destroyDescriptorUpdateTemplate

const createDescriptorUpdateTemplateKHR* = createDescriptorUpdateTemplate

const updateDescriptorSetWithTemplateKHR* = updateDescriptorSetWithTemplate


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



proc loadVK_KHR_descriptor_update_template*(instance: Instance) =
  instance.defineLoader(`<<`)

  destroyDescriptorUpdateTemplateKHRCage << "vkDestroyDescriptorUpdateTemplateKHR"
  createDescriptorUpdateTemplateKHRCage << "vkCreateDescriptorUpdateTemplateKHR"
  updateDescriptorSetWithTemplateKHRCage << "vkUpdateDescriptorSetWithTemplateKHR"

  cmdPushDescriptorSetWithTemplateKHRCage << "vkCmdPushDescriptorSetWithTemplateKHR"