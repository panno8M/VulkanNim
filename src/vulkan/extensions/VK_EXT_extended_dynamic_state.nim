# Generated at 2021-09-12T04:58:24Z
# VK_EXT_extended_dynamic_state


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

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
      cullMode: CullModeFlags;
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
      pViewports: ptr Viewport;
    ): void {.cdecl, lazyload("vkCmdSetViewportWithCountEXT", DeviceLevel).}
proc cmdSetScissorWithCountEXT*(
      commandBuffer: CommandBuffer;
      scissorCount: uint32;
      pScissors: ptr Rect2D;
    ): void {.cdecl, lazyload("vkCmdSetScissorWithCountEXT", DeviceLevel).}
proc cmdBindVertexBuffers2EXT*(
      commandBuffer: CommandBuffer;
      firstBinding: uint32;
      bindingCount: uint32;
      pBuffers: ptr Buffer;
      pOffsets: ptr DeviceSize;
      pSizes: ptr DeviceSize;
      pStrides: ptr DeviceSize;
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

proc loadAllVK_EXT_extended_dynamic_state*(instance: Instance) =
  cmdSetCullModeEXT.load(instance)
  cmdSetFrontFaceEXT.load(instance)
  cmdSetPrimitiveTopologyEXT.load(instance)
  cmdSetViewportWithCountEXT.load(instance)
  cmdSetScissorWithCountEXT.load(instance)
  cmdBindVertexBuffers2EXT.load(instance)
  cmdSetDepthTestEnableEXT.load(instance)
  cmdSetDepthWriteEnableEXT.load(instance)
  cmdSetDepthCompareOpEXT.load(instance)
  cmdSetDepthBoundsTestEnableEXT.load(instance)
  cmdSetStencilTestEnableEXT.load(instance)
  cmdSetStencilOpEXT.load(instance)

proc loadVK_EXT_extended_dynamic_state*(device: Device) =
  cmdSetCullModeEXT.load(device)
  cmdSetFrontFaceEXT.load(device)
  cmdSetPrimitiveTopologyEXT.load(device)
  cmdSetViewportWithCountEXT.load(device)
  cmdSetScissorWithCountEXT.load(device)
  cmdBindVertexBuffers2EXT.load(device)
  cmdSetDepthTestEnableEXT.load(device)
  cmdSetDepthWriteEnableEXT.load(device)
  cmdSetDepthCompareOpEXT.load(device)
  cmdSetDepthBoundsTestEnableEXT.load(device)
  cmdSetStencilTestEnableEXT.load(device)
  cmdSetStencilOpEXT.load(device)

