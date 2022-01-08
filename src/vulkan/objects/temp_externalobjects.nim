import xcb/xcb

type
  Display* = object
  RRoutput* = object
  IDirectFB* = object
  IDirectFBSurface* = object
  HMONITOR* = object
  zx_handle_t* = object

  GgpFrameToken* = object
  GgpStreamDescriptor* = object

  wl_display* = object
  wl_surface* = object

  Win32Handle* = object # replace HANDLE of windows.h
  LPCWSTR* = object
  SECURITY_ATTRIBUTES* = object
  DWORD* = object
  HINSTANCE* = object
  HWND* = object
  Window* = object
  VisualID* = object

  screenContext* = object
  screenWindow* = object

  StdVideoH264ProfileIdc* = object
  StdVideoH264SequenceParameterSet* = object
  StdVideoH264PictureParameterSet* = object

  StdVideoDecodeH264PictureInfo* = object
  StdVideoDecodeH264Mvc* = object
  StdVideoDecodeH264ReferenceInfo* = object

  StdVideoEncodeH264PictureInfo* = object
  StdVideoEncodeH264SliceHeader* = object


  StdVideoH265ProfileIdc* = object
  StdVideoH265SequenceParameterSet* = object
  StdVideoH265PictureParameterSet* = object
  StdVideoH265VideoParameterSet* = object

  StdVideoDecodeH265PictureInfo* = object
  StdVideoDecodeH265ReferenceInfo* = object

  StdVideoEncodeH265PictureInfo* = object
  StdVideoEncodeH265SliceHeader* = object
  StdVideoEncodeH265ReferenceInfo* = object
  StdVideoEncodeH265ReferenceModifications* = object

export XcbConnection
export XcbWindow
export XcbVisualid