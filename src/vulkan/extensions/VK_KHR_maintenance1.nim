
import ../platform
import ../features/vk10




type
  {name}* = {Alias}

var # commands
  
const trimCommandPoolKHR* = trimCommandPool
proc loadVK_KHR_maintenance1*(instance: Instance) =
  instance.defineLoader(`<<`)

  trimCommandPoolKHRCage << "vkTrimCommandPoolKHR"