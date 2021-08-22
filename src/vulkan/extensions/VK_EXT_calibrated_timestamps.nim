
import ../platform
import ../features/vk10


type
  CalibratedTimestampInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    timeDomain*: TimeDomainEXT
  TimeDomainEXT* {.size: sizeof(int32), pure.} = enum
    Device = 0
    ClockMonotonic = 1
    ClockMonotonicRaw = 2
    QueryPerformanceCounter = 3

const ExtCalibratedTimestampsSpecVersion* = 1
const ExtCalibratedTimestampsExtensionName* = "VK_EXT_calibrated_timestamps"
var # commands
  getPhysicalDeviceCalibrateableTimeDomainsEXTCage: proc(physicalDevice: PhysicalDevice; pTimeDomainCount: ptr uint32; pTimeDomains: ptr TimeDomainEXT;): Result {.cdecl.}
  getCalibratedTimestampsEXTCage: proc(device: Device; timestampCount: uint32; pTimestampInfos: ptr CalibratedTimestampInfoEXT; pTimestamps: ptr uint64; pMaxDeviation: ptr uint64;): Result {.cdecl.}

proc getPhysicalDeviceCalibrateableTimeDomainsEXT*(
      physicalDevice: PhysicalDevice;
      pTimeDomainCount: ptr uint32;
      pTimeDomains: ptr TimeDomainEXT;
    ): Result {.cdecl.} =
  getPhysicalDeviceCalibrateableTimeDomainsEXTCage(physicalDevice,pTimeDomainCount,pTimeDomains)

proc getCalibratedTimestampsEXT*(
      device: Device;
      timestampCount: uint32;
      pTimestampInfos: ptr CalibratedTimestampInfoEXT;
      pTimestamps: ptr uint64;
      pMaxDeviation: ptr uint64;
    ): Result {.cdecl.} =
  getCalibratedTimestampsEXTCage(device,timestampCount,pTimestampInfos,pTimestamps,pMaxDeviation)


proc loadVK_EXT_calibrated_timestamps*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceCalibrateableTimeDomainsEXTCage << "vkGetPhysicalDeviceCalibrateableTimeDomainsEXT"
  getCalibratedTimestampsEXTCage << "vkGetCalibratedTimestampsEXT"