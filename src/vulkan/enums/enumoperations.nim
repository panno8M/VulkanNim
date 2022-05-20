import std/macros {.all.}
from std/strutils import replace

import ./tools
from ./enumdefs import QueueFlags
from ../basetypes import Flags

# Bitmask operations
# Utility for bitmask operation added independently
# =================================================

# template queues*(v: QueueFlags) {.pragma.}

proc toFlags*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  Flags[Flagbits](flagbits)
template `{}`*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  flagbits.toFlags

macro makeFlags*[Flagbits: enum](Type: typedesc[Flags[Flagbits]]; bits: varargs[untyped]): Flags[Flagbits] =
  let FlagBitsType = Type.getTypeImpl[1].getImpl[2][1]
  if FlagBitsType.customPragmaNode().findChild(it.len == 1 and it[0].repr == "flagbits") == nil:
    error "Expect the enum that has Flagbits pragma", FlagBitsType

  if bits.len == 0:
    return ident"none".newCall Type

  for i, bit in bits:
    result =
      if i == 0:
        ident"toFlags".newCall newDotExpr(FlagBitsType, bit)
      else:
        infix result, "or", newDotExpr(FlagBitsType, bit)
template `{}`*[Flagbits: enum](Type: typedesc[Flags[Flagbits]]; bits: varargs[untyped]): Flags[Flagbits] =
  Type.makeFlags(bits)

{.push, inline.}
proc `==`*[Flagbits: enum](a, b: Flags[Flagbits]): bool =
  a.uint32 == b.uint32

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
proc `and`*[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] =
  Flags[Flagbits] (a.uint32 and b.uint32)
proc `xor`*[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] =
  # if Flags.all is 00011111:
  # 00011100 xor 00011000 = 00000100
  # 00011100 xor 10000000 = 00011100
  #              ^ overflowed value must be ignored.
  not (a and b) and (a or b)
proc `not`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] =
  Flags[Flagbits](flags.all.uint32 and not flags.uint32)

proc `*`  *[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] = a and b
proc `+`  *[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] = a or b
proc `-+-`*[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] = a xor b
proc `-`  *[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] = a and not b
{.pop.}

template defineBitOp(op): untyped =
  {.push, inline.}
  proc op*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = op(a{}, b  )
  proc op*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = op(a  , b{})
  proc op*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = op(a{}, b{})
  {.pop.}

defineBitOp `or`
defineBitOp `and`
defineBitOp `xor`
defineBitOp `*`
defineBitOp `+`
defineBitOp `-+-`
defineBitOp `-`

{.push, inline.}
proc `*=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flagbits) =        a = a * b
proc `*=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flags[Flagbits]) = a = a * b

proc `+=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flagbits) =        a = a + b
proc `+=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flags[Flagbits]) = a = a + b

proc `-+-=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flagbits) =        a = a -+- b
proc `-+-=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flags[Flagbits]) = a = a -+- b

proc `-=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flagbits) =        a = a - b
proc `-=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flags[Flagbits]) = a = a - b

proc contains*[Flagbits: enum](flags: Flags[Flagbits]; flagbits: Flagbits): bool =
  (flagbits or flags) == flags

proc contains*[Flagbits: enum](a, b: Flags[Flagbits]): bool =
  b - a == b.none

iterator items*[FlagBits: enum](flags: Flags[FlagBits]): FlagBits =
  {.warning[HoleEnumConv]: off.}
  var i_bit: int = 1
  while i_bit < FlagBits.high.ord:
    if FlagBits(i_bit) in flags:
      yield FlagBits(i_bit)
    i_bit = i_bit shl 1

iterator pairs*[FlagBits: enum](flags: Flags[FlagBits]): (int, FlagBits) =
  {.warning[HoleEnumConv]: off.}
  var idx_itr: int
  var i_bit: int = 1
  while i_bit < FlagBits.high.ord:
    if FlagBits(i_bit) in flags:
      yield (idx_itr, FlagBits(i_bit))
      inc idx_itr
    i_bit = i_bit shl 1

proc len*[FlagBits: enum](flags: Flags[FlagBits]): Natural =
  for bit in flags:
    inc result

proc `$`*[FlagBits: enum](flags: Flags[FlagBits]): string =
  result = ($FlagBits).replace("Bit", "")
  result.add "{ "
  for i, bit in flags:
    if i != 0: result.add ", "
    result.add $bit
  result.add " }"

{.pop.}

when isMainModule:
  import std/unittest
  import vulkan/enums

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