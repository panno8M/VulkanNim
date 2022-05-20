## You can use these templates to load Vulkan proc dynamically and individually.

import std/macros {.all.}
import std/sequtils

import ../handles

import loadercomponents

type UnloadedDefect* = object of NilAccessDefect

macro loadCommand*[TH: Instance|Device](handle: TH; procType: typedesc[proc]): proc =
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
  quote do:
    when typeof(`handle`) is Instance:
      when LoadWith.Instance in `loadWith`:
        cast[`procType`](`handle`.getInstanceProcAddr(`loadFrom`))
      else:
        {.error: "Not available to load with instance.".}
    elif typeof(`handle`) is Device:
      when LoadWith.Device in `loadWith`:
        cast[`procType`](`handle`.getDeviceProcAddr(`loadFrom`))
      else:
        {.error: "Not available to load with device.".}
    else:
      {.error: "Type of the handle must be Instance or Device, not " & repr(typeof(`handle`)).}

macro loadCommand*(handle: Instance|Device; procAccessor: proc) =
  if procAccessor.kind notin [nnkSym]:
    error "procAccessor must be nnkSym, not " & $procAccessor.kind, procAccessor
  let cageName = procAccessor.customPragmaNode()
    .findChild(it.len > 0 and it[0].repr == "loadInto")[1]
  quote do:
    `cageName` = `handle`.loadCommand(typeof `cageName`)

macro loadCommands*(handle: Instance or Device; body) =
  newStmtList(
    body.mapIt( ident"loadCommand".newCall(handle, it) )
  )

template withLoad*[T: proc](procAccessor: T; handle: Instance or Device): T =
  procAccessor.loadCommand(handle)
  procAccessor