
import ../platform
import ../features/vk10


type
  DeferredOperationInfoKHR* = object
    sType*: StructureType
    pNext*: pointer
    operationHandle*: DeferredOperationKHR
  DeferredOperationKHR* = distinct NonDispatchableHandle

const KhrDeferredHostOperationsExtensionName* = "VK_KHR_deferred_host_operations"
const KhrDeferredHostOperationsSpecVersion* = 3
var # commands
  getDeferredOperationMaxConcurrencyKHRCage: proc(device: Device; operation: DeferredOperationKHR;): uint32 {.cdecl.}
  getDeferredOperationResultKHRCage: proc(device: Device; operation: DeferredOperationKHR;): Result {.cdecl.}
  deferredOperationJoinKHRCage: proc(device: Device; operation: DeferredOperationKHR;): Result {.cdecl.}
  destroyDeferredOperationKHRCage: proc(device: Device; operation: DeferredOperationKHR; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  createDeferredOperationKHRCage: proc(device: Device; pAllocator: ptr AllocationCallbacks; pDeferredOperation: ptr DeferredOperationKHR;): Result {.cdecl.}

proc getDeferredOperationMaxConcurrencyKHR*(
      device: Device;
      operation: DeferredOperationKHR;
    ): uint32 {.cdecl.} =
  getDeferredOperationMaxConcurrencyKHRCage(device,operation)

proc getDeferredOperationResultKHR*(
      device: Device;
      operation: DeferredOperationKHR;
    ): Result {.cdecl.} =
  getDeferredOperationResultKHRCage(device,operation)

proc deferredOperationJoinKHR*(
      device: Device;
      operation: DeferredOperationKHR;
    ): Result {.cdecl.} =
  deferredOperationJoinKHRCage(device,operation)

proc destroyDeferredOperationKHR*(
      device: Device;
      operation: DeferredOperationKHR;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyDeferredOperationKHRCage(device,operation,pAllocator)

proc createDeferredOperationKHR*(
      device: Device;
      pAllocator: ptr AllocationCallbacks;
      pDeferredOperation: ptr DeferredOperationKHR;
    ): Result {.cdecl.} =
  createDeferredOperationKHRCage(device,pAllocator,pDeferredOperation)


proc loadVK_KHR_deferred_host_operations*(instance: Instance) =
  instance.defineLoader(`<<`)

  getDeferredOperationMaxConcurrencyKHRCage << "vkGetDeferredOperationMaxConcurrencyKHR"
  getDeferredOperationResultKHRCage << "vkGetDeferredOperationResultKHR"
  deferredOperationJoinKHRCage << "vkDeferredOperationJoinKHR"
  destroyDeferredOperationKHRCage << "vkDestroyDeferredOperationKHR"
  createDeferredOperationKHRCage << "vkCreateDeferredOperationKHR"