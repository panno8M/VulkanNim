# Generated at 2021-09-09T01:49:36Z
# VK_EXT_depth_clip_enable


import ../platform
import ../features/vk10

const
  ExtDepthClipEnableSpecVersion* = 1
  ExtDepthClipEnableExtensionName* = "VK_EXT_depth_clip_enable"

type # enums and bitmasks
  PipelineRasterizationDepthClipStateCreateFlagsEXT* = Flags[distinct UnusedEnum]

type
  PhysicalDeviceDepthClipEnableFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    depthClipEnable*: Bool32
  PipelineRasterizationDepthClipStateCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineRasterizationDepthClipStateCreateFlagsEXT
    depthClipEnable*: Bool32



