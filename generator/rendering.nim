import strutils
import sequtils
import strformat
import options
import algorithm

import ./utils
import ./nodedefs
import ./structuredstring

func cmp(a, b: NodeEnumVal): int =
  case a.kind
    of nkeValue:
      case b.kind
      of nkeValue:  cmp(a.value, b.value)
      of nkeBitpos: cmp(a.value, 1.shl(b.bitpos))
    of nkeBitpos:
      case b.kind
      of nkeValue:  cmp(1.shl(a.bitpos), b.value)
      of nkeBitpos: cmp(1.shl(a.bitpos), 1.shl(b.bitpos))

proc render*(enumVal: NodeEnumVal; vendorTags: VendorTags; enumsName: string): string =
  let name = enumVal.name.parseEnumValue(enumsName, vendorTags)

  result.add  do:
    case enumVal.kind
    of nkeValue:
      if enumVal.isHex: "{name} = 0x{enumVal.value.toHex(8)}".fmt
      else: "{name} = {enumVal.value}".fmt
    of nkeBitpos:
      "{name} = 0x{1.shl(enumVal.bitpos).toHex(8)}".fmt

  if enumVal.comment.isSome:
    result.add " # " & enumVal.comment.get


proc render*(enums: NodeEnum; vendorTags: VendorTags): sstring =
  result = sstring(kind: skBlock)
  let name = enums.name.removeVkPrefix

  if enums.comment.isSome:
    result.add comment enums.comment.get

  if enums.enumVals.len == 0:
    result.add %"{name}* = distinct UnusedEnum".fmt
    return

  result.add sstring(kind: skBlock,
    title:
      if name.find("FlagBits") == -1:
        "{name}* {{.vkEnum.}} = enum".fmt
      else:
        "{name}* {{.vkFlagBits.}} = enum".fmt
  )

  var lastExt = ""
  for field in enums.enumvals.sorted(cmp):
    if field.isExtended and field.providedBy != lastExt:
      lastExt = field.providedBy
      result[^1].add comment "Provided by " & lastExt
    result[^1].add %field.render(vendorTags, name)


proc render*(enumAlias: NodeEnumAlias; vendorTags: VendorTags; enumName: string): Option[string] =
  let name = enumAlias.name.parseEnumValue(enumName, vendorTags)
  let alias = enumAlias.alias.parseEnumValue(enumName, vendorTags)
  if name == alias: return
  var res: string
  if enumAlias.isExtended:
    res.add "# Provided by {enumAlias.providedBy}\n".fmt
  res.add "{alias} as {name}".fmt
  if enumAlias.comment.isSome:
    res.add " # " & enumAlias.comment.get
  return some res


proc render*(enumAliases: NodeEnumAliases; vendorTags: VendorTags): string =
  if enumAliases.aliases.len == 0: return
  let name = enumAliases.name.removeVkPrefix
  result.add "{name}.defineAliases:\n".fmt
  for alias in enumAliases.aliases:
    let elem = render(alias, vendorTags, name)
    if elem.isSome:
      result.add elem.get.indent(2) & "\n"


proc render*(cons: NodeConst): string =
  let name = cons.name.parseVariableNameFromSnake
  let value = case name
    of "True", "False": "Bool32({cons.value})".fmt
    else: cons.value
  result = "{name}* = {value}".fmt
  if cons.comment.isSome:
    result.add " # " & cons.comment.get


proc render*(consAlias: NodeConstAlias): string =
  let name = consAlias.name.parseVariableNameFromSnake
  let alias = consAlias.alias.parseVariableNameFromSnake
  result = "{name}* = {alias}".fmt
  if consAlias.comment.isSome:
    result.add " # " & consAlias.comment.get


proc render*(funcPtr: NodeFuncPtr): string =
  let name = funcPtr.name.parseTypeName
  let theType = funcPtr.theType.parseTypeName(funcPtr.ptrLv)
  result &= "{name}* = proc(".fmt
  let args = funcPtr.args
    .map( proc(arg: tuple[name, theType: string, ptrLv: Natural]): string =
      result = arg.name.parseParamName & ": "
      let theType = arg.theType.replaceBasicTypes
      result.add ("ptr ".repeat(arg.ptrLv) & theType).replacePtrTypes
      result &= ";"
    )
  if args.len != 0:
    result &= "\n" & args.join("\n").indent(4) & "\n  "
  result &= "): {theType} ".fmt & "{.cdecl.}"


proc render*(define: NodeDefine): string = define.str


