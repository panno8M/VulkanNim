# Generated at 2021-10-24T09:33:17Z
# VK_KHR_deferred_host_operations

import ../platform
import ../features/vk10

prepareVulkanLibDef()

const
  KhrDeferredHostOperationsSpecVersion* = 3
  KhrDeferredHostOperationsExtensionName* = "VK_KHR_deferred_host_operations"

type
  HtDeferredOperationKHR* = object of HandleType
  DeferredOperationKHR* = NonDispatchableHandle[HtDeferredOperationKHR]
  DeferredOperationInfoKHR* = object
    sType* {.constant: (StructureType.deferredOperationInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    operationHandle*: DeferredOperationKHR

proc createDeferredOperationKHR*(
      device: Device;
      pAllocator = default(ptr AllocationCallbacks);
      pDeferredOperation: ptr DeferredOperationKHR;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory),
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
      successCodes(success, notReady),
      lazyload("vkGetDeferredOperationResultKHR", DeviceLevel).}
proc deferredOperationJoinKHR*(
      device: Device;
      operation: DeferredOperationKHR;
    ): Result {.cdecl,
      successCodes(success, threadDoneKhr, threadIdleKhr),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      lazyload("vkDeferredOperationJoinKHR", DeviceLevel).}

proc loadAllVK_KHR_deferred_host_operations*(instance: Instance) =
  instance.loadCommand createDeferredOperationKHR
  instance.loadCommand destroyDeferredOperationKHR
  instance.loadCommand getDeferredOperationMaxConcurrencyKHR
  instance.loadCommand getDeferredOperationResultKHR
  instance.loadCommand deferredOperationJoinKHR

proc loadVK_KHR_deferred_host_operations*(device: Device) =
  device.loadCommand createDeferredOperationKHR
  device.loadCommand destroyDeferredOperationKHR
  device.loadCommand getDeferredOperationMaxConcurrencyKHR
  device.loadCommand getDeferredOperationResultKHR
  device.loadCommand deferredOperationJoinKHR

