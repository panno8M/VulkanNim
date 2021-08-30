# Generated at 2021-08-30T14:31:10Z
# VK_EXT_validation_flags


import ../platform
import ../features/vk10

const
  ExtValidationFlagsSpecVersion* = 2
  ExtValidationFlagsExtensionName* = "VK_EXT_validation_flags"

type
  ValidationFlagsEXT* = object
    sType*: StructureType
    pNext*: pointer
    disabledValidationCheckCount*: uint32
    pDisabledValidationChecks*: ptr ValidationCheckEXT
  ValidationCheckEXT* {.size: sizeof(int32), pure.} = enum
    allExt = 0
    shadersExt = 1


