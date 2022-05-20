template Handle* (handle): untyped =
  type handle* = distinct uint64
  proc `==`*(a, b: handle): bool = a.uint64 == b.uint64
  proc isNone*(a: handle): bool = a.uint64 == 0
  proc none*(a: typedesc[handle]): handle = handle(0)

template NonDispatchableHandle* (handle): untyped =
  type handle* = distinct uint64
  proc `==`*(a, b: handle): bool = a.uint64 == b.uint64
  proc isNone*(a: handle): bool = a.uint64 == 0
  proc none*(a: typedesc[handle]): handle = handle(0)

template parent*(prt: untyped) {.pragma.}