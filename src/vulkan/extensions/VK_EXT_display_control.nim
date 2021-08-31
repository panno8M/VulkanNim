# Generated at 2021-08-31T01:03:35Z
# VK_EXT_display_control


import ../platform
import ../features/vk10
import ./VK_EXT_display_surface_counter
import ./VK_KHR_swapchain
export VK_EXT_display_surface_counter
export VK_KHR_swapchain

const
  ExtDisplayControlSpecVersion* = 1
  ExtDisplayControlExtensionName* = "VK_EXT_display_control"

type # enums and bitmasks
  DisplayPowerStateEXT* {.size: sizeof(int32), pure.} = enum
    offExt = 0
    suspendExt = 1
    onExt = 2
  DeviceEventTypeEXT* {.size: sizeof(int32), pure.} = enum
    displayHotplugExt = 0
  DisplayEventTypeEXT* {.size: sizeof(int32), pure.} = enum
    firstPixelOutExt = 0

type
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

var # command cages
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