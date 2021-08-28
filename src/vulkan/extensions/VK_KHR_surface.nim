# Generated at 2021-08-28T00:52:26Z
# VK_KHR_surface
# =================================

import ../platform
import ../features/vk10


const
  KhrSurfaceSpecVersion* = 25
  KhrSurfaceExtensionName* = "VK_KHR_surface"

type
  SurfaceKHR* = distinct NonDispatchableHandle
  SurfaceTransformFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    IdentityBitKhr = 0x00000001
    Rotate90BitKhr = 0x00000002
    Rotate180BitKhr = 0x00000004
    Rotate270BitKhr = 0x00000008
    HorizontalMirrorBitKhr = 0x00000010
    HorizontalMirrorRotate90BitKhr = 0x00000020
    HorizontalMirrorRotate180BitKhr = 0x00000040
    HorizontalMirrorRotate270BitKhr = 0x00000080
    InheritBitKhr = 0x00000100
  PresentModeKHR* {.size: sizeof(int32), pure.} = enum
    ImmediateKhr = 0
    MailboxKhr = 1
    FifoKhr = 2
    FifoRelaxedKhr = 3
    # Provided by VK_KHR_shared_presentable_image
    SharedDemandRefreshKhr = 100001110000
    # Provided by VK_KHR_shared_presentable_image
    SharedContinuousRefreshKhr = 100001110001
  ColorSpaceKHR* {.size: sizeof(int32), pure.} = enum
    SrgbNonlinearKhr = 0
    # Provided by VK_EXT_swapchain_colorspace
    DisplayP3NonlinearExt = 100001040001
    # Provided by VK_EXT_swapchain_colorspace
    ExtendedSrgbLinearExt = 100001040002
    # Provided by VK_EXT_swapchain_colorspace
    DisplayP3LinearExt = 100001040003
    # Provided by VK_EXT_swapchain_colorspace
    DciP3NonlinearExt = 100001040004
    # Provided by VK_EXT_swapchain_colorspace
    Bt709LinearExt = 100001040005
    # Provided by VK_EXT_swapchain_colorspace
    Bt709NonlinearExt = 100001040006
    # Provided by VK_EXT_swapchain_colorspace
    Bt2020LinearExt = 100001040007
    # Provided by VK_EXT_swapchain_colorspace
    Hdr10St2084Ext = 100001040008
    # Provided by VK_EXT_swapchain_colorspace
    DolbyvisionExt = 100001040009
    # Provided by VK_EXT_swapchain_colorspace
    Hdr10HlgExt = 100001040010
    # Provided by VK_EXT_swapchain_colorspace
    AdobergbLinearExt = 100001040011
    # Provided by VK_EXT_swapchain_colorspace
    AdobergbNonlinearExt = 100001040012
    # Provided by VK_EXT_swapchain_colorspace
    PassThroughExt = 100001040013
    # Provided by VK_EXT_swapchain_colorspace
    ExtendedSrgbNonlinearExt = 100001040014
    # Provided by VK_AMD_display_native_hdr
    DisplayNativeAmd = 100002130000
  CompositeAlphaFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    OpaqueBitKhr = 0x00000001
    PreMultipliedBitKhr = 0x00000002
    PostMultipliedBitKhr = 0x00000004
    InheritBitKhr = 0x00000008
  CompositeAlphaFlagsKHR* = distinct Flags
  SurfaceCapabilitiesKHR* = object
    minImageCount*: uint32
    maxImageCount*: uint32
    currentExtent*: Extent2D
    minImageExtent*: Extent2D
    maxImageExtent*: Extent2D
    maxImageArrayLayers*: uint32
    supportedTransforms*: SurfaceTransformFlagsKHR
    currentTransform*: SurfaceTransformFlagBitsKHR
    supportedCompositeAlpha*: CompositeAlphaFlagsKHR
    supportedUsageFlags*: ImageUsageFlags
  SurfaceFormatKHR* = object
    format*: Format
    colorSpace*: ColorSpaceKHR

ColorSpaceKHR.defineAliases:
  SrgbNonlinearKhr as ColorspaceSrgbNonlinearKhr # Backwards-compatible alias containing a typo

var # commands
  destroySurfaceKHRCage: proc(instance: Instance; surface: SurfaceKHR; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  getPhysicalDeviceSurfaceSupportKHRCage: proc(physicalDevice: PhysicalDevice; queueFamilyIndex: uint32; surface: SurfaceKHR; pSupported: ptr Bool32;): Result {.cdecl.}
  getPhysicalDeviceSurfaceCapabilitiesKHRCage: proc(physicalDevice: PhysicalDevice; surface: SurfaceKHR; pSurfaceCapabilities: ptr SurfaceCapabilitiesKHR;): Result {.cdecl.}
  getPhysicalDeviceSurfaceFormatsKHRCage: proc(physicalDevice: PhysicalDevice; surface: SurfaceKHR; pSurfaceFormatCount: ptr uint32; pSurfaceFormats: ptr SurfaceFormatKHR;): Result {.cdecl.}
  getPhysicalDeviceSurfacePresentModesKHRCage: proc(physicalDevice: PhysicalDevice; surface: SurfaceKHR; pPresentModeCount: ptr uint32; pPresentModes: ptr PresentModeKHR;): Result {.cdecl.}
proc destroySurfaceKHR*(
      instance: Instance;
      surface: SurfaceKHR;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroySurfaceKHRCage(instance,surface,pAllocator)
proc getPhysicalDeviceSurfaceSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      surface: SurfaceKHR;
      pSupported: ptr Bool32;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceSurfaceSupportKHRCage(physicalDevice,queueFamilyIndex,surface,pSupported)
proc getPhysicalDeviceSurfaceCapabilitiesKHR*(
      physicalDevice: PhysicalDevice;
      surface: SurfaceKHR;
      pSurfaceCapabilities: ptr SurfaceCapabilitiesKHR;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceSurfaceCapabilitiesKHRCage(physicalDevice,surface,pSurfaceCapabilities)
proc getPhysicalDeviceSurfaceFormatsKHR*(
      physicalDevice: PhysicalDevice;
      surface: SurfaceKHR;
      pSurfaceFormatCount: ptr uint32;
      pSurfaceFormats: ptr SurfaceFormatKHR;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceSurfaceFormatsKHRCage(physicalDevice,surface,pSurfaceFormatCount,pSurfaceFormats)
proc getPhysicalDeviceSurfacePresentModesKHR*(
      physicalDevice: PhysicalDevice;
      surface: SurfaceKHR;
      pPresentModeCount: ptr uint32;
      pPresentModes: ptr PresentModeKHR;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceSurfacePresentModesKHRCage(physicalDevice,surface,pPresentModeCount,pPresentModes)
proc loadVK_KHR_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  destroySurfaceKHRCage << "vkDestroySurfaceKHR"
  getPhysicalDeviceSurfaceSupportKHRCage << "vkGetPhysicalDeviceSurfaceSupportKHR"
  getPhysicalDeviceSurfaceCapabilitiesKHRCage << "vkGetPhysicalDeviceSurfaceCapabilitiesKHR"
  getPhysicalDeviceSurfaceFormatsKHRCage << "vkGetPhysicalDeviceSurfaceFormatsKHR"
  getPhysicalDeviceSurfacePresentModesKHRCage << "vkGetPhysicalDeviceSurfacePresentModesKHR"