
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  PhysicalDeviceExclusiveScissorFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    exclusiveScissor*: Bool32
  PipelineViewportExclusiveScissorStateCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    exclusiveScissorCount*: uint32
    pExclusiveScissors*: ptr Rect2D

const NvScissorExclusiveSpecVersion* = 1
const NvScissorExclusiveExtensionName* = "VK_NV_scissor_exclusive"
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