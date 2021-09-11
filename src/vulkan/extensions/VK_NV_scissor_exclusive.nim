# Generated at 2021-09-10T05:27:58Z
# VK_NV_scissor_exclusive


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  NvScissorExclusiveSpecVersion* = 1
  NvScissorExclusiveExtensionName* = "VK_NV_scissor_exclusive"

type
  PipelineViewportExclusiveScissorStateCreateInfoNV* = object
    sType* {.constant: (StructureType.pipelineViewportExclusiveScissorStateCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    exclusiveScissorCount* {.optional.}: uint32
    pExclusiveScissors*: ptr Rect2D
  PhysicalDeviceExclusiveScissorFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceExclusiveScissorFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    exclusiveScissor*: Bool32

proc cmdSetExclusiveScissorNV*(
      commandBuffer: CommandBuffer;
      firstExclusiveScissor: uint32;
      exclusiveScissorCount: uint32;
      pExclusiveScissors: ptr Rect2D;
    ): void {.cdecl, lazyload("vkCmdSetExclusiveScissorNV", DeviceLevel).}

proc loadAllVK_NV_scissor_exclusive*(instance: Instance) =
  cmdSetExclusiveScissorNV.smartLoad(instance)

proc loadVK_NV_scissor_exclusive*(device: Device) =
  cmdSetExclusiveScissorNV.smartLoad(device)

