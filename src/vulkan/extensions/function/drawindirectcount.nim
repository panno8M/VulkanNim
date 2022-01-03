# VK_AMD_draw_indirect_count
# VK_KHR_draw_indirect_count

import ../../features/vk10
import ../../platform
import ../../features/vk12
prepareVulkanLibDef()

const
  AmdDrawIndirectCountSpecVersion* = 2
  AmdDrawIndirectCountExtensionName* = "VK_AMD_draw_indirect_count"

  KhrDrawIndirectCountSpecVersion* = 1
  KhrDrawIndirectCountExtensionName* = "VK_KHR_draw_indirect_count"

const cmdDrawIndirectCountAMD* = cmdDrawIndirectCount
const cmdDrawIndexedIndirectCountAMD* = cmdDrawIndexedIndirectCount


const cmdDrawIndirectCountKHR* = cmdDrawIndirectCount
const cmdDrawIndexedIndirectCountKHR* = cmdDrawIndexedIndirectCount

