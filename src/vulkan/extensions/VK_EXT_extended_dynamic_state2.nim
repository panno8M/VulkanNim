# VK_EXT_extended_dynamic_state2

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtExtendedDynamicState2SpecVersion* = 1
  ExtExtendedDynamicState2ExtensionName* = "VK_EXT_extended_dynamic_state2"

type
  PhysicalDeviceExtendedDynamicState2FeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceExtendedDynamicState2FeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    extendedDynamicState2*: Bool32
    extendedDynamicState2LogicOp*: Bool32
    extendedDynamicState2PatchControlPoints*: Bool32

proc cmdSetPatchControlPointsEXT*(
      commandBuffer: CommandBuffer;
      patchControlPoints: uint32;
    ): void {.cdecl, lazyload("vkCmdSetPatchControlPointsEXT", DeviceLevel).}
proc cmdSetRasterizerDiscardEnableEXT*(
      commandBuffer: CommandBuffer;
      rasterizerDiscardEnable: Bool32;
    ): void {.cdecl, lazyload("vkCmdSetRasterizerDiscardEnableEXT", DeviceLevel).}
proc cmdSetDepthBiasEnableEXT*(
      commandBuffer: CommandBuffer;
      depthBiasEnable: Bool32;
    ): void {.cdecl, lazyload("vkCmdSetDepthBiasEnableEXT", DeviceLevel).}
proc cmdSetLogicOpEXT*(
      commandBuffer: CommandBuffer;
      logicOp: LogicOp;
    ): void {.cdecl, lazyload("vkCmdSetLogicOpEXT", DeviceLevel).}
proc cmdSetPrimitiveRestartEnableEXT*(
      commandBuffer: CommandBuffer;
      primitiveRestartEnable: Bool32;
    ): void {.cdecl, lazyload("vkCmdSetPrimitiveRestartEnableEXT", DeviceLevel).}

proc loadAllVK_EXT_extended_dynamic_state2*(instance: Instance) = instance.loadCommands:
  cmdSetPatchControlPointsEXT
  cmdSetRasterizerDiscardEnableEXT
  cmdSetDepthBiasEnableEXT
  cmdSetLogicOpEXT
  cmdSetPrimitiveRestartEnableEXT
proc loadVK_EXT_extended_dynamic_state2*(device: Device) = device.loadCommands:
  cmdSetPatchControlPointsEXT
  cmdSetRasterizerDiscardEnableEXT
  cmdSetDepthBiasEnableEXT
  cmdSetLogicOpEXT
  cmdSetPrimitiveRestartEnableEXT
