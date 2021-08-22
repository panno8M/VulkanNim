
import ../platform
import ../features/vk10


# type


const KhrDrawIndirectCountSpecVersion* = 1
const KhrDrawIndirectCountExtensionName* = "VK_KHR_draw_indirect_count"
var # commands
  
  

const cmdDrawIndexedIndirectCountKHR* = cmdDrawIndexedIndirectCount

const cmdDrawIndirectCountKHR* = cmdDrawIndirectCount


proc loadVK_KHR_draw_indirect_count*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdDrawIndexedIndirectCountKHRCage << "vkCmdDrawIndexedIndirectCountKHR"
  cmdDrawIndirectCountKHRCage << "vkCmdDrawIndirectCountKHR"