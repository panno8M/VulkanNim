import std/sequtils
import std/options
import std/sets
import std/sugar
import std/macros {.all.}

import tools

converter toArrPtr*[T](x: var seq[T]): arrPtr[T] =
  if x.len == 0: nil
  else: addr x[0]
converter toArrPtr*[I, T](x: var array[I, T]): arrPtr[T] =
  when x.len == 0: nil
  else: addr x[0]

macro `{}`*[T: object](Struct: typedesc[T]; args: varargs[untyped]): T =
  ## It makes it easier to understand what is optional, what is
  ## implicitly determined, and what needs to be explicitly set
  ## for many items in the vulkan structure. It also makes it
  ## easier to write the creation of structures.

  let structMemDefs = Struct.getImpl[2][2][0..^1]
  type StructArg = object
    name: NimNode
    kind: NimNode
    isOptional: bool
    constant: Option[NimNode]
    length: Option[NimNode]

  let structArgs = structMemDefs.map proc(it: NimNode): StructArg =
    result.name = it[0]
    result.kind = it[1]
    var pragma: Option[NimNode]
    if it[0].kind == nnkPragmaExpr:
      result.name = it[0][0]
      pragma = some it[0][1]
    var exportIt: bool
    if result.name.kind == nnkPostfix and result.name[0].eqIdent "*":
      exportIt = true
      result.name = result.name[1]
    if pragma.isSome:
      for p in pragma.get:
        if p.kind == nnkSym and $p == "optional":
          result.isOptional = true
        if p.kind == nnkExprColonExpr:
          if p[0].kind == nnkSym and $p[0] == "constant":
            result.constant = some p[1]
          if p[0].kind == nnkSym and $p[0] == "length":
            result.length = some p[1]
  let argsCanNotFill = structArgs.filterIt: it.constant.isSome
  let argsOptional = structArgs.filterIt: it.isOptional
  let argsFilledOptional = args
    .mapIt(argsOptional.filter(x => eqIdent(x.name, it[0]) and x.isOptional))
    .filterIt(it.len != 0)
    .mapIt(it[0])
  let argsBlankOptional = argsOptional.filter(x => not argsFilledOptional.anyIt(it == x))
  var argsNeedFill = structArgs.filterIt: not it.isOptional and it.constant.isNone
  # Mark param with the "length" pragma that point to other optional param as optional.
  for i in countdown(argsNeedFill.high, argsNeedFill.low):
    if argsNeedFill[i].length.isNone: continue
    if argsBlankOptional
        .anyIt(eqIdent(it.name, argsneedFill[i].length.get)):
      argsNeedFill.delete i

  block errorCheck:
    for arg in args:
      if argsCanNotFill.anyIt(eqIdent(it.name, arg[0])):
        error "\"" & $arg[0] & "\" is marked as constant so cannot fill it manuary", arg
    for argneed in argsNeedFill:
      if not args.anyIt(eqIdent(it[0], argneed.name)):
        error "\"" & argneed.name.repr & ": " & argneed.kind.repr & "\" is not optional. must be filled", Struct

  newNimNode(nnkObjConstr)
    .add(Struct)
    .add(structArgs
      .filterIt(it.constant.isSome)
      .mapIt(newNimNode(nnkExprColonExpr).add(it.name, it.constant.get)))
    .add(args[0..^1])