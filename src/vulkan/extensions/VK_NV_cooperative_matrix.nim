# Generated at 2021-08-27T06:01:03Z
# VK_NV_cooperative_matrix
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


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
    DeviceNv = 1
    WorkgroupNv = 2
    SubgroupNv = 3
    QueueFamilyNv = 5
  ComponentTypeNV* {.size: sizeof(int32), pure.} = enum
    Float16Nv = 0
    Float32Nv = 1
    Float64Nv = 2
    Sint8Nv = 3
    Sint16Nv = 4
    Sint32Nv = 5
    Sint64Nv = 6
    Uint8Nv = 7
    Uint16Nv = 8
    Uint32Nv = 9
    Uint64Nv = 10
  PhysicalDeviceCooperativeMatrixFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    cooperativeMatrix*: Bool32
    cooperativeMatrixRobustBufferAccess*: Bool32
  PhysicalDeviceCooperativeMatrixPropertiesNV* = object
    sType*: StructureType
    pNext*: pointer
    cooperativeMatrixSupportedStages*: ShaderStageFlags

var # commands
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