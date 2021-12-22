# Generated at 2021-12-22T14:50:02Z
# VK_EXT_display_control

import ../platform
import ../features/vk10
import ./VK_EXT_display_surface_counter
import ./VK_KHR_swapchain
export VK_EXT_display_surface_counter
export VK_KHR_swapchain

prepareVulkanLibDef()

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
    sType* {.constant: (StructureType.displayPowerInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    powerState*: DisplayPowerStateEXT
  DeviceEventInfoEXT* = object
    sType* {.constant: (StructureType.deviceEventInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    deviceEvent*: DeviceEventTypeEXT
  DisplayEventInfoEXT* = object
    sType* {.constant: (StructureType.displayEventInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    displayEvent*: DisplayEventTypeEXT
  SwapchainCounterCreateInfoEXT* = object
    sType* {.constant: (StructureType.swapchainCounterCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    surfaceCounters* {.optional.}: SurfaceCounterFlagsEXT

proc displayPowerControlEXT*(
      device: Device;
      display: DisplayKHR;
      pDisplayPowerInfo: ptr DisplayPowerInfoEXT;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory),
      lazyload("vkDisplayPowerControlEXT", DeviceLevel).}
proc registerDeviceEventEXT*(
      device: Device;
      pDeviceEventInfo: ptr DeviceEventInfoEXT;
      pAllocator = default(ptr AllocationCallbacks);
      pFence: ptr Fence;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory),
      lazyload("vkRegisterDeviceEventEXT", DeviceLevel).}
proc registerDisplayEventEXT*(
      device: Device;
      display: DisplayKHR;
      pDisplayEventInfo: ptr DisplayEventInfoEXT;
      pAllocator = default(ptr AllocationCallbacks);
      pFence: ptr Fence;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory),
      lazyload("vkRegisterDisplayEventEXT", DeviceLevel).}
proc getSwapchainCounterEXT*(
      device: Device;
      swapchain: SwapchainKHR;
      counter: SurfaceCounterFlagBitsEXT;
      pCounterValue: ptr uint64;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorDeviceLost, errorOutOfDateKhr),
      lazyload("vkGetSwapchainCounterEXT", DeviceLevel).}

proc loadAllVK_EXT_display_control*(instance: Instance) =
  instance.loadCommand displayPowerControlEXT
  instance.loadCommand registerDeviceEventEXT
  instance.loadCommand registerDisplayEventEXT
  instance.loadCommand getSwapchainCounterEXT

proc loadVK_EXT_display_control*(device: Device) =
  device.loadCommand displayPowerControlEXT
  device.loadCommand registerDeviceEventEXT
  device.loadCommand registerDisplayEventEXT
  device.loadCommand getSwapchainCounterEXT

