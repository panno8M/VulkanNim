# VK_EXT_physical_device_drm

import ../features/vk10
import VK_KHR_get_physical_device_properties2
import ../platform
prepareVulkanLibDef()

const
  ExtPhysicalDeviceDrmSpecVersion* = 1
  ExtPhysicalDeviceDrmExtensionName* = "VK_EXT_physical_device_drm"

type
  PhysicalDeviceDrmPropertiesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceDrmPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    hasPrimary*: Bool32
    hasRender*: Bool32
    primaryMajor*: int64
    primaryMinor*: int64
    renderMajor*: int64
    renderMinor*: int64



