# Generated at 2021-10-24T02:03:03Z
# VK_EXT_separate_stencil_usage

import ../platform
import ../features/vk10
import ../features/vk12

prepareVulkanLibDef()

const
  ExtSeparateStencilUsageSpecVersion* = 1
  ExtSeparateStencilUsageExtensionName* = "VK_EXT_separate_stencil_usage"

type
  ImageStencilUsageCreateInfoEXT* = object

StructureType.defineAliases:
  imageStencilUsageCreateInfo as imageStencilUsageCreateInfoExt


