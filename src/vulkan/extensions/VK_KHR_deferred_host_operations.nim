# Generated at 2021-12-31T11:28:24Z
# VK_KHR_deferred_host_operations

import ../platform

import ../features/vk10

prepareVulkanLibDef()

const
  KhrDeferredHostOperationsSpecVersion* = 4
  KhrDeferredHostOperationsExtensionName* = "VK_KHR_deferred_host_operations"

proc createDeferredOperationKHR*(
      device: Device;
      pAllocator = default(ptr AllocationCallbacks);
      pDeferredOperation: ptr DeferredOperationKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory],
      lazyload("vkCreateDeferredOperationKHR", DeviceLevel).}
proc destroyDeferredOperationKHR*(
      device: Device;
      operation = default(DeferredOperationKHR);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, lazyload("vkDestroyDeferredOperationKHR", DeviceLevel).}
proc getDeferredOperationMaxConcurrencyKHR*(
      device: Device;
      operation: DeferredOperationKHR;
    ): uint32 {.cdecl, lazyload("vkGetDeferredOperationMaxConcurrencyKHR", DeviceLevel).}
proc getDeferredOperationResultKHR*(
      device: Device;
      operation: DeferredOperationKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.notReady],
      lazyload("vkGetDeferredOperationResultKHR", DeviceLevel).}
proc deferredOperationJoinKHR*(
      device: Device;
      operation: DeferredOperationKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success, Result.threadDoneKhr, Result.threadIdleKhr],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory],
      lazyload("vkDeferredOperationJoinKHR", DeviceLevel).}

proc loadAllVK_KHR_deferred_host_operations*(instance: Instance) = instance.loadCommands:
  createDeferredOperationKHR
  destroyDeferredOperationKHR
  getDeferredOperationMaxConcurrencyKHR
  getDeferredOperationResultKHR
  deferredOperationJoinKHR
proc loadVK_KHR_deferred_host_operations*(device: Device) = device.loadCommands:
  createDeferredOperationKHR
  destroyDeferredOperationKHR
  getDeferredOperationMaxConcurrencyKHR
  getDeferredOperationResultKHR
  deferredOperationJoinKHR
