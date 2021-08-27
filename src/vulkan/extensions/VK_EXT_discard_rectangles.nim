# Generated at 2021-08-27T06:01:02Z
# VK_EXT_discard_rectangles
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  ExtDiscardRectanglesSpecVersion* = 1
  ExtDiscardRectanglesExtensionName* = "VK_EXT_discard_rectangles"

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
  PipelineDiscardRectangleStateCreateFlagsEXT* = distinct Flags
  DiscardRectangleModeEXT* {.size: sizeof(int32), pure.} = enum
    InclusiveExt = 0
    ExclusiveExt = 1

var # commands
  cmdSetDiscardRectangleEXTCage: proc(commandBuffer: CommandBuffer; firstDiscardRectangle: uint32; discardRectangleCount: uint32; pDiscardRectangles: ptr Rect2D;): void {.cdecl.}
proc cmdSetDiscardRectangleEXT*(
      commandBuffer: CommandBuffer;
      firstDiscardRectangle: uint32;
      discardRectangleCount: uint32;
      pDiscardRectangles: ptr Rect2D;
    ): void {.cdecl.} =
  cmdSetDiscardRectangleEXTCage(commandBuffer,firstDiscardRectangle,discardRectangleCount,pDiscardRectangles)
proc loadVK_EXT_discard_rectangles*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdSetDiscardRectangleEXTCage << "vkCmdSetDiscardRectangleEXT"