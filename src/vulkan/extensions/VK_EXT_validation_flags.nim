# VK_EXT_validation_flags

import ../features/vk10
import ../platform
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



