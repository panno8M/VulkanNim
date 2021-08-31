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
