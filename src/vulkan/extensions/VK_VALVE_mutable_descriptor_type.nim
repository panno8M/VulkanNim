# Generated at 2021-12-26T16:57:01Z
# VK_VALVE_mutable_descriptor_type

import ../platform

import ../features/vk10
import ./VK_KHR_maintenance3
export VK_KHR_maintenance3
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



