# Generated at 2021-09-12T04:58:24Z
# VK_NV_cooperative_matrix


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  NvCooperativeMatrixSpecVersion* = 1
  NvCooperativeMatrixExtensionName* = "VK_NV_cooperative_matrix"

type # enums and bitmasks
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

type
  CooperativeMatrixPropertiesNV* = object
    sType* {.constant: (StructureType.cooperativeMatrixPropertiesNv).}: StructureType
    pNext* {.optional.}: pointer
    MSize*: uint32
    NSize*: uint32
    KSize*: uint32
    AType*: ComponentTypeNV
    BType*: ComponentTypeNV
    CType*: ComponentTypeNV
    DType*: ComponentTypeNV
    scope*: ScopeNV
  PhysicalDeviceCooperativeMatrixFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceCooperativeMatrixFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    cooperativeMatrix*: Bool32
    cooperativeMatrixRobustBufferAccess*: Bool32
  PhysicalDeviceCooperativeMatrixPropertiesNV* = object
    sType* {.constant: (StructureType.physicalDeviceCooperativeMatrixPropertiesNv).}: StructureType
    pNext* {.optional.}: pointer
    cooperativeMatrixSupportedStages*: ShaderStageFlags

proc getPhysicalDeviceCooperativeMatrixPropertiesNV*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties: ptr CooperativeMatrixPropertiesNV;
    ): Result {.cdecl, lazyload("vkGetPhysicalDeviceCooperativeMatrixPropertiesNV", InstanceLevel).}

proc loadAllVK_NV_cooperative_matrix*(instance: Instance) =
  getPhysicalDeviceCooperativeMatrixPropertiesNV.load(instance)

proc loadVK_NV_cooperative_matrix*(instance: Instance) =
  getPhysicalDeviceCooperativeMatrixPropertiesNV.load(instance)

