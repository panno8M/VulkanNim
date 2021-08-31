# Generated at 2021-08-31T05:18:46Z
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



