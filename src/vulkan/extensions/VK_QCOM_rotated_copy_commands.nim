# Generated at 2021-12-26T16:57:01Z
# VK_QCOM_rotated_copy_commands

import ../platform

import ../features/vk10
import ./VK_KHR_swapchain
import ./VK_KHR_copy_commands2
export VK_KHR_swapchain
export VK_KHR_copy_commands2
prepareVulkanLibDef()

const
  QcomRotatedCopyCommandsSpecVersion* = 1
  QcomRotatedCopyCommandsExtensionName* = "VK_QCOM_rotated_copy_commands"

type
  CopyCommandTransformInfoQCOM* = object
    sType* {.constant: (StructureType.copyCommandTransformInfoQcom).}: StructureType
    pNext* {.optional.}: pointer
    transform*: SurfaceTransformFlagBitsKHR



