import std/sequtils
import std/strutils
type StrKind* = enum
  skNormal
  skComment
type sstring* = ref object
  kind: StrKind
  sons: seq[sstring]
  item: string

proc add*(ss: sstring; item: sstring) =
  ss.sons.add item

proc `&=`*(ss: sstring; item: string) =
  ss.item.add item

proc `[]`*(ss: sstring; index: BackwardsIndex): sstring =
  ss.sons[index]
proc `[]`*(ss: sstring; index: int): sstring =
  ss.sons[index]

proc get*(ss: sstring): var string = ss.item

proc `%`*(str: string): sstring =
  sstring(item: str)

proc `$`*(ss: sstring): string =
  concat(@[ss.item], ss.sons.mapIt("  " & $it)).join("\n")