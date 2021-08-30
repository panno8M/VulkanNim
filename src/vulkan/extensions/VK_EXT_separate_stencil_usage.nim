# Generated at 2021-08-30T23:05:46Z
# VK_EXT_separate_stencil_usage


import ../platform
import ../features/vk10
import ../features/vk12

const
  ExtSeparateStencilUsageSpecVersion* = 1
  ExtSeparateStencilUsageExtensionName* = "VK_EXT_separate_stencil_usage"

type
  ImageStencilUsageCreateInfoEXT* = object

StructureType.defineAliases:
  imageStencilUsageCreateInfo as imageStencilUsageCreateInfoExt

