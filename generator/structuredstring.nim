import std/sequtils
import std/strutils
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
  sstring(kind: skLeaf, item: str)

proc comment*(str: string): sstring =
  sstring(kind: skComment, item: str)

proc `$`*(ss: sstring): string =
  case ss.kind
  of skLeaf: ss.item
  of skComment: "# " & ss.item
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