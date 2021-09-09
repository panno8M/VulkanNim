# Generated at 2021-09-09T01:49:36Z
# VK_EXT_calibrated_timestamps


import ../platform
import ../features/vk10

const
  ExtCalibratedTimestampsSpecVersion* = 1
  ExtCalibratedTimestampsExtensionName* = "VK_EXT_calibrated_timestamps"

type # enums and bitmasks
  TimeDomainEXT* {.size: sizeof(int32), pure.} = enum
    deviceExt = 0
    clockMonotonicExt = 1
    clockMonotonicRawExt = 2
    queryPerformanceCounterExt = 3

type
  CalibratedTimestampInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    timeDomain*: TimeDomainEXT

proc getPhysicalDeviceCalibrateableTimeDomainsEXT*(
      physicalDevice: PhysicalDevice;
      pTimeDomainCount: ptr uint32;
      pTimeDomains: ptr TimeDomainEXT;
    ): Result {.cdecl, lazyload("vkGetPhysicalDeviceCalibrateableTimeDomainsEXT", InstanceLevel).}
proc getCalibratedTimestampsEXT*(
      device: Device;
      timestampCount: uint32;
      pTimestampInfos: ptr CalibratedTimestampInfoEXT;
      pTimestamps: ptr uint64;
      pMaxDeviation: ptr uint64;
    ): Result {.cdecl, lazyload("vkGetCalibratedTimestampsEXT", DeviceLevel).}

proc loadAllVK_EXT_calibrated_timestamps*(instance: Instance) =
  getPhysicalDeviceCalibrateableTimeDomainsEXT.smartLoad(instance)
  getCalibratedTimestampsEXT.smartLoad(instance)

proc loadVK_EXT_calibrated_timestamps*(instance: Instance) =
  getPhysicalDeviceCalibrateableTimeDomainsEXT.smartLoad(instance)

proc loadVK_EXT_calibrated_timestamps*(device: Device) =
  getCalibratedTimestampsEXT.smartLoad(device)

