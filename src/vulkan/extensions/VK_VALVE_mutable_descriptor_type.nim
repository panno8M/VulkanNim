# VK_VALVE_mutable_descriptor_type

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ValveMutableDescriptorTypeSpecVersion* = 1
  ValveMutableDescriptorTypeExtensionName* = "VK_VALVE_mutable_descriptor_type"

type
  PhysicalDeviceMutableDescriptorTypeFeaturesVALVE* = object
    sType* {.constant: (StructureType.physicalDeviceMutableDescriptorTypeFeaturesValve).}: StructureType
    pNext* {.optional.}: pointer
    mutableDescriptorType*: Bool32
  MutableDescriptorTypeListVALVE* = object
    descriptorTypeCount* {.optional.}: uint32
    pDescriptorTypes* {.length: descriptorTypeCount.}: arrPtr[DescriptorType]
  MutableDescriptorTypeCreateInfoVALVE* = object
    sType* {.constant: (StructureType.mutableDescriptorTypeCreateInfoValve).}: StructureType
    pNext* {.optional.}: pointer
    mutableDescriptorTypeListCount* {.optional.}: uint32
    pMutableDescriptorTypeLists* {.length: mutableDescriptorTypeListCount.}: arrPtr[MutableDescriptorTypeListVALVE]



