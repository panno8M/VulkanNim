
import ../platform
import ../features/vk10


# type


const AmdDrawIndirectCountExtensionName* = "VK_AMD_draw_indirect_count"
const AmdDrawIndirectCountSpecVersion* = 2
var # commands
  
  

const cmdDrawIndexedIndirectCountAMD* = cmdDrawIndexedIndirectCount

const cmdDrawIndirectCountAMD* = cmdDrawIndirectCount


proc loadVK_AMD_draw_indirect_count*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdDrawIndexedIndirectCountAMDCage << "vkCmdDrawIndexedIndirectCountAMD"
  cmdDrawIndirectCountAMDCage << "vkCmdDrawIndirectCountAMD"