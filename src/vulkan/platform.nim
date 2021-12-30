# Generated at 2021-12-26T08:21:06Z
# platform
import std/macros
export macros.hasCustomPragma, macros.getCustomPragmaVal

import xcb/xcb

const vkDllPath* =
  when defined(windows):
    "vulkan-1.dll"
  elif defined(macosx):
    "libMoltenVK.dylib"
  else:
    "libvulkan.so.1"

type
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


template optional* {.pragma.}
template constant*(v: typed) {.pragma.}

template length*(v: untyped) {.pragma.}

template successCodes*(v: varargs[untyped]) {.pragma.}
template errorCodes*(v: varargs[untyped]) {.pragma.}

template prepareVulkanLibDef* =
  import std/options
  import vulkan/basetypes
  import vulkan/handles
  import vulkan/enums
  import vulkan/commandLoaders {.all.}
