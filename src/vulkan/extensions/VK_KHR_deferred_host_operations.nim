# Generated at 2021-09-16T07:11:43Z
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
      pAllocator = default(ptr AllocationCallbacks); # optional
      pDeferredOperation: ptr DeferredOperationKHR;
    ): Result {.cdecl, lazyload("vkCreateDeferredOperationKHR", DeviceLevel).}
proc destroyDeferredOperationKHR*(
      device: Device;
      operation = default(DeferredOperationKHR); # optional
      pAllocator = default(ptr AllocationCallbacks); # optional
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
  createDeferredOperationKHR.load(instance)
  destroyDeferredOperationKHR.load(instance)
  getDeferredOperationMaxConcurrencyKHR.load(instance)
  getDeferredOperationResultKHR.load(instance)
  deferredOperationJoinKHR.load(instance)

proc loadVK_KHR_deferred_host_operations*(device: Device) =
  createDeferredOperationKHR.load(device)
  destroyDeferredOperationKHR.load(device)
  getDeferredOperationMaxConcurrencyKHR.load(device)
  getDeferredOperationResultKHR.load(device)
  deferredOperationJoinKHR.load(device)

