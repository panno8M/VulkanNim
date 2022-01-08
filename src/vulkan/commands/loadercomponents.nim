import std/macros {.all.}
import std/strformat
import std/sequtils

import ../enums

const vkDllPath* =
  when defined(windows):
    "vulkan-1.dll"
  elif defined(macosx):
    "libMoltenVK.dylib"
  else:
    "libvulkan.so.1"

type LoadWith* {.pure.} = enum
  Instance, Device
const InstanceLevel* = {LoadWith.Instance}
const DeviceLevel* = {LoadWith.Instance, LoadWith.Device}

template loadable*(loadFrom: string, with = InstanceLevel) {.pragma.}
template loadInto*[T: proc](cage: var T) {.pragma.}

macro preload*(loadFrom: string; body): untyped =
  result = body
  result.expectKind nnkProcDef
  result.pragma.add(
    (quote do: dynlib(`vkDllPath`)),
    (quote do: importc(`loadFrom`)))


macro lazyload*(loadFrom: string; with = InstanceLevel; body): untyped =
  ## .. code-block:: Nim
  ##    proc queuePresentKHR*(
  ##          queue: Queue;
  ##          pPresentInfo: ptr PresentInfoKHR;
  ##        ): Result {.cdecl, lazyload("vkQueuePresentKHR", DeviceLevel).}
  ##
  ## is expanded as:
  ##
  ## .. code-block:: Nim
  ##    type PFN_queuePresentKHR* = proc(
  ##          queue: Queue;
  ##          pPresentInfo: ptr PresentInfoKHR;
  ##        ): Result {.cdecl, loadable("vkQueuePresentKHR", DeviceLevel).}
  ##
  ##    var queuePresentKHR_CAGE: Option[PFN_queuePresentKHR]
  ##
  ##    proc queuePresentKHR*(
  ##          queue: Queue;
  ##          pPresentInfo: ptr PresentInfoKHR;
  ##        ): Result {.loadInto: queuePresentKHR_CAGE.}
  ##      get(queuePresentKHR_CAGE)(queue, pPresentInfo)
  proc isExported(n: NimNode): bool =
    n.kind == nnkPostfix and n[0].eqIdent "*"

  body.expectKind nnkProcDef
  if body.body.kind != nnkEmpty: error("the body must be empty")

  let
    procTyPragma = newNimNode(nnkPragma)
    .add( body.pragma[0..^1] )
    .add( quote do: loadable(`loadFrom`, `with`) )
    procTy = newNimNode(nnkProcTy).add(
      body.params,
      procTyPragma)

    typeName = ident(&"PFN_{body.name}")
    cageName = ident(&"{body.name}_CAGE")
    defectStr = newStrLitNode("\"" & $body.name & "\" has been called which has not yet been loaded.")
    
    exportableTypeName =
      if body[0].isExported: typeName.postfix("*")
      else: typeName

    typeDef = quote do:
      type `exportableTypeName` = `procTy`

    cageDef = quote do:
      var `cageName`: `typeName`

    cageparams = body.params[1..^1].mapIt( if it[0].kind == nnkPragmaExpr: it[0][0] else: it[0] )
    accessorDef = newProc(
      name= body[0],
      params= body.params[0..^1],
      body= newStmtList(
        (quote do:
          if `cageName`.isNil: raise newException(UnloadedDefect, `defectStr`)
        ),
        cageName.newCall(cageparams)
      ),
      pragmas= newNimNode(nnkPragma)
        .add(procTyPragma[0..^1])
        .add(quote do: loadInto(`cageName`))
    )

  quote do:
    `typeDef`
    `cageDef`
    `accessorDef`
