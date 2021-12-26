# Generated at 2021-12-26T10:16:14Z
# VK_KHR_draw_indirect_count
# VK_AMD_draw_indirect_count

import ../platform

import ../features/vk10
import ../features/vk12

prepareVulkanLibDef()

const
  KhrDrawIndirectCountSpecVersion* = 1
  KhrDrawIndirectCountExtensionName* = "VK_KHR_draw_indirect_count"

  AmdDrawIndirectCountSpecVersion* = 2
  AmdDrawIndirectCountExtensionName* = "VK_AMD_draw_indirect_count"

const cmdDrawIndirectCountKHR* = cmdDrawIndirectCount
const cmdDrawIndexedIndirectCountKHR* = cmdDrawIndexedIndirectCount


const cmdDrawIndirectCountAMD* = cmdDrawIndirectCount
const cmdDrawIndexedIndirectCountAMD* = cmdDrawIndexedIndirectCount

