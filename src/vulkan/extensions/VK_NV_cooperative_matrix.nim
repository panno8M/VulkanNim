# Generated at 2021-12-22T14:50:02Z
# VK_NV_cooperative_matrix

import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

prepareVulkanLibDef()

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
      pProperties {.length: pPropertyCount.} = default(arrPtr[CooperativeMatrixPropertiesNV]);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkGetPhysicalDeviceCooperativeMatrixPropertiesNV", InstanceLevel).}

proc loadAllVK_NV_cooperative_matrix*(instance: Instance) =
  instance.loadCommand getPhysicalDeviceCooperativeMatrixPropertiesNV

proc loadVK_NV_cooperative_matrix*(instance: Instance) =
  instance.loadCommand getPhysicalDeviceCooperativeMatrixPropertiesNV

