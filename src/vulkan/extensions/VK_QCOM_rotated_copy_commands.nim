# VK_QCOM_rotated_copy_commands

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  QcomRotatedCopyCommandsSpecVersion* = 1
  QcomRotatedCopyCommandsExtensionName* = "VK_QCOM_rotated_copy_commands"

type
  CopyCommandTransformInfoQCOM* = object
    sType* {.constant: (StructureType.copyCommandTransformInfoQcom).}: StructureType
    pNext* {.optional.}: pointer
    transform*: SurfaceTransformFlagBitsKHR



