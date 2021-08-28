# Generated at 2021-08-28T12:28:00Z
# VK_AMD_draw_indirect_count
# =================================

import ../platform
import ../features/vk10


const
  AmdDrawIndirectCountSpecVersion* = 2
  AmdDrawIndirectCountExtensionName* = "VK_AMD_draw_indirect_count"

var # commands
  
  
const cmdDrawIndirectCountAMD* = cmdDrawIndirectCount
const cmdDrawIndexedIndirectCountAMD* = cmdDrawIndexedIndirectCount
proc loadVK_AMD_draw_indirect_count*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdDrawIndirectCountAMDCage << "vkCmdDrawIndirectCountAMD"
  cmdDrawIndexedIndirectCountAMDCage << "vkCmdDrawIndexedIndirectCountAMD"
