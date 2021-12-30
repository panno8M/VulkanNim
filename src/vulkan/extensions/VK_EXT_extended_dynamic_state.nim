# Generated at 2021-12-30T17:13:13Z
# VK_EXT_extended_dynamic_state

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2
prepareVulkanLibDef()

const
  ExtExtendedDynamicStateSpecVersion* = 1
  ExtExtendedDynamicStateExtensionName* = "VK_EXT_extended_dynamic_state"

type
  PhysicalDeviceExtendedDynamicStateFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceExtendedDynamicStateFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    extendedDynamicState*: Bool32

proc cmdSetCullModeEXT*(
      commandBuffer: CommandBuffer;
      cullMode = default(CullModeFlags);
    ): void {.cdecl, lazyload("vkCmdSetCullModeEXT", DeviceLevel).}
proc cmdSetFrontFaceEXT*(
      commandBuffer: CommandBuffer;
      frontFace: FrontFace;
    ): void {.cdecl, lazyload("vkCmdSetFrontFaceEXT", DeviceLevel).}
proc cmdSetPrimitiveTopologyEXT*(
      commandBuffer: CommandBuffer;
      primitiveTopology: PrimitiveTopology;
    ): void {.cdecl, lazyload("vkCmdSetPrimitiveTopologyEXT", DeviceLevel).}
proc cmdSetViewportWithCountEXT*(
      commandBuffer: CommandBuffer;
      viewportCount: uint32;
      pViewports {.length: viewportCount.}: arrPtr[Viewport];
    ): void {.cdecl, lazyload("vkCmdSetViewportWithCountEXT", DeviceLevel).}
proc cmdSetScissorWithCountEXT*(
      commandBuffer: CommandBuffer;
      scissorCount: uint32;
      pScissors {.length: scissorCount.}: arrPtr[Rect2D];
    ): void {.cdecl, lazyload("vkCmdSetScissorWithCountEXT", DeviceLevel).}
proc cmdBindVertexBuffers2EXT*(
      commandBuffer: CommandBuffer;
      firstBinding: uint32;
      bindingCount: uint32;
      pBuffers {.length: bindingCount.}: arrPtr[Buffer];
      pOffsets {.length: bindingCount.}: arrPtr[DeviceSize];
      pSizes {.length: bindingCount.} = default(arrPtr[DeviceSize]);
      pStrides {.length: bindingCount.} = default(arrPtr[DeviceSize]);
    ): void {.cdecl, lazyload("vkCmdBindVertexBuffers2EXT", DeviceLevel).}
proc cmdSetDepthTestEnableEXT*(
      commandBuffer: CommandBuffer;
      depthTestEnable: Bool32;
    ): void {.cdecl, lazyload("vkCmdSetDepthTestEnableEXT", DeviceLevel).}
proc cmdSetDepthWriteEnableEXT*(
      commandBuffer: CommandBuffer;
      depthWriteEnable: Bool32;
    ): void {.cdecl, lazyload("vkCmdSetDepthWriteEnableEXT", DeviceLevel).}
proc cmdSetDepthCompareOpEXT*(
      commandBuffer: CommandBuffer;
      depthCompareOp: CompareOp;
    ): void {.cdecl, lazyload("vkCmdSetDepthCompareOpEXT", DeviceLevel).}
proc cmdSetDepthBoundsTestEnableEXT*(
      commandBuffer: CommandBuffer;
      depthBoundsTestEnable: Bool32;
    ): void {.cdecl, lazyload("vkCmdSetDepthBoundsTestEnableEXT", DeviceLevel).}
proc cmdSetStencilTestEnableEXT*(
      commandBuffer: CommandBuffer;
      stencilTestEnable: Bool32;
    ): void {.cdecl, lazyload("vkCmdSetStencilTestEnableEXT", DeviceLevel).}
proc cmdSetStencilOpEXT*(
      commandBuffer: CommandBuffer;
      faceMask: StencilFaceFlags;
      failOp: StencilOp;
      passOp: StencilOp;
      depthFailOp: StencilOp;
      compareOp: CompareOp;
    ): void {.cdecl, lazyload("vkCmdSetStencilOpEXT", DeviceLevel).}

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
