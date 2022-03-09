# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_EXT_extended_dynamic_state

import ../tools
const
  # VK_EXT_extended_dynamic_state
  ExtExtendedDynamicStateSpecVersion* = 1
  ExtExtendedDynamicStateExtensionName* = "VK_EXT_extended_dynamic_state"


# VK_EXT_extended_dynamic_state
# =============================
proc cmdSetCullModeEXT*(
      commandBuffer: CommandBuffer;
      cullMode = default(CullModeFlags);
    ): void {.lazyload("vkCmdSetCullModeEXT", DeviceLevel), cmdchain.}
proc cmdSetFrontFaceEXT*(
      commandBuffer: CommandBuffer;
      frontFace: FrontFace;
    ): void {.lazyload("vkCmdSetFrontFaceEXT", DeviceLevel), cmdchain.}
proc cmdSetPrimitiveTopologyEXT*(
      commandBuffer: CommandBuffer;
      primitiveTopology: PrimitiveTopology;
    ): void {.lazyload("vkCmdSetPrimitiveTopologyEXT", DeviceLevel), cmdchain.}
proc cmdSetViewportWithCountEXT*(
      commandBuffer: CommandBuffer;
      viewportCount: uint32;
      pViewports {.length: viewportCount.}: arrPtr[Viewport];
    ): void {.lazyload("vkCmdSetViewportWithCountEXT", DeviceLevel), cmdchain.}
proc cmdSetScissorWithCountEXT*(
      commandBuffer: CommandBuffer;
      scissorCount: uint32;
      pScissors {.length: scissorCount.}: arrPtr[Rect2D];
    ): void {.lazyload("vkCmdSetScissorWithCountEXT", DeviceLevel), cmdchain.}
proc cmdBindVertexBuffers2EXT*(
      commandBuffer: CommandBuffer;
      firstBinding: uint32;
      bindingCount: uint32;
      pBuffers {.length: bindingCount.}: arrPtr[Buffer];
      pOffsets {.length: bindingCount.}: arrPtr[DeviceSize];
      pSizes {.length: bindingCount.} = default(arrPtr[DeviceSize]);
      pStrides {.length: bindingCount.} = default(arrPtr[DeviceSize]);
    ): void {.lazyload("vkCmdBindVertexBuffers2EXT", DeviceLevel), cmdchain.}
proc cmdSetDepthTestEnableEXT*(
      commandBuffer: CommandBuffer;
      depthTestEnable: Bool32;
    ): void {.lazyload("vkCmdSetDepthTestEnableEXT", DeviceLevel), cmdchain.}
proc cmdSetDepthWriteEnableEXT*(
      commandBuffer: CommandBuffer;
      depthWriteEnable: Bool32;
    ): void {.lazyload("vkCmdSetDepthWriteEnableEXT", DeviceLevel), cmdchain.}
proc cmdSetDepthCompareOpEXT*(
      commandBuffer: CommandBuffer;
      depthCompareOp: CompareOp;
    ): void {.lazyload("vkCmdSetDepthCompareOpEXT", DeviceLevel), cmdchain.}
proc cmdSetDepthBoundsTestEnableEXT*(
      commandBuffer: CommandBuffer;
      depthBoundsTestEnable: Bool32;
    ): void {.lazyload("vkCmdSetDepthBoundsTestEnableEXT", DeviceLevel), cmdchain.}
proc cmdSetStencilTestEnableEXT*(
      commandBuffer: CommandBuffer;
      stencilTestEnable: Bool32;
    ): void {.lazyload("vkCmdSetStencilTestEnableEXT", DeviceLevel), cmdchain.}
proc cmdSetStencilOpEXT*(
      commandBuffer: CommandBuffer;
      faceMask: StencilFaceFlags;
      failOp: StencilOp;
      passOp: StencilOp;
      depthFailOp: StencilOp;
      compareOp: CompareOp;
    ): void {.lazyload("vkCmdSetStencilOpEXT", DeviceLevel), cmdchain.}


proc loadAllVK_EXT_extended_dynamic_state*(instance: Instance) = instance.loadCommands:
  cmdSetCullModeEXT
  cmdSetFrontFaceEXT
  cmdSetPrimitiveTopologyEXT
  cmdSetViewportWithCountEXT
  cmdSetScissorWithCountEXT
  cmdBindVertexBuffers2EXT
  cmdSetDepthTestEnableEXT
  cmdSetDepthWriteEnableEXT
  cmdSetDepthCompareOpEXT
  cmdSetDepthBoundsTestEnableEXT
  cmdSetStencilTestEnableEXT
  cmdSetStencilOpEXT
proc loadVK_EXT_extended_dynamic_state*(device: Device) = device.loadCommands:
  cmdSetCullModeEXT
  cmdSetFrontFaceEXT
  cmdSetPrimitiveTopologyEXT
  cmdSetViewportWithCountEXT
  cmdSetScissorWithCountEXT
  cmdBindVertexBuffers2EXT
  cmdSetDepthTestEnableEXT
  cmdSetDepthWriteEnableEXT
  cmdSetDepthCompareOpEXT
  cmdSetDepthBoundsTestEnableEXT
  cmdSetStencilTestEnableEXT
  cmdSetStencilOpEXT