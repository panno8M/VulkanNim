# Generated at 2021-09-09T01:49:36Z
# VK_NV_device_generated_commands


import ../platform
import ../features/vk11

const
  NvDeviceGeneratedCommandsSpecVersion* = 3
  NvDeviceGeneratedCommandsExtensionName* = "VK_NV_device_generated_commands"

type # enums and bitmasks
  IndirectStateFlagBitsNV* {.size: sizeof(int32), pure.} = enum
    flagFrontfaceNv = 0x00000001
  IndirectStateFlagsNV* = Flags[IndirectStateFlagBitsNV]
  IndirectCommandsTokenTypeNV* {.size: sizeof(int32), pure.} = enum
    shaderGroupNv = 0
    stateFlagsNv = 1
    indexBufferNv = 2
    vertexBufferNv = 3
    pushConstantNv = 4
    drawIndexedNv = 5
    drawNv = 6
    drawTasksNv = 7
  IndirectCommandsLayoutUsageFlagBitsNV* {.size: sizeof(int32), pure.} = enum
    explicitPreprocessNv = 0x00000001
    indexedSequencesNv = 0x00000002
    unorderedSequencesNv = 0x00000004
  IndirectCommandsLayoutUsageFlagsNV* = Flags[IndirectCommandsLayoutUsageFlagBitsNV]

type
  PhysicalDeviceDeviceGeneratedCommandsPropertiesNV* = object
    sType*: StructureType
    pNext*: pointer
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
    sType*: StructureType
    pNext*: pointer
    deviceGeneratedCommands*: Bool32
  GraphicsShaderGroupCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    stageCount*: uint32
    pStages*: ptr PipelineShaderStageCreateInfo
    pVertexInputState*: ptr PipelineVertexInputStateCreateInfo
    pTessellationState*: ptr PipelineTessellationStateCreateInfo
  GraphicsPipelineShaderGroupsCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    groupCount*: uint32
    pGroups*: ptr GraphicsShaderGroupCreateInfoNV
    pipelineCount*: uint32
    pPipelines*: ptr Pipeline
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
  HtIndirectCommandsLayoutNV = object of HandleType
  IndirectCommandsLayoutNV* = NonDispatchableHandle[HtIndirectCommandsLayoutNV]
  IndirectCommandsStreamNV* = object
    buffer*: Buffer
    offset*: DeviceSize
  IndirectCommandsLayoutTokenNV* = object
    sType*: StructureType
    pNext*: pointer
    tokenType*: IndirectCommandsTokenTypeNV
    stream*: uint32
    offset*: uint32
    vertexBindingUnit*: uint32
    vertexDynamicStride*: Bool32
    pushconstantPipelineLayout*: PipelineLayout
    pushconstantShaderStageFlags*: ShaderStageFlags
    pushconstantOffset*: uint32
    pushconstantSize*: uint32
    indirectStateFlags*: IndirectStateFlagsNV
    indexTypeCount*: uint32
    pIndexTypes*: ptr IndexType
    pIndexTypeValues*: ptr uint32
  IndirectCommandsLayoutCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    flags*: IndirectCommandsLayoutUsageFlagsNV
    pipelineBindPoint*: PipelineBindPoint
    tokenCount*: uint32
    pTokens*: ptr IndirectCommandsLayoutTokenNV
    streamCount*: uint32
    pStreamStrides*: ptr uint32
  GeneratedCommandsInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    pipelineBindPoint*: PipelineBindPoint
    pipeline*: Pipeline
    indirectCommandsLayout*: IndirectCommandsLayoutNV
    streamCount*: uint32
    pStreams*: ptr IndirectCommandsStreamNV
    sequencesCount*: uint32
    preprocessBuffer*: Buffer
    preprocessOffset*: DeviceSize
    preprocessSize*: DeviceSize
    sequencesCountBuffer*: Buffer
    sequencesCountOffset*: DeviceSize
    sequencesIndexBuffer*: Buffer
    sequencesIndexOffset*: DeviceSize
  GeneratedCommandsMemoryRequirementsInfoNV* = object
    sType*: StructureType
    pNext*: pointer
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
      pAllocator: ptr AllocationCallbacks;
      pIndirectCommandsLayout: ptr IndirectCommandsLayoutNV;
    ): Result {.cdecl, lazyload("vkCreateIndirectCommandsLayoutNV", DeviceLevel).}
proc destroyIndirectCommandsLayoutNV*(
      device: Device;
      indirectCommandsLayout: IndirectCommandsLayoutNV;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl, lazyload("vkDestroyIndirectCommandsLayoutNV", DeviceLevel).}

proc loadAllVK_NV_device_generated_commands*(instance: Instance) =
  getGeneratedCommandsMemoryRequirementsNV.smartLoad(instance)
  cmdPreprocessGeneratedCommandsNV.smartLoad(instance)
  cmdExecuteGeneratedCommandsNV.smartLoad(instance)
  cmdBindPipelineShaderGroupNV.smartLoad(instance)
  createIndirectCommandsLayoutNV.smartLoad(instance)
  destroyIndirectCommandsLayoutNV.smartLoad(instance)

proc loadVK_NV_device_generated_commands*(device: Device) =
  getGeneratedCommandsMemoryRequirementsNV.smartLoad(device)
  cmdPreprocessGeneratedCommandsNV.smartLoad(device)
  cmdExecuteGeneratedCommandsNV.smartLoad(device)
  cmdBindPipelineShaderGroupNV.smartLoad(device)
  createIndirectCommandsLayoutNV.smartLoad(device)
  destroyIndirectCommandsLayoutNV.smartLoad(device)

