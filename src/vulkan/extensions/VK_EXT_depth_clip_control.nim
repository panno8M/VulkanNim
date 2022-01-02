# VK_EXT_depth_clip_control

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtDepthClipControlSpecVersion* = 1
  ExtDepthClipControlExtensionName* = "VK_EXT_depth_clip_control"

type
  PhysicalDeviceDepthClipControlFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceDepthClipControlFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    depthClipControl*: Bool32
  PipelineViewportDepthClipControlCreateInfoEXT* = object
    sType* {.constant: (StructureType.pipelineViewportDepthClipControlCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    negativeOneToOne*: Bool32



