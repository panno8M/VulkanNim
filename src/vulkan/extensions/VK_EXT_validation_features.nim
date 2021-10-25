# Generated at 2021-10-24T02:03:03Z
# VK_EXT_validation_features

import ../platform
import ../features/vk10

prepareVulkanLibDef()

const
  ExtValidationFeaturesSpecVersion* = 4
  ExtValidationFeaturesExtensionName* = "VK_EXT_validation_features"

type # enums and bitmasks
  ValidationFeatureEnableEXT* {.size: sizeof(int32), pure.} = enum
    gpuAssistedExt = 0
    gpuAssistedReserveBindingSlotExt = 1
    bestPracticesExt = 2
    debugPrintfExt = 3
    synchronizationValidationExt = 4
  ValidationFeatureDisableEXT* {.size: sizeof(int32), pure.} = enum
    allExt = 0
    shadersExt = 1
    threadSafetyExt = 2
    apiParametersExt = 3
    objectLifetimesExt = 4
    coreChecksExt = 5
    uniqueHandlesExt = 6

type
  ValidationFeaturesEXT* = object
    sType* {.constant: (StructureType.validationFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    enabledValidationFeatureCount* {.optional.}: uint32
    pEnabledValidationFeatures* {.length: enabledValidationFeatureCount.}: arrPtr[ValidationFeatureEnableEXT]
    disabledValidationFeatureCount* {.optional.}: uint32
    pDisabledValidationFeatures* {.length: disabledValidationFeatureCount.}: arrPtr[ValidationFeatureDisableEXT]



