
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  ScopeNV* {.size: sizeof(int32), pure.} = enum
    Device = 1
    Workgroup = 2
    Subgroup = 3
    QueueFamily = 5
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
  PhysicalDeviceCooperativeMatrixPropertiesNV* = object
    sType*: StructureType
    pNext*: pointer
    cooperativeMatrixSupportedStages*: ShaderStageFlags
  PhysicalDeviceCooperativeMatrixFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    cooperativeMatrix*: Bool32
    cooperativeMatrixRobustBufferAccess*: Bool32
  ComponentTypeNV* {.size: sizeof(int32), pure.} = enum
    Float16 = 0
    Float32 = 1
    Float64 = 2
    Sint8 = 3
    Sint16 = 4
    Sint32 = 5
    Sint64 = 6
    Uint8 = 7
    Uint16 = 8
    Uint32 = 9
    Uint64 = 10

const NvCooperativeMatrixExtensionName* = "VK_NV_cooperative_matrix"
const NvCooperativeMatrixSpecVersion* = 1
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