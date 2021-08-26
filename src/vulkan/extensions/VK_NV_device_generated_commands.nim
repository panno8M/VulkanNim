
import ../platform
import ../features/vk10




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
  IndirectStateFlagBitsNV* {.size: sizeof(int32), pure.} = enum
    FlagFrontfaceBitNv = 0x00000001
  IndirectStateFlagsNV* = distinct Flags
  IndirectCommandsLayoutNV* = distinct NonDispatchableHandle
  IndirectCommandsTokenTypeNV* {.size: sizeof(int32), pure.} = enum
    ShaderGroupNv = 0
    StateFlagsNv = 1
    IndexBufferNv = 2
    VertexBufferNv = 3
    PushConstantNv = 4
    DrawIndexedNv = 5
    DrawNv = 6
    DrawTasksNv = 7
  IndirectCommandsLayoutUsageFlagBitsNV* {.size: sizeof(int32), pure.} = enum
    ExplicitPreprocessBitNv = 0x00000001
    IndexedSequencesBitNv = 0x00000002
    UnorderedSequencesBitNv = 0x00000004
  IndirectCommandsLayoutUsageFlagsNV* = distinct Flags
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

var # commands
  getGeneratedCommandsMemoryRequirementsNVCage: proc(device: Device; pInfo: ptr GeneratedCommandsMemoryRequirementsInfoNV; pMemoryRequirements: ptr MemoryRequirements2;): void {.cdecl.}
  cmdPreprocessGeneratedCommandsNVCage: proc(commandBuffer: CommandBuffer; pGeneratedCommandsInfo: ptr GeneratedCommandsInfoNV;): void {.cdecl.}
  cmdExecuteGeneratedCommandsNVCage: proc(commandBuffer: CommandBuffer; isPreprocessed: Bool32; pGeneratedCommandsInfo: ptr GeneratedCommandsInfoNV;): void {.cdecl.}
  cmdBindPipelineShaderGroupNVCage: proc(commandBuffer: CommandBuffer; pipelineBindPoint: PipelineBindPoint; pipeline: Pipeline; groupIndex: uint32;): void {.cdecl.}
  createIndirectCommandsLayoutNVCage: proc(device: Device; pCreateInfo: ptr IndirectCommandsLayoutCreateInfoNV; pAllocator: ptr AllocationCallbacks; pIndirectCommandsLayout: ptr IndirectCommandsLayoutNV;): Result {.cdecl.}
  destroyIndirectCommandsLayoutNVCage: proc(device: Device; indirectCommandsLayout: IndirectCommandsLayoutNV; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
proc getGeneratedCommandsMemoryRequirementsNV*(
      device: Device;
      pInfo: ptr GeneratedCommandsMemoryRequirementsInfoNV;
      pMemoryRequirements: ptr MemoryRequirements2;
    ): void {.cdecl.} =
  getGeneratedCommandsMemoryRequirementsNVCage(device,pInfo,pMemoryRequirements)
proc cmdPreprocessGeneratedCommandsNV*(
      commandBuffer: CommandBuffer;
      pGeneratedCommandsInfo: ptr GeneratedCommandsInfoNV;
    ): void {.cdecl.} =
  cmdPreprocessGeneratedCommandsNVCage(commandBuffer,pGeneratedCommandsInfo)
proc cmdExecuteGeneratedCommandsNV*(
      commandBuffer: CommandBuffer;
      isPreprocessed: Bool32;
      pGeneratedCommandsInfo: ptr GeneratedCommandsInfoNV;
    ): void {.cdecl.} =
  cmdExecuteGeneratedCommandsNVCage(commandBuffer,isPreprocessed,pGeneratedCommandsInfo)
proc cmdBindPipelineShaderGroupNV*(
      commandBuffer: CommandBuffer;
      pipelineBindPoint: PipelineBindPoint;
      pipeline: Pipeline;
      groupIndex: uint32;
    ): void {.cdecl.} =
  cmdBindPipelineShaderGroupNVCage(commandBuffer,pipelineBindPoint,pipeline,groupIndex)
proc createIndirectCommandsLayoutNV*(
      device: Device;
      pCreateInfo: ptr IndirectCommandsLayoutCreateInfoNV;
      pAllocator: ptr AllocationCallbacks;
      pIndirectCommandsLayout: ptr IndirectCommandsLayoutNV;
    ): Result {.cdecl, discardable.} =
  createIndirectCommandsLayoutNVCage(device,pCreateInfo,pAllocator,pIndirectCommandsLayout)
proc destroyIndirectCommandsLayoutNV*(
      device: Device;
      indirectCommandsLayout: IndirectCommandsLayoutNV;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyIndirectCommandsLayoutNVCage(device,indirectCommandsLayout,pAllocator)
proc loadVK_NV_device_generated_commands*(instance: Instance) =
  instance.defineLoader(`<<`)

  getGeneratedCommandsMemoryRequirementsNVCage << "vkGetGeneratedCommandsMemoryRequirementsNV"
  cmdPreprocessGeneratedCommandsNVCage << "vkCmdPreprocessGeneratedCommandsNV"
  cmdExecuteGeneratedCommandsNVCage << "vkCmdExecuteGeneratedCommandsNV"
  cmdBindPipelineShaderGroupNVCage << "vkCmdBindPipelineShaderGroupNV"
  createIndirectCommandsLayoutNVCage << "vkCreateIndirectCommandsLayoutNV"
  destroyIndirectCommandsLayoutNVCage << "vkDestroyIndirectCommandsLayoutNV"