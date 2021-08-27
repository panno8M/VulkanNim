
import ../platform
import ../features/vk10


const
  ExtDepthClipEnableSpecVersion* = 1
  ExtDepthClipEnableExtensionName* = "VK_EXT_depth_clip_enable"

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
  PipelineRasterizationDepthClipStateCreateFlagsEXT* = distinct Flags


