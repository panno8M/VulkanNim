
import ../platform
import ../features/vk10


type
  CommandBufferInheritanceConditionalRenderingInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    conditionalRenderingEnable*: Bool32
  ConditionalRenderingBeginInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    buffer*: Buffer
    offset*: DeviceSize
    flags*: ConditionalRenderingFlagsEXT
  PhysicalDeviceConditionalRenderingFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    conditionalRendering*: Bool32
    inheritedConditionalRendering*: Bool32
  ConditionalRenderingFlagsEXT* = Flags
  ConditionalRenderingFlagBitsEXT* {.size: sizeof(int32), pure.} = enum
    Inverted = 0x00000001

const ExtConditionalRenderingSpecVersion* = 2
const ExtConditionalRenderingExtensionName* = "VK_EXT_conditional_rendering"
var # commands
  cmdBeginConditionalRenderingEXTCage: proc(commandBuffer: CommandBuffer; pConditionalRenderingBegin: ptr ConditionalRenderingBeginInfoEXT;): void {.cdecl.}
  cmdEndConditionalRenderingEXTCage: proc(commandBuffer: CommandBuffer;): void {.cdecl.}

proc cmdBeginConditionalRenderingEXT*(
      commandBuffer: CommandBuffer;
      pConditionalRenderingBegin: ptr ConditionalRenderingBeginInfoEXT;
    ): void {.cdecl.} =
  cmdBeginConditionalRenderingEXTCage(commandBuffer,pConditionalRenderingBegin)

proc cmdEndConditionalRenderingEXT*(
      commandBuffer: CommandBuffer;
    ): void {.cdecl.} =
  cmdEndConditionalRenderingEXTCage(commandBuffer)


proc loadVK_EXT_conditional_rendering*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdBeginConditionalRenderingEXTCage << "vkCmdBeginConditionalRenderingEXT"
  cmdEndConditionalRenderingEXTCage << "vkCmdEndConditionalRenderingEXT"