# Generated at 2021-08-28T00:52:26Z
# VK_EXT_separate_stencil_usage
# =================================

import ../platform
import ../features/vk10


const
  ExtSeparateStencilUsageSpecVersion* = 1
  ExtSeparateStencilUsageExtensionName* = "VK_EXT_separate_stencil_usage"

type
  ImageStencilUsageCreateInfoEXT* = object

StructureType.defineAliases:
  ImageStencilUsageCreateInfo as ImageStencilUsageCreateInfoExt

