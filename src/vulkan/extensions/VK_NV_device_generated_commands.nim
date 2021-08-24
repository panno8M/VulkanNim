
import ../platform
import ../features/vk10


type
  GraphicsPipelineShaderGroupsCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    groupCount*: uint32
    pGroups*: ptr GraphicsShaderGroupCreateInfoNV
    pipelineCount*: uint32
    pPipelines*: ptr Pipeline
  IndirectCommandsLayoutNV* = distinct NonDispatchableHandle
  IndirectCommandsStreamNV* = object
    buffer*: Buffer
    offset*: DeviceSize
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
  BindVertexBufferIndirectCommandNV* = object
    bufferAddress*: DeviceAddress
    size*: uint32
    stride*: uint32
  IndirectCommandsLayoutUsageFlagsNV* = distinct Flags
  IndirectCommandsLayoutUsageFlagBitsNV* {.size: sizeof(int32), pure.} = enum
    ExplicitPreprocess = 0x00000001
    IndexedSequences = 0x00000002
    UnorderedSequences = 0x00000004
  GraphicsShaderGroupCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    stageCount*: uint32
    pStages*: ptr PipelineShaderStageCreateInfo
    pVertexInputState*: ptr PipelineVertexInputStateCreateInfo
    pTessellationState*: ptr PipelineTessellationStateCreateInfo
  SetStateFlagsIndirectCommandNV* = object
    data*: uint32
  GeneratedCommandsMemoryRequirementsInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    pipelineBindPoint*: PipelineBindPoint
    pipeline*: Pipeline
    indirectCommandsLayout*: IndirectCommandsLayoutNV
    maxSequencesCount*: uint32
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
  IndirectStateFlagBitsNV* {.size: sizeof(int32), pure.} = enum
    FlagFrontface = 0x00000001
  BindIndexBufferIndirectCommandNV* = object
    bufferAddress*: DeviceAddress
    size*: uint32
    indexType*: IndexType
  IndirectStateFlagsNV* = distinct Flags
  PhysicalDeviceDeviceGeneratedCommandsFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    deviceGeneratedCommands*: Bool32
  IndirectCommandsTokenTypeNV* {.size: sizeof(int32), pure.} = enum
    ShaderGroup = 0
    StateFlags = 1
    IndexBuffer = 2
    VertexBuffer = 3
    PushConstant = 4
    DrawIndexed = 5
    Draw = 6
    DrawTasks = 7
  IndirectCommandsLayoutCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    flags*: IndirectCommandsLayoutUsageFlagsNV
    pipelineBindPoint*: PipelineBindPoint
    tokenCount*: uint32
    pTokens*: ptr IndirectCommandsLayoutTokenNV
    streamCount*: uint32
    pStreamStrides*: ptr uint32
  BindShaderGroupIndirectCommandNV* = object
    groupIndex*: uint32
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

const NvDeviceGeneratedCommandsSpecVersion* = 3
const NvDeviceGeneratedCommandsExtensionName* = "VK_NV_device_generated_commands"
var # commands
  cmdPreprocessGeneratedCommandsNVCage: proc(commandBuffer: CommandBuffer; pGeneratedCommandsInfo: ptr GeneratedCommandsInfoNV;): void {.cdecl.}
  createIndirectCommandsLayoutNVCage: proc(device: Device; pCreateInfo: ptr IndirectCommandsLayoutCreateInfoNV; pAllocator: ptr AllocationCallbacks; pIndirectCommandsLayout: ptr IndirectCommandsLayoutNV;): Result {.cdecl.}
  cmdBindPipelineShaderGroupNVCage: proc(commandBuffer: CommandBuffer; pipelineBindPoint: PipelineBindPoint; pipeline: Pipeline; groupIndex: uint32;): void {.cdecl.}
  destroyIndirectCommandsLayoutNVCage: proc(device: Device; indirectCommandsLayout: IndirectCommandsLayoutNV; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  cmdExecuteGeneratedCommandsNVCage: proc(commandBuffer: CommandBuffer; isPreprocessed: Bool32; pGeneratedCommandsInfo: ptr GeneratedCommandsInfoNV;): void {.cdecl.}
  getGeneratedCommandsMemoryRequirementsNVCage: proc(device: Device; pInfo: ptr GeneratedCommandsMemoryRequirementsInfoNV; pMemoryRequirements: ptr MemoryRequirements2;): void {.cdecl.}

proc cmdPreprocessGeneratedCommandsNV*(
      commandBuffer: CommandBuffer;
      pGeneratedCommandsInfo: ptr GeneratedCommandsInfoNV;
    ): void {.cdecl.} =
  cmdPreprocessGeneratedCommandsNVCage(commandBuffer,pGeneratedCommandsInfo)

proc createIndirectCommandsLayoutNV*(
      device: Device;
      pCreateInfo: ptr IndirectCommandsLayoutCreateInfoNV;
      pAllocator: ptr AllocationCallbacks;
      pIndirectCommandsLayout: ptr IndirectCommandsLayoutNV;
    ): Result {.cdecl.} =
  createIndirectCommandsLayoutNVCage(device,pCreateInfo,pAllocator,pIndirectCommandsLayout)

proc cmdBindPipelineShaderGroupNV*(
      commandBuffer: CommandBuffer;
      pipelineBindPoint: PipelineBindPoint;
      pipeline: Pipeline;
      groupIndex: uint32;
    ): void {.cdecl.} =
  cmdBindPipelineShaderGroupNVCage(commandBuffer,pipelineBindPoint,pipeline,groupIndex)

proc destroyIndirectCommandsLayoutNV*(
      device: Device;
      indirectCommandsLayout: IndirectCommandsLayoutNV;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyIndirectCommandsLayoutNVCage(device,indirectCommandsLayout,pAllocator)

proc cmdExecuteGeneratedCommandsNV*(
      commandBuffer: CommandBuffer;
      isPreprocessed: Bool32;
      pGeneratedCommandsInfo: ptr GeneratedCommandsInfoNV;
    ): void {.cdecl.} =
  cmdExecuteGeneratedCommandsNVCage(commandBuffer,isPreprocessed,pGeneratedCommandsInfo)

proc getGeneratedCommandsMemoryRequirementsNV*(
      device: Device;
      pInfo: ptr GeneratedCommandsMemoryRequirementsInfoNV;
      pMemoryRequirements: ptr MemoryRequirements2;
    ): void {.cdecl.} =
  getGeneratedCommandsMemoryRequirementsNVCage(device,pInfo,pMemoryRequirements)


proc loadVK_NV_device_generated_commands*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdPreprocessGeneratedCommandsNVCage << "vkCmdPreprocessGeneratedCommandsNV"
  createIndirectCommandsLayoutNVCage << "vkCreateIndirectCommandsLayoutNV"
  cmdBindPipelineShaderGroupNVCage << "vkCmdBindPipelineShaderGroupNV"
  destroyIndirectCommandsLayoutNVCage << "vkDestroyIndirectCommandsLayoutNV"
  cmdExecuteGeneratedCommandsNVCage << "vkCmdExecuteGeneratedCommandsNV"
  getGeneratedCommandsMemoryRequirementsNVCage << "vkGetGeneratedCommandsMemoryRequirementsNV"