
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2




type
  PipelineViewportExclusiveScissorStateCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    exclusiveScissorCount*: uint32
    pExclusiveScissors*: ptr Rect2D
  PhysicalDeviceExclusiveScissorFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    exclusiveScissor*: Bool32

var # commands
  cmdSetExclusiveScissorNVCage: proc(commandBuffer: CommandBuffer; firstExclusiveScissor: uint32; exclusiveScissorCount: uint32; pExclusiveScissors: ptr Rect2D;): void {.cdecl.}
proc cmdSetExclusiveScissorNV*(
      commandBuffer: CommandBuffer;
      firstExclusiveScissor: uint32;
      exclusiveScissorCount: uint32;
      pExclusiveScissors: ptr Rect2D;
    ): void {.cdecl.} =
  cmdSetExclusiveScissorNVCage(commandBuffer,firstExclusiveScissor,exclusiveScissorCount,pExclusiveScissors)
proc loadVK_NV_scissor_exclusive*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdSetExclusiveScissorNVCage << "vkCmdSetExclusiveScissorNV"