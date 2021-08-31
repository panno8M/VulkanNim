# Generated at 2021-08-31T01:03:35Z
# VK_EXT_validation_flags


import ../platform
import ../features/vk10

const
  ExtValidationFlagsSpecVersion* = 2
  ExtValidationFlagsExtensionName* = "VK_EXT_validation_flags"

type # enums and bitmasks
  ValidationCheckEXT* {.size: sizeof(int32), pure.} = enum
    allExt = 0
    shadersExt = 1

type
  ValidationFlagsEXT* = object
    sType*: StructureType
    pNext*: pointer
    disabledValidationCheckCount*: uint32
    pDisabledValidationChecks*: ptr ValidationCheckEXT


