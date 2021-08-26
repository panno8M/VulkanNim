
import ../platform
import ../features/vk10




type
  TimeDomainEXT* {.size: sizeof(int32), pure.} = enum
    DeviceExt = 0
    ClockMonotonicExt = 1
    ClockMonotonicRawExt = 2
    QueryPerformanceCounterExt = 3
  CalibratedTimestampInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    timeDomain*: TimeDomainEXT

var # commands
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