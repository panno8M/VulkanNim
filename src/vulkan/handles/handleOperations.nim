import handleTypes

template nonDispatchable* {.pragma.}

type
  Handle*[T: static HandleTypes] = distinct uint64
  NonDispatchableHandle*[T: static HandleTypes] = distinct uint64


proc `==`*[T](a, b: Handle[T]): bool = a.uint64 == b.uint64

proc `==`*[T](a, b: NonDispatchableHandle[T]): bool = a.uint64 == b.uint64

proc isValid*[T](h: Handle[T]): bool = h.uint64 != 0