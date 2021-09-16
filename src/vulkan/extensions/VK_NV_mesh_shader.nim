# Generated at 2021-09-12T04:58:23Z
# VK_NV_mesh_shader


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  NvMeshShaderSpecVersion* = 1
  NvMeshShaderExtensionName* = "VK_NV_mesh_shader"

type
  PhysicalDeviceMeshShaderFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceMeshShaderFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    taskShader*: Bool32
    meshShader*: Bool32
  PhysicalDeviceMeshShaderPropertiesNV* = object
    sType* {.constant: (StructureType.physicalDeviceMeshShaderPropertiesNv).}: StructureType
    pNext* {.optional.}: pointer
    maxDrawMeshTasksCount*: uint32
    maxTaskWorkGroupInvocations*: uint32
    maxTaskWorkGroupSize*: array[3, uint32]
    maxTaskTotalMemorySize*: uint32
    maxTaskOutputCount*: uint32
    maxMeshWorkGroupInvocations*: uint32
    maxMeshWorkGroupSize*: array[3, uint32]
    maxMeshTotalMemorySize*: uint32
    maxMeshOutputVertices*: uint32
    maxMeshOutputPrimitives*: uint32
    maxMeshMultiviewViewCount*: uint32
    meshOutputPerVertexGranularity*: uint32
    meshOutputPerPrimitiveGranularity*: uint32
  DrawMeshTasksIndirectCommandNV* = object
    taskCount*: uint32
    firstTask*: uint32

proc cmdDrawMeshTasksNV*(
      commandBuffer: CommandBuffer;
      taskCount: uint32;
      firstTask: uint32;
    ): void {.cdecl, lazyload("vkCmdDrawMeshTasksNV", DeviceLevel).}
proc cmdDrawMeshTasksIndirectNV*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      drawCount: uint32;
      stride: uint32;
    ): void {.cdecl, lazyload("vkCmdDrawMeshTasksIndirectNV", DeviceLevel).}
proc cmdDrawMeshTasksIndirectCountNV*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      countBuffer: Buffer;
      countBufferOffset: DeviceSize;
      maxDrawCount: uint32;
      stride: uint32;
    ): void {.cdecl, lazyload("vkCmdDrawMeshTasksIndirectCountNV", DeviceLevel).}

proc loadAllVK_NV_mesh_shader*(instance: Instance) =
  cmdDrawMeshTasksNV.load(instance)
  cmdDrawMeshTasksIndirectNV.load(instance)
  cmdDrawMeshTasksIndirectCountNV.load(instance)

proc loadVK_NV_mesh_shader*(device: Device) =
  cmdDrawMeshTasksNV.load(device)
  cmdDrawMeshTasksIndirectNV.load(device)
  cmdDrawMeshTasksIndirectCountNV.load(device)

