
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2




type
  PhysicalDeviceExtendedDynamicStateFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    extendedDynamicState*: Bool32

var # commands
  cmdSetCullModeEXTCage: proc(commandBuffer: CommandBuffer; cullMode: CullModeFlags;): void {.cdecl.}
  cmdSetFrontFaceEXTCage: proc(commandBuffer: CommandBuffer; frontFace: FrontFace;): void {.cdecl.}
  cmdSetPrimitiveTopologyEXTCage: proc(commandBuffer: CommandBuffer; primitiveTopology: PrimitiveTopology;): void {.cdecl.}
  cmdSetViewportWithCountEXTCage: proc(commandBuffer: CommandBuffer; viewportCount: uint32; pViewports: ptr Viewport;): void {.cdecl.}
  cmdSetScissorWithCountEXTCage: proc(commandBuffer: CommandBuffer; scissorCount: uint32; pScissors: ptr Rect2D;): void {.cdecl.}
  cmdBindVertexBuffers2EXTCage: proc(commandBuffer: CommandBuffer; firstBinding: uint32; bindingCount: uint32; pBuffers: ptr Buffer; pOffsets: ptr DeviceSize; pSizes: ptr DeviceSize; pStrides: ptr DeviceSize;): void {.cdecl.}
  cmdSetDepthTestEnableEXTCage: proc(commandBuffer: CommandBuffer; depthTestEnable: Bool32;): void {.cdecl.}
  cmdSetDepthWriteEnableEXTCage: proc(commandBuffer: CommandBuffer; depthWriteEnable: Bool32;): void {.cdecl.}
  cmdSetDepthCompareOpEXTCage: proc(commandBuffer: CommandBuffer; depthCompareOp: CompareOp;): void {.cdecl.}
  cmdSetDepthBoundsTestEnableEXTCage: proc(commandBuffer: CommandBuffer; depthBoundsTestEnable: Bool32;): void {.cdecl.}
  cmdSetStencilTestEnableEXTCage: proc(commandBuffer: CommandBuffer; stencilTestEnable: Bool32;): void {.cdecl.}
  cmdSetStencilOpEXTCage: proc(commandBuffer: CommandBuffer; faceMask: StencilFaceFlags; failOp: StencilOp; passOp: StencilOp; depthFailOp: StencilOp; compareOp: CompareOp;): void {.cdecl.}
proc cmdSetCullModeEXT*(
      commandBuffer: CommandBuffer;
      cullMode: CullModeFlags;
    ): void {.cdecl.} =
  cmdSetCullModeEXTCage(commandBuffer,cullMode)
proc cmdSetFrontFaceEXT*(
      commandBuffer: CommandBuffer;
      frontFace: FrontFace;
    ): void {.cdecl.} =
  cmdSetFrontFaceEXTCage(commandBuffer,frontFace)
proc cmdSetPrimitiveTopologyEXT*(
      commandBuffer: CommandBuffer;
      primitiveTopology: PrimitiveTopology;
    ): void {.cdecl.} =
  cmdSetPrimitiveTopologyEXTCage(commandBuffer,primitiveTopology)
proc cmdSetViewportWithCountEXT*(
      commandBuffer: CommandBuffer;
      viewportCount: uint32;
      pViewports: ptr Viewport;
    ): void {.cdecl.} =
  cmdSetViewportWithCountEXTCage(commandBuffer,viewportCount,pViewports)
proc cmdSetScissorWithCountEXT*(
      commandBuffer: CommandBuffer;
      scissorCount: uint32;
      pScissors: ptr Rect2D;
    ): void {.cdecl.} =
  cmdSetScissorWithCountEXTCage(commandBuffer,scissorCount,pScissors)
proc cmdBindVertexBuffers2EXT*(
      commandBuffer: CommandBuffer;
      firstBinding: uint32;
      bindingCount: uint32;
      pBuffers: ptr Buffer;
      pOffsets: ptr DeviceSize;
      pSizes: ptr DeviceSize;
      pStrides: ptr DeviceSize;
    ): void {.cdecl.} =
  cmdBindVertexBuffers2EXTCage(commandBuffer,firstBinding,bindingCount,pBuffers,pOffsets,pSizes,pStrides)
proc cmdSetDepthTestEnableEXT*(
      commandBuffer: CommandBuffer;
      depthTestEnable: Bool32;
    ): void {.cdecl.} =
  cmdSetDepthTestEnableEXTCage(commandBuffer,depthTestEnable)
proc cmdSetDepthWriteEnableEXT*(
      commandBuffer: CommandBuffer;
      depthWriteEnable: Bool32;
    ): void {.cdecl.} =
  cmdSetDepthWriteEnableEXTCage(commandBuffer,depthWriteEnable)
proc cmdSetDepthCompareOpEXT*(
      commandBuffer: CommandBuffer;
      depthCompareOp: CompareOp;
    ): void {.cdecl.} =
  cmdSetDepthCompareOpEXTCage(commandBuffer,depthCompareOp)
proc cmdSetDepthBoundsTestEnableEXT*(
      commandBuffer: CommandBuffer;
      depthBoundsTestEnable: Bool32;
    ): void {.cdecl.} =
  cmdSetDepthBoundsTestEnableEXTCage(commandBuffer,depthBoundsTestEnable)
proc cmdSetStencilTestEnableEXT*(
      commandBuffer: CommandBuffer;
      stencilTestEnable: Bool32;
    ): void {.cdecl.} =
  cmdSetStencilTestEnableEXTCage(commandBuffer,stencilTestEnable)
proc cmdSetStencilOpEXT*(
      commandBuffer: CommandBuffer;
      faceMask: StencilFaceFlags;
      failOp: StencilOp;
      passOp: StencilOp;
      depthFailOp: StencilOp;
      compareOp: CompareOp;
    ): void {.cdecl.} =
  cmdSetStencilOpEXTCage(commandBuffer,faceMask,failOp,passOp,depthFailOp,compareOp)
proc loadVK_EXT_extended_dynamic_state*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdSetCullModeEXTCage << "vkCmdSetCullModeEXT"
  cmdSetFrontFaceEXTCage << "vkCmdSetFrontFaceEXT"
  cmdSetPrimitiveTopologyEXTCage << "vkCmdSetPrimitiveTopologyEXT"
  cmdSetViewportWithCountEXTCage << "vkCmdSetViewportWithCountEXT"
  cmdSetScissorWithCountEXTCage << "vkCmdSetScissorWithCountEXT"
  cmdBindVertexBuffers2EXTCage << "vkCmdBindVertexBuffers2EXT"
  cmdSetDepthTestEnableEXTCage << "vkCmdSetDepthTestEnableEXT"
  cmdSetDepthWriteEnableEXTCage << "vkCmdSetDepthWriteEnableEXT"
  cmdSetDepthCompareOpEXTCage << "vkCmdSetDepthCompareOpEXT"
  cmdSetDepthBoundsTestEnableEXTCage << "vkCmdSetDepthBoundsTestEnableEXT"
  cmdSetStencilTestEnableEXTCage << "vkCmdSetStencilTestEnableEXT"
  cmdSetStencilOpEXTCage << "vkCmdSetStencilOpEXT"