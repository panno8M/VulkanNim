# Generated at 2021-08-30T14:31:10Z
# VK_EXT_separate_stencil_usage


import ../platform
import ../features/vk10

const
  ExtSeparateStencilUsageSpecVersion* = 1
  ExtSeparateStencilUsageExtensionName* = "VK_EXT_separate_stencil_usage"

type
  ImageStencilUsageCreateInfoEXT* = object

StructureType.defineAliases:
  imageStencilUsageCreateInfo as imageStencilUsageCreateInfoExt

