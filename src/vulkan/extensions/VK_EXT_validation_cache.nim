# Generated at 2021-08-28T12:28:01Z
# VK_EXT_validation_cache
# =================================

import ../platform
import ../features/vk10


const
  ExtValidationCacheSpecVersion* = 1
  ExtValidationCacheExtensionName* = "VK_EXT_validation_cache"

type
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
  ValidationCacheHeaderVersionEXT* {.size: sizeof(int32), pure.} = enum
    oneExt = 1
  ValidationCacheCreateFlagsEXT* = Flags[distinct UnusedEnum]

var # commands
  createValidationCacheEXTCage: proc(device: Device; pCreateInfo: ptr ValidationCacheCreateInfoEXT; pAllocator: ptr AllocationCallbacks; pValidationCache: ptr ValidationCacheEXT;): Result {.cdecl.}
  destroyValidationCacheEXTCage: proc(device: Device; validationCache: ValidationCacheEXT; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  mergeValidationCachesEXTCage: proc(device: Device; dstCache: ValidationCacheEXT; srcCacheCount: uint32; pSrcCaches: ptr ValidationCacheEXT;): Result {.cdecl.}
  getValidationCacheDataEXTCage: proc(device: Device; validationCache: ValidationCacheEXT; pDataSize: ptr uint; pData: pointer;): Result {.cdecl.}
proc createValidationCacheEXT*(
      device: Device;
      pCreateInfo: ptr ValidationCacheCreateInfoEXT;
      pAllocator: ptr AllocationCallbacks;
      pValidationCache: ptr ValidationCacheEXT;
    ): Result {.cdecl, discardable.} =
  createValidationCacheEXTCage(device,pCreateInfo,pAllocator,pValidationCache)
proc destroyValidationCacheEXT*(
      device: Device;
      validationCache: ValidationCacheEXT;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyValidationCacheEXTCage(device,validationCache,pAllocator)
proc mergeValidationCachesEXT*(
      device: Device;
      dstCache: ValidationCacheEXT;
      srcCacheCount: uint32;
      pSrcCaches: ptr ValidationCacheEXT;
    ): Result {.cdecl, discardable.} =
  mergeValidationCachesEXTCage(device,dstCache,srcCacheCount,pSrcCaches)
proc getValidationCacheDataEXT*(
      device: Device;
      validationCache: ValidationCacheEXT;
      pDataSize: ptr uint;
      pData: pointer;
    ): Result {.cdecl, discardable.} =
  getValidationCacheDataEXTCage(device,validationCache,pDataSize,pData)
proc loadVK_EXT_validation_cache*(instance: Instance) =
  instance.defineLoader(`<<`)

  createValidationCacheEXTCage << "vkCreateValidationCacheEXT"
  destroyValidationCacheEXTCage << "vkDestroyValidationCacheEXT"
  mergeValidationCachesEXTCage << "vkMergeValidationCachesEXT"
  getValidationCacheDataEXTCage << "vkGetValidationCacheDataEXT"
