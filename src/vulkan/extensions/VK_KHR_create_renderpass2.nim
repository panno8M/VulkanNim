# Generated at 2021-08-31T05:18:46Z
# VK_KHR_create_renderpass2


import ../platform
import ../features/vk10
import ./VK_KHR_multiview
import ./VK_KHR_maintenance2
import ../features/vk12
export VK_KHR_multiview
export VK_KHR_maintenance2

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
StructureType.defineAliases:
  attachmentDescription2 as attachmentDescription2Khr
  attachmentReference2 as attachmentReference2Khr
  subpassDescription2 as subpassDescription2Khr
  subpassDependency2 as subpassDependency2Khr
  renderPassCreateInfo2 as renderPassCreateInfo2Khr
  subpassBeginInfo as subpassBeginInfoKhr
  subpassEndInfo as subpassEndInfoKhr


