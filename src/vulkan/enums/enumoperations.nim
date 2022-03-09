import std/macros {.all.}

import tools

from ../basetypes import Flags

# Bitmask operations
# Utility for bitmask operation added independently
# =================================================

proc `==`*[Flagbits: enum](a, b: Flags[Flagbits]): bool =
  a.uint32 == b.uint32

proc toFlags*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  Flags[Flagbits](flagbits)
template `{}`*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  flagbits.toFlags

macro makeFlags*[Flagbits: enum](Type: typedesc[Flags[Flagbits]]; bits: varargs[untyped]): Flags[Flagbits] =
  let FlagBitsType = Type.getTypeImpl[1].getImpl[2][1]
  if FlagBitsType.customPragmaNode().findChild(it.len == 1 and it[0].repr == "flagbits") == nil:
    error "Expect the enum that has Flagbits pragma", FlagBitsType

  if bits.len == 0:
    return ident"none".newCall nnkBracketExpr.newTree(ident"Flags", FlagBitsType)

  for i, bit in bits:
    result =
      if i == 0:
        ident"toFlags".newCall newDotExpr(FlagBitsType, bit)
      else:
        infix result, "or", newDotExpr(FlagBitsType, bit)
template `{}`*[Flagbits: enum](Type: typedesc[Flags[Flagbits]]; bits: varargs[untyped]): Flags[Flagbits] =
  Type.makeFlags(bits)

proc `all`*[Flagbits: enum](Type: typedesc[Flags[Flagbits]]): Flags[Flagbits] =
  Flags[Flagbits] Flagbits.high.ord.shl(1) - 1
proc `all`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] = flags.typeof.all

proc `none`*[Flagbits: enum](Type: typedesc[Flags[Flagbits]]): Flags[Flagbits] = return
proc `none`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] = return
proc `none`*(flags: typedesc[Flags[UnusedEnum]]): Flags[UnusedEnum] = return

proc isSome*[Flagbits: enum](flags: Flags[Flagbits]): bool = flags != Flags[Flagbits].none

proc isNone*[Flagbits: enum](flags: Flags[Flagbits]): bool = flags == Flags[Flagbits].none

proc `or`*[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] =
  Flags[Flagbits] a.uint32 or b.uint32
proc `or`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a or b{}
proc `or`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = b or a
proc `or`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a{} or b{}

proc `and`*[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] =
  Flags[Flagbits] (a.uint32 and b.uint32)
proc `and`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a and b{}
proc `and`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = b and a
proc `and`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a{} and b{}

proc `xor`*[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] =
  # if Flags.all is 00011111:
  # 00011100 xor 00011000 = 00000100
  # 00011100 xor 10000000 = 00011100
  #              ^ overflowed value must be ignored.
  not (a and b) and (a or b)
proc `xor`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a xor b{}
proc `xor`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = b xor a
proc `xor`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a{} xor b{}

proc `not`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] =
  Flags[Flagbits](flags.all.uint32 and not flags.uint32)

proc `not`*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  not flagbits.toFlags

proc `*`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a and b
proc `*`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a and b
proc `*`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a and b
proc `*`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a and b

proc `+`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a or b
proc `+`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a or b
proc `+`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a or b
proc `+`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a or b

proc `-+-`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a xor b
proc `-+-`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a xor b
proc `-+-`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a xor b
proc `-+-`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a xor b

proc `-`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a and not b
proc `-`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a and not b
proc `-`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a and not b
proc `-`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a and not b

proc `*=`*[Flagbits: enum](a: var Flagbits; b: Flagbits) =               a = a * b
proc `*=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flagbits) =        a = a * b
proc `*=`*[Flagbits: enum](a: var Flagbits; b: Flags[Flagbits]) =        a = a * b
proc `*=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flags[Flagbits]) = a = a * b

proc `+=`*[Flagbits: enum](a: var Flagbits; b: Flagbits) =               a = a + b
proc `+=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flagbits) =        a = a + b
proc `+=`*[Flagbits: enum](a: var Flagbits; b: Flags[Flagbits]) =        a = a + b
proc `+=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flags[Flagbits]) = a = a + b

proc `-+-=`*[Flagbits: enum](a: var Flagbits; b: Flagbits) =               a = a -+- b
proc `-+-=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flagbits) =        a = a -+- b
proc `-+-=`*[Flagbits: enum](a: var Flagbits; b: Flags[Flagbits]) =        a = a -+- b
proc `-+-=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flags[Flagbits]) = a = a -+- b

proc `-=`*[Flagbits: enum](a: var Flagbits; b: Flagbits) =               a = a - b
proc `-=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flagbits) =        a = a - b
proc `-=`*[Flagbits: enum](a: var Flagbits; b: Flags[Flagbits]) =        a = a - b
proc `-=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flags[Flagbits]) = a = a - b

proc contains*[Flagbits: enum](flags: Flags[Flagbits]; flagbits: Flagbits): bool =
  (flags and flagbits) != flags.none

proc contains*[Flagbits: enum](a, b: Flags[Flagbits]): bool =
  b - a == b.none

iterator items*[FlagBits: enum](flags: Flags[FlagBits]): FlagBits =
  for bit in FlagBits.low.ord..FlagBits.high.ord:
    if cast[FlagBits](bit) in flags: yield cast[FlagBits](bit)

proc len*[FlagBits: enum](flags: Flags[FlagBits]): Natural =
  for bit in flags:
    inc result

import tables
var flagbitsCache = newTable[string, uint32]()

proc `carefulAll`*[Flagbits: enum](Type: typedesc[Flags[Flagbits]]): Flags[Flagbits] =
  ## Mainly used for flags with non-contiguous bits, such as the DebugUtilsMessageSeverity flag.
  try:
    return Flags[Flagbits](flagbitsCache[$Type])
  except KeyError:
    var x = Flagbits.low.ord
    while x <= Flagbits.high.ord:
      let bit = Flagbits(x)
      if not ($bit)[0].isDigit:
        result = result or bit
      x = x shl 1
    flagbitsCache[$Type] = result.uint32

proc `carefulNot`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] =
  ## Mainly used for flags with non-contiguous bits, such as the DebugUtilsMessageSeverity flag.
  Flags[Flagbits](flags.typeof.carefulAll.uint32 and not flags.uint32)
proc `carefulNot`*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  ## Mainly used for flags with non-contiguous bits, such as the DebugUtilsMessageSeverity flag.
  carefulNot flagbits.toFlags

when isMainModule:
  import std/unittest
  import vulkan/enums

  macro makeFlagsTest*[Flagbits: enum](Type: typedesc[Flags[Flagbits]]) =
    hint treeRepr Type.getTypeImpl[1].getImpl[2][1].customPragmaNode
  macro makeFlagsTest*[Flagbits: enum](Type: typedesc[Flagbits]) =
    hint treeRepr Type.customPragmaNode

  QueueFlags.makeFlagsTest
  QueueFB.makeFlagsTest

  test "flagsA contains flagsB":
    let
      a = QueueFlags{graphics}
      b = QueueFlags{graphics, transfer}
      c = QueueFlags{transfer}
      d = QueueFlags{graphics, transfer, compute}
      e = QueueFlags{compute}

    check a in a

    check a in b
    check b notin a

    check a notin c
    check c notin a

    check b in d
    check d notin b

    check b notin e
    check e notin b