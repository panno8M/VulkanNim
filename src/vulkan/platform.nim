# Generated at 2021-12-26T08:21:06Z
# platform
import strformat
import macros
import sequtils
import options
export macros.hasCustomPragma, macros.getCustomPragmaVal

import xcb/xcb

const vkDllPath =
  when defined(windows):
    "vulkan-1.dll"
  elif defined(macosx):
    "libMoltenVK.dylib"
  else:
    "libvulkan.so.1"

type
  UnusedEnum* = object ## Reserved for future use
  arrPtr*[T] = ptr T

type
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
  Window* = ptr object
  VisualID* = ptr object
export XcbConnection
export XcbWindow
export XcbVisualid

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
template loadInto*[T: proc](cage: var Option[T]) {.pragma.}

macro preload*(loadFrom: string, def: untyped): untyped =
  def.expectKind nnkProcDef
  if def.body.kind != nnkEmpty: error("the body must be empty")
  def.addPragma ident"discardable"
  def.addPragma ident"dynlib".newCall(newStrLitNode(vkDllPath))
  def.addPragma ident"importc".newCall(newStrLitNode($loadFrom))
  return def
macro lazyload*(loadFrom: string; with = InstanceLevel; def: untyped): untyped =
  ## The proc expands to something like:
  ##
  ## var procName: procDef {.[procPragma], loadable(loadFrom, with).}
  ##
  ## As you can see the proc pointer has loadable pragma so, you can use load macro to dynamic load.
  
  proc isExported(n: NimNode): bool =
    n.kind == nnkPostfix and n[0].eqIdent "*"

  def.expectKind nnkProcDef
  if def.body.kind != nnkEmpty: error("the body must be empty")

  let
    procTyPragma = newNimNode(nnkPragma).add(concat(
      def.pragma[0..^1],
      @[ident"loadable".newCall(loadFrom, with)],
    ))
    procTy = newNimNode(nnkProcTy).add(
      def.params,
      procTyPragma)

    typeName = ident(&"PFN_{def.name}")
    cageName = ident(&"{def.name}_CAGE")
    exportableTypeName =
      if def[0].isExported: typeName.postfix("*")
      else: typeName

    typeDef = quote do:
      type `exportableTypeName` = `procTy`

    cageDef = quote do:
      var `cageName`: Option[`typeName`]

    accessorDef = newProc(
      name= def[0],
      params= def.params[0..^1],
      body= ident"get".newCall(cageName).newCall def.params[1..^1].mapIt( if it[0].kind == nnkPragmaExpr: it[0][0] else: it[0] ),
      pragmas= newNimNode(nnkPragma).add(
        ident"loadInto".newCall(cageName),
        ident"discardable"
      )
    )

  quote do:
    `typeDef`
    `cageDef`
    `accessorDef`

template optional* {.pragma.}
template constant*(v: typed) {.pragma.}

template flagbits* {.pragma.}

template length*(v: untyped) {.pragma.}

template successCodes*(v: varargs[untyped]) {.pragma.}
template errorCodes*(v: varargs[untyped]) {.pragma.}

template prepareVulkanLibDef* =
  import std/options
  import vulkan/basetypes
  import vulkan/handles
  import vulkan/enums

