
import ../platform
import ../features/vk10
import VK_EXT_display_surface_counter
import VK_KHR_swapchain


const
  ExtDisplayControlSpecVersion* = 1
  ExtDisplayControlExtensionName* = "VK_EXT_display_control"

type
  DisplayPowerStateEXT* {.size: sizeof(int32), pure.} = enum
    OffExt = 0
    SuspendExt = 1
    OnExt = 2
  DeviceEventTypeEXT* {.size: sizeof(int32), pure.} = enum
    DisplayHotplugExt = 0
  DisplayEventTypeEXT* {.size: sizeof(int32), pure.} = enum
    FirstPixelOutExt = 0
  DisplayPowerInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    powerState*: DisplayPowerStateEXT
  DeviceEventInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    deviceEvent*: DeviceEventTypeEXT
  DisplayEventInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    displayEvent*: DisplayEventTypeEXT
  SwapchainCounterCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    surfaceCounters*: SurfaceCounterFlagsEXT

var # commands
  displayPowerControlEXTCage: proc(device: Device; display: DisplayKHR; pDisplayPowerInfo: ptr DisplayPowerInfoEXT;): Result {.cdecl.}
  registerDeviceEventEXTCage: proc(device: Device; pDeviceEventInfo: ptr DeviceEventInfoEXT; pAllocator: ptr AllocationCallbacks; pFence: ptr Fence;): Result {.cdecl.}
  registerDisplayEventEXTCage: proc(device: Device; display: DisplayKHR; pDisplayEventInfo: ptr DisplayEventInfoEXT; pAllocator: ptr AllocationCallbacks; pFence: ptr Fence;): Result {.cdecl.}
  getSwapchainCounterEXTCage: proc(device: Device; swapchain: SwapchainKHR; counter: SurfaceCounterFlagBitsEXT; pCounterValue: ptr uint64;): Result {.cdecl.}
proc displayPowerControlEXT*(
      device: Device;
      display: DisplayKHR;
      pDisplayPowerInfo: ptr DisplayPowerInfoEXT;
    ): Result {.cdecl, discardable.} =
  displayPowerControlEXTCage(device,display,pDisplayPowerInfo)
proc registerDeviceEventEXT*(
      device: Device;
      pDeviceEventInfo: ptr DeviceEventInfoEXT;
      pAllocator: ptr AllocationCallbacks;
      pFence: ptr Fence;
    ): Result {.cdecl, discardable.} =
  registerDeviceEventEXTCage(device,pDeviceEventInfo,pAllocator,pFence)
proc registerDisplayEventEXT*(
      device: Device;
      display: DisplayKHR;
      pDisplayEventInfo: ptr DisplayEventInfoEXT;
      pAllocator: ptr AllocationCallbacks;
      pFence: ptr Fence;
    ): Result {.cdecl, discardable.} =
  registerDisplayEventEXTCage(device,display,pDisplayEventInfo,pAllocator,pFence)
proc getSwapchainCounterEXT*(
      device: Device;
      swapchain: SwapchainKHR;
      counter: SurfaceCounterFlagBitsEXT;
      pCounterValue: ptr uint64;
    ): Result {.cdecl, discardable.} =
  getSwapchainCounterEXTCage(device,swapchain,counter,pCounterValue)
proc loadVK_EXT_display_control*(instance: Instance) =
  instance.defineLoader(`<<`)

  displayPowerControlEXTCage << "vkDisplayPowerControlEXT"
  registerDeviceEventEXTCage << "vkRegisterDeviceEventEXT"
  registerDisplayEventEXTCage << "vkRegisterDisplayEventEXT"
  getSwapchainCounterEXTCage << "vkGetSwapchainCounterEXT"