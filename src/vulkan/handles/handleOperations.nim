from ../enums import ObjectType
template nonDispatchable* {.pragma.}

type
  Handle*[T: static ObjectType] = distinct uint64
  NonDispatchableHandle*[T: static ObjectType] = distinct uint64


proc `==`*[T](a, b: Handle[T]): bool = a.uint64 == b.uint64

proc `==`*[T](a, b: NonDispatchableHandle[T]): bool = a.uint64 == b.uint64

proc isValid*[T](h: Handle[T]): bool = h.uint64 != 0
proc isValid*[T](h: NonDispatchableHandle[T]): bool = h.uint64 != 0


template parent*(prt: untyped) {.pragma.}