import std/sugar

import nimbench

import vulkan/features/vk10
import vulkan/extensions/VK_EXT_debug_utils {.all.}
import vulkan/enums
import vulkan/basetypes
import vulkan/handles
import vulkan/resulttraits
import vulkan/additionalOperations

proc callback(
      messageSeverity: DebugUtilsMessageSeverityFlagBitsEXT;
      messageTypes: DebugUtilsMessageTypeFlagsEXT;
      pCallbackData: ptr DebugUtilsMessengerCallbackDataEXT;
      pUserData: pointer;
    ): Bool32 {.cdecl.} =
  echo pCallbackData[].pMessage

var
  instance_ci = InstanceCreateInfo{
    enabledExtensionCount: 1,
    ppEnabledExtensionNames: [ExtDebugUtilsExtensionName].allocCStringArray()
    }
  instance: Instance

  debugger_ci = DebugUtilsMessengerCreateInfoEXT{
    messageSeverity: DebugUtilsMessageSeverityFlagBitsEXT.errorExt,
    messageType: DebugUtilsMessageTypeFlagsEXT.all,
    pfnUserCallback: callback
    }
  debugger: DebugUtilsMessengerEXT


dump createInstance.withCheck(addr instance_ci, nil, addr instance)



bench(loadOnly, m):
  var createDebugger: PFN_createDebugUtilsMessengerEXT
  doNotOptimizeAway(createDebugger)
  for i in 1..m:
    createDebugger = cast[PFN_createDebugUtilsMessengerEXT](instance.getInstanceProcAddr("vkCreateDebugUtilsMessengerEXT"))


bench(load_and_create_for_each, m):
  var createDebugger: PFN_createDebugUtilsMessengerEXT
  doNotOptimizeAway(createDebugger)
  for i in 1..m:
    createDebugger = cast[PFN_createDebugUtilsMessengerEXT](instance.getInstanceProcAddr("vkCreateDebugUtilsMessengerEXT"))
    discard instance.createDebugger(addr debugger_ci, nil, addr debugger)

bench(load_when_isNil_and_create_for_each, m):
  var createDebugger: PFN_createDebugUtilsMessengerEXT
  doNotOptimizeAway(createDebugger)
  for i in 1..m:
    if createDebugger.isNil:
      createDebugger = cast[PFN_createDebugUtilsMessengerEXT](instance.getInstanceProcAddr("vkCreateDebugUtilsMessengerEXT"))
    discard instance.createDebugger(addr debugger_ci, nil, addr debugger)

bench(load_ones_and_create_for_each, m):
  var createDebugger: PFN_createDebugUtilsMessengerEXT
  doNotOptimizeAway(createDebugger)
  createDebugger = cast[PFN_createDebugUtilsMessengerEXT](instance.getInstanceProcAddr("vkCreateDebugUtilsMessengerEXT"))
  for i in 1..m:
    discard instance.createDebugger(addr debugger_ci, nil, addr debugger)

runBenchmarks()