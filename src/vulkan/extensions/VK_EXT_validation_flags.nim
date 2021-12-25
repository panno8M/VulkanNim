# Generated at 2021-12-25T07:50:19Z
# VK_EXT_validation_flags

import ../platform
import ../features/vk10

prepareVulkanLibDef()

const
  ExtValidationFlagsSpecVersion* = 2
  ExtValidationFlagsExtensionName* = "VK_EXT_validation_flags"

type
  ValidationFlagsEXT* = object
    sType* {.constant: (StructureType.validationFlagsExt).}: StructureType
    pNext* {.optional.}: pointer
    disabledValidationCheckCount*: uint32
    pDisabledValidationChecks* {.length: disabledValidationCheckCount.}: arrPtr[ValidationCheckEXT]



