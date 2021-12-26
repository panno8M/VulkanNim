# Generated at 2021-12-26T16:57:02Z
# VK_EXT_depth_clip_control

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2
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



