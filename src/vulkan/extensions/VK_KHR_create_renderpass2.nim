# Generated at 2021-08-27T06:01:02Z
# VK_KHR_create_renderpass2
# =================================

import ../platform
import ../features/vk10
import VK_KHR_multiview
import VK_KHR_maintenance2


const
  KhrCreateRenderpass2SpecVersion* = 1
  KhrCreateRenderpass2ExtensionName* = "VK_KHR_create_renderpass2"

type
  RenderPassCreateInfo2KHR* = object
  AttachmentDescription2KHR* = object
  AttachmentReference2KHR* = object
  SubpassDescription2KHR* = object
  SubpassDependency2KHR* = object
  SubpassBeginInfoKHR* = object
  SubpassEndInfoKHR* = object

var # commands
  
  
  
  
const createRenderPass2KHR* = createRenderPass2
const cmdBeginRenderPass2KHR* = cmdBeginRenderPass2
const cmdNextSubpass2KHR* = cmdNextSubpass2
const cmdEndRenderPass2KHR* = cmdEndRenderPass2
proc loadVK_KHR_create_renderpass2*(instance: Instance) =
  instance.defineLoader(`<<`)

  createRenderPass2KHRCage << "vkCreateRenderPass2KHR"
  cmdBeginRenderPass2KHRCage << "vkCmdBeginRenderPass2KHR"
  cmdNextSubpass2KHRCage << "vkCmdNextSubpass2KHR"
  cmdEndRenderPass2KHRCage << "vkCmdEndRenderPass2KHR"