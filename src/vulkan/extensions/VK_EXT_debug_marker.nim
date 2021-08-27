# Generated at 2021-08-27T06:01:02Z
# VK_EXT_debug_marker
# =================================

import ../platform
import ../features/vk10
import VK_EXT_debug_report


const
  ExtDebugMarkerSpecVersion* = 4
  ExtDebugMarkerExtensionName* = "VK_EXT_debug_marker"

type
  DebugReportObjectTypeEXT* {.size: sizeof(int32), pure.} = enum
    UnknownExt = 0
    InstanceExt = 1
    PhysicalDeviceExt = 2
    DeviceExt = 3
    QueueExt = 4
    SemaphoreExt = 5
    CommandBufferExt = 6
    FenceExt = 7
    DeviceMemoryExt = 8
    BufferExt = 9
    ImageExt = 10
    EventExt = 11
    QueryPoolExt = 12
    BufferViewExt = 13
    ImageViewExt = 14
    ShaderModuleExt = 15
    PipelineCacheExt = 16
    PipelineLayoutExt = 17
    RenderPassExt = 18
    PipelineExt = 19
    DescriptorSetLayoutExt = 20
    SamplerExt = 21
    DescriptorPoolExt = 22
    DescriptorSetExt = 23
    FramebufferExt = 24
    CommandPoolExt = 25
    SurfaceKhrExt = 26
    SwapchainKhrExt = 27
    DebugReportCallbackExtExt = 28
    DisplayKhrExt = 29
    DisplayModeKhrExt = 30
    ValidationCacheExtExt = 33
    # Provided by VK_EXT_debug_report
    DescriptorUpdateTemplateExt = 100000850000
    # Provided by VK_EXT_debug_report
    SamplerYcbcrConversionExt = 100001560000
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureKhrExt = 100001650000
  DebugMarkerObjectNameInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    objectType*: DebugReportObjectTypeEXT
    object*: uint64
    pObjectName*: cstring
  DebugMarkerObjectTagInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    objectType*: DebugReportObjectTypeEXT
    object*: uint64
    tagName*: uint64
    tagSize*: uint
    pTag*: pointer
  DebugMarkerMarkerInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    pMarkerName*: cstring
    color*: array[4, float32]

DebugReportObjectTypeEXT.defineAliases:
  DebugReportCallbackExtExt as DebugReportExt # Backwards-compatible alias containing a typo
  ValidationCacheExtExt as ValidationCacheExt # Backwards-compatible alias containing a typo
  # Provided by VK_KHR_descriptor_update_template
  DescriptorUpdateTemplateExt as DescriptorUpdateTemplateKhrExt
  # Provided by VK_KHR_sampler_ycbcr_conversion
  SamplerYcbcrConversionExt as SamplerYcbcrConversionKhrExt
  # Provided by VK_NV_ray_tracing
  AccelerationStructureKhrExt as AccelerationStructureNvExt

var # commands
  debugMarkerSetObjectTagEXTCage: proc(device: Device; pTagInfo: ptr DebugMarkerObjectTagInfoEXT;): Result {.cdecl.}
  debugMarkerSetObjectNameEXTCage: proc(device: Device; pNameInfo: ptr DebugMarkerObjectNameInfoEXT;): Result {.cdecl.}
  cmdDebugMarkerBeginEXTCage: proc(commandBuffer: CommandBuffer; pMarkerInfo: ptr DebugMarkerMarkerInfoEXT;): void {.cdecl.}
  cmdDebugMarkerEndEXTCage: proc(commandBuffer: CommandBuffer;): void {.cdecl.}
  cmdDebugMarkerInsertEXTCage: proc(commandBuffer: CommandBuffer; pMarkerInfo: ptr DebugMarkerMarkerInfoEXT;): void {.cdecl.}
proc debugMarkerSetObjectTagEXT*(
      device: Device;
      pTagInfo: ptr DebugMarkerObjectTagInfoEXT;
    ): Result {.cdecl, discardable.} =
  debugMarkerSetObjectTagEXTCage(device,pTagInfo)
proc debugMarkerSetObjectNameEXT*(
      device: Device;
      pNameInfo: ptr DebugMarkerObjectNameInfoEXT;
    ): Result {.cdecl, discardable.} =
  debugMarkerSetObjectNameEXTCage(device,pNameInfo)
proc cmdDebugMarkerBeginEXT*(
      commandBuffer: CommandBuffer;
      pMarkerInfo: ptr DebugMarkerMarkerInfoEXT;
    ): void {.cdecl.} =
  cmdDebugMarkerBeginEXTCage(commandBuffer,pMarkerInfo)
proc cmdDebugMarkerEndEXT*(
      commandBuffer: CommandBuffer;
    ): void {.cdecl.} =
  cmdDebugMarkerEndEXTCage(commandBuffer)
proc cmdDebugMarkerInsertEXT*(
      commandBuffer: CommandBuffer;
      pMarkerInfo: ptr DebugMarkerMarkerInfoEXT;
    ): void {.cdecl.} =
  cmdDebugMarkerInsertEXTCage(commandBuffer,pMarkerInfo)
proc loadVK_EXT_debug_marker*(instance: Instance) =
  instance.defineLoader(`<<`)

  debugMarkerSetObjectTagEXTCage << "vkDebugMarkerSetObjectTagEXT"
  debugMarkerSetObjectNameEXTCage << "vkDebugMarkerSetObjectNameEXT"
  cmdDebugMarkerBeginEXTCage << "vkCmdDebugMarkerBeginEXT"
  cmdDebugMarkerEndEXTCage << "vkCmdDebugMarkerEndEXT"
  cmdDebugMarkerInsertEXTCage << "vkCmdDebugMarkerInsertEXT"