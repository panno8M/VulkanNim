{.experimental: "strictFuncs".}

import strutils
import os
import sequtils
import sugar
import strformat
import options
import algorithm
import xmltree
import tables
import logging

import ./utils
import ./nodedefs
import ./liblogger
import ./defineTypeComponents

type UnexpectedXmlStructureError* = object of CatchableError
template xmlError*(title: Title; strs: varargs[string, `$`]): untyped =
  raise UnexpectedXmlStructureError.newException(logMsg(title, strs))
proc invalidStructure*(at: string): Title = 
    title("@" & at & " > invalid structure")
proc cmp(a, b: NodeEnumVal): int =
  case a.kind
    of nkeValue:
      case b.kind
      of nkeValue: cmp(a.value, b.value)
      of nkeBitpos: cmp(a.value, 1.shl(b.bitpos))
    of nkeBitpos:
      case b.kind
      of nkeValue: cmp(1.shl(a.bitpos), b.value)
      of nkeBitpos: cmp(1.shl(a.bitpos), 1.shl(b.bitpos))

# SECTION renderers

proc render*(enumVal: NodeEnumVal; vendorTags: VendorTags; enumsName: string): string =
  let name = enumVal.name.parseEnumName(enumsName, vendorTags)
  case enumVal.kind
  of nkeValue:
    if enumVal.isExtended:
      result &= "# Provided by {enumVal.providedBy}\n".fmt
    result
      .add if enumVal.isHex: "{name} = 0x{enumVal.value.toHex(8)}".fmt
      else: "{name} = {enumVal.value}".fmt
    if enumVal.comment.isSome:
      result &= enumVal.comment.get.commentify.indent(1)
  of nkeBitpos:
    if enumVal.isExtended:
      result &= "# Provided by {enumVal.providedBy}\n".fmt
    result &= "{name} = 0x{1.shl(enumVal.bitpos).toHex(8)}".fmt
    if enumVal.comment.isSome:
      result &= enumVal.comment.get.commentify.indent(1)
proc render*(enumAlias: NodeEnumAlias; vendorTags: VendorTags): string =
  let name = enumAlias.name.parseEnumName(enumAlias.enumName, vendorTags)
  let alias = enumAlias.alias.parseEnumName(enumAlias.enumName, vendorTags)
  if enumAlias.isExtended:
    result &= "# Provided by {enumAlias.providedBy}\n".fmt
  result &= "{enumAlias.enumName.removeVkPrefix}.defineAlias({name}, {alias})".fmt
  if enumAlias.comment.isSome:
    result &= enumAlias.comment.get.commentify.indent(1)

proc render*(enums: NodeEnum; vendorTags: VendorTags): string =
  let name = enums.name.removeVkPrefix
  if enums.comment.isSome:
    result &= enums.comment.get.commentify.LF
  if enums.enumVals.len == 0:
    result &= "{name}* = UnusedEnum".fmt
    return
  result &= "{name}* {enumPragma} = enum\n".fmt
  result &= enums
    .enumVals
    .sorted(cmp)
    .mapIt(it.render(vendorTags, name))
    .join("\n").indent(2)

proc render*(cons: NodeConst): string =
  let name = cons.name.parseVariableNameFromSnake
  result = "const {name}* = {cons.value}".fmt
  if cons.comment.isSome:
    result &= cons.comment.get.commentify.indent(1)

proc render*(consAlias: NodeConstAlias): string =
  let name = consAlias.name.removeVkPrefix.toUpperCamel
  result = "template {name}*(): untyped =\n".fmt
  if consAlias.comment.isSome:
    result &= consAlias.comment.get.commentify.indent(2).LF
  result &= consAlias.alias.toUpperCamel.indent(2)

