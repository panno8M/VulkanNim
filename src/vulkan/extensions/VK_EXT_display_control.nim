
import ../platform
import ../features/vk10
import VK_EXT_display_surface_counter
import VK_KHR_swapchain


type
  DisplayPowerInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    powerState*: DisplayPowerStateEXT
  DeviceEventTypeEXT* {.size: sizeof(int32), pure.} = enum
    DisplayHotplug = 0
  DisplayEventInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    displayEvent*: DisplayEventTypeEXT
  SwapchainCounterCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    surfaceCounters*: SurfaceCounterFlagsEXT
  DisplayPowerStateEXT* {.size: sizeof(int32), pure.} = enum
    Off = 0
    Suspend = 1
    On = 2
  DeviceEventInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    deviceEvent*: DeviceEventTypeEXT
  DisplayEventTypeEXT* {.size: sizeof(int32), pure.} = enum
    FirstPixelOut = 0

const ExtDisplayControlExtensionName* = "VK_EXT_display_control"
const ExtDisplayControlSpecVersion* = 1
var # commands
  displayPowerControlEXTCage: proc(device: Device; display: DisplayKHR; pDisplayPowerInfo: ptr DisplayPowerInfoEXT;): Result {.cdecl.}
  getSwapchainCounterEXTCage: proc(device: Device; swapchain: SwapchainKHR; counter: SurfaceCounterFlagBitsEXT; pCounterValue: ptr uint64;): Result {.cdecl.}
  registerDisplayEventEXTCage: proc(device: Device; display: DisplayKHR; pDisplayEventInfo: ptr DisplayEventInfoEXT; pAllocator: ptr AllocationCallbacks; pFence: ptr Fence;): Result {.cdecl.}
  registerDeviceEventEXTCage: proc(device: Device; pDeviceEventInfo: ptr DeviceEventInfoEXT; pAllocator: ptr AllocationCallbacks; pFence: ptr Fence;): Result {.cdecl.}

proc displayPowerControlEXT*(
      device: Device;
      display: DisplayKHR;
      pDisplayPowerInfo: ptr DisplayPowerInfoEXT;
    ): Result {.cdecl.} =
  displayPowerControlEXTCage(device,display,pDisplayPowerInfo)

proc getSwapchainCounterEXT*(
      device: Device;
      swapchain: SwapchainKHR;
      counter: SurfaceCounterFlagBitsEXT;
      pCounterValue: ptr uint64;
    ): Result {.cdecl.} =
  getSwapchainCounterEXTCage(device,swapchain,counter,pCounterValue)

proc registerDisplayEventEXT*(
      device: Device;
      display: DisplayKHR;
      pDisplayEventInfo: ptr DisplayEventInfoEXT;
      pAllocator: ptr AllocationCallbacks;
      pFence: ptr Fence;
    ): Result {.cdecl.} =
  registerDisplayEventEXTCage(device,display,pDisplayEventInfo,pAllocator,pFence)

proc registerDeviceEventEXT*(
      device: Device;
      pDeviceEventInfo: ptr DeviceEventInfoEXT;
      pAllocator: ptr AllocationCallbacks;
      pFence: ptr Fence;
    ): Result {.cdecl.} =
  registerDeviceEventEXTCage(device,pDeviceEventInfo,pAllocator,pFence)


proc loadVK_EXT_display_control*(instance: Instance) =
  instance.defineLoader(`<<`)

  displayPowerControlEXTCage << "vkDisplayPowerControlEXT"
  getSwapchainCounterEXTCage << "vkGetSwapchainCounterEXT"
  registerDisplayEventEXTCage << "vkRegisterDisplayEventEXT"
  registerDeviceEventEXTCage << "vkRegisterDeviceEventEXT"