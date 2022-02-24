from ../enums import ObjectType
template nonDispatchable* {.pragma.}

type
  Handle*[T: static ObjectType] = distinct pointer
  NonDispatchableHandle*[T: static ObjectType] = distinct pointer


proc `==`*[T](a, b: Handle[T]): bool = a.pointer == b.pointer

proc `==`*[T](a, b: NonDispatchableHandle[T]): bool = a.pointer == b.pointer

proc isValid*[T](h: Handle[T]): bool = h.pointer != nil
proc isValid*[T](h: NonDispatchableHandle[T]): bool = h.pointer != nil


template parent*(prt: untyped) {.pragma.}