
import ../platform
import ../features/vk10


type
  PipelineRasterizationDepthClipStateCreateFlagsEXT* = distinct Flags
  PhysicalDeviceDepthClipEnableFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    depthClipEnable*: Bool32
  PipelineRasterizationDepthClipStateCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineRasterizationDepthClipStateCreateFlagsEXT
    depthClipEnable*: Bool32

const ExtDepthClipEnableExtensionName* = "VK_EXT_depth_clip_enable"
const ExtDepthClipEnableSpecVersion* = 1

