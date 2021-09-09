# Generated at 2021-09-09T01:49:36Z
# VK_EXT_conditional_rendering


import ../platform
import ../features/vk10

const
  ExtConditionalRenderingSpecVersion* = 2
  ExtConditionalRenderingExtensionName* = "VK_EXT_conditional_rendering"

type # enums and bitmasks
  ConditionalRenderingFlagsEXT* = Flags[ConditionalRenderingFlagBitsEXT]
  ConditionalRenderingFlagBitsEXT* {.size: sizeof(int32), pure.} = enum
    invertedExt = 0x00000001

type
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
  CommandBufferInheritanceConditionalRenderingInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    conditionalRenderingEnable*: Bool32

proc cmdBeginConditionalRenderingEXT*(
      commandBuffer: CommandBuffer;
      pConditionalRenderingBegin: ptr ConditionalRenderingBeginInfoEXT;
    ): void {.cdecl, lazyload("vkCmdBeginConditionalRenderingEXT", DeviceLevel).}
proc cmdEndConditionalRenderingEXT*(
      commandBuffer: CommandBuffer;
    ): void {.cdecl, lazyload("vkCmdEndConditionalRenderingEXT", DeviceLevel).}

proc loadAllVK_EXT_conditional_rendering*(instance: Instance) =
  cmdBeginConditionalRenderingEXT.smartLoad(instance)
  cmdEndConditionalRenderingEXT.smartLoad(instance)

proc loadVK_EXT_conditional_rendering*(device: Device) =
  cmdBeginConditionalRenderingEXT.smartLoad(device)
  cmdEndConditionalRenderingEXT.smartLoad(device)

