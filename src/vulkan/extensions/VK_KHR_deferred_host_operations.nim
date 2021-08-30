# Generated at 2021-08-29T23:53:05Z
# VK_KHR_deferred_host_operations
# =================================

import ../platform
import ../features/vk10


const
  KhrDeferredHostOperationsSpecVersion* = 3
  KhrDeferredHostOperationsExtensionName* = "VK_KHR_deferred_host_operations"

type
  DeferredOperationKHR* = object of NonDispatchableHandle
  DeferredOperationInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    operationHandle*: DeferredOperationKHR

var # commands
  createDeferredOperationKHRCage: proc(device: Device; pAllocator: ptr AllocationCallbacks; pDeferredOperation: ptr DeferredOperationKHR;): Result {.cdecl.}
  destroyDeferredOperationKHRCage: proc(device: Device; operation: DeferredOperationKHR; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  getDeferredOperationMaxConcurrencyKHRCage: proc(device: Device; operation: DeferredOperationKHR;): uint32 {.cdecl.}
  getDeferredOperationResultKHRCage: proc(device: Device; operation: DeferredOperationKHR;): Result {.cdecl.}
  deferredOperationJoinKHRCage: proc(device: Device; operation: DeferredOperationKHR;): Result {.cdecl.}
proc createDeferredOperationKHR*(
      device: Device;
      pAllocator: ptr AllocationCallbacks;
      pDeferredOperation: ptr DeferredOperationKHR;
    ): Result {.cdecl, discardable.} =
  createDeferredOperationKHRCage(device,pAllocator,pDeferredOperation)
proc destroyDeferredOperationKHR*(
      device: Device;
      operation: DeferredOperationKHR;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyDeferredOperationKHRCage(device,operation,pAllocator)
proc getDeferredOperationMaxConcurrencyKHR*(
      device: Device;
      operation: DeferredOperationKHR;
    ): uint32 {.cdecl.} =
  getDeferredOperationMaxConcurrencyKHRCage(device,operation)
proc getDeferredOperationResultKHR*(
      device: Device;
      operation: DeferredOperationKHR;
    ): Result {.cdecl, discardable.} =
  getDeferredOperationResultKHRCage(device,operation)
proc deferredOperationJoinKHR*(
      device: Device;
      operation: DeferredOperationKHR;
    ): Result {.cdecl, discardable.} =
  deferredOperationJoinKHRCage(device,operation)
proc loadVK_KHR_deferred_host_operations*(instance: Instance) =
  instance.defineLoader(`<<`)

  createDeferredOperationKHRCage << "vkCreateDeferredOperationKHR"
  destroyDeferredOperationKHRCage << "vkDestroyDeferredOperationKHR"
  getDeferredOperationMaxConcurrencyKHRCage << "vkGetDeferredOperationMaxConcurrencyKHR"
  getDeferredOperationResultKHRCage << "vkGetDeferredOperationResultKHR"
  deferredOperationJoinKHRCage << "vkDeferredOperationJoinKHR"
