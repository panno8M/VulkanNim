# Generated at 2021-12-25T07:50:19Z
# VK_KHR_pipeline_executable_properties

import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

prepareVulkanLibDef()

const
  KhrPipelineExecutablePropertiesSpecVersion* = 1
  KhrPipelineExecutablePropertiesExtensionName* = "VK_KHR_pipeline_executable_properties"
  MaxDescriptionSize* = 256

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
    pData* {.optional, length: dataSize.}: pointer

proc getPipelineExecutablePropertiesKHR*(
      device: Device;
      pPipelineInfo: ptr PipelineInfoKHR;
      pExecutableCount: ptr uint32;
      pProperties {.length: pExecutableCount.} = default(arrPtr[PipelineExecutablePropertiesKHR]);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkGetPipelineExecutablePropertiesKHR", DeviceLevel).}
proc getPipelineExecutableStatisticsKHR*(
      device: Device;
      pExecutableInfo: ptr PipelineExecutableInfoKHR;
      pStatisticCount: ptr uint32;
      pStatistics {.length: pStatisticCount.} = default(arrPtr[PipelineExecutableStatisticKHR]);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkGetPipelineExecutableStatisticsKHR", DeviceLevel).}
proc getPipelineExecutableInternalRepresentationsKHR*(
      device: Device;
      pExecutableInfo: ptr PipelineExecutableInfoKHR;
      pInternalRepresentationCount: ptr uint32;
      pInternalRepresentations {.length: pInternalRepresentationCount.} = default(arrPtr[PipelineExecutableInternalRepresentationKHR]);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkGetPipelineExecutableInternalRepresentationsKHR", DeviceLevel).}

proc loadAllVK_KHR_pipeline_executable_properties*(instance: Instance) =
  instance.loadCommand getPipelineExecutablePropertiesKHR
  instance.loadCommand getPipelineExecutableStatisticsKHR
  instance.loadCommand getPipelineExecutableInternalRepresentationsKHR

proc loadVK_KHR_pipeline_executable_properties*(device: Device) =
  device.loadCommand getPipelineExecutablePropertiesKHR
  device.loadCommand getPipelineExecutableStatisticsKHR
  device.loadCommand getPipelineExecutableInternalRepresentationsKHR

