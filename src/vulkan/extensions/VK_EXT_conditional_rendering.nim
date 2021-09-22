# Generated at 2021-09-22T15:02:54Z
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
    sType* {.constant: (StructureType.conditionalRenderingBeginInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    buffer*: Buffer
    offset*: DeviceSize
    flags* {.optional.}: ConditionalRenderingFlagsEXT
  PhysicalDeviceConditionalRenderingFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceConditionalRenderingFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    conditionalRendering*: Bool32
    inheritedConditionalRendering*: Bool32
  CommandBufferInheritanceConditionalRenderingInfoEXT* = object
    sType* {.constant: (StructureType.commandBufferInheritanceConditionalRenderingInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    conditionalRenderingEnable*: Bool32

proc cmdBeginConditionalRenderingEXT*(
      commandBuffer: CommandBuffer;
      pConditionalRenderingBegin: ptr ConditionalRenderingBeginInfoEXT;
    ): void {.cdecl, lazyload("vkCmdBeginConditionalRenderingEXT", DeviceLevel).}
proc cmdEndConditionalRenderingEXT*(
      commandBuffer: CommandBuffer;
    ): void {.cdecl, lazyload("vkCmdEndConditionalRenderingEXT", DeviceLevel).}

proc loadAllVK_EXT_conditional_rendering*(instance: Instance) =
  cmdBeginConditionalRenderingEXT.load(instance)
  cmdEndConditionalRenderingEXT.load(instance)

proc loadVK_EXT_conditional_rendering*(device: Device) =
  cmdBeginConditionalRenderingEXT.load(device)
  cmdEndConditionalRenderingEXT.load(device)

