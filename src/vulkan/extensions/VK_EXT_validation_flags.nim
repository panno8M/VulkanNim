
import ../platform
import ../features/vk10


type
  ValidationFlagsEXT* = object
    sType*: StructureType
    pNext*: pointer
    disabledValidationCheckCount*: uint32
    pDisabledValidationChecks*: ptr ValidationCheckEXT
  ValidationCheckEXT* {.size: sizeof(int32), pure.} = enum
    All = 0
    Shaders = 1

const ExtValidationFlagsExtensionName* = "VK_EXT_validation_flags"
const ExtValidationFlagsSpecVersion* = 2

