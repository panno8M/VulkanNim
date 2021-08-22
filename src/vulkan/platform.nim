import strformat
import dynlib

const vkDllPath =
  when defined(windows):
    "vulkan-1.dll"
  elif defined(macosx):
    "libMoltenVK.dylib"
  else:
    "libvulkan.so.1"
let vkDll = vkDllPath.loadLib

if vkDll.isNil:
  quit("Could not load: {vkDllPath}".fmt)

let getInstanceProcAddrPlatform* = cast[proc(inst: pointer, s: cstring): pointer {.cdecl.}](vkDll.symAddr("vkGetInstanceProcAddr"))
if getInstanceProcAddrPlatform == nil:
  quit("failed to load `vkGetInstanceProcAddr` from " & vkDllPath)

template loadProc*(instance, target: untyped; loadFrom: string): untyped =
  target = cast[typeof(target)](getInstanceProcAddrPlatform(instance.pointer, loadFrom))
template loadProc*(target: untyped, loadFrom: string): untyped =
  target = cast[typeof(target)](getInstanceProcAddrPlatform(nil, loadFrom))

template defineLoader*(instance: untyped; procName: untyped): untyped =
  template procName(target: untyped; loadFrom: string): untyped =
    target = cast[typeof(target)](getInstanceProcAddrPlatform(instance.pointer, loadFrom))

template defineAlias*(TEnum: typedesc; value, alias: untyped): untyped =
  template alias*(tEnum: typedesc[TEnum]): TEnum =
    TEnum.value

type
  UnusedEnum* = object ## Reserved for future use
  Handle* = pointer
  NonDispatchableHandle* = pointer