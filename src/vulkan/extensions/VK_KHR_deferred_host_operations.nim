# Generated at 2021-09-10T05:27:58Z
# VK_KHR_deferred_host_operations


import ../platform
import ../features/vk10

const
  KhrDeferredHostOperationsSpecVersion* = 3
  KhrDeferredHostOperationsExtensionName* = "VK_KHR_deferred_host_operations"

type
  HtDeferredOperationKHR = object of HandleType
  DeferredOperationKHR* = NonDispatchableHandle[HtDeferredOperationKHR]
  DeferredOperationInfoKHR* = object
    sType* {.constant: (StructureType.deferredOperationInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    operationHandle*: DeferredOperationKHR

proc createDeferredOperationKHR*(
      device: Device;
      pAllocator: ptr AllocationCallbacks;
      pDeferredOperation: ptr DeferredOperationKHR;
    ): Result {.cdecl, lazyload("vkCreateDeferredOperationKHR", DeviceLevel).}
proc destroyDeferredOperationKHR*(
      device: Device;
      operation: DeferredOperationKHR;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl, lazyload("vkDestroyDeferredOperationKHR", DeviceLevel).}
proc getDeferredOperationMaxConcurrencyKHR*(
      device: Device;
      operation: DeferredOperationKHR;
    ): uint32 {.cdecl, lazyload("vkGetDeferredOperationMaxConcurrencyKHR", DeviceLevel).}
proc getDeferredOperationResultKHR*(
      device: Device;
      operation: DeferredOperationKHR;
    ): Result {.cdecl, lazyload("vkGetDeferredOperationResultKHR", DeviceLevel).}
proc deferredOperationJoinKHR*(
      device: Device;
      operation: DeferredOperationKHR;
    ): Result {.cdecl, lazyload("vkDeferredOperationJoinKHR", DeviceLevel).}

proc loadAllVK_KHR_deferred_host_operations*(instance: Instance) =
  createDeferredOperationKHR.smartLoad(instance)
  destroyDeferredOperationKHR.smartLoad(instance)
  getDeferredOperationMaxConcurrencyKHR.smartLoad(instance)
  getDeferredOperationResultKHR.smartLoad(instance)
  deferredOperationJoinKHR.smartLoad(instance)

proc loadVK_KHR_deferred_host_operations*(device: Device) =
  createDeferredOperationKHR.smartLoad(device)
  destroyDeferredOperationKHR.smartLoad(device)
  getDeferredOperationMaxConcurrencyKHR.smartLoad(device)
  getDeferredOperationResultKHR.smartLoad(device)
  deferredOperationJoinKHR.smartLoad(device)

