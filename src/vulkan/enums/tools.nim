import std/macros
import std/strformat

template defineAlias*(TEnum: typedesc; original, alias: untyped): untyped =
  template alias*(tEnum: typedesc[TEnum]): TEnum =
    TEnum.original

macro defineAliases*(TEnum: typedesc; body: untyped): untyped =
  var aliases: seq[tuple[original: string; alias: string]]

  block Extraction:
    body.expectKind(nnkStmtList)
    for cbody in body:
      if cbody.kind != nnkInfix or
        cbody[0].kind != nnkIdent or
        (not cbody[0].eqIdent "as") or
        cbody[1].kind != nnkIdent or
        cbody[2].kind != nnkIdent:
        continue
      aliases.add ($cbody[1], $cbody[2])

  block Rendering:
    result = newStmtList()
    for alias in aliases:
      result.add "defineAlias({repr TEnum}, {alias.original}, {alias.alias})".fmt.parseStmt



template flagbits* {.pragma.}
type UnusedEnum* = object ## Reserved for future use

macro vkEnum*(body) =
  let pragma = body[0][1]
  pragma.expectKind nnkPragma
  pragma.add quote do: size(sizeof int32)
  pragma.add quote do: pure
  body

macro vkFlagBits*(body) =
  let pragma = body[0][1]
  pragma.expectKind nnkPragma
  pragma.add quote do: vkEnum
  pragma.add quote do: flagbits
  body
