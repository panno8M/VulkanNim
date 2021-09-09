# Generated at 2021-09-09T01:49:36Z
# VK_EXT_line_rasterization


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  ExtLineRasterizationSpecVersion* = 1
  ExtLineRasterizationExtensionName* = "VK_EXT_line_rasterization"

type # enums and bitmasks
  LineRasterizationModeEXT* {.size: sizeof(int32), pure.} = enum
    defaultExt = 0
    rectangularExt = 1
    bresenhamExt = 2
    rectangularSmoothExt = 3

type
  PhysicalDeviceLineRasterizationFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    rectangularLines*: Bool32
    bresenhamLines*: Bool32
    smoothLines*: Bool32
    stippledRectangularLines*: Bool32
    stippledBresenhamLines*: Bool32
    stippledSmoothLines*: Bool32
  PhysicalDeviceLineRasterizationPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    lineSubPixelPrecisionBits*: uint32
  PipelineRasterizationLineStateCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    lineRasterizationMode*: LineRasterizationModeEXT
    stippledLineEnable*: Bool32
    lineStippleFactor*: uint32
    lineStipplePattern*: uint16

proc cmdSetLineStippleEXT*(
      commandBuffer: CommandBuffer;
      lineStippleFactor: uint32;
      lineStipplePattern: uint16;
    ): void {.cdecl, lazyload("vkCmdSetLineStippleEXT", DeviceLevel).}

proc loadAllVK_EXT_line_rasterization*(instance: Instance) =
  cmdSetLineStippleEXT.smartLoad(instance)

proc loadVK_EXT_line_rasterization*(device: Device) =
  cmdSetLineStippleEXT.smartLoad(device)

