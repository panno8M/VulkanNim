# Generated at 2021-12-26T10:16:14Z
# VK_KHR_get_memory_requirements2

import ../platform

import ../features/vk10
import ../features/vk11

prepareVulkanLibDef()

const
  KhrGetMemoryRequirements2SpecVersion* = 1
  KhrGetMemoryRequirements2ExtensionName* = "VK_KHR_get_memory_requirements2"

type
  BufferMemoryRequirementsInfo2KHR* = object
  ImageMemoryRequirementsInfo2KHR* = object
  ImageSparseMemoryRequirementsInfo2KHR* = object
  MemoryRequirements2KHR* = object
  SparseImageMemoryRequirements2KHR* = object

const getImageMemoryRequirements2KHR* = getImageMemoryRequirements2
const getBufferMemoryRequirements2KHR* = getBufferMemoryRequirements2
const getImageSparseMemoryRequirements2KHR* = getImageSparseMemoryRequirements2

