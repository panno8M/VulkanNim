# Generated at 2021-08-30T22:51:48Z
# VK_EXT_calibrated_timestamps


import ../platform
import ../features/vk10

const
  ExtCalibratedTimestampsSpecVersion* = 1
  ExtCalibratedTimestampsExtensionName* = "VK_EXT_calibrated_timestamps"

type
  TimeDomainEXT* {.size: sizeof(int32), pure.} = enum
    deviceExt = 0
    clockMonotonicExt = 1
    clockMonotonicRawExt = 2
    queryPerformanceCounterExt = 3
  CalibratedTimestampInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    timeDomain*: TimeDomainEXT

var # command cages
  getPhysicalDeviceCalibrateableTimeDomainsEXTCage: proc(physicalDevice: PhysicalDevice; pTimeDomainCount: ptr uint32; pTimeDomains: ptr TimeDomainEXT;): Result {.cdecl.}
  getCalibratedTimestampsEXTCage: proc(device: Device; timestampCount: uint32; pTimestampInfos: ptr CalibratedTimestampInfoEXT; pTimestamps: ptr uint64; pMaxDeviation: ptr uint64;): Result {.cdecl.}
proc getPhysicalDeviceCalibrateableTimeDomainsEXT*(
      physicalDevice: PhysicalDevice;
      pTimeDomainCount: ptr uint32;
      pTimeDomains: ptr TimeDomainEXT;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceCalibrateableTimeDomainsEXTCage(physicalDevice,pTimeDomainCount,pTimeDomains)
proc getCalibratedTimestampsEXT*(
      device: Device;
      timestampCount: uint32;
      pTimestampInfos: ptr CalibratedTimestampInfoEXT;
      pTimestamps: ptr uint64;
      pMaxDeviation: ptr uint64;
    ): Result {.cdecl, discardable.} =
  getCalibratedTimestampsEXTCage(device,timestampCount,pTimestampInfos,pTimestamps,pMaxDeviation)
proc loadVK_EXT_calibrated_timestamps*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceCalibrateableTimeDomainsEXTCage << "vkGetPhysicalDeviceCalibrateableTimeDomainsEXT"
  getCalibratedTimestampsEXTCage << "vkGetCalibratedTimestampsEXT"