
# Bitmask operations
# Utility for bitmask operation added independently
# =================================================

import macros
import strformat
import strutils
import sets

proc `==`*[Flagbits: enum](a, b: Flags[Flagbits]): bool =
  a.uint32 == b.uint32

macro `toFlagSets`*[Flagbits: enum](Type: typedesc[Flagbits]; bits: varargs[untyped]): HashSet[Flagbits] =
  if (repr Type).find("FlagBits") == -1:
    macros.error("Expect the enum that has the suffix Flagbits, got " & repr Type)
  # var resultStr = "{DebugUtilsMessageSeverityFlagBitsEXT.VerboseBitExt}"
  var resultStr = "toHashSet(["
  for bit in bits: resultStr.add "{repr Type}.{bit},".fmt
  resultStr.add "])"
  return resultStr.parseStmt
template `{}`*[Flagbits: enum](Type: typedesc[Flagbits]; bits: varargs[untyped]): HashSet[Flagbits] =
  Type.toFlagSets(bits)

proc `toFlagSets`*[Flagbits: enum](flags: Flags[Flagbits]): HashSet[Flagbits] =
  var val = 1.uint32
  let flags = flags.uint32
  while val <= flags:
    if (val and flags) != 0:
      result.incl Flagbits(val)
    val = val shl 1
template `{}`*[Flagbits: enum](flags: Flags[Flagbits]): HashSet[Flagbits] =
  flags.toFlagSets

proc `toFlags`*[Flagbits: enum](flagsets: HashSet[Flagbits]): Flags[Flagbits] =
  for flagset in flagsets:
    result = result or flagset
template `<+>`*[Flagbits: enum](flagsets: HashSet[Flagbits]): Flags[Flagbits] =
  flagsets.toFlags

proc `toFlags`*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  Flags[Flagbits](flagbits)
template `<+>`*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  flagbits.toFlags

proc `all`*[Flagbits: enum](Type: typedesc[Flags[Flagbits]]): Flags[Flagbits] =
  Flags[Flagbits]((Flagbits.high.ord-1).shl(1) or 1)
template `all`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] = flags.typeof.all
template `all`*[Flagbits: enum](Type: typedesc[HashSet[Flagbits]]): HashSet[Flagbits] = Flags[Flagbits].all.toFlagSets
template `all`*[Flagbits: enum](flagsets: HashSet[Flagbits]): HashSet[Flagbits] = flagsets.typeof.all

proc `none`*[Flagbits: enum](Type: typedesc[HashSet[Flagbits]]): HashSet[Flagbits] = return
template `none`*[Flagbits: enum](flagsets: HashSet[Flagbits]): HashSet[Flagbits] = flagsets.typeof.none
proc `none`*[Flagbits: enum](Type: typedesc[Flags[Flagbits]]): Flags[Flagbits] = return
template `none`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] = flags.typeof.none

proc `and`*[Flagbits: enum](a, b: Flagbits): Flags[Flagbits] =
  Flags[Flagbits]((a.uint32 and b.uint32) and Flagbits.all)
template `and`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = <+>a and b
template `and`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = b and a
template `and`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = <+>a and <+>b

proc `or`*[Flagbits: enum](a, b: Flagbits): Flags[Flagbits] =
  Flags[Flagbits]((a.uint32 or b.uint32) and Flagbits.all)
template `or`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = <+>a or b
template `or`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = b or a
template `or`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = <+>a or <+>b

proc `xor`*[Flagbits: enum](a, b: Flagbits): Flags[Flagbits] =
  # if Flags.all is 00011111:
  # 00011100 xor 00011000 = 00000100
  # 00011100 xor 10000000 = 00011100
  #              ^ overflowed value must be ignored.
  not (a and b) and (a or b)
template `xor`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = <+>a xor b
template `xor`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = b xor a
template `xor`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = <+>a xor <+>b

proc `not`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] =
  flags xor flags.all

template `not`*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  not flagbits.toFlags

template `not`*[Flagbits: enum](flagsets: HashSet[Flagbits]): HashSet[Flagbits] =
  (not flagsets.toFlags).toFlagSets

template `*`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a and b
template `*`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a and b
template `*`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a and b
template `*`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a and b

template `+`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a or b
template `+`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a or b
template `+`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a or b
template `+`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a or b

template `-+-`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a xor b
template `-+-`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a xor b
template `-+-`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a xor b
template `-+-`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a xor b

template `-`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a and not b
template `-`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a and not b
template `-`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a and not b
template `-`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a and not b

proc contains*[Flagbits: enum](flags: Flags[Flagbits]; flagbits: Flagbits): bool =
  (flags and flagbits) != flags.none

proc toString*[Flagbits: enum](flags: Flags[Flagbits]): string =
  $flags.toFlagSets
proc `$`*[Flagbits: enum](flags: Flags[Flagbits]): string =
  flags.toString