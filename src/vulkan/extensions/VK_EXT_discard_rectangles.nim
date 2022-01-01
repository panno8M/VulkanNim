# VK_EXT_discard_rectangles

import ../features/vk10
import VK_KHR_get_physical_device_properties2
import ../platform
prepareVulkanLibDef()

const
  ExtDiscardRectanglesSpecVersion* = 1
  ExtDiscardRectanglesExtensionName* = "VK_EXT_discard_rectangles"

type
  PhysicalDeviceDiscardRectanglePropertiesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceDiscardRectanglePropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    maxDiscardRectangles*: uint32
  PipelineDiscardRectangleStateCreateInfoEXT* = object
    sType* {.constant: (StructureType.pipelineDiscardRectangleStateCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineDiscardRectangleStateCreateFlagsEXT
    discardRectangleMode*: DiscardRectangleModeEXT
    discardRectangleCount* {.optional.}: uint32
    pDiscardRectangles* {.length: discardRectangleCount.}: arrPtr[Rect2D]

proc cmdSetDiscardRectangleEXT*(
      commandBuffer: CommandBuffer;
      firstDiscardRectangle: uint32;
      discardRectangleCount: uint32;
      pDiscardRectangles {.length: discardRectangleCount.}: arrPtr[Rect2D];
    ): void {.cdecl, lazyload("vkCmdSetDiscardRectangleEXT", DeviceLevel).}

proc loadAllVK_EXT_discard_rectangles*(instance: Instance) = instance.loadCommands:
  cmdSetDiscardRectangleEXT
proc loadVK_EXT_discard_rectangles*(device: Device) = device.loadCommands:
  cmdSetDiscardRectangleEXT
