# Generated at 2021-10-24T02:03:03Z
# VK_EXT_validation_flags

import ../platform
import ../features/vk10

prepareVulkanLibDef()

const
  ExtValidationFlagsSpecVersion* = 2
  ExtValidationFlagsExtensionName* = "VK_EXT_validation_flags"

type # enums and bitmasks
  ValidationCheckEXT* {.size: sizeof(int32), pure.} = enum
    allExt = 0
    shadersExt = 1

type
  ValidationFlagsEXT* = object
    sType* {.constant: (StructureType.validationFlagsExt).}: StructureType
    pNext* {.optional.}: pointer
    disabledValidationCheckCount*: uint32
    pDisabledValidationChecks* {.length: disabledValidationCheckCount.}: arrPtr[ValidationCheckEXT]



