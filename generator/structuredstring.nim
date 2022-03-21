import std/sequtils
import std/strutils
import std/options
type StrKind* = enum
  skLeaf
  skBlock
  skComment
type sstring* = ref object
  case kind*: StrKind
  of skLeaf, skComment:
    item*: string
  of skBlock:
    title*: string
    sons*: seq[sstring]

proc `%`*(str: string): sstring =
  sstring(kind: skLeaf, item: str)

proc comment*(str: string): sstring =
  sstring(kind: skComment, item: str)

proc add*(ss: sstring; item: sstring) =
  ss.sons.add item
proc add*(ss: sstring; item: Option[sstring]) =
  if item.isSome: ss.add item.get
proc add*(ss: sstring; item: string) =
  ss.add %item
proc add*(ss: sstring; item: Option[string]) =
  if item.isSome: ss.add item.get

proc add*(ss: sstring; items: varargs[sstring]) =
  for item in items:
    ss.add item

proc `&=`*(ss: sstring; item: string) =
  ss.item.add item

proc `[]`*(ss: sstring; index: BackwardsIndex): sstring =
  ss.sons[index]
proc `[]`*(ss: sstring; index: int): sstring =
  ss.sons[index]

proc get*(ss: sstring): var string = ss.item

proc `$`*(ss: sstring): string =
  case ss.kind
  of skLeaf: ss.item
  of skComment: ss.item.splitLines.mapIt("# " & it).join("\n")
  of skBlock:
    if ss.title.isEmptyOrWhitespace:
      ss.sons.mapIt($it).join("\n")
    else:
      ss.title & "\n" &
      ss.sons.mapIt( block:
        var x = $it
        if x.isEmptyOrWhitespace: x
        else: x.indent(2)
      ).join("\n")