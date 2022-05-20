import std/sequtils
import std/options
import std/sugar
import std/macros {.all.}

macro `{}`*[T: object](Struct: typedesc[T]; args: varargs[untyped]): T =
  ## It makes it easier to understand what is optional, what is
  ## implicitly determined, and what needs to be explicitly set
  ## for many items in the vulkan structure. It also makes it
  ## easier to write the creation of structures.
  type UniqueOption = enum
    none
    isOptional
    isConstant
  type AdditionalInfomations = enum
    length
  type MemberInfo = object
    name: NimNode
    kind: NimNode
    case uniqueOption: UniqueOption
    of isConstant:
      constantValue: NimNode
    else: discard
    length: Option[NimNode]

  # let StructName = Struct.getImpl[0]
  # let StructPragma = Struct.getImpl[1]
  let StructInstance = Struct.getImpl[2]
  let StructReqList = StructInstance[2]

  var membersConstant: seq[MemberInfo]
  var membersRequired: seq[MemberInfo]
  var membersOptional: seq[MemberInfo]
  var membersRequiredReceived: seq[MemberInfo]
  var membersRequiredNotReceived: seq[MemberInfo]
  var membersOptionalReceived: seq[MemberInfo]
  var membersOptionalNotReceived: seq[MemberInfo]
  for i, memberNode in StructReqList:
    var pragmaExpr: Option[NimNode]
    if memberNode[0].kind == nnkPragmaExpr:
      pragmaExpr = some memberNode[0][1]

    var memberInfo: MemberInfo
    if pragmaExpr.isSome:
      block CreateMemberInfo:
        for p in pragmaExpr.get:
          if p.kind in [nnkSym] and p.eqIdent "optional":
            memberInfo = MemberInfo(uniqueOption: isOptional)
            break CreateMemberInfo
          elif p.kind in [nnkExprColonExpr] and p[0].kind in [nnkSym] and p[0].eqIdent "constant":
            memberInfo = MemberInfo(
              uniqueOption: isConstant,
              constantValue: p[1])
            break CreateMemberInfo
        memberInfo = MemberInfo(uniqueOption: none)
      for p in pragmaExpr.get:
        if p.kind in [nnkExprColonExpr]:
          if p[0].kind in [nnkSym] and p[0].eqIdent "length":
            memberInfo.length = some p[1]

    memberInfo.kind = memberNode[1]
    memberInfo.name = case memberNode[0].kind
      of nnkPragmaExpr:
        if memberNode[0][0].kind == nnkPostfix:
          memberNode[0][0][1]
        else:
          memberNode[0][0]
      of nnkPostfix:
        memberNode[0][1]
      else:
        memberNode[0]

    if memberInfo.uniqueOption == isConstant: membersConstant.add memberInfo
    elif memberInfo.uniqueOption == isOptional: membersOptional.add memberInfo
    else: membersRequired.add memberInfo
  for memberOptional in membersOptional:
    if args.anyIt(it[0].eqIdent memberOptional.name):
      membersOptionalReceived.add memberOptional
    else:
      membersOptionalNotReceived.add memberOptional

  # Mark param with the "length" pragma that point to other optional param as optional.
  for i in countdown(membersRequired.high, membersRequired.low):
    if membersRequired[i].length.isNone: continue
    if membersOptionalNotReceived
        .anyIt(it.name.eqIdent membersRequired[i].length.get):
      membersRequired.delete i

  for memberRequired in membersRequired:
    if args.anyIt(it[0].eqIdent memberRequired.name):
      membersRequiredReceived.add memberRequired
    else:
      membersRequiredNotReceived.add memberRequired

  block errorCheck:
    var errorMsg: string
    for arg in args:
      if membersConstant.anyIt(it.name.eqIdent arg[0]):
        errorMsg.add "\"" & $arg[0] & "\" is marked as constant so cannot fill it manuary\n"
    for memberRequiredNotReceived in membersRequiredNotReceived:
      errorMsg.add "\"" & memberRequiredNotReceived.name.repr & ": " & memberRequiredNotReceived.kind.repr & "\" is not optional. must be filled\n"
    if errorMsg != "": error errorMsg, Struct

  nnkObjConstr.newTree(Struct)
    .add(
      membersConstant
        .mapIt(nnkExprColonExpr.newTree(it.name, it.constantValue))
    ).add(
      args[0..^1]
    )