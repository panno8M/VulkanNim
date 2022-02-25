import std/macros
import std/strutils
import std/sequtils

import ../resulttraits; export resulttraits

macro genCommandChain*(Proc: proc) =
  let name =
    case Proc.repr:
    of "beginCommandBuffer": ident"begin"
    of "endCommandBuffer": ident"fin"
    of "resetCommandBuffer": ident"reset"
    else:
      if Proc.repr[0..2] != "cmd":
        error("invalid proc.", Proc)
      ident(Proc.repr[3].toLowerAscii & Proc.repr[4..^1])
  let impl = Proc.getImpl
  let params = impl.params
  let needsCheckResult = params[0].eqIdent "Result"

  let newParams = concat(
    @[quote do: lent CommandBuffer],
    params[1..^1]
  )

  result = newProc(
    name= name.postfix("*"),
    params= newparams,
    body= newStmtList(
      if needsCheckResult:
        nnkDiscardStmt.newTree(
          ident"withCheck".newCall concat(@[Proc], newparams[1..^1].mapIt it[0])
        )
      else:
        Proc.newCall(newparams[1..^1].mapIt(it[0])),
      params[1][0]
    ),
    pragmas= nnkPragma.newTree(
      ident"discardable")
  )

macro genCommandChains*(body) =
  newStmtList(
    body[0..^1].mapIt(quote do: genCommandChain `it`)
  )

macro cmdchain*(body): untyped =
  result = newstmtlist body

  let name =
    case body.name.repr:
    of "beginCommandBuffer": ident"begin"
    of "endCommandBuffer": ident"fin"
    of "resetCommandBuffer": ident"reset"
    else:
      if body.name.repr[0..2] != "cmd":
        error("invalid proc.", body.name)
      ident(body.name.repr[3].toLowerAscii & body.name.repr[4..^1])

  let impl = body
  let params = impl.params.copy
  let needsCheckResult = params[0].eqIdent "Result"
  params[0] = ident"CommandBuffer"

  let chain = newProc(
    name= name.postfix("*"),
    params= params[0..^1],
    body= newStmtList(
      if needsCheckResult:
        nnkDiscardStmt.newTree(
          ident"withCheck".newCall concat(@[body.name], params[1..^1].mapIt(if it[0].kind == nnkPragmaExpr: it[0][0] else: it[0]))
        )
      else:
        body.name.newCall(params[1..^1].mapIt(if it[0].kind == nnkPragmaExpr: it[0][0] else: it[0])),
      params[1][0]
    ),
    pragmas= nnkPragma.newTree(
      ident"discardable")
  )

  result.add chain