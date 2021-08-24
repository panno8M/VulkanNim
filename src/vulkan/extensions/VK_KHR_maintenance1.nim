
import ../platform
import ../features/vk10


type
  {name}* = {Alias}

const KhrMaintenance1ExtensionName* = "VK_KHR_maintenance1"
const KhrMaintenance1SpecVersion* = 2
var # commands
  

const trimCommandPoolKHR* = trimCommandPool


proc loadVK_KHR_maintenance1*(instance: Instance) =
  instance.defineLoader(`<<`)

  trimCommandPoolKHRCage << "vkTrimCommandPoolKHR"