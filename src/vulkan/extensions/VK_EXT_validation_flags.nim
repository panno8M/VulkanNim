
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
    AllExt = 0
    ShadersExt = 1


