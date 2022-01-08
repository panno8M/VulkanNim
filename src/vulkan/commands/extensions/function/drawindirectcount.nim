# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_AMD_draw_indirect_count
# VK_KHR_draw_indirect_count

const
  # VK_AMD_draw_indirect_count
  AmdDrawIndirectCountSpecVersion* = 2
  AmdDrawIndirectCountExtensionName* = "VK_AMD_draw_indirect_count"
  # VK_KHR_draw_indirect_count
  KhrDrawIndirectCountSpecVersion* = 1
  KhrDrawIndirectCountExtensionName* = "VK_KHR_draw_indirect_count"


# VK_AMD_draw_indirect_count
# ==========================
template cmdDrawIndirectCountAMD* = cmdDrawIndirectCount
template cmdDrawIndexedIndirectCountAMD* = cmdDrawIndexedIndirectCount

# VK_KHR_draw_indirect_count
# ==========================
template cmdDrawIndirectCountKHR* = cmdDrawIndirectCount
template cmdDrawIndexedIndirectCountKHR* = cmdDrawIndexedIndirectCount

