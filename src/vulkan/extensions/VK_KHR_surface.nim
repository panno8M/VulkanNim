
import ../platform
import ../features/vk10


type
  CompositeAlphaFlagsKHR* = Flags
  SurfaceKHR* = distinct NonDispatchableHandle
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
  SurfaceTransformFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    Identity = 0x00000001
    Rotate90 = 0x00000002
    Rotate180 = 0x00000004
    Rotate270 = 0x00000008
    HorizontalMirror = 0x00000010
    HorizontalMirrorRotate90 = 0x00000020
    HorizontalMirrorRotate180 = 0x00000040
    HorizontalMirrorRotate270 = 0x00000080
    Inherit = 0x00000100
  PresentModeKHR* {.size: sizeof(int32), pure.} = enum
    Immediate = 0
    Mailbox = 1
    Fifo = 2
    FifoRelaxed = 3
    # Provided by VK_KHR_shared_presentable_image
    SharedDemandRefresh = 100001110000
    # Provided by VK_KHR_shared_presentable_image
    SharedContinuousRefresh = 100001110001
  SurfaceFormatKHR* = object
    format*: Format
    colorSpace*: ColorSpaceKHR
  CompositeAlphaFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    Opaque = 0x00000001
    PreMultiplied = 0x00000002
    PostMultiplied = 0x00000004
    Inherit = 0x00000008
  ColorSpaceKHR* {.size: sizeof(int32), pure.} = enum
    SrgbNonlinear = 0
    # Provided by VK_EXT_swapchain_colorspace
    DisplayP3Nonlinear = 100001040001
    # Provided by VK_EXT_swapchain_colorspace
    ExtendedSrgbLinear = 100001040002
    # Provided by VK_EXT_swapchain_colorspace
    DisplayP3Linear = 100001040003
    # Provided by VK_EXT_swapchain_colorspace
    DciP3Nonlinear = 100001040004
    # Provided by VK_EXT_swapchain_colorspace
    Bt709Linear = 100001040005
    # Provided by VK_EXT_swapchain_colorspace
    Bt709Nonlinear = 100001040006
    # Provided by VK_EXT_swapchain_colorspace
    Bt2020Linear = 100001040007
    # Provided by VK_EXT_swapchain_colorspace
    Hdr10St2084 = 100001040008
    # Provided by VK_EXT_swapchain_colorspace
    Dolbyvision = 100001040009
    # Provided by VK_EXT_swapchain_colorspace
    Hdr10Hlg = 100001040010
    # Provided by VK_EXT_swapchain_colorspace
    AdobergbLinear = 100001040011
    # Provided by VK_EXT_swapchain_colorspace
    AdobergbNonlinear = 100001040012
    # Provided by VK_EXT_swapchain_colorspace
    PassThrough = 100001040013
    # Provided by VK_EXT_swapchain_colorspace
    ExtendedSrgbNonlinear = 100001040014
    # Provided by VK_AMD_display_native_hdr
    DisplayNative = 100002130000

ColorSpaceKHR.defineAlias(ColorspaceSrgbNonlinear, SrgbNonlinear) # Backwards-compatible alias containing a typo
const KhrSurfaceExtensionName* = "VK_KHR_surface"
const KhrSurfaceSpecVersion* = 25
var # commands
  destroySurfaceKHRCage: proc(instance: Instance; surface: SurfaceKHR; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  getPhysicalDeviceSurfaceCapabilitiesKHRCage: proc(physicalDevice: PhysicalDevice; surface: SurfaceKHR; pSurfaceCapabilities: ptr SurfaceCapabilitiesKHR;): Result {.cdecl.}
  getPhysicalDeviceSurfaceFormatsKHRCage: proc(physicalDevice: PhysicalDevice; surface: SurfaceKHR; pSurfaceFormatCount: ptr uint32; pSurfaceFormats: ptr SurfaceFormatKHR;): Result {.cdecl.}
  getPhysicalDeviceSurfacePresentModesKHRCage: proc(physicalDevice: PhysicalDevice; surface: SurfaceKHR; pPresentModeCount: ptr uint32; pPresentModes: ptr PresentModeKHR;): Result {.cdecl.}
  getPhysicalDeviceSurfaceSupportKHRCage: proc(physicalDevice: PhysicalDevice; queueFamilyIndex: uint32; surface: SurfaceKHR; pSupported: ptr Bool32;): Result {.cdecl.}

proc destroySurfaceKHR*(
      instance: Instance;
      surface: SurfaceKHR;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroySurfaceKHRCage(instance,surface,pAllocator)

proc getPhysicalDeviceSurfaceCapabilitiesKHR*(
      physicalDevice: PhysicalDevice;
      surface: SurfaceKHR;
      pSurfaceCapabilities: ptr SurfaceCapabilitiesKHR;
    ): Result {.cdecl.} =
  getPhysicalDeviceSurfaceCapabilitiesKHRCage(physicalDevice,surface,pSurfaceCapabilities)

proc getPhysicalDeviceSurfaceFormatsKHR*(
      physicalDevice: PhysicalDevice;
      surface: SurfaceKHR;
      pSurfaceFormatCount: ptr uint32;
      pSurfaceFormats: ptr SurfaceFormatKHR;
    ): Result {.cdecl.} =
  getPhysicalDeviceSurfaceFormatsKHRCage(physicalDevice,surface,pSurfaceFormatCount,pSurfaceFormats)

proc getPhysicalDeviceSurfacePresentModesKHR*(
      physicalDevice: PhysicalDevice;
      surface: SurfaceKHR;
      pPresentModeCount: ptr uint32;
      pPresentModes: ptr PresentModeKHR;
    ): Result {.cdecl.} =
  getPhysicalDeviceSurfacePresentModesKHRCage(physicalDevice,surface,pPresentModeCount,pPresentModes)

proc getPhysicalDeviceSurfaceSupportKHR*(
      physicalDevice: PhysicalDevice;
      queueFamilyIndex: uint32;
      surface: SurfaceKHR;
      pSupported: ptr Bool32;
    ): Result {.cdecl.} =
  getPhysicalDeviceSurfaceSupportKHRCage(physicalDevice,queueFamilyIndex,surface,pSupported)


proc loadVK_KHR_surface*(instance: Instance) =
  instance.defineLoader(`<<`)

  destroySurfaceKHRCage << "vkDestroySurfaceKHR"
  getPhysicalDeviceSurfaceCapabilitiesKHRCage << "vkGetPhysicalDeviceSurfaceCapabilitiesKHR"
  getPhysicalDeviceSurfaceFormatsKHRCage << "vkGetPhysicalDeviceSurfaceFormatsKHR"
  getPhysicalDeviceSurfacePresentModesKHRCage << "vkGetPhysicalDeviceSurfacePresentModesKHR"
  getPhysicalDeviceSurfaceSupportKHRCage << "vkGetPhysicalDeviceSurfaceSupportKHR"