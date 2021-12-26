# Generated at 2021-12-26T16:57:02Z
# VK_NV_device_generated_commands

import ../platform

import ../features/vk11
import ./VK_KHR_buffer_device_address
export VK_KHR_buffer_device_address
prepareVulkanLibDef()

const
  NvDeviceGeneratedCommandsSpecVersion* = 3
  NvDeviceGeneratedCommandsExtensionName* = "VK_NV_device_generated_commands"

type
  PhysicalDeviceDeviceGeneratedCommandsPropertiesNV* = object
    sType* {.constant: (StructureType.physicalDeviceDeviceGeneratedCommandsPropertiesNv).}: StructureType
    pNext* {.optional.}: pointer
    maxGraphicsShaderGroupCount*: uint32
    maxIndirectSequenceCount*: uint32
    maxIndirectCommandsTokenCount*: uint32
    maxIndirectCommandsStreamCount*: uint32
    maxIndirectCommandsTokenOffset*: uint32
    maxIndirectCommandsStreamStride*: uint32
    minSequencesCountBufferOffsetAlignment*: uint32
    minSequencesIndexBufferOffsetAlignment*: uint32
    minIndirectCommandsBufferOffsetAlignment*: uint32
  PhysicalDeviceDeviceGeneratedCommandsFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceDeviceGeneratedCommandsFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    deviceGeneratedCommands*: Bool32
  GraphicsShaderGroupCreateInfoNV* = object
    sType* {.constant: (StructureType.graphicsShaderGroupCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    stageCount*: uint32
    pStages* {.length: stageCount.}: arrPtr[PipelineShaderStageCreateInfo]
    pVertexInputState* {.optional.}: ptr PipelineVertexInputStateCreateInfo
    pTessellationState* {.optional.}: ptr PipelineTessellationStateCreateInfo
  GraphicsPipelineShaderGroupsCreateInfoNV* = object
    sType* {.constant: (StructureType.graphicsPipelineShaderGroupsCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    groupCount*: uint32
    pGroups* {.length: groupCount.}: arrPtr[GraphicsShaderGroupCreateInfoNV]
    pipelineCount* {.optional.}: uint32
    pPipelines* {.length: pipelineCount.}: arrPtr[Pipeline]
  BindShaderGroupIndirectCommandNV* = object
    groupIndex*: uint32
  BindIndexBufferIndirectCommandNV* = object
    bufferAddress*: DeviceAddress
    size*: uint32
    indexType*: IndexType
  BindVertexBufferIndirectCommandNV* = object
    bufferAddress*: DeviceAddress
    size*: uint32
    stride*: uint32
  SetStateFlagsIndirectCommandNV* = object
    data*: uint32
  IndirectCommandsStreamNV* = object
    buffer*: Buffer
    offset*: DeviceSize
  IndirectCommandsLayoutTokenNV* = object
    sType* {.constant: (StructureType.indirectCommandsLayoutTokenNv).}: StructureType
    pNext* {.optional.}: pointer
    tokenType*: IndirectCommandsTokenTypeNV
    stream*: uint32
    offset*: uint32
    vertexBindingUnit*: uint32
    vertexDynamicStride*: Bool32
    pushconstantPipelineLayout* {.optional.}: PipelineLayout
    pushconstantShaderStageFlags* {.optional.}: ShaderStageFlags
    pushconstantOffset*: uint32
    pushconstantSize*: uint32
    indirectStateFlags* {.optional.}: IndirectStateFlagsNV
    indexTypeCount* {.optional.}: uint32
    pIndexTypes* {.length: indexTypeCount.}: arrPtr[IndexType]
    pIndexTypeValues* {.length: indexTypeCount.}: arrPtr[uint32]
  IndirectCommandsLayoutCreateInfoNV* = object
    sType* {.constant: (StructureType.indirectCommandsLayoutCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: IndirectCommandsLayoutUsageFlagsNV
    pipelineBindPoint*: PipelineBindPoint
    tokenCount*: uint32
    pTokens* {.length: tokenCount.}: arrPtr[IndirectCommandsLayoutTokenNV]
    streamCount*: uint32
    pStreamStrides* {.length: streamCount.}: arrPtr[uint32]
  GeneratedCommandsInfoNV* = object
    sType* {.constant: (StructureType.generatedCommandsInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    pipelineBindPoint*: PipelineBindPoint
    pipeline*: Pipeline
    indirectCommandsLayout*: IndirectCommandsLayoutNV
    streamCount*: uint32
    pStreams* {.length: streamCount.}: arrPtr[IndirectCommandsStreamNV]
    sequencesCount*: uint32
    preprocessBuffer*: Buffer
    preprocessOffset*: DeviceSize
    preprocessSize*: DeviceSize
    sequencesCountBuffer* {.optional.}: Buffer
    sequencesCountOffset*: DeviceSize
    sequencesIndexBuffer* {.optional.}: Buffer
    sequencesIndexOffset*: DeviceSize
  GeneratedCommandsMemoryRequirementsInfoNV* = object
    sType* {.constant: (StructureType.generatedCommandsMemoryRequirementsInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    pipelineBindPoint*: PipelineBindPoint
    pipeline*: Pipeline
    indirectCommandsLayout*: IndirectCommandsLayoutNV
    maxSequencesCount*: uint32

proc getGeneratedCommandsMemoryRequirementsNV*(
      device: Device;
      pInfo: ptr GeneratedCommandsMemoryRequirementsInfoNV;
      pMemoryRequirements: ptr MemoryRequirements2;
    ): void {.cdecl, lazyload("vkGetGeneratedCommandsMemoryRequirementsNV", DeviceLevel).}
proc cmdPreprocessGeneratedCommandsNV*(
      commandBuffer: CommandBuffer;
      pGeneratedCommandsInfo: ptr GeneratedCommandsInfoNV;
    ): void {.cdecl, lazyload("vkCmdPreprocessGeneratedCommandsNV", DeviceLevel).}
proc cmdExecuteGeneratedCommandsNV*(
      commandBuffer: CommandBuffer;
      isPreprocessed: Bool32;
      pGeneratedCommandsInfo: ptr GeneratedCommandsInfoNV;
    ): void {.cdecl, lazyload("vkCmdExecuteGeneratedCommandsNV", DeviceLevel).}
proc cmdBindPipelineShaderGroupNV*(
      commandBuffer: CommandBuffer;
      pipelineBindPoint: PipelineBindPoint;
      pipeline: Pipeline;
      groupIndex: uint32;
    ): void {.cdecl, lazyload("vkCmdBindPipelineShaderGroupNV", DeviceLevel).}
proc createIndirectCommandsLayoutNV*(
      device: Device;
      pCreateInfo: ptr IndirectCommandsLayoutCreateInfoNV;
      pAllocator = default(ptr AllocationCallbacks);
      pIndirectCommandsLayout: ptr IndirectCommandsLayoutNV;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkCreateIndirectCommandsLayoutNV", DeviceLevel).}
proc destroyIndirectCommandsLayoutNV*(
      device: Device;
      indirectCommandsLayout = default(IndirectCommandsLayoutNV);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, lazyload("vkDestroyIndirectCommandsLayoutNV", DeviceLevel).}

proc loadAllVK_NV_device_generated_commands*(instance: Instance) =
  instance.loadCommand getGeneratedCommandsMemoryRequirementsNV
  instance.loadCommand cmdPreprocessGeneratedCommandsNV
  instance.loadCommand cmdExecuteGeneratedCommandsNV
  instance.loadCommand cmdBindPipelineShaderGroupNV
  instance.loadCommand createIndirectCommandsLayoutNV
  instance.loadCommand destroyIndirectCommandsLayoutNV

proc loadVK_NV_device_generated_commands*(device: Device) =
  device.loadCommand getGeneratedCommandsMemoryRequirementsNV
  device.loadCommand cmdPreprocessGeneratedCommandsNV
  device.loadCommand cmdExecuteGeneratedCommandsNV
  device.loadCommand cmdBindPipelineShaderGroupNV
  device.loadCommand createIndirectCommandsLayoutNV
  device.loadCommand destroyIndirectCommandsLayoutNV

