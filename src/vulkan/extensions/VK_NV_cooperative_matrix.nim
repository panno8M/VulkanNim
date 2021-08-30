# Generated at 2021-08-30T22:51:48Z
# VK_NV_cooperative_matrix


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2

const
  NvCooperativeMatrixSpecVersion* = 1
  NvCooperativeMatrixExtensionName* = "VK_NV_cooperative_matrix"

type
  CooperativeMatrixPropertiesNV* = object
    sType*: StructureType
    pNext*: pointer
    MSize*: uint32
    NSize*: uint32
    KSize*: uint32
    AType*: ComponentTypeNV
    BType*: ComponentTypeNV
    CType*: ComponentTypeNV
    DType*: ComponentTypeNV
    scope*: ScopeNV
  ScopeNV* {.size: sizeof(int32), pure.} = enum
    deviceNv = 1
    workgroupNv = 2
    subgroupNv = 3
    queueFamilyNv = 5
  ComponentTypeNV* {.size: sizeof(int32), pure.} = enum
    float16Nv = 0
    float32Nv = 1
    float64Nv = 2
    sint8Nv = 3
    sint16Nv = 4
    sint32Nv = 5
    sint64Nv = 6
    uint8Nv = 7
    uint16Nv = 8
    uint32Nv = 9
    uint64Nv = 10
  PhysicalDeviceCooperativeMatrixFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    cooperativeMatrix*: Bool32
    cooperativeMatrixRobustBufferAccess*: Bool32
  PhysicalDeviceCooperativeMatrixPropertiesNV* = object
    sType*: StructureType
    pNext*: pointer
    cooperativeMatrixSupportedStages*: ShaderStageFlags

var # command cages
  getPhysicalDeviceCooperativeMatrixPropertiesNVCage: proc(physicalDevice: PhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr CooperativeMatrixPropertiesNV;): Result {.cdecl.}
proc getPhysicalDeviceCooperativeMatrixPropertiesNV*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties: ptr CooperativeMatrixPropertiesNV;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceCooperativeMatrixPropertiesNVCage(physicalDevice,pPropertyCount,pProperties)
proc loadVK_NV_cooperative_matrix*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceCooperativeMatrixPropertiesNVCage << "vkGetPhysicalDeviceCooperativeMatrixPropertiesNV"