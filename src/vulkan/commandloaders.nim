## You can use these templates to load Vulkan proc dynamically and individually.

import std/macros {.all.}
import std/strformat
import std/sequtils
import std/options

import vulkan/platform
import vulkan/handles

# Internal //================================================================= #
# For statically control vulkan's external functions.
# To tie your defined function to the vulkan function, import this
# with `import vulkan/commandloaders {.all.}` and set them as pragmas.

type LoadWith {.used, pure.} = enum
  Instance, Device
const InstanceLevel {.used.} = {LoadWith.Instance}
const DeviceLevel {.used.} = {LoadWith.Instance, LoadWith.Device}

{.push, used.}
template loadable(loadFrom: string, with = InstanceLevel) {.pragma.}
template loadInto[T: proc](cage: var Option[T]) {.pragma.}

macro preload(loadFrom: string; body): untyped =
  result = body
  result.expectKind nnkProcDef
  result.pragma.add(
    (quote do: dynlib(`vkDllPath`)),
    (quote do: importc(`loadFrom`)))





macro lazyload(loadFrom: string; with = InstanceLevel; body): untyped =
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
    exportableTypeName =
      if body[0].isExported: typeName.postfix("*")
      else: typeName

    typeDef = quote do:
      type `exportableTypeName` = `procTy`

    cageDef = quote do:
      var `cageName`: Option[`typeName`]

    cageparams = body.params[1..^1].mapIt( if it[0].kind == nnkPragmaExpr: it[0][0] else: it[0] )
    accessorDef = newProc(
      name= body[0],
      params= body.params[0..^1],
      body= ("get".newCall(cageName).newCall cageparams),
      pragmas= newNimNode(nnkPragma)
        .add(procTyPragma[0..^1])
        .add(quote do: loadInto(`cageName`))
    )

  quote do:
    `typeDef`
    `cageDef`
    `accessorDef`

{.pop.}

# =================================================================// Internal #


macro loadCommand*[T: proc](handle: Instance or Device; procType: typedesc[T]): T =
  ## .. code-block:: Nim
  ##    type PFN_queuePresentKHR* = proc(
  ##          queue: Queue;
  ##          pPresentInfo: ptr PresentInfoKHR;
  ##        ): Result {.cdecl, loadable("vkQueuePresentKHR", DeviceLevel).}
  ## 
  ##    var queuePresentKHR_ins = instance.loadCommand(PFN_queuePresentKHR)
  ##    var queuePresentKHR_dev = device.loadCommand(PFN_queuePresentKHR)
  ##
  ## is expanded as:
  ##
  ## .. code-block:: Nim
  ##    var queuePresentKHR_ins = cast[PFN_queuePresentKHR](
  ##      # "vkQueuePresentKHR"== PFN_queuePresentKHR.getCustomPragmaVal(loadable).loadFrom
  ##      instance.getInstanceProcAddr("vkQueuePresentKHR"))
  ##    var queuePresentKHR_dev = cast[PFN_queuePresentKHR](
  ##      device.getDeviceProcAddr("vkQueuePresentKHR"))
  let (loadFrom, loadWith) = block:
    let procTypeDef =
      if procType.kind == nnkSym and procType.symKind == nskType:
        procType.getImpl[2]
      elif procType.kind == nnkTypeOfExpr:
        procType.getTypeImpl[1].getTypeImpl
      else:
        procType

    if procTypeDef.kind != nnkProcTy: error "unexpected"

    let procPragmas = procTypeDef.pragma

    var loadablePragma: NimNode
    for pragma in procPragmas:
      case pragma.kind
      of nnkCall, nnkExprColonExpr:
        if pragma[0].kind == nnkSym and
            pragma[0].symkind == nskTemplate and
            $pragma[0] == "loadable":
          loadablePragma = pragma
          break
      else: continue
    if loadablePragma == nil:
      error "The loadable pragma must be set for the proc type.", procType

    (
      loadFrom: loadablePragma[1],
      loadWith: loadablePragma[2][0..^1].mapIt(LoadWith(it.intVal))
    )

  case handle.getTypeInst.repr
  of Instance.getTypeInst.repr:
    if LoadWith.Instance in loadWith:
      return quote do:
        cast[`procType`](`handle`.getInstanceProcAddr(`loadFrom`))
    else:
      error "Not available to load with instance.", handle

  of Device.getTypeInst.repr:
    if LoadWith.Device in loadWith:
      return quote do:
        cast[`procType`](`handle`.getDeviceProcAddr(`loadFrom`))
    else:
      error "Not available to load with device.", handle

  else: error "Type of the handle must be Instance or Device", procType

macro loadCommand*[T: proc](handle: Instance or Device; procAccessor: T) =
  let cageName = procAccessor.customPragmaNode()
    .findChild(it.len > 0 and it[0].repr == "loadInto")[1]
  quote do:
    `cageName` = option `handle`.loadCommand(`cageName`.unsafeGet.typeof)

macro loadCommands*(handle: Instance or Device; body): untyped =
  newStmtList(
    body.mapIt( quote do: `handle`.loadCommand `it` )
  )

template withLoad*[T: proc](procAccessor: T; handle: Instance or Device): T =
  procAccessor.load(handle)
  procAccessor