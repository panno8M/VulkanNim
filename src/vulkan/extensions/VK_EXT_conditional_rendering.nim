# Generated at 2021-12-30T17:13:13Z
# VK_EXT_conditional_rendering

import ../platform

import ../features/vk10

prepareVulkanLibDef()

const
  ExtConditionalRenderingSpecVersion* = 2
  ExtConditionalRenderingExtensionName* = "VK_EXT_conditional_rendering"

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

proc loadAllVK_EXT_conditional_rendering*(instance: Instance) = instance.loadCommands:
  cmdBeginConditionalRenderingEXT
  cmdEndConditionalRenderingEXT
proc loadVK_EXT_conditional_rendering*(device: Device) = device.loadCommands:
  cmdBeginConditionalRenderingEXT
  cmdEndConditionalRenderingEXT
