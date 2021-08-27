
import ../platform
import ../features/vk10


const
  KhrDrawIndirectCountSpecVersion* = 1
  KhrDrawIndirectCountExtensionName* = "VK_KHR_draw_indirect_count"

var # commands
  
  
const cmdDrawIndirectCountKHR* = cmdDrawIndirectCount
const cmdDrawIndexedIndirectCountKHR* = cmdDrawIndexedIndirectCount
proc loadVK_KHR_draw_indirect_count*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdDrawIndirectCountKHRCage << "vkCmdDrawIndirectCountKHR"
  cmdDrawIndexedIndirectCountKHRCage << "vkCmdDrawIndexedIndirectCountKHR"