# Generated at 2021-08-31T01:03:35Z
# VK_KHR_pipeline_executable_properties


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  KhrPipelineExecutablePropertiesSpecVersion* = 1
  KhrPipelineExecutablePropertiesExtensionName* = "VK_KHR_pipeline_executable_properties"
  MaxDescriptionSize* = 256

type # enums and bitmasks
  PipelineExecutableStatisticFormatKHR* {.size: sizeof(int32), pure.} = enum
    bool32Khr = 0
    int64Khr = 1
    uint64Khr = 2
    float64Khr = 3

type
  PhysicalDevicePipelineExecutablePropertiesFeaturesKHR* = object
    sType*: StructureType
    pNext*: pointer
    pipelineExecutableInfo*: Bool32
  PipelineInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    pipeline*: Pipeline
  PipelineExecutablePropertiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    stages*: ShaderStageFlags
    name*: array[MaxDescriptionSize, char]
    description*: array[MaxDescriptionSize, char]
    subgroupSize*: uint32
  PipelineExecutableInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    pipeline*: Pipeline
    executableIndex*: uint32
  PipelineExecutableStatisticValueKHR* {.union.} = object
    b32*: Bool32
    i64*: int64
    u64*: uint64
    f64*: float64
  PipelineExecutableStatisticKHR* = object
    sType*: StructureType
    pNext*: pointer
    name*: array[MaxDescriptionSize, char]
    description*: array[MaxDescriptionSize, char]
    format*: PipelineExecutableStatisticFormatKHR
    value*: PipelineExecutableStatisticValueKHR
  PipelineExecutableInternalRepresentationKHR* = object
    sType*: StructureType
    pNext*: pointer
    name*: array[MaxDescriptionSize, char]
    description*: array[MaxDescriptionSize, char]
    isText*: Bool32
    dataSize*: uint
    pData*: pointer

var # command cages
  getPipelineExecutablePropertiesKHRCage: proc(device: Device; pPipelineInfo: ptr PipelineInfoKHR; pExecutableCount: ptr uint32; pProperties: ptr PipelineExecutablePropertiesKHR;): Result {.cdecl.}
  getPipelineExecutableStatisticsKHRCage: proc(device: Device; pExecutableInfo: ptr PipelineExecutableInfoKHR; pStatisticCount: ptr uint32; pStatistics: ptr PipelineExecutableStatisticKHR;): Result {.cdecl.}
  getPipelineExecutableInternalRepresentationsKHRCage: proc(device: Device; pExecutableInfo: ptr PipelineExecutableInfoKHR; pInternalRepresentationCount: ptr uint32; pInternalRepresentations: ptr PipelineExecutableInternalRepresentationKHR;): Result {.cdecl.}
proc getPipelineExecutablePropertiesKHR*(
      device: Device;
      pPipelineInfo: ptr PipelineInfoKHR;
      pExecutableCount: ptr uint32;
      pProperties: ptr PipelineExecutablePropertiesKHR;
    ): Result {.cdecl, discardable.} =
  getPipelineExecutablePropertiesKHRCage(device,pPipelineInfo,pExecutableCount,pProperties)
proc getPipelineExecutableStatisticsKHR*(
      device: Device;
      pExecutableInfo: ptr PipelineExecutableInfoKHR;
      pStatisticCount: ptr uint32;
      pStatistics: ptr PipelineExecutableStatisticKHR;
    ): Result {.cdecl, discardable.} =
  getPipelineExecutableStatisticsKHRCage(device,pExecutableInfo,pStatisticCount,pStatistics)
proc getPipelineExecutableInternalRepresentationsKHR*(
      device: Device;
      pExecutableInfo: ptr PipelineExecutableInfoKHR;
      pInternalRepresentationCount: ptr uint32;
      pInternalRepresentations: ptr PipelineExecutableInternalRepresentationKHR;
    ): Result {.cdecl, discardable.} =
  getPipelineExecutableInternalRepresentationsKHRCage(device,pExecutableInfo,pInternalRepresentationCount,pInternalRepresentations)
proc loadVK_KHR_pipeline_executable_properties*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPipelineExecutablePropertiesKHRCage << "vkGetPipelineExecutablePropertiesKHR"
  getPipelineExecutableStatisticsKHRCage << "vkGetPipelineExecutableStatisticsKHR"
  getPipelineExecutableInternalRepresentationsKHRCage << "vkGetPipelineExecutableInternalRepresentationsKHR"