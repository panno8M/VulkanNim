
import ../platform
import ../features/vk10
import VK_KHR_device_group_creation


type
  MemoryAllocateFlagsInfoKHR* = object
  {name}* = {Alias}
  DeviceGroupBindSparseInfoKHR* = object
  DeviceGroupCommandBufferBeginInfoKHR* = object
  DeviceGroupRenderPassBeginInfoKHR* = object
  DeviceGroupSubmitInfoKHR* = object
  {name}* = {Alias}
  PeerMemoryFeatureFlagBitsKHR* = UnusedEnum
  MemoryAllocateFlagBitsKHR* = UnusedEnum

  BindImageMemoryDeviceGroupInfoKHR* = object
  BindBufferMemoryDeviceGroupInfoKHR* = object

  DeviceGroupPresentCapabilitiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    presentMask*: uint32
    modes*: DeviceGroupPresentModeFlagsKHR
  DeviceGroupPresentModeFlagBitsKHR* {.size: sizeof(int32), pure.} = enum
    Local = 0x00000001 # Present from local memory
    Remote = 0x00000002 # Present from remote memory
    Sum = 0x00000004 # Present sum of local and/or remote memory
    LocalMultiDevice = 0x00000008 # Each physical device presents from local memory
  DeviceGroupPresentModeFlagsKHR* = distinct Flags

  AcquireNextImageInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    swapchain*: SwapchainKHR
    timeout*: uint64
    semaphore*: Semaphore
    fence*: Fence
    deviceMask*: uint32
  DeviceGroupSwapchainCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    modes*: DeviceGroupPresentModeFlagsKHR
  DeviceGroupPresentInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    swapchainCount*: uint32
    pDeviceMasks*: ptr uint32
    mode*: DeviceGroupPresentModeFlagBitsKHR
  ImageSwapchainCreateInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    swapchain*: SwapchainKHR
  BindImageMemorySwapchainInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    swapchain*: SwapchainKHR
    imageIndex*: uint32

const KhrDeviceGroupExtensionName* = "VK_KHR_device_group"
const KhrDeviceGroupSpecVersion* = 4
var # commands
  
  
  

const cmdSetDeviceMaskKHR* = cmdSetDeviceMask

const getDeviceGroupPeerMemoryFeaturesKHR* = getDeviceGroupPeerMemoryFeatures

const cmdDispatchBaseKHR* = cmdDispatchBase



var # commands
  getDeviceGroupPresentCapabilitiesKHRCage: proc(device: Device; pDeviceGroupPresentCapabilities: ptr DeviceGroupPresentCapabilitiesKHR;): Result {.cdecl.}
  getDeviceGroupSurfacePresentModesKHRCage: proc(device: Device; surface: SurfaceKHR; pModes: ptr DeviceGroupPresentModeFlagsKHR;): Result {.cdecl.}
  getPhysicalDevicePresentRectanglesKHRCage: proc(physicalDevice: PhysicalDevice; surface: SurfaceKHR; pRectCount: ptr uint32; pRects: ptr Rect2D;): Result {.cdecl.}

proc getDeviceGroupPresentCapabilitiesKHR*(
      device: Device;
      pDeviceGroupPresentCapabilities: ptr DeviceGroupPresentCapabilitiesKHR;
    ): Result {.cdecl, discardable.} =
  getDeviceGroupPresentCapabilitiesKHRCage(device,pDeviceGroupPresentCapabilities)

proc getDeviceGroupSurfacePresentModesKHR*(
      device: Device;
      surface: SurfaceKHR;
      pModes: ptr DeviceGroupPresentModeFlagsKHR;
    ): Result {.cdecl, discardable.} =
  getDeviceGroupSurfacePresentModesKHRCage(device,surface,pModes)

proc getPhysicalDevicePresentRectanglesKHR*(
      physicalDevice: PhysicalDevice;
      surface: SurfaceKHR;
      pRectCount: ptr uint32;
      pRects: ptr Rect2D;
    ): Result {.cdecl, discardable.} =
  getPhysicalDevicePresentRectanglesKHRCage(physicalDevice,surface,pRectCount,pRects)


var # commands
  acquireNextImage2KHRCage: proc(device: Device; pAcquireInfo: ptr AcquireNextImageInfoKHR; pImageIndex: ptr uint32;): Result {.cdecl.}

proc acquireNextImage2KHR*(
      device: Device;
      pAcquireInfo: ptr AcquireNextImageInfoKHR;
      pImageIndex: ptr uint32;
    ): Result {.cdecl, discardable.} =
  acquireNextImage2KHRCage(device,pAcquireInfo,pImageIndex)


proc loadVK_KHR_device_group*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdSetDeviceMaskKHRCage << "vkCmdSetDeviceMaskKHR"
  getDeviceGroupPeerMemoryFeaturesKHRCage << "vkGetDeviceGroupPeerMemoryFeaturesKHR"
  cmdDispatchBaseKHRCage << "vkCmdDispatchBaseKHR"

  getDeviceGroupPresentCapabilitiesKHRCage << "vkGetDeviceGroupPresentCapabilitiesKHR"
  getDeviceGroupSurfacePresentModesKHRCage << "vkGetDeviceGroupSurfacePresentModesKHR"
  getPhysicalDevicePresentRectanglesKHRCage << "vkGetPhysicalDevicePresentRectanglesKHR"

  acquireNextImage2KHRCage << "vkAcquireNextImage2KHR"