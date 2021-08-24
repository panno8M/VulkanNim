
import ../platform
import ../features/vk10


type
  ValidationCacheCreateFlagsEXT* = distinct Flags
  ValidationCacheHeaderVersionEXT* {.size: sizeof(int32), pure.} = enum
    One = 1
  ValidationCacheEXT* = distinct NonDispatchableHandle
  ValidationCacheCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    flags*: ValidationCacheCreateFlagsEXT
    initialDataSize*: uint
    pInitialData*: pointer
  ShaderModuleValidationCacheCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    validationCache*: ValidationCacheEXT

const ExtValidationCacheExtensionName* = "VK_EXT_validation_cache"
const ExtValidationCacheSpecVersion* = 1
var # commands
  mergeValidationCachesEXTCage: proc(device: Device; dstCache: ValidationCacheEXT; srcCacheCount: uint32; pSrcCaches: ptr ValidationCacheEXT;): Result {.cdecl.}
  getValidationCacheDataEXTCage: proc(device: Device; validationCache: ValidationCacheEXT; pDataSize: ptr uint; pData: pointer;): Result {.cdecl.}
  createValidationCacheEXTCage: proc(device: Device; pCreateInfo: ptr ValidationCacheCreateInfoEXT; pAllocator: ptr AllocationCallbacks; pValidationCache: ptr ValidationCacheEXT;): Result {.cdecl.}
  destroyValidationCacheEXTCage: proc(device: Device; validationCache: ValidationCacheEXT; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}

proc mergeValidationCachesEXT*(
      device: Device;
      dstCache: ValidationCacheEXT;
      srcCacheCount: uint32;
      pSrcCaches: ptr ValidationCacheEXT;
    ): Result {.cdecl.} =
  mergeValidationCachesEXTCage(device,dstCache,srcCacheCount,pSrcCaches)

proc getValidationCacheDataEXT*(
      device: Device;
      validationCache: ValidationCacheEXT;
      pDataSize: ptr uint;
      pData: pointer;
    ): Result {.cdecl.} =
  getValidationCacheDataEXTCage(device,validationCache,pDataSize,pData)

proc createValidationCacheEXT*(
      device: Device;
      pCreateInfo: ptr ValidationCacheCreateInfoEXT;
      pAllocator: ptr AllocationCallbacks;
      pValidationCache: ptr ValidationCacheEXT;
    ): Result {.cdecl.} =
  createValidationCacheEXTCage(device,pCreateInfo,pAllocator,pValidationCache)

proc destroyValidationCacheEXT*(
      device: Device;
      validationCache: ValidationCacheEXT;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyValidationCacheEXTCage(device,validationCache,pAllocator)


proc loadVK_EXT_validation_cache*(instance: Instance) =
  instance.defineLoader(`<<`)

  mergeValidationCachesEXTCage << "vkMergeValidationCachesEXT"
  getValidationCacheDataEXTCage << "vkGetValidationCacheDataEXT"
  createValidationCacheEXTCage << "vkCreateValidationCacheEXT"
  destroyValidationCacheEXTCage << "vkDestroyValidationCacheEXT"