# Generated at 2021-12-25T07:50:19Z
# VK_EXT_depth_clip_enable

import ../platform
import ../features/vk10

prepareVulkanLibDef()

const
  ExtDepthClipEnableSpecVersion* = 1
  ExtDepthClipEnableExtensionName* = "VK_EXT_depth_clip_enable"

type
  PhysicalDeviceDepthClipEnableFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceDepthClipEnableFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    depthClipEnable*: Bool32
  PipelineRasterizationDepthClipStateCreateInfoEXT* = object
    sType* {.constant: (StructureType.pipelineRasterizationDepthClipStateCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineRasterizationDepthClipStateCreateFlagsEXT
    depthClipEnable*: Bool32



