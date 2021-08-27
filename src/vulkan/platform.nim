import strformat
import macros
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

template defineAlias*(TEnum: typedesc; original, alias: untyped): untyped =
  template alias*(tEnum: typedesc[TEnum]): TEnum =
    TEnum.original

macro defineAliases*(TEnum: typedesc; body: untyped): untyped =
  var aliases: seq[tuple[original: string; alias: string]]

  block Extraction:
    body.expectKind(nnkStmtList)
    for cbody in body:
      if cbody.kind != nnkInfix or
        cbody[0].kind != nnkIdent or
        (not cbody[0].eqIdent "as") or
        cbody[1].kind != nnkIdent or
        cbody[2].kind != nnkIdent:
        continue
      aliases.add ($cbody[1], $cbody[2])

  block Rendering:
    result = newStmtList()
    for alias in aliases:
      result.add "defineAlias({repr TEnum}, {alias.original}, {alias.alias})".fmt.parseStmt




type
  UnusedEnum* = object ## Reserved for future use
  Handle* = pointer
  NonDispatchableHandle* = pointer