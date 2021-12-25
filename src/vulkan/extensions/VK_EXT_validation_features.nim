# Generated at 2021-12-25T07:50:19Z
# VK_EXT_validation_features

import ../platform
import ../features/vk10

prepareVulkanLibDef()

const
  ExtValidationFeaturesSpecVersion* = 4
  ExtValidationFeaturesExtensionName* = "VK_EXT_validation_features"

type
  ValidationFeaturesEXT* = object
    sType* {.constant: (StructureType.validationFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    enabledValidationFeatureCount* {.optional.}: uint32
    pEnabledValidationFeatures* {.length: enabledValidationFeatureCount.}: arrPtr[ValidationFeatureEnableEXT]
    disabledValidationFeatureCount* {.optional.}: uint32
    pDisabledValidationFeatures* {.length: disabledValidationFeatureCount.}: arrPtr[ValidationFeatureDisableEXT]