proc render*(funcPtr: NodeFuncPtr): string =
  let name = funcPtr.name.parseTypeName
  let theType = funcPtr.theType.parseTypeName(funcPtr.ptrLv)
  result &= "{name}* = proc(".fmt
  let args = funcPtr.args
    .map( proc(arg: tuple[name, theType: string, ptrLv: Natural]): string =
      result = arg.name & ": "
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

  let members = struct.members
    .mapIt(block:
      let
        theType = it.theType.parseTypeName(it.ptrLv, it.length)
        name = it.name.parseParamName
      "  {name}*: {theType}".fmt)
  if members.len != 0:
    result.LF
    result &= members.join("\n")

proc render*(bitmask: NodeBitmask): string =
  let name = bitmask.name.replaceBasicTypes
  case bitmask.kind
  of nkbrNormal:
    "{name}* = distinct Flags".fmt
  of nkbrAlias:
    "{name}* = {Alias}"


proc render*(handle: NodeHandle): string =
  let name = handle.name.replaceBasicTypes
  case handle.kind
  of nkbrNormal:
    let handleType = handle.handleType
    case handleType
    of "VK_DEFINE_HANDLE":
      "{name}* = distinct Handle".fmt
    of "VK_DEFINE_NON_DISPATCHABLE_HANDLE":
      "{name}* = distinct NonDispatchableHandle".fmt
    else:
      "FIXME: [Unsupported HANDLE]\n{repr handle}".fmt.commentify
  of nkbrAlias:
    let alias = handle.alias.replaceBasicTypes
    "{name}* = {alias}".fmt

proc renderCage*(command: NodeCommand): string =
  if command.kind == nkbrNormal:
    let name = command.name.parseCommandName & "Cage"
    let theType = command.theType.parseTypeName
    result &= "{name}: proc(".fmt
    let params = command.params
      .mapIt( block:
        let name = it.name.parseParamName
        let theType = it.theType.parseTypeName(it.ptrLv)
        "{name}: {theType};".fmt)
    if params.len != 0:
      result &= params.join(" ")
    result &= "): {theType} {commandPragma}".fmt
proc renderAccessor*(command: NodeCommand): string =
  let name = command.name.parseCommandName
  case command.kind
  of nkbrNormal:
    let theType = command.theType.parseTypeName
    let procHeader = "proc {name}*(".fmt
    let procParams = command.params
      .mapIt( block:
        let name = it.name.parseParamName
        let theType = it.theType.parseTypeName(it.ptrLv)
        "      {name}: {theType};".fmt)
    let procFutter =
      if theType == "Result": "    ): {theType} {discardableCommandPragma} =\n".fmt
      else: "    ): {theType} {commandPragma} =\n".fmt
    let cageName = name & "Cage"
    let cageParams = command.params.mapIt(it.name.parseParamName)

    result &= procHeader
    if procParams.len != 0:
      result &= '\n' & procParams.join("\n") & '\n'
    result &= procFutter
    result &= "  {cageName}({cageParams.join(\",\")})".fmt
    return
  of nkbrAlias:
    let alias = command.alias.parseCommandName
    return "const {name}* = {alias}".fmt

proc render*(basetype: NodeBasetype): string =
  let
    name = basetype.name.removeVkPrefix
    theType = basetype.theType.replaceBasicTypes
  "{name}* = distinct {theType}".fmt

proc renderCommandLoaderComponent*(require: NodeRequire; resources: Resources): string =
  if require.targets.filterIt(it.kind == nkrCommand).len == 0: return
  var commandLoaderDef = newSeq[string]()

  if require.comment.isSome:
    commandLoaderDef.add require.comment.get.underline('-').commentify
  for req in require.targets.filter(x => x.kind == nkrCommand):
    commandLoaderDef.add "{req.name.parseCommandName}Cage << \"{req.name}\"".fmt

  return commandLoaderDef.join("\n")

proc renderCommandLoader*(libFile: LibFile; resources: Resources): string =
  var commandLoaderDefs = newSeq[string]()

  for require in libFile.requires:
    let def = require.renderCommandLoaderComponent(resources)
    if not def.isEmptyOrWhitespace:
      commandLoaderDefs.add def

  return if commandLoaderDefs.len == 0: ""
  else:
    "proc load{libFile.fileName.capitalizeAscii}*(instance: Instance) =\n".fmt &
    "  instance.defineLoader(`<<`)\n\n" &
    commandLoaderDefs.mapIt(it.indent(2)).join("\n\n")

proc renderInstanceCommandLoader*(fileName: string): string =
  assert fileName in ["vk10", "vk11"]
  case fileName
  of "vk10":
    result =
      "proc loadInstanceProcs*() =\n" &
      "  nil.defineLoader(`<<`)\n" &
      "  getInstanceProcAddrCage << \"vkGetInstanceAddr\"\n" &
      "  enumerateInstanceExtensionPropertiesCage << \"vkEnumerateInstanceExtensionProperties\"\n" &
      "  enumerateInstanceLayerPropertiesCage << \"vkEnumerateInstanceLayerProperties\"\n" &
      "  createInstanceCage << \"vkCreateInstance\""
  of "vk11":
    result =
      "proc loadInstanceProcs*() =\n" &
      "  vk10.loadInstanceProcs()\n" &
      "  nil.defineLoader(`<<`)\n" &
      "  enumerateInstanceVersionCage << \"vkEnumerateInstanceVersion\""

proc render*(libFile: LibFile; resources: Resources): string =
  var renderedNodes: seq[string]
  var enumAliasesRequired: seq[NodeEnumAlias]
  result &= libFile.fileHeader
  result.LF
  result &= libFile
    .dependencies
    .mapIt("import {it.fileName}".fmt)
    .join("\n").LF
  result &= libFile
    .dependencies
    .filterIt(it.exportIt)
    .mapIt( block:
      if it.fileName in ["vk10"]:
        "export {it.fileName.splitFile.name} except loadInstanceProcs".fmt
      else:
        "export {it.fileName.splitFile.name}".fmt
    )
    .join("\n").LF
  result.LF

  block Solve_consts:
    var reqDefs: seq[seq[string]]
    for require in libFile.requires:
      reqDefs.add @[]
      # result &= require.render.LF
      if require.comment.isSome:
        reqDefs[^1].add require.comment.get.underline('-').commentify

      for req in require.targets.filter(x => x.kind in {nkrApiConst, nkrConst, nkrConstAlias, nkrType}):
        if req.name in renderedNodes: continue

        if resources.consts.hasKey(req.name):
          reqDefs[^1].add resources.consts[req.name].render
          renderedNodes.add req.name

        elif resources.constAliases.hasKey(req.name):
          reqDefs[^1].add resources.constAliases[req.name].render
          renderedNodes.add req.name

        elif resources.structs.hasKey(req.name):
          let struct = resources.structs[req.name]
          if struct.requiredConstNames.len == 0: continue
          for reqConst in struct.requiredConstNames:
            if reqConst in renderedNodes: continue
            if resources.consts.hasKey(reqConst):
              reqDefs[^1].add resources.consts[reqConst].render
              renderedNodes.add reqConst

      if (require.comment.isSome and reqDefs[^1].len == 1) or
         (require.comment.isNone and reqDefs[^1].len == 0):
        reqDefs.del(reqDefs.high)


    result &= reqDefs.mapIt(it.join("\n")).filterIt(it.len != 0).join("\n\n")
    result.LF
    result.LF

  block Solve_types_first:
    var typeDefs: seq[seq[string]]
    for require in libFile.requires:
      let typeTargets = require.targets.filterIt(it.kind in {nkrType})
      if typeTargets.len == 0: continue

      typeDefs.add @[]
      if require.comment.isSome:
        typeDefs[^1].add @[require.comment.get.underline('-').commentify]

      for req in typeTargets:
        if req.name notin renderedNodes:
          if resources.basetypes.hasKey(req.name):
            typeDefs[^1].add resources.basetypes[req.name].render
            renderedNodes.add req.name
          elif resources.bitmasks.hasKey(req.name):
            typeDefs[^1].add resources.bitmasks[req.name].render
            renderedNodes.add req.name
          elif resources.structs.hasKey(req.name):
            typeDefs[^1].add resources.structs[req.name].render
            renderedNodes.add req.name
          elif resources.funcPtrs.hasKey(req.name):
            typeDefs[^1].add resources.funcPtrs[req.name].render
            renderedNodes.add req.name
          elif resources.handles.hasKey(req.name):
            typeDefs[^1].add resources.handles[req.name].render
            renderedNodes.add req.name
          elif resources.enums.hasKey(req.name):
            typeDefs[^1].add resources.enums[req.name].render(resources.vendorTags)
            if resources.enumAliases.hasKey(req.name):
              for alias in resources.enumAliases[req.name]:
                enumAliasesRequired.add alias
            renderedNodes.add req.name

    result.add "type".LF
    result &= typeDefs.mapIt(it.join("\n").indent(2)).join("\n\n").LF.LF

  block Solve_others:
    var reqDefs: seq[seq[string]]
    for require in libFile.requires:
      reqDefs.add @[]
      # result &= require.render.LF
      if require.comment.isSome:
        reqDefs[^1].add require.comment.get.underline('-').commentify

      for req in require.targets.filter(x => x.kind == nkrType):
        reqDefs.add @[]
        if req.name notin renderedNodes:
          if resources.defines.hasKey(req.name):
            reqDefs[^1].add resources.defines[req.name].render
            renderedNodes.add req.name
        if resources.enumAliases.hasKey(req.name):
          reqDefs[^1].add resources.enumAliases[req.name].mapIt(it.render(resources.vendorTags)).join("\n")

      let reqCommands = require.targets.filter(x => x.kind == nkrCommand)
      if reqCommands.len != 0:
        reqDefs[^1].add "var # commands"
        for reqCommand in reqCommands:
          if reqCommand.name notin renderedNodes:
            if resources.commands.hasKey(reqCommand.name):
              reqDefs[^1].add resources.commands[reqCommand.name].renderCage.indent(2)
        for reqCommand in reqCommands:
          if reqCommand.name notin renderedNodes:
            if resources.commands.hasKey(reqCommand.name):
              reqDefs[^1].add resources.commands[reqCommand.name].renderAccessor
              renderedNodes.add reqCommand.name

    result &= reqDefs.mapIt(it.join("\n")).filterIt(it.len != 0).join("\n\n")
    result.LF

  if libFile.fileName in ["vk10", "vk11"]: # Insert_basic_loader:
    result &= libFile.fileName.renderInstanceCommandLoader
    result.LF
    result.LF

  result &= libFile.renderCommandLoader(resources)

#!SECTION

# SECTION extractors
func extractNodeEnumValue*(typeDef: XmlNode): (Option[NodeEnumVal], Option[NodeEnumAlias]) {.raises: [UnexpectedXmlStructureError].} =
  # Extract enum data from each <enum> tag of <enums>.
  #   <enums name="VkResult" type="enum" comment="API result codes">
  #           <comment>Return codes (positive values)</comment>
  #       <enum value="0"     name="VK_SUCCESS" comment="Command completed successfully"/>
  #       <enum value="1"     name="VK_NOT_READY" comment="A fence or query has not yet completed"/>
  # ...
  #       <enum value="5"     name="VK_INCOMPLETE" comment="A return array was too small for the result"/>
  #           <comment>Error codes (negative values)</comment>
  #       <enum value="-1"    name="VK_ERROR_OUT_OF_HOST_MEMORY" comment="A host memory allocation has failed"/>
  #       <enum value="-2"    name="VK_ERROR_OUT_OF_DEVICE_MEMORY" comment="A device memory allocation has failed"/>
  # ...
  #       <enum value="-13"   name="VK_ERROR_UNKNOWN" comment="An unknown error has occurred, due to an implementation or application bug"/>
  #           <unused start="-14" comment="This is the next unused available error code (negative value)"/>
  #   </enums>
  block Handle_invalid_nodes:
    if typeDef.kind in {xnText, xnComment}: # Meaningless blank value
      return
    if typeDef.kind != xnElement:
      xmlError title"@Enum Value Extraction >": $typeDef

    if typeDef.tag in ["unused", "comment"]:
      # Since enum values are later sorted, it is difficult to handle such comment tag.
      return
    if typeDef.tag != "enum":
      xmlError title"@Enum Value Extraction >": $typeDef

  let value: Option[tuple[val: int; isHex: bool]] =
    # input        100  0x100 abcde
    # -------------------------------
    # parseInt      o     x     x
    # parseHexInt   o     o     x
    try: some (typeDef{"value"}.parseInt, false)
    except:
      try:    some (typeDef{"value"}.parseHexInt, true)
      except: none (int, bool)
  let bitpos =
    try: some typeDef{"bitpos"}.parseInt.int32
    except: none int32
  let alias = ?typeDef{"alias"}

  if value.isSome or bitpos.isSome:
    var resultVal = NodeEnumVal(
      name: typeDef.name,
      comment: ?typeDef.comment,
      kind:
        if value.isSome: nkeValue
        else: nkeBitpos)
    case resultVal.kind
    of nkeValue:
      resultVal.value = value.get.val
      resultVal.isHex = value.get.isHex
      return (some resultVal, none NodeEnumAlias)
    of nkeBitpos:
      resultVal.bitpos = bitpos.get
      return (some resultVal, none NodeEnumAlias)
  elif alias.isSome:
    return ( none NodeEnumVal, some NodeEnumAlias(
      name: typeDef.name,
      comment: ?typeDef.comment,
      alias: alias.get))
  else:
    xmlError title"The enum value does'nt has any value, bitpos or alias attr.": $typeDef

func extractNodeEnum*(enumDef: XmlNode): (Option[NodeEnum], seq[NodeEnumAlias]) {.raises: [UnexpectedXmlStructureError].} =
  if enumDef.kind != xnElement or
     enumDef.tag != "enums":
    return
  if enumDef.name == "API Constants":
    return

  var resultAliases = newSeq[NodeEnumAlias]()
  var resultEnum = NodeEnum(
    name: enumDef.name,
    comment: ?enumDef.comment)

  for child in enumDef:
    let (value, alias) = child.extractNodeEnumValue
    if value.isSome:
      resultEnum.enumVals.add value.get
    if alias.isSome:
      resultAliases.add alias.get |> (x => (x.enumName = resultEnum.name; x))

  result[0] = some resultEnum
  result[1] = resultAliases

func extractNodeApiConstVal*(typeDef: XmlNode): (Option[NodeConst], Option[NodeConstAlias]) {.raises: [UnexpectedXmlStructureError].} =
  if typeDef.tag != "enum":
    xmlError title"@API constant value Extraction >": $typeDef
  result = if (?typeDef.value).isSome: (
      some NodeConst(
        name: typeDef.name,
        value: typeDef.value
          .replace("~0ULL", "uint.high")
          .replace("~0U", "uint.high"),
        comment: ?typeDef.comment),
      none NodeConstAlias
    )
  elif (?typeDef.alias).isSome: (
      none NodeConst,
      some NodeConstAlias(
        name: typeDef.name,
        alias: typeDef.alias,
        comment: ?typeDef.comment)
    )
  else:
    xmlError title"@API constant value Extraction >": $typeDef

func extractVendorTags*(tags: XmlNode): VendorTags {.raises: [UnexpectedXmlStructureError].} =
  if tags.kind != xnElement or tags.tag != "tags":
    xmlError invalidStructure("Vendor Tag Extraction"): $tags
  tags.findAll("tag")
    .filterIt((?it.name).isSome)
    .mapIt(VendorTag(name: it.name))

func extractNodeFuncPointer*(typeDef: XmlNode): NodeFuncPtr {.raises: [UnexpectedXmlStructureError].} =
  # extract funcpointer definition data from such as following xml:
  # <type category="funcpointer">typedef void (VKAPI_PTR *<name>PFN_vkInternalAllocationNotification</name>)(
  #   <type>void</type>*                    pUserData,
  #   <type>size_t</type>                   size,
  #   <type>VkInternalAllocationType</type> allocationType,
  #   <type>VkSystemAllocationScope</type>  allocationScope);</type>
  if typeDef.kind != xnElement or
     typeDef.tag != "type" or
     typeDef.category != "funcpointer":
    xmlError invalidStructure("Funcpointer Extraction"): $typeDef
  new result
  var atArgDef: bool
  for child in typeDef:
    case child.kind
    of xnElement:
      case child.tag
      of "name": # The name tag in "funcpointer" represents the func name.
        result.name = child.innerText.parseWords[0]
      of "type": # The type tag in "funcpointer" represents the arg names.
        if not atArgDef: atArgDef = true
        #                name, theType,                     ptrLv
        result.args.add ("", child.innerText.parseWords[0], 0.Natural)
    of xnText:
      let words = child
        .innerText
        .parseWords({',', ';', '(', ')', '*'})
        .filterInvalidArgParams

      if words.len == 0: continue
      if words.len != 1:
        xmlError title"@funcpointer Extraction > cannot determine the type of return": $typeDef

      if atArgDef:
        if result.args.len == 0: # for the func that has no (void) arguments
          continue
        result.args[^1].ptrLv += child.innerText.count("*")
        result.args[^1].name = words[0]
      else:
        result.ptrLv += child.innerText.count("*")
        result.theType = words[0]
    else:
      xmlError title"@funcpointer Extraction > unhandled xml has found": $typeDef

func extractNodeDefine*(typeDef: XmlNode): NodeDefine {.raises: [UnexpectedXmlStructureError].} =
  if typeDef.kind != xnElement or typeDef.tag != "type":
    xmlError invalidStructure("define Extraction"): $typeDef
  result = NodeDefine(
    name:
      if (?typeDef.name).isSome: typeDef.name
      else: typeDef["name"].innerText.parseWords[0])
  result.str =
    define(result.name, typeDef) |> (x => (
      if x.isSome: x.get
      else: xmlError title"@define Extraction > the define has not found": $typeDef
    ))

func extractNodeStructMember*(typeDef: XmlNode): (NodeStructMember, seq[string]) {.raises: [].} =
    result[0] = NodeStructMember(
      theType: typeDef["type"].innerText.parseWords[0],
      name: typeDef["name"].innerText.parseWords[0],
      length: @[]
    )
    for m in typeDef:
      if m.kind == xnElement:
        if m.tag == "enum":
          result[0].length.add NodeArrayLength(useConst: true, name: m.innerText.parseWords[0])
          result[1].add m.innerText.parseWords[0]

      if m.kind != xnText: continue
      let words = m.text.parseWords.filterInvalidArgParams
      if words.len == 0: continue
      result[0].ptrLv += m.text.count("*")
      #  E.g. "[3]", "[2][3]" or "[1][2][3]".
      #  Raise exception if it pattern is as "[a][b]"
      if words[0][0] == '[' and words[0][^1] == ']':
        result[0].length.add words[0]
          .parseWords({'[', ']'})
          .mapIt(try:    some it.parseInt.Natural
                 except: none Natural)
          .filterIt(it.isSome)
          .mapIt(NodeArrayLength(useConst: false, value: it.get))
func extractNodeStruct*(typeDef: XmlNode): NodeStruct {.raises: [UnexpectedXmlStructureError].} =
  # Extract struct definition data from such as following xml:
  #
  # <type category="struct" name="VkImageBlit">
  #   <member><type>VkImageSubresourceLayers</type> <name>srcSubresource</name></member>
  #   <member><type>VkOffset3D</type>             <name>srcOffsets</name>[2]<comment>Specified in pixels for both compressed and uncompressed images</comment></member>
  #   <member><type>VkImageSubresourceLayers</type> <name>dstSubresource</name></member>
  #   <member><type>VkOffset3D</type>             <name>dstOffsets</name>[2]<comment>Specified in pixels for both compressed and uncompressed images</comment></member>
  # </type>
  if typeDef.kind != xnElement or
     typeDef.tag != "type" or
     typeDef.category notin ["struct", "union"]:
    xmlError invalidStructure("struct Extraction"): $typeDef

  result = NodeStruct(
    name: typeDef.name,
    comment: ?typeDef.comment,
    isUnion: typeDef.category == "union")
  for member in typeDef.findAll("member"):
    let (memberNode, requiredConsts) = member.extractNodeStructMember
    result.members.add memberNode
    result.requiredConstNames.add requiredConsts

func extractNodeBitmask*(typeDef: Xmlnode): NodeBitmask {.raises: [UnexpectedXmlStructureError]} =
  if typeDef.kind != xnElement or
     typeDef.tag != "type" or
     typeDef.category != "bitmask":
    xmlError invalidStructure("bitmask Extraction"): $typeDef
    
  result = NodeBitmask(
    kind:
      if typeDef["type"] != nil and
         typeDef["name"] != nil :
        nkbrNormal
      elif (?typeDef{"alias"}).isSome and
           (?typeDef{"name"}).isSome:
        nkbrAlias
      else:
        xmlError title"@Flagbits Extraction >": $typeDef
  )
  case result.kind
  of nkbrNormal:
    result.name = typeDef["name"].innerText.parseWords[0]
    result.flagbitsReq = ?typeDef{"requires"}
  of nkbrAlias:
    result.name = typeDef{"name"}
    result.alias = typeDef{"alias"}

func extractNodeHandle*(typeDef: XmlNode): NodeHandle {.raises: [UnexpectedXmlStructureError].} =
  if typeDef.kind != xnElement or
     typeDef.tag != "type" or
     typeDef.category != "handle":
    xmlError invalidStructure("handle Extraction"): $typeDef
  if (?typeDef{"name"}).isSome and (?typeDef{"alias"}).isSome:
    NodeHandle(
      kind: nkbrAlias,
      name: typeDef{"name"},
      alias: typeDef{"alias"})
  else:
    NodeHandle(
      kind: nkbrNormal,
      name: typeDef["name"].innerText.parseWords[0],
      handleType: typeDef["type"].innerText.parseWords[0],
      parent: ?typeDef{"parent"})

func extractNodeCommand*(typeDef: XmlNode): NodeCommand {.raises: [UnexpectedXmlStructureError].} =
  # Extract command definition data from such as following xml:
  #
  # <command name="vkGetDeviceMemoryOpaqueCaptureAddressKHR"        alias="vkGetDeviceMemoryOpaqueCaptureAddress"/>
  #
  # <command successcodes="VK_SUCCESS,VK_INCOMPLETE" errorcodes="VK_ERROR_OUT_OF_HOST_MEMORY,VK_ERROR_OUT_OF_DEVICE_MEMORY">
  #     <proto><type>VkResult</type> <name>vkGetPipelineExecutablePropertiesKHR</name></proto>
  #     <param><type>VkDevice</type>                        <name>device</name></param>
  #     <param>const <type>VkPipelineInfoKHR</type>*        <name>pPipelineInfo</name></param>
  #     <param optional="false,true"><type>uint32_t</type>* <name>pExecutableCount</name></param>
  #     <param optional="true" len="pExecutableCount"><type>VkPipelineExecutablePropertiesKHR</type>* <name>pProperties</name></param>
  # </command>
  if typeDef.kind != xnElement or
     typeDef.tag != "command":
    xmlError invalidStructure("command Extraction"): $typeDef
  result = NodeCommand(
    kind: if (?typeDef{"alias"}).isSome: nkbrAlias
          else: nkbrNormal)
  case result.kind
  of nkbrAlias:
    result.name = typeDef{"name"}
    result.alias= typeDef{"alias"}
  of nkbrNormal:
    result.successCodes = typeDef{"successcodes"}.parseWords({','})
    result.errorCodes = typeDef{"errorcodes"}.parseWords({','})
    result.name = typeDef["proto"]["name"].innerText.parseWords[0]
    result.theType = typeDef["proto"]["type"].innerText.parseWords[0]
    for param in typeDef:
      if param.tag != "param": continue
      result.params.add NodeCommandParam(
        name: param["name"].innerText.parseWords[0],
        theType: param["type"].innerText.parseWords[0],
        ptrLv: ($param).count("*"),)

func extractNodeBasetype*(typeDef: XmlNode): NodeBasetype {.raises: [UnexpectedXmlStructureError].} =
  if typeDef.kind != xnElement or
     typeDef.tag != "type" or
     typeDef.category != "basetype":
    xmlError invalidStructure("basetype Extraction"): $typeDef
  NodeBasetype(
    name: typeDef["name"].innerText.parseWords[0],
    theType: block:
      let ctype = typeDef["type"]
      if ctype != nil: ctype.innerText.parseWords[0]
      else: "object"
  )

proc extractAllNodeEnumExtensions*(rootXml: XmlNode; resources: var Resources) {.raises: [UnexpectedXmlStructureError].} =
  for enumsRoot in concat(
        rootXml.findAll("feature"),
        rootXml["extensions"].findAll("extension"),):
    let enums = enumsRoot
      .findAll("enum")
      .filterIt((?it{"extends"}).isSome)
    for theEnum in enums:
      let extnumber =
        try: some theEnum{"extnumber"}.parseInt
        except: 
          try: some enumsRoot{"number"}.parseInt
          except: none int
      let offset =
        try: some theEnum{"offset"}.parseInt
        except: none int
      let bitpos =
        try: some theEnum{"bitpos"}.parseInt
        except: none int
      let alias = ?theEnum{"alias"}
      if (extnumber.isSome and offset.isSome) or bitpos.isSome:
        var nodeEnumVal = NodeEnumVal(
          name: theEnum.name,
          comment: ?theEnum.comment,
          isExtended: true,
          extends: theEnum{"extends"},
          providedBy: enumsRoot.name,
          kind:
            if extnumber.isSome and offset.isSome: nkeValue
            else: nkeBitpos
        )
        case nodeEnumVal.kind
        of nkeValue:
          try:
            nodeEnumVal.value = "1000{extnumber.get-1:04}{offset.get:04}".fmt.parseInt
            if resources.enums[nodeEnumVal.extends].enumVals.findIt(it.value == nodeEnumVal.value) == nil:
              resources.enums[nodeEnumVal.extends].enumVals.add nodeEnumVal
          except ValueError:
            xmlError title"@enum extends Extraction > cannot parse the value": $theEnum
          except KeyError:
            xmlError title"@enum extends Extraction >": $theEnum
        of nkeBitpos:
          try:
            nodeEnumVal.bitpos = bitpos.get
            resources.enums[nodeEnumVal.extends].enumVals.add nodeEnumVal
          except KeyError:
            xmlError title"@enum extends Extraction >": $theEnum
      elif alias.isSome:
        var enumAlias = NodeEnumAlias(
          enumName: theEnum{"extends"},
          name: theEnum.name,
          alias: theEnum.alias,
          comment: ?theEnum.comment,
          isExtended: true,
          providedBy: enumsRoot.name)
        try:
          resources.enumAliases[enumAlias.enumName].add enumAlias
        except KeyError:
          resources.enumAliases[enumAlias.enumName] = @[enumAlias]
      else: continue

#!SECTION

func extractNodeRequire*(typeDef: XmlNode): NodeRequire {.raises: [UnexpectedXmlStructureError].} =
  template lastTarget(x: untyped): untyped =
    x.targets[^1]
  if typeDef.kind != xnElement or typeDef.tag != "require":
    xmlError invalidStructure("require Extraction"): $typeDef
  result = NodeRequire(comment: ?typeDef.comment)
  for child in typeDef:
    if child.kind != xnElement: continue
    result.targets.add NodeRequireVal(
      name: child.name,
      kind: case child.tag
        of "comment": continue
        of "type":                       nkrType
        of "command":                    nkrCommand
        of "enum":
          if (?child{"extends"}).isSome: nkrEnumExtend
          elif (?child{"value"}).isSome: nkrConst
          elif (?child{"alias"}).isSome: nkrConstAlias
          else:                          nkrApiConst
        else: xmlError title"@require Extraction > A resource of the unexpected type has required": $child
    )
    case result.lastTarget.kind
    of nkrConst:
      result.lastTarget.value = child{"value"}
    of nkrConstAlias:
      result.lastTarget.alias = child{"alias"}
    else: discard

proc extractResources*(rootXml: XmlNode): Resources {.raises: [LoggingFailure, Exception].}=
  template zipTable(s: untyped): untyped =
    s.mapIt((it.name, it)).newTable
  let
    enumsXmlTable = rootXml
      .findAll("enums")
      .mapIt((it.name, it))
      .newTable
    typeXmlSeq = rootXml
      .child("types")
      .findAll("type")

  result = Resources(
    consts: newTable[string, NodeConst](),
    constAliases: newTable[string, NodeConstAlias](),
    structs: newTable[string, NodeStruct](),
    enums: newTable[string, NodeEnum](),
    enumAliases: newTable[string, seq[NodeEnumAlias]](),
  )

  try:
    result.vendorTags = rootXml["tags"].extractVendorTags
  except UnexpectedXmlStructureError:
    error getCurrentExceptionMsg()

  try:
    for apiConst in enumsXmlTable["API Constants"].findAll("enum"):
      try:
        let (cons, alias) = apiConst.extractNodeApiConstVal
        if cons.isSome:
          result.consts[cons.get.name] = cons.get
        if alias.isSome:
          result.constAliases[alias.get.name] = alias.get
      except UnexpectedXmlStructureError:
        error getCurrentExceptionMsg()
  except KeyError:
    error title"@resources Extraction > API Constants was not found."

  result.defines = typeXmlSeq
    .filterByCategory("define")
    .mapIt(it.extractNodeDefine)
    .zipTable

  result.commands = rootXml
    .child("commands")
    .findAll("command")
    .mapIt(it.extractNodeCommand)
    .zipTable

  for xmlType in typeXmlSeq.filterByCategory("enum"):
    try:
      let (theEnum, enumAliases) = enumsXmlTable[xmlType.name].extractNodeEnum()
      if theEnum.isSome:
        result.enums[xmlType.name] = theEnum.get
      result.enumAliases[xmlType.name] = enumAliases
    except KeyError:
      result.enums[xmlType.name] = NodeEnum(name: xmlType.name, enumVals: @[])
    except UnexpectedXmlStructureError:
      error getCurrentExceptionMsg()

  try:
    rootXml.extractAllNodeEnumExtensions(result)
  except UnexpectedXmlStructureError:
    error getCurrentExceptionMsg()

  for xmlStruct in typeXmlSeq.filterByCategory("struct", "union"):
    try:
      let struct = xmlStruct.extractNodeStruct()
      result.structs[struct.name] = struct
    except UnexpectedXmlStructureError:
      error getCurrentExceptionMsg()

  result.bitmasks = typeXmlSeq
    .filterByCategory("bitmask")
    .mapIt(
      try: it.extractNodeBitmask
      except UnexpectedXmlStructureError:
        error getCurrentExceptionMsg(); nil)
    .filterIt(not it.isNil)
    .zipTable
  result.funcPtrs = typeXmlSeq
    .filterByCategory("funcpointer")
    .mapIt(
      try: it.extractNodeFuncPointer
      except UnexpectedXmlStructureError:
        error getCurrentExceptionMsg(); nil)
    .filterIt(not it.isNil)
    .zipTable
  result.basetypes = typeXmlSeq
    .filterByCategory("basetype")
    .mapIt(it.extractNodeBasetype)
    .zipTable
  result.handles = typeXmlSeq
    .filterByCategory("handle")
    .mapIt(it.extractNodehandle)
    .zipTable