# Generated at 2021-09-16T07:49:56Z
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
    pStages*: ptr PipelineShaderStageCreateInfo
    pVertexInputState* {.optional.}: ptr PipelineVertexInputStateCreateInfo
    pTessellationState* {.optional.}: ptr PipelineTessellationStateCreateInfo
  GraphicsPipelineShaderGroupsCreateInfoNV* = object
    sType* {.constant: (StructureType.graphicsPipelineShaderGroupsCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    groupCount*: uint32
    pGroups*: ptr GraphicsShaderGroupCreateInfoNV
    pipelineCount* {.optional.}: uint32
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
    pIndexTypes*: ptr IndexType
    pIndexTypeValues*: ptr uint32
  IndirectCommandsLayoutCreateInfoNV* = object
    sType* {.constant: (StructureType.indirectCommandsLayoutCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    flags*: IndirectCommandsLayoutUsageFlagsNV
    pipelineBindPoint*: PipelineBindPoint
    tokenCount*: uint32
    pTokens*: ptr IndirectCommandsLayoutTokenNV
    streamCount*: uint32
    pStreamStrides*: ptr uint32
  GeneratedCommandsInfoNV* = object
    sType* {.constant: (StructureType.generatedCommandsInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    pipelineBindPoint*: PipelineBindPoint
    pipeline*: Pipeline
    indirectCommandsLayout*: IndirectCommandsLayoutNV
    streamCount*: uint32
    pStreams*: ptr IndirectCommandsStreamNV
    sequencesCount*: uint32
    preprocessBuffer*: Buffer
    preprocessOffset*: DeviceSize
    preprocessSize*: DeviceSize
    sequencesCountBuffer* {.optional.}: Buffer
    sequencesCountOffset* {.optional.}: DeviceSize
    sequencesIndexBuffer* {.optional.}: Buffer
    sequencesIndexOffset* {.optional.}: DeviceSize
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
    ): Result {.cdecl, lazyload("vkCreateIndirectCommandsLayoutNV", DeviceLevel).}
proc destroyIndirectCommandsLayoutNV*(
      device: Device;
      indirectCommandsLayout = default(IndirectCommandsLayoutNV);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, lazyload("vkDestroyIndirectCommandsLayoutNV", DeviceLevel).}

proc loadAllVK_NV_device_generated_commands*(instance: Instance) =
  getGeneratedCommandsMemoryRequirementsNV.load(instance)
  cmdPreprocessGeneratedCommandsNV.load(instance)
  cmdExecuteGeneratedCommandsNV.load(instance)
  cmdBindPipelineShaderGroupNV.load(instance)
  createIndirectCommandsLayoutNV.load(instance)
  destroyIndirectCommandsLayoutNV.load(instance)

proc loadVK_NV_device_generated_commands*(device: Device) =
  getGeneratedCommandsMemoryRequirementsNV.load(device)
  cmdPreprocessGeneratedCommandsNV.load(device)
  cmdExecuteGeneratedCommandsNV.load(device)
  cmdBindPipelineShaderGroupNV.load(device)
  createIndirectCommandsLayoutNV.load(device)
  destroyIndirectCommandsLayoutNV.load(device)

