# VK_AMD_draw_indirect_count

import ../features/vk10
import VK_KHR_draw_indirect_count
import ../platform
prepareVulkanLibDef()

const
  AmdDrawIndirectCountSpecVersion* = 2
  AmdDrawIndirectCountExtensionName* = "VK_AMD_draw_indirect_count"

const cmdDrawIndirectCountAMD* = cmdDrawIndirectCount
const cmdDrawIndexedIndirectCountAMD* = cmdDrawIndexedIndirectCount

