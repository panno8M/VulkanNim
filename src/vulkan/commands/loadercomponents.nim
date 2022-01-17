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
  result.pragma = nnkPragma.newTree concat(
    @[(quote do: cdecl),
    (quote do: dynlib(`vkDllPath`)),
    (quote do: importc(`loadFrom`))],
    result.pragma[0..^1],
  )


macro lazyload*(loadFrom: string; with = InstanceLevel; body): untyped =
  ## .. code-block:: Nim
  ##    proc queuePresentKHR*(
  ##          queue: Queue;
  ##          pPresentInfo: ptr PresentInfoKHR;
  ##        ): Result {.lazyload("vkQueuePresentKHR", DeviceLevel), yourPragma.}
  ##
  ## is expanded as:
  ##
  ## .. code-block:: Nim
  ##    type PFN_queuePresentKHR* = proc(
  ##          queue: Queue;
  ##          pPresentInfo: ptr PresentInfoKHR;
  ##        ): Result {.cdecl, loadable("vkQueuePresentKHR", DeviceLevel).}
  ##
  ##    var queuePresentKHR_CAGE: PFN_queuePresentKHR
  ##
  ##    proc queuePresentKHR*(
  ##          queue: Queue;
  ##          pPresentInfo: ptr PresentInfoKHR;
  ##        ): Result {.cdecl, loadInto: queuePresentKHR_CAGE, yourPragma.}
  ##      if queuePresentKHR_CAGE.isNil:
  ##        raise newException(UnloadedDefect, "\"queuePresentKHR\" has been called which has not yet been loaded.")
  ##      queuePresentKHR_CAGE(queue, pPresentInfo)
  proc isExported(n: NimNode): bool =
    n.kind == nnkPostfix and n[0].eqIdent "*"

  body.expectKind nnkProcDef
  if body.body.kind != nnkEmpty: error("the body must be empty")

  let
    procTy = nnkProcTy.newTree(
      body.params,
      nnkPragma.newTree(
        ident"cdecl",
        ident"loadable".newCall(loadFrom, with)))

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
      pragmas= nnkPragma.newTree(
        ident"cdecl",
        ident"loadInto".newCall(cageName))
      .add(body.pragma[0..^1])
    )
  newStmtList(
    typeDef,
    cageDef,
    accessorDef)
