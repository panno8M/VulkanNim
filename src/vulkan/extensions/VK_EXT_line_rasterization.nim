
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  PipelineRasterizationLineStateCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    lineRasterizationMode*: LineRasterizationModeEXT
    stippledLineEnable*: Bool32
    lineStippleFactor*: uint32
    lineStipplePattern*: uint16
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
  LineRasterizationModeEXT* {.size: sizeof(int32), pure.} = enum
    Default = 0
    Rectangular = 1
    Bresenham = 2
    RectangularSmooth = 3

const ExtLineRasterizationSpecVersion* = 1
const ExtLineRasterizationExtensionName* = "VK_EXT_line_rasterization"
var # commands
  cmdSetLineStippleEXTCage: proc(commandBuffer: CommandBuffer; lineStippleFactor: uint32; lineStipplePattern: uint16;): void {.cdecl.}

proc cmdSetLineStippleEXT*(
      commandBuffer: CommandBuffer;
      lineStippleFactor: uint32;
      lineStipplePattern: uint16;
    ): void {.cdecl.} =
  cmdSetLineStippleEXTCage(commandBuffer,lineStippleFactor,lineStipplePattern)


proc loadVK_EXT_line_rasterization*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdSetLineStippleEXTCage << "vkCmdSetLineStippleEXT"