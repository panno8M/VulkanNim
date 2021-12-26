# Generated at 2021-12-26T10:16:14Z
# VK_NV_cooperative_matrix

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

prepareVulkanLibDef()

const
  NvCooperativeMatrixSpecVersion* = 1
  NvCooperativeMatrixExtensionName* = "VK_NV_cooperative_matrix"

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

