# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_FUCHSIA_imagepipe_surface
# VK_FUCHSIA_external_memory
# VK_FUCHSIA_external_semaphore
# VK_FUCHSIA_buffer_collection

import ../../tools
const
  # VK_FUCHSIA_imagepipe_surface
  FuchsiaImagepipeSurfaceSpecVersion* = 1
  FuchsiaImagepipeSurfaceExtensionName* = "VK_FUCHSIA_imagepipe_surface"
  # VK_FUCHSIA_external_memory
  FuchsiaExternalMemorySpecVersion* = 1
  FuchsiaExternalMemoryExtensionName* = "VK_FUCHSIA_external_memory"
  # VK_FUCHSIA_external_semaphore
  FuchsiaExternalSemaphoreSpecVersion* = 1
  FuchsiaExternalSemaphoreExtensionName* = "VK_FUCHSIA_external_semaphore"
  # VK_FUCHSIA_buffer_collection
  FuchsiaBufferCollectionSpecVersion* = 2
  FuchsiaBufferCollectionExtensionName* = "VK_FUCHSIA_buffer_collection"


# VK_FUCHSIA_imagepipe_surface
# ============================
proc createImagePipeSurfaceFUCHSIA*(
      instance: Instance;
      pCreateInfo: ptr ImagePipeSurfaceCreateInfoFUCHSIA;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.lazyload("vkCreateImagePipeSurfaceFUCHSIA", InstanceLevel),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory].}

# VK_FUCHSIA_external_memory
# ==========================
proc getMemoryZirconHandleFUCHSIA*(
      device: Device;
      pGetZirconHandleInfo: ptr MemoryGetZirconHandleInfoFUCHSIA;
      pZirconHandle: ptr zx_handle_t;
    ): Result {.lazyload("vkGetMemoryZirconHandleFUCHSIA", DeviceLevel),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorTooManyObjects, Result.errorOutOfHostMemory].}
proc getMemoryZirconHandlePropertiesFUCHSIA*(
      device: Device;
      handleType: ExternalMemoryHandleTypeFlagBits;
      zirconHandle: zx_handle_t;
      pMemoryZirconHandleProperties: ptr MemoryZirconHandlePropertiesFUCHSIA;
    ): Result {.lazyload("vkGetMemoryZirconHandlePropertiesFUCHSIA", DeviceLevel),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorInvalidExternalHandle].}

# VK_FUCHSIA_external_semaphore
# =============================
proc importSemaphoreZirconHandleFUCHSIA*(
      device: Device;
      pImportSemaphoreZirconHandleInfo: ptr ImportSemaphoreZirconHandleInfoFUCHSIA;
    ): Result {.lazyload("vkImportSemaphoreZirconHandleFUCHSIA", DeviceLevel),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorInvalidExternalHandle].}
proc getSemaphoreZirconHandleFUCHSIA*(
      device: Device;
      pGetZirconHandleInfo: ptr SemaphoreGetZirconHandleInfoFUCHSIA;
      pZirconHandle: ptr zx_handle_t;
    ): Result {.lazyload("vkGetSemaphoreZirconHandleFUCHSIA", DeviceLevel),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorTooManyObjects, Result.errorOutOfHostMemory].}

# VK_FUCHSIA_buffer_collection
# ============================
proc createBufferCollectionFUCHSIA*(
      device: Device;
      pCreateInfo: ptr BufferCollectionCreateInfoFUCHSIA;
      pAllocator = default(ptr AllocationCallbacks);
      pCollection: ptr BufferCollectionFUCHSIA;
    ): Result {.lazyload("vkCreateBufferCollectionFUCHSIA", DeviceLevel),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorInvalidExternalHandle, Result.errorInitializationFailed].}
proc setBufferCollectionImageConstraintsFUCHSIA*(
      device: Device;
      collection: BufferCollectionFUCHSIA;
      pImageConstraintsInfo: ptr ImageConstraintsInfoFUCHSIA;
    ): Result {.lazyload("vkSetBufferCollectionImageConstraintsFUCHSIA", DeviceLevel),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorInitializationFailed, Result.errorOutOfHostMemory, Result.errorFormatNotSupported].}
proc setBufferCollectionBufferConstraintsFUCHSIA*(
      device: Device;
      collection: BufferCollectionFUCHSIA;
      pBufferConstraintsInfo: ptr BufferConstraintsInfoFUCHSIA;
    ): Result {.lazyload("vkSetBufferCollectionBufferConstraintsFUCHSIA", DeviceLevel),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorInitializationFailed, Result.errorOutOfHostMemory, Result.errorFormatNotSupported].}
proc destroyBufferCollectionFUCHSIA*(
      device: Device;
      collection: BufferCollectionFUCHSIA;
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.lazyload("vkDestroyBufferCollectionFUCHSIA", DeviceLevel).}
proc getBufferCollectionPropertiesFUCHSIA*(
      device: Device;
      collection: BufferCollectionFUCHSIA;
      pProperties: ptr BufferCollectionPropertiesFUCHSIA;
    ): Result {.lazyload("vkGetBufferCollectionPropertiesFUCHSIA", DeviceLevel),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorInitializationFailed].}


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