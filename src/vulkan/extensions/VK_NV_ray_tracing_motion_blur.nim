# Generated at 2021-12-26T16:57:02Z
# VK_NV_ray_tracing_motion_blur

import ../platform

import ../features/vk10
import ./VK_KHR_ray_tracing_pipeline
export VK_KHR_ray_tracing_pipeline
prepareVulkanLibDef()

const
  NvRayTracingMotionBlurSpecVersion* = 1
  NvRayTracingMotionBlurExtensionName* = "VK_NV_ray_tracing_motion_blur"

type
  AccelerationStructureGeometryMotionTrianglesDataNV* = object
    sType* {.constant: (StructureType.accelerationStructureGeometryMotionTrianglesDataNv).}: StructureType
    pNext* {.optional.}: pointer
    vertexData*: DeviceOrHostAddressConstKHR
  AccelerationStructureMotionInfoNV* = object
    sType* {.constant: (StructureType.accelerationStructureMotionInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    maxInstances*: uint32
    flags* {.optional.}: AccelerationStructureMotionInfoFlagsNV
  AccelerationStructureMotionInstanceNV* = object
    theType*: AccelerationStructureMotionInstanceTypeNV
    flags* {.optional.}: AccelerationStructureMotionInstanceFlagsNV
    data*: AccelerationStructureMotionInstanceDataNV
  AccelerationStructureMotionInstanceDataNV* {.union.} = object
    staticInstance*: AccelerationStructureInstanceKHR
    matrixMotionInstance*: AccelerationStructureMatrixMotionInstanceNV
    srtMotionInstance*: AccelerationStructureSRTMotionInstanceNV
  AccelerationStructureMatrixMotionInstanceNV* = object
    transformT0*: TransformMatrixKHR
    transformT1*: TransformMatrixKHR
    instanceCustomIndex*: uint32
    mask*: uint32
    instanceShaderBindingTableRecordOffset*: uint32
    flags* {.optional.}: GeometryInstanceFlagsKHR
    accelerationStructureReference*: uint64
  AccelerationStructureSRTMotionInstanceNV* = object
    transformT0*: SRTDataNV
    transformT1*: SRTDataNV
    instanceCustomIndex*: uint32
    mask*: uint32
    instanceShaderBindingTableRecordOffset*: uint32
    flags* {.optional.}: GeometryInstanceFlagsKHR
    accelerationStructureReference*: uint64
  SRTDataNV* = object
    sx*: float32
    a*: float32
    b*: float32
    pvx*: float32
    sy*: float32
    c*: float32
    pvy*: float32
    sz*: float32
    pvz*: float32
    qx*: float32
    qy*: float32
    qz*: float32
    qw*: float32
    tx*: float32
    ty*: float32
    tz*: float32
  PhysicalDeviceRayTracingMotionBlurFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceRayTracingMotionBlurFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    rayTracingMotionBlur*: Bool32
    rayTracingMotionBlurPipelineTraceRaysIndirect*: Bool32



