# Generated at 2021-09-12T04:58:23Z
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
    sType* {.constant: (StructureType.physicalDevicePipelineExecutablePropertiesFeaturesKhr).}: StructureType
    pNext* {.optional.}: pointer
    pipelineExecutableInfo*: Bool32
  PipelineInfoKHR* = object
    sType* {.constant: (StructureType.pipelineInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    pipeline*: Pipeline
  PipelineExecutablePropertiesKHR* = object
    sType* {.constant: (StructureType.pipelineExecutablePropertiesKhr).}: StructureType
    pNext* {.optional.}: pointer
    stages*: ShaderStageFlags
    name*: array[MaxDescriptionSize, char]
    description*: array[MaxDescriptionSize, char]
    subgroupSize*: uint32
  PipelineExecutableInfoKHR* = object
    sType* {.constant: (StructureType.pipelineExecutableInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    pipeline*: Pipeline
    executableIndex*: uint32
  PipelineExecutableStatisticValueKHR* {.union.} = object
    b32*: Bool32
    i64*: int64
    u64*: uint64
    f64*: float64
  PipelineExecutableStatisticKHR* = object
    sType* {.constant: (StructureType.pipelineExecutableStatisticKhr).}: StructureType
    pNext* {.optional.}: pointer
    name*: array[MaxDescriptionSize, char]
    description*: array[MaxDescriptionSize, char]
    format*: PipelineExecutableStatisticFormatKHR
    value*: PipelineExecutableStatisticValueKHR
  PipelineExecutableInternalRepresentationKHR* = object
    sType* {.constant: (StructureType.pipelineExecutableInternalRepresentationKhr).}: StructureType
    pNext* {.optional.}: pointer
    name*: array[MaxDescriptionSize, char]
    description*: array[MaxDescriptionSize, char]
    isText*: Bool32
    dataSize* {.optional.}: uint
    pData* {.optional.}: pointer

proc getPipelineExecutablePropertiesKHR*(
      device: Device;
      pPipelineInfo: ptr PipelineInfoKHR;
      pExecutableCount: ptr uint32;
      pProperties: ptr PipelineExecutablePropertiesKHR;
    ): Result {.cdecl, lazyload("vkGetPipelineExecutablePropertiesKHR", DeviceLevel).}
proc getPipelineExecutableStatisticsKHR*(
      device: Device;
      pExecutableInfo: ptr PipelineExecutableInfoKHR;
      pStatisticCount: ptr uint32;
      pStatistics: ptr PipelineExecutableStatisticKHR;
    ): Result {.cdecl, lazyload("vkGetPipelineExecutableStatisticsKHR", DeviceLevel).}
proc getPipelineExecutableInternalRepresentationsKHR*(
      device: Device;
      pExecutableInfo: ptr PipelineExecutableInfoKHR;
      pInternalRepresentationCount: ptr uint32;
      pInternalRepresentations: ptr PipelineExecutableInternalRepresentationKHR;
    ): Result {.cdecl, lazyload("vkGetPipelineExecutableInternalRepresentationsKHR", DeviceLevel).}

proc loadAllVK_KHR_pipeline_executable_properties*(instance: Instance) =
  getPipelineExecutablePropertiesKHR.load(instance)
  getPipelineExecutableStatisticsKHR.load(instance)
  getPipelineExecutableInternalRepresentationsKHR.load(instance)

proc loadVK_KHR_pipeline_executable_properties*(device: Device) =
  getPipelineExecutablePropertiesKHR.load(device)
  getPipelineExecutableStatisticsKHR.load(device)
  getPipelineExecutableInternalRepresentationsKHR.load(device)