proc render*(struct: Nodestruct): string =
  if struct.comment.isSome:
    result &= struct.comment.get.commentify.LF
  let name = struct.name.removeVkPrefix

  result.add case struct.isUnion
    of true: "{name}* {{.union.}} = object".fmt
    of false: "{name}* = object".fmt

  let members = struct.members.mapIt(block:
    let
      theType =
        case it.arrayStyle
        of nasPtr: it.theType.parseTypeName(ptrLen= it.ptrLen)
        of nasFix: it.theType.parseTypeName(dim= it.dim)
        of nasNotArray: it.theType.parseTypeName(ptrLv= it.ptrLv)
      name = it.name.parseParamName
      pragmas =
        ( if it.optional: @["optional"]
          elif it.values.isSome:
            let value = it.values.get.parseEnumValue("vkStructureType", @[])
            @[&"constant: (StructureType.{value})"]
          else: newSeq[string]()
        ).concat(
          if it.arrayStyle == nasPtr:
            let annotated = it.ptrLen.filterIt(it.isSome)
            if annotated.len != 0:
              @["length: " & annotated.mapIt(it.get).join(", ")]
            else: newSeq[string]()
          else: newSeq[string]()
        )
    if pragmas.len != 0:
      "  {name}* {{.{pragmas.join(\", \")}.}}: {theType}".fmt
    else:
      "  {name}*: {theType}".fmt
  )
  if members.len != 0:
    result.LF
    result &= members.join("\n")


proc render*(bitmask: NodeBitmask): string =
  let name = bitmask.name.replaceBasicTypes
  case bitmask.kind
  of nkbrNormal:
    if bitmask.flagbitsReq.isSome:
      "{name}* = Flags[{bitmask.flagbitsReq.get.removeVkPrefix}]".fmt
    else:
      "{name}* = Flags[distinct UnusedEnum]".fmt
  of nkbrAlias:
    let alias = bitmask.alias.replaceBasicTypes
    "{name}* = {alias}".fmt


proc renderHandleType*(handle: NodeHandle): Option[string] =
  let name = handle.name.replaceBasicTypes
  case handle.kind
  of nkbrNormal:
    case handle.handleKind
    of HandleKind.Handle               : some "Ht" & name
    of HandleKind.NonDispatchableHandle: some "Ht" & name
  of nkbrAlias                         : none string
proc render*(handle: NodeHandle): string =
  let name = handle.name.replaceBasicTypes
  case handle.kind
  of nkbrNormal:
    case handle.handleKind
    of HandleKind.Handle:
      "{name}* = Handle[Ht{name}]".fmt
    of HandleKind.NonDispatchableHandle:
      "{name}* = NonDispatchableHandle[Ht{name}]".fmt
  of nkbrAlias:
    let alias = handle.alias.replaceBasicTypes
    "{name}* = {alias}".fmt


proc render*(command: NodeCommand): string =
  let name = command.name.parseCommandName
  # let name = command.name
  case command.kind
  of nkbrNormal:
    let theType = command.theType.parseTypeName
    let procHeader = "proc {name}*(".fmt
    let procParams = command.params
      .mapIt( block:
        let name = it.name.parseParamName
        let theType = case it.arrayStyle
          of nasNotArray: it.theType.parseTypeName(it.ptrLv)
          of nasPtr: it.theType.parseTypeName(it.ptrLen)
          else: raiseAssert "arrayStyle must be NotArray or Ptr"
        let lengthAnno =
          if it.arrayStyle != nasPtr or it.ptrLen.allIt(it.isNone): ""
          else:
            let lengthAnno = it.ptrLen.filterIt(it.isSome).mapIt(it.get.replace("->", ".")).join(", ")
            " {{.length: {lengthAnno}.}}".fmt
        if it.optional:
          "      {name}{lengthAnno} = default({theType});".fmt
        else:
          "      {name}{lengthAnno}: {theType};".fmt)
    let loadMethod = case command.loadMode
      of lmPreload: "preload(\"{command.name}\")".fmt
      of lmWithInstance: "lazyload(\"{command.name}\", InstanceLevel)".fmt
      of lmWithDevice: "lazyload(\"{command.name}\", DeviceLevel)".fmt
    let procFutter = block:
      var futter = "    ): {theType} {{.cdecl,".fmt
      if command.successCodes.len != 0:
        futter.add "\n      successCodes(" & command.successCodes.mapIt(it.parseEnumValue("", @[])).join(", ") & "),"
      if command.errorCodes.len != 0:
        futter.add "\n      errorCodes(" & command.errorCodes.mapIt(it.parseEnumValue("", @[])).join(", ") & "),"
      if command.successCodes.len+command.errorCodes.len != 0:
        futter.add "\n      " & loadMethod
      else: futter.add " " & loadMethod
      futter & ".}"

    result &= procHeader
    if procParams.len != 0:
      result &= '\n' & procParams.join("\n") & '\n'
    result &= procFutter
    # result &= "  {cageName}({cageParams.join(\",\")})".fmt
    return
  of nkbrAlias:
    let alias = command.alias.parseCommandName
    return "const {name}* = {alias}".fmt


proc render*(basetype: NodeBasetype): string =
  let name = basetype.name.removeVkPrefix
  case basetype.kind
  of nkbNormal:
    let theType = basetype.theType.replaceBasicTypes
    case name
    of "Flags": "{name}*[Flagbits] = distinct {theType}".fmt
    else: "{name}* = distinct {theType}".fmt
  of nkbExternal:
    "{name}* = ptr object # defined at {basetype.path}".fmt
