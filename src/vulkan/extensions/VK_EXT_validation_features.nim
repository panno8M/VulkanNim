
import ../platform
import ../features/vk10


type
  ValidationFeatureDisableEXT* {.size: sizeof(int32), pure.} = enum
    All = 0
    Shaders = 1
    ThreadSafety = 2
    ApiParameters = 3
    ObjectLifetimes = 4
    CoreChecks = 5
    UniqueHandles = 6
  ValidationFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    enabledValidationFeatureCount*: uint32
    pEnabledValidationFeatures*: ptr ValidationFeatureEnableEXT
    disabledValidationFeatureCount*: uint32
    pDisabledValidationFeatures*: ptr ValidationFeatureDisableEXT
  ValidationFeatureEnableEXT* {.size: sizeof(int32), pure.} = enum
    GpuAssisted = 0
    GpuAssistedReserveBindingSlot = 1
    BestPractices = 2
    DebugPrintf = 3
    SynchronizationValidation = 4

const ExtValidationFeaturesSpecVersion* = 4
const ExtValidationFeaturesExtensionName* = "VK_EXT_validation_features"

