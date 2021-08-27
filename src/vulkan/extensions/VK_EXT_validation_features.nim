# Generated at 2021-08-27T06:01:03Z
# VK_EXT_validation_features
# =================================

import ../platform
import ../features/vk10


const
  ExtValidationFeaturesSpecVersion* = 4
  ExtValidationFeaturesExtensionName* = "VK_EXT_validation_features"

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


