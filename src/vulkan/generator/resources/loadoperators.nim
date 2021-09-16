
# ========================= #
#      LOADER TEMPLATE      #
# ========================= #

# You can use these templates to load Vulkan proc dynamically and individually.
import macros
import sequtils

macro load*[T: proc](procType: typedesc[T]; handle: Instance or Device): T =
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

  let loadFrom = loadablePragma[1]
  let loadWith = loadablePragma[2][0..^1].mapIt(LoadWith(it.intVal))


  case handle.getTypeInst.repr
  of Instance.getTypeInst.repr:
    if LoadWith.Instance in loadWith:
      return quote do:
        cast[`procType`](`handle`.getInstanceProcAddr(`loadFrom`))
    else:
      error "Not available to load with instance.", handle

  of Device.getTypeInst.repr:
    if LoadWith.Device in `loadWith`:
      return quote do:
        cast[`procType`](`handle`.getDeviceProcAddr(`loadFrom`))
    else:
      error "Not available to load with device.", handle

  else: error "Type of the handle must be Instance or Device", procType

template load*[T: proc](procVar: var T; handle: Instance or Device) =
  procVar = procVar.typeof.load(handle)

template withLoad*[T: proc](procVar: var T; handle: Instance or Device): T =
  procVar.load(handle)
  procVar


# ========================= #
#      LOADER TEMPLATE      #
# ========================= #
