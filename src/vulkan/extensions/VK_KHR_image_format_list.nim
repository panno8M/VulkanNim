# Generated at 2021-10-24T02:03:03Z
# VK_KHR_image_format_list

import ../platform
import ../features/vk10
import ../features/vk12

prepareVulkanLibDef()

const
  KhrImageFormatListSpecVersion* = 1
  KhrImageFormatListExtensionName* = "VK_KHR_image_format_list"

type
  ImageFormatListCreateInfoKHR* = object

StructureType.defineAliases:
  imageFormatListCreateInfo as imageFormatListCreateInfoKhr


