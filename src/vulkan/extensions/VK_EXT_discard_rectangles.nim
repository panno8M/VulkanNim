# Generated at 2021-09-09T01:49:36Z
# VK_EXT_discard_rectangles


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  ExtDiscardRectanglesSpecVersion* = 1
  ExtDiscardRectanglesExtensionName* = "VK_EXT_discard_rectangles"

type # enums and bitmasks
  PipelineDiscardRectangleStateCreateFlagsEXT* = Flags[distinct UnusedEnum]
  DiscardRectangleModeEXT* {.size: sizeof(int32), pure.} = enum
    inclusiveExt = 0
    exclusiveExt = 1

type
  PhysicalDeviceDiscardRectanglePropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    maxDiscardRectangles*: uint32
  PipelineDiscardRectangleStateCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineDiscardRectangleStateCreateFlagsEXT
    discardRectangleMode*: DiscardRectangleModeEXT
    discardRectangleCount*: uint32
    pDiscardRectangles*: ptr Rect2D

proc cmdSetDiscardRectangleEXT*(
      commandBuffer: CommandBuffer;
      firstDiscardRectangle: uint32;
      discardRectangleCount: uint32;
      pDiscardRectangles: ptr Rect2D;
    ): void {.cdecl, lazyload("vkCmdSetDiscardRectangleEXT", DeviceLevel).}

proc loadAllVK_EXT_discard_rectangles*(instance: Instance) =
  cmdSetDiscardRectangleEXT.smartLoad(instance)

proc loadVK_EXT_discard_rectangles*(device: Device) =
  cmdSetDiscardRectangleEXT.smartLoad(device)

