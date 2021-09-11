# Generated at 2021-09-10T05:27:58Z
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
  cmdSetCullModeEXT.smartLoad(instance)
  cmdSetFrontFaceEXT.smartLoad(instance)
  cmdSetPrimitiveTopologyEXT.smartLoad(instance)
  cmdSetViewportWithCountEXT.smartLoad(instance)
  cmdSetScissorWithCountEXT.smartLoad(instance)
  cmdBindVertexBuffers2EXT.smartLoad(instance)
  cmdSetDepthTestEnableEXT.smartLoad(instance)
  cmdSetDepthWriteEnableEXT.smartLoad(instance)
  cmdSetDepthCompareOpEXT.smartLoad(instance)
  cmdSetDepthBoundsTestEnableEXT.smartLoad(instance)
  cmdSetStencilTestEnableEXT.smartLoad(instance)
  cmdSetStencilOpEXT.smartLoad(instance)

proc loadVK_EXT_extended_dynamic_state*(device: Device) =
  cmdSetCullModeEXT.smartLoad(device)
  cmdSetFrontFaceEXT.smartLoad(device)
  cmdSetPrimitiveTopologyEXT.smartLoad(device)
  cmdSetViewportWithCountEXT.smartLoad(device)
  cmdSetScissorWithCountEXT.smartLoad(device)
  cmdBindVertexBuffers2EXT.smartLoad(device)
  cmdSetDepthTestEnableEXT.smartLoad(device)
  cmdSetDepthWriteEnableEXT.smartLoad(device)
  cmdSetDepthCompareOpEXT.smartLoad(device)
  cmdSetDepthBoundsTestEnableEXT.smartLoad(device)
  cmdSetStencilTestEnableEXT.smartLoad(device)
  cmdSetStencilOpEXT.smartLoad(device)

