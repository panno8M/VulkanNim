
# Bitmask operations
# Utility for bitmask operation added independently
# =================================================

import macros
import strformat
import strutils
import sets

proc `and`*[Flagbits: enum](a, b: Flagbits): Flags[Flagbits] =
  Flags[Flagbits](a.uint32 and b.uint32)
proc `and`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] =
  Flags[Flagbits](a.uint32 and b.uint32)
template `and`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] =
  b and a
proc `and`*[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] =
  Flags[Flagbits](a.uint32 and b.uint32)

proc `or`*[Flagbits: enum](a, b: Flagbits): Flags[Flagbits] =
  Flags[Flagbits](a.uint32 or b.uint32)
proc `or`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] =
  Flags[Flagbits](a.uint32 or b.uint32)
template `or`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] =
  b or a
proc `or`*[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] =
  Flags[Flagbits](a.uint32 or b.uint32)

proc `xor`*[Flagbits: enum](a, b: Flagbits): Flags[Flagbits] =
  Flags[Flagbits](a.uint32 xor b.uint32)
proc `xor`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] =
  Flags[Flagbits](a.uint32 xor b.uint32)
template `xor`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] =
  b xor a
proc `xor`*[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] =
  Flags[Flagbits](a.uint32 xor b.uint32)

proc `not`*[Flagbits: enum](a: Flags[Flagbits]): Flags =
  Flags[Flagbits](not a.uint32)

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
template `+`*[Flagbits: enum](flagsets: HashSet[Flagbits]): Flags[Flagbits] =
  flagsets.toFlags

proc `toString`*[Flagbits: enum](flags: Flags[Flagbits]): string =
  $flags{}
proc `$`*[Flagbits: enum](flags: Flags[Flagbits]): string =
  flags.toString