# Generated at 2021-09-10T05:27:58Z
# platform
import strformat
import macros
import sequtils
export macros.hasCustomPragma, macros.getCustomPragmaVal

const vkDllPath =
  when defined(windows):
    "vulkan-1.dll"
  elif defined(macosx):
    "libMoltenVK.dylib"
  else:
    "libvulkan.so.1"

type
  UnusedEnum* = object ## Reserved for future use
  HandleType* = object of RootObj
  NullHandle* = Handle[HandleType]
  Handle*[T] = distinct ptr object
  NonDispatchableHandle*[T] = distinct ptr object
  Display* = ptr object
  RRoutput* = ptr object
  IDirectFB* = ptr object
  IDirectFBSurface* = ptr object
  HMONITOR* = ptr object
  zx_handle_t* = ptr object
  GgpFrameToken* = ptr object
  GgpStreamDescriptor* = ptr object
  wl_display* = ptr object
  wl_surface* = ptr object
  Win32Handle* = ptr object # replace HANDLE of windows.h
  LPCWSTR* = ptr object
  SECURITY_ATTRIBUTES* = ptr object
  DWORD* = ptr object
  HINSTANCE* = ptr object
  HWND* = ptr object
  xcb_connection_t* = ptr object
  xcb_window_t* = ptr object
  xcb_visualid_t* = ptr object
  Window* = ptr object
  VisualID* = ptr object

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

type LoadWith* {.pure.} = enum
  Instance, Device
const InstanceLevel* = {LoadWith.Instance}
const DeviceLevel* = {LoadWith.Instance, LoadWith.Device}

template loadable*(loadFrom: string, with = InstanceLevel) {.pragma.}

macro preload*(loadFrom: string, def: untyped): untyped =
  def.expectKind nnkProcDef
  if def.body.kind != nnkEmpty: error("the body must be empty")
  def.addPragma ident("discardable")
  def.addPragma ident("dynlib").newCall(newStrLitNode(vkDllPath))
  def.addPragma ident("importc").newCall(newStrLitNode($loadFrom))
  return def
macro lazyload*(loadFrom: string; with = InstanceLevel; def: untyped): untyped =
  ## The proc expands to something like:
  ##
  ## var procName: procDef {.[procPragma], loadable(loadFrom, with).}
  ##
  ## As you can see the proc pointer has loadable pragma so, you can use load macro to dynamic load.

  def.expectKind nnkProcDef
  if def.body.kind != nnkEmpty: error("the body must be empty")

  let
    pragma = newNimNode(nnkPragma).add(concat(
      def.pragma[0..^1],
      @[ident("loadable").newCall(loadFrom, with)],
    ))
    procTy = newNimNode(nnkProcTy).add(
      def.params,
      pragma)

  newNimNode(nnkVarSection).add(newIdentDefs(
    def[0], # def.name
    procTy,
    newEmptyNode()
  ))

template optional*() {.pragma.}
template constant*(v: typed) {.pragma.}



