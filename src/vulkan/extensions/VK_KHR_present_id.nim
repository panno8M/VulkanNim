# VK_KHR_present_id

import ../features/vk10
import VK_KHR_swapchain
import ../platform
prepareVulkanLibDef()

const
  KhrPresentIdSpecVersion* = 1
  KhrPresentIdExtensionName* = "VK_KHR_present_id"

type
  PresentIdKHR* = object
    sType* {.constant: (StructureType.presentIdKhr).}: StructureType
    pNext* {.optional.}: pointer
    swapchainCount*: uint32
    pPresentIds* {.optional, length: swapchainCount.}: arrPtr[uint64]
  PhysicalDevicePresentIdFeaturesKHR* = object
    sType* {.constant: (StructureType.physicalDevicePresentIdFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    presentId*: Bool32



