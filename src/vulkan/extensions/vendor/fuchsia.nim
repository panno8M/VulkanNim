# VK_FUCHSIA_imagepipe_surface
# VK_FUCHSIA_external_memory
# VK_FUCHSIA_external_semaphore
# VK_FUCHSIA_buffer_collection

import ../../features/vk10
import ../../platform
prepareVulkanLibDef()

const
  FuchsiaImagepipeSurfaceSpecVersion* = 1
  FuchsiaImagepipeSurfaceExtensionName* = "VK_FUCHSIA_imagepipe_surface"

  FuchsiaExternalMemorySpecVersion* = 1
  FuchsiaExternalMemoryExtensionName* = "VK_FUCHSIA_external_memory"

  FuchsiaExternalSemaphoreSpecVersion* = 1
  FuchsiaExternalSemaphoreExtensionName* = "VK_FUCHSIA_external_semaphore"

  FuchsiaBufferCollectionSpecVersion* = 2
  FuchsiaBufferCollectionExtensionName* = "VK_FUCHSIA_buffer_collection"

type
  ImagePipeSurfaceCreateInfoFUCHSIA* = object
    sType* {.constant: (StructureType.imagepipeSurfaceCreateInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: ImagePipeSurfaceCreateFlagsFUCHSIA
    imagePipeHandle*: zx_handle_t

  ImportMemoryZirconHandleInfoFUCHSIA* = object
    sType* {.constant: (StructureType.importMemoryZirconHandleInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    handleType* {.optional.}: ExternalMemoryHandleTypeFlagBits
    handle* {.optional.}: zx_handle_t
  MemoryZirconHandlePropertiesFUCHSIA* = object
    sType* {.constant: (StructureType.memoryZirconHandlePropertiesFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    memoryTypeBits*: uint32
  MemoryGetZirconHandleInfoFUCHSIA* = object
    sType* {.constant: (StructureType.memoryGetZirconHandleInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    memory*: DeviceMemory
    handleType*: ExternalMemoryHandleTypeFlagBits

  ImportSemaphoreZirconHandleInfoFUCHSIA* = object
    sType* {.constant: (StructureType.importSemaphoreZirconHandleInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    semaphore*: Semaphore
    flags* {.optional.}: SemaphoreImportFlags
    handleType*: ExternalSemaphoreHandleTypeFlagBits
    zirconHandle*: zx_handle_t
  SemaphoreGetZirconHandleInfoFUCHSIA* = object
    sType* {.constant: (StructureType.semaphoreGetZirconHandleInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    semaphore*: Semaphore
    handleType*: ExternalSemaphoreHandleTypeFlagBits

  BufferCollectionCreateInfoFUCHSIA* = object
    sType* {.constant: (StructureType.bufferCollectionCreateInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    collectionToken*: zx_handle_t
  ImportMemoryBufferCollectionFUCHSIA* = object
    sType* {.constant: (StructureType.importMemoryBufferCollectionFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    collection*: BufferCollectionFUCHSIA
    index*: uint32
  BufferCollectionImageCreateInfoFUCHSIA* = object
    sType* {.constant: (StructureType.bufferCollectionImageCreateInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    collection*: BufferCollectionFUCHSIA
    index*: uint32
  BufferConstraintsInfoFUCHSIA* = object
    sType* {.constant: (StructureType.bufferConstraintsInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    createInfo*: BufferCreateInfo
    requiredFormatFeatures* {.optional.}: FormatFeatureFlags
    bufferCollectionConstraints*: BufferCollectionConstraintsInfoFUCHSIA
  BufferCollectionBufferCreateInfoFUCHSIA* = object
    sType* {.constant: (StructureType.bufferCollectionBufferCreateInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    collection*: BufferCollectionFUCHSIA
    index*: uint32
  BufferCollectionPropertiesFUCHSIA* = object
    sType* {.constant: (StructureType.bufferCollectionPropertiesFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    memoryTypeBits*: uint32
    bufferCount*: uint32
    createInfoIndex*: uint32
    sysmemPixelFormat*: uint64
    formatFeatures*: FormatFeatureFlags
    sysmemColorSpaceIndex*: SysmemColorSpaceFUCHSIA
    samplerYcbcrConversionComponents*: ComponentMapping
    suggestedYcbcrModel*: SamplerYcbcrModelConversion
    suggestedYcbcrRange*: SamplerYcbcrRange
    suggestedXChromaOffset*: ChromaLocation
    suggestedYChromaOffset*: ChromaLocation
  SysmemColorSpaceFUCHSIA* = object
    sType* {.constant: (StructureType.sysmemColorSpaceFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    colorSpace*: uint32
  ImageConstraintsInfoFUCHSIA* = object
    sType* {.constant: (StructureType.imageConstraintsInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    formatConstraintsCount*: uint32
    pFormatConstraints* {.length: formatConstraintsCount.}: arrPtr[ImageFormatConstraintsInfoFUCHSIA]
    bufferCollectionConstraints*: BufferCollectionConstraintsInfoFUCHSIA
    flags* {.optional.}: ImageConstraintsInfoFlagsFUCHSIA
  ImageFormatConstraintsInfoFUCHSIA* = object
    sType* {.constant: (StructureType.imageFormatConstraintsInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    imageCreateInfo*: ImageCreateInfo
    requiredFormatFeatures*: FormatFeatureFlags
    flags* {.optional.}: ImageFormatConstraintsFlagsFUCHSIA
    sysmemPixelFormat* {.optional.}: uint64
    colorSpaceCount*: uint32
    pColorSpaces*: ptr SysmemColorSpaceFUCHSIA
  BufferCollectionConstraintsInfoFUCHSIA* = object
    sType* {.constant: (StructureType.bufferCollectionConstraintsInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    minBufferCount*: uint32
    maxBufferCount*: uint32
    minBufferCountForCamping*: uint32
    minBufferCountForDedicatedSlack*: uint32
    minBufferCountForSharedSlack*: uint32

proc createImagePipeSurfaceFUCHSIA*(
      instance: Instance;
      pCreateInfo: ptr ImagePipeSurfaceCreateInfoFUCHSIA;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkCreateImagePipeSurfaceFUCHSIA", InstanceLevel).}


proc getMemoryZirconHandleFUCHSIA*(
      device: Device;
      pGetZirconHandleInfo: ptr MemoryGetZirconHandleInfoFUCHSIA;
      pZirconHandle: ptr zx_handle_t;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorTooManyObjects, Result.errorOutOfHostMemory],
      lazyload("vkGetMemoryZirconHandleFUCHSIA", DeviceLevel).}
proc getMemoryZirconHandlePropertiesFUCHSIA*(
      device: Device;
      handleType: ExternalMemoryHandleTypeFlagBits;
      zirconHandle: zx_handle_t;
      pMemoryZirconHandleProperties: ptr MemoryZirconHandlePropertiesFUCHSIA;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorInvalidExternalHandle],
      lazyload("vkGetMemoryZirconHandlePropertiesFUCHSIA", DeviceLevel).}


proc importSemaphoreZirconHandleFUCHSIA*(
      device: Device;
      pImportSemaphoreZirconHandleInfo: ptr ImportSemaphoreZirconHandleInfoFUCHSIA;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorInvalidExternalHandle],
      lazyload("vkImportSemaphoreZirconHandleFUCHSIA", DeviceLevel).}
proc getSemaphoreZirconHandleFUCHSIA*(
      device: Device;
      pGetZirconHandleInfo: ptr SemaphoreGetZirconHandleInfoFUCHSIA;
      pZirconHandle: ptr zx_handle_t;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorTooManyObjects, Result.errorOutOfHostMemory],
      lazyload("vkGetSemaphoreZirconHandleFUCHSIA", DeviceLevel).}


proc createBufferCollectionFUCHSIA*(
      device: Device;
      pCreateInfo: ptr BufferCollectionCreateInfoFUCHSIA;
      pAllocator = default(ptr AllocationCallbacks);
      pCollection: ptr BufferCollectionFUCHSIA;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorInvalidExternalHandle, Result.errorInitializationFailed],
      lazyload("vkCreateBufferCollectionFUCHSIA", DeviceLevel).}
proc setBufferCollectionImageConstraintsFUCHSIA*(
      device: Device;
      collection: BufferCollectionFUCHSIA;
      pImageConstraintsInfo: ptr ImageConstraintsInfoFUCHSIA;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorInitializationFailed, Result.errorOutOfHostMemory, Result.errorFormatNotSupported],
      lazyload("vkSetBufferCollectionImageConstraintsFUCHSIA", DeviceLevel).}
proc setBufferCollectionBufferConstraintsFUCHSIA*(
      device: Device;
      collection: BufferCollectionFUCHSIA;
      pBufferConstraintsInfo: ptr BufferConstraintsInfoFUCHSIA;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorInitializationFailed, Result.errorOutOfHostMemory, Result.errorFormatNotSupported],
      lazyload("vkSetBufferCollectionBufferConstraintsFUCHSIA", DeviceLevel).}
proc destroyBufferCollectionFUCHSIA*(
      device: Device;
      collection: BufferCollectionFUCHSIA;
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, lazyload("vkDestroyBufferCollectionFUCHSIA", DeviceLevel).}
proc getBufferCollectionPropertiesFUCHSIA*(
      device: Device;
      collection: BufferCollectionFUCHSIA;
      pProperties: ptr BufferCollectionPropertiesFUCHSIA;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorInitializationFailed],
      lazyload("vkGetBufferCollectionPropertiesFUCHSIA", DeviceLevel).}

proc loadAllVK_FUCHSIA_imagepipe_surface*(instance: Instance) = instance.loadCommands:
  createImagePipeSurfaceFUCHSIA
proc loadAllVK_FUCHSIA_external_memory*(instance: Instance) = instance.loadCommands:
  getMemoryZirconHandleFUCHSIA
  getMemoryZirconHandlePropertiesFUCHSIA
proc loadAllVK_FUCHSIA_external_semaphore*(instance: Instance) = instance.loadCommands:
  importSemaphoreZirconHandleFUCHSIA
  getSemaphoreZirconHandleFUCHSIA
proc loadAllVK_FUCHSIA_buffer_collection*(instance: Instance) = instance.loadCommands:
  createBufferCollectionFUCHSIA
  setBufferCollectionImageConstraintsFUCHSIA
  setBufferCollectionBufferConstraintsFUCHSIA
  destroyBufferCollectionFUCHSIA
  getBufferCollectionPropertiesFUCHSIA
proc loadVK_FUCHSIA_imagepipe_surface*(instance: Instance) = instance.loadCommands:
  createImagePipeSurfaceFUCHSIA
proc loadVK_FUCHSIA_external_memory*(device: Device) = device.loadCommands:
  getMemoryZirconHandleFUCHSIA
  getMemoryZirconHandlePropertiesFUCHSIA
proc loadVK_FUCHSIA_external_semaphore*(device: Device) = device.loadCommands:
  importSemaphoreZirconHandleFUCHSIA
  getSemaphoreZirconHandleFUCHSIA
proc loadVK_FUCHSIA_buffer_collection*(device: Device) = device.loadCommands:
  createBufferCollectionFUCHSIA
  setBufferCollectionImageConstraintsFUCHSIA
  setBufferCollectionBufferConstraintsFUCHSIA
  destroyBufferCollectionFUCHSIA
  getBufferCollectionPropertiesFUCHSIA
