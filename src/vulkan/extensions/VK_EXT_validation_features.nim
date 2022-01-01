# VK_EXT_validation_features

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtValidationFeaturesSpecVersion* = 5
  ExtValidationFeaturesExtensionName* = "VK_EXT_validation_features"

type
  ValidationFeaturesEXT* = object
    sType* {.constant: (StructureType.validationFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    enabledValidationFeatureCount* {.optional.}: uint32
    pEnabledValidationFeatures* {.length: enabledValidationFeatureCount.}: arrPtr[ValidationFeatureEnableEXT]
    disabledValidationFeatureCount* {.optional.}: uint32
    pDisabledValidationFeatures* {.length: disabledValidationFeatureCount.}: arrPtr[ValidationFeatureDisableEXT]



