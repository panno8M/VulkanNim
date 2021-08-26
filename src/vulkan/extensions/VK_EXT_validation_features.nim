
import ../platform
import ../features/vk10




type
  ValidationFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    enabledValidationFeatureCount*: uint32
    pEnabledValidationFeatures*: ptr ValidationFeatureEnableEXT
    disabledValidationFeatureCount*: uint32
    pDisabledValidationFeatures*: ptr ValidationFeatureDisableEXT
  ValidationFeatureEnableEXT* {.size: sizeof(int32), pure.} = enum
    GpuAssistedExt = 0
    GpuAssistedReserveBindingSlotExt = 1
    BestPracticesExt = 2
    DebugPrintfExt = 3
    SynchronizationValidationExt = 4
  ValidationFeatureDisableEXT* {.size: sizeof(int32), pure.} = enum
    AllExt = 0
    ShadersExt = 1
    ThreadSafetyExt = 2
    ApiParametersExt = 3
    ObjectLifetimesExt = 4
    CoreChecksExt = 5
    UniqueHandlesExt = 6


