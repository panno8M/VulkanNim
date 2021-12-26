# Generated at 2021-12-26T10:42:47Z
# VK_KHR_create_renderpass2

import ../platform

import ../features/vk10
import ./VK_KHR_multiview
import ./VK_KHR_maintenance2
import ../features/vk12
export VK_KHR_multiview
export VK_KHR_maintenance2
prepareVulkanLibDef()

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

const createRenderPass2KHR* = createRenderPass2
const cmdBeginRenderPass2KHR* = cmdBeginRenderPass2
const cmdNextSubpass2KHR* = cmdNextSubpass2
const cmdEndRenderPass2KHR* = cmdEndRenderPass2

