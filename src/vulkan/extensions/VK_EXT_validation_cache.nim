# Generated at 2021-12-30T17:13:13Z
# VK_EXT_validation_cache

import ../platform

import ../features/vk10

prepareVulkanLibDef()

const
  ExtValidationCacheSpecVersion* = 1
  ExtValidationCacheExtensionName* = "VK_EXT_validation_cache"

type
  ValidationCacheCreateInfoEXT* = object
    sType* {.constant: (StructureType.validationCacheCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: ValidationCacheCreateFlagsEXT
    initialDataSize* {.optional.}: uint
    pInitialData* {.length: initialDataSize.}: pointer
  ShaderModuleValidationCacheCreateInfoEXT* = object
    sType* {.constant: (StructureType.shaderModuleValidationCacheCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    validationCache*: ValidationCacheEXT

proc createValidationCacheEXT*(
      device: Device;
      pCreateInfo: ptr ValidationCacheCreateInfoEXT;
      pAllocator = default(ptr AllocationCallbacks);
      pValidationCache: ptr ValidationCacheEXT;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory),
      lazyload("vkCreateValidationCacheEXT", DeviceLevel).}
proc destroyValidationCacheEXT*(
      device: Device;
      validationCache = default(ValidationCacheEXT);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, lazyload("vkDestroyValidationCacheEXT", DeviceLevel).}
proc mergeValidationCachesEXT*(
      device: Device;
      dstCache: ValidationCacheEXT;
      srcCacheCount: uint32;
      pSrcCaches {.length: srcCacheCount.}: arrPtr[ValidationCacheEXT];
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkMergeValidationCachesEXT", DeviceLevel).}
proc getValidationCacheDataEXT*(
      device: Device;
      validationCache: ValidationCacheEXT;
      pDataSize: ptr uint;
      pData {.length: pDataSize.} = default(pointer);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkGetValidationCacheDataEXT", DeviceLevel).}

proc loadAllVK_EXT_validation_cache*(instance: Instance) = instance.loadCommands:
  createValidationCacheEXT
  destroyValidationCacheEXT
  mergeValidationCachesEXT
  getValidationCacheDataEXT
proc loadVK_EXT_validation_cache*(device: Device) = device.loadCommands:
  createValidationCacheEXT
  destroyValidationCacheEXT
  mergeValidationCachesEXT
  getValidationCacheDataEXT
