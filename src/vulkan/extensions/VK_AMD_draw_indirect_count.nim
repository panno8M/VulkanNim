
import ../platform
import ../features/vk10




type


var # commands
  
  
const cmdDrawIndirectCountAMD* = cmdDrawIndirectCount
const cmdDrawIndexedIndirectCountAMD* = cmdDrawIndexedIndirectCount
proc loadVK_AMD_draw_indirect_count*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdDrawIndirectCountAMDCage << "vkCmdDrawIndirectCountAMD"
  cmdDrawIndexedIndirectCountAMDCage << "vkCmdDrawIndexedIndirectCountAMD"