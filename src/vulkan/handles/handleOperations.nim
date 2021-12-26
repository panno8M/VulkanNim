import handleTypes

template nonDispatchable* {.pragma.}

type
  Handle*[T: static HandleTypes = HtNil] = distinct uint64
  NonDispatchableHandle*[T: static HandleTypes = HtNil] {.nonDispatchable.} = Handle[T]


proc `==`*[T](a, b: Handle[T]): bool = a.uint64 == b.uint64
proc `==`*[T](a: Handle[T]; b: Handle[HtNil]): bool = a.uint64 == b.uint64
template `==`*[T](a: Handle[HtNil]; b: Handle[T]): bool = b == a
proc `==`*(a, b: Handle[HtNil]): bool = a.uint64 == b.uint64

proc isValid*[T](h: Handle[T]): bool = h.uint64 != 0

proc nullHandle*[T](H: typedesc[Handle[T]]): Handle[T] = H(0)