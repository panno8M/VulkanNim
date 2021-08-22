
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  PipelineExecutablePropertiesKHR* = object
    sType*: StructureType
    pNext*: pointer
    stages*: ShaderStageFlags
    name*: char
    description*: char
    subgroupSize*: uint32
  PipelineExecutableStatisticValueKHR* {.union.} = object
    b32*: Bool32
    i64*: int64
    u64*: uint64
    f64*: float64
  PipelineExecutableStatisticFormatKHR* {.size: sizeof(int32), pure.} = enum
    Bool32 = 0
    Int64 = 1
    Uint64 = 2
    Float64 = 3
  PipelineExecutableInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    pipeline*: Pipeline
    executableIndex*: uint32
  PipelineExecutableStatisticKHR* = object
    sType*: StructureType
    pNext*: pointer
    name*: char
    description*: char
    format*: PipelineExecutableStatisticFormatKHR
    value*: PipelineExecutableStatisticValueKHR
  PipelineInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    pipeline*: Pipeline
  PhysicalDevicePipelineExecutablePropertiesFeaturesKHR* = object
    sType*: StructureType
    pNext*: pointer
    pipelineExecutableInfo*: Bool32
  PipelineExecutableInternalRepresentationKHR* = object
    sType*: StructureType
    pNext*: pointer
    name*: char
    description*: char
    isText*: Bool32
    dataSize*: uint
    pData*: pointer

const KhrPipelineExecutablePropertiesExtensionName* = "VK_KHR_pipeline_executable_properties"
const KhrPipelineExecutablePropertiesSpecVersion* = 1
var # commands
  getPipelineExecutableStatisticsKHRCage: proc(device: Device; pExecutableInfo: ptr PipelineExecutableInfoKHR; pStatisticCount: ptr uint32; pStatistics: ptr PipelineExecutableStatisticKHR;): Result {.cdecl.}
  getPipelineExecutableInternalRepresentationsKHRCage: proc(device: Device; pExecutableInfo: ptr PipelineExecutableInfoKHR; pInternalRepresentationCount: ptr uint32; pInternalRepresentations: ptr PipelineExecutableInternalRepresentationKHR;): Result {.cdecl.}
  getPipelineExecutablePropertiesKHRCage: proc(device: Device; pPipelineInfo: ptr PipelineInfoKHR; pExecutableCount: ptr uint32; pProperties: ptr PipelineExecutablePropertiesKHR;): Result {.cdecl.}

proc getPipelineExecutableStatisticsKHR*(
      device: Device;
      pExecutableInfo: ptr PipelineExecutableInfoKHR;
      pStatisticCount: ptr uint32;
      pStatistics: ptr PipelineExecutableStatisticKHR;
    ): Result {.cdecl.} =
  getPipelineExecutableStatisticsKHRCage(device,pExecutableInfo,pStatisticCount,pStatistics)

proc getPipelineExecutableInternalRepresentationsKHR*(
      device: Device;
      pExecutableInfo: ptr PipelineExecutableInfoKHR;
      pInternalRepresentationCount: ptr uint32;
      pInternalRepresentations: ptr PipelineExecutableInternalRepresentationKHR;
    ): Result {.cdecl.} =
  getPipelineExecutableInternalRepresentationsKHRCage(device,pExecutableInfo,pInternalRepresentationCount,pInternalRepresentations)

proc getPipelineExecutablePropertiesKHR*(
      device: Device;
      pPipelineInfo: ptr PipelineInfoKHR;
      pExecutableCount: ptr uint32;
      pProperties: ptr PipelineExecutablePropertiesKHR;
    ): Result {.cdecl.} =
  getPipelineExecutablePropertiesKHRCage(device,pPipelineInfo,pExecutableCount,pProperties)


proc loadVK_KHR_pipeline_executable_properties*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPipelineExecutableStatisticsKHRCage << "vkGetPipelineExecutableStatisticsKHR"
  getPipelineExecutableInternalRepresentationsKHRCage << "vkGetPipelineExecutableInternalRepresentationsKHR"
  getPipelineExecutablePropertiesKHRCage << "vkGetPipelineExecutablePropertiesKHR"