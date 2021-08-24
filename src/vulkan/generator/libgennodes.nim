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
import ./liblogger
import ./defineTypeComponents

{.pragma: raiseInExtractor, raises: [UnexpectedXmlError].}

type
  UnexpectedXmlError* = object of ValueError
  Resources* = ref object
    vendorTags*: VendorTags
    commands*: TableRef[string, NodeCommand]
    apiConstants*: TableRef[string, NodeConst]
    defines*: TableRef[string, NodeDefine]
    enumAliases*: TableRef[string, NodeEnum]

    types*: TableRef[string, NodeType]

  LibFile* = ref object
    fileHeader*: string
    fileName*: string
    dependencies*: seq[tuple[fileName: string; exportIt: bool]]
    isCompiled: bool
    requires*: seq[NodeRequire]

  NodeKindType* = enum
    nktBasetype
    nktEnum
    nktBitmask
    nktStruct
    nktFuncPtr
    nktHandle
    nktUnexpected
  NodeType* = object
    case kind*: NodeKindType
    of nktBasetype:
      nodeBasetype*: NodeBasetype
    of nktEnum:
      nodeEnum*: NodeEnum
    of nktBitmask:
      nodeBitmask*: NodeBitmask
    of nktStruct:
      nodeStruct*: NodeStruct
    of nktFuncPtr:
      nodeFuncPtr*: NodeFuncPtr
    of nktHandle:
      nodeHandle*: NodeHandle
    of nktUnexpected:
      msg*: string
  NodeTypes* = seq[NodeType]
  NodeKindEnum* = enum
    nkeValue
    nkeBitpos
    nkeAlias
  NodeEnumVal* = ref object
    name*: string
    comment*: Option[string]
    case kind*: NodeKindEnum
    of nkeValue:
      value*: int
      isHex*: bool
    of nkeBitpos:
      bitpos*: int
    of nkeAlias:
      alias*: string
    case isExtended*: bool
    of true:
      extends*: string
      providedBy*: string
    of false:
      discard
  NodeEnum* = ref object
    name*: string
    enumVals*: seq[NodeEnumVal]
    comment*: Option[string]
  NodeKindConst* = enum
    nkacValue
    nkacAlias
  NodeConst* = ref object
    name*: string
    comment*: Option[string]
    case kind*: NodeKindConst
    of nkacValue:
      value*: string
    of nkacAlias:
      alias*: string
  NodeFuncPtr = ref object
    name*: string
    theType*: string
    ptrLv*: Natural
    args*: seq[tuple[name, theType: string, ptrLv: Natural]]
  NodeDefine* = ref object
    name*: string
    str*: string
  NodeStruct* = ref object
    isUnion*: bool
    name*: string
    comment*: Option[string]
    members*: seq[tuple[name, theType: string; ptrLv: Natural; length: seq[Natural]]]
  NodeKindBitmask* = enum
    nkbNormal, nkbAlias
  NodeBitmask* = ref object
    name*: string
    case kind*: NodeKindBitmask
    of nkbNormal:
      flagbitsReq*: Option[string]
    of nkbAlias:
      alias*: string
  NodeHandle* = ref object
    name*: string
    handleType*: string
    parent*: Option[string]
  NodeKindCommand* = enum
    nkcNormal
    nkcAlias
  NodeCommand* = ref object
    name*: string
    case kind*: NodeKindCommand
    of nkcNormal:
      theType*: string
      successCodes*: seq[string]
      errorCodes*: seq[string]
      params*: seq[tuple[name, theType: string; ptrLv: Natural]]
    of nkcAlias:
      alias*: string
  NodeBasetype* = ref object
    name*: string
    theType*: string

  NodeKindRequire* = enum
    nkrCommand
    nkrApiConst
    nkrConst
    nkrConstAlias
    nkrEnumExtend
    nkrType
    nkrUnexpected
  NodeRequireVal* = object
    name*: string
    case kind*: NodeKindRequire
    of nkrConst:
      value*: string
    of nkrConstAlias:
      alias*: string
    of nkrUnexpected:
      raw*: XmlNode
    else: discard

  NodeRequire* = ref object
    comment*: Option[string]
    case isCompiled*: bool
    of true:
      vendorTags*: VendorTags
      types*: TableRef[string, NodeType]
      commands*: TableRef[string, NodeCommand]
      consts*: TableRef[string, NodeConst]
      defines*: TableRef[string, NodeDefine]
      enumAliases*: TableRef[string, NodeEnum]
      nodesUnexpected*: TableRef[string, string]
    of false:
      targets*: seq[NodeRequireVal]

proc raiseUnexpectedXmlError(title: Title; msg: varargs[string, `$`]) =
  raise newException(UnexpectedXmlError,
    logMsg(title, msg)
  )

proc cmp(a, b: NodeEnumVal): int =
  case a.kind
  of nkeValue:
    case b.kind
    of nkeValue:
      return cmp(a.value, b.value)
    of nkeBitpos:
      return cmp(a.value, 1.shl(b.bitpos))
    else: discard
  of nkeBitpos:
    case b.kind
    of nkeValue:
      return cmp(1.shl(a.bitpos), b.value)
    of nkeBitpos:
      return cmp(1.shl(a.bitpos), 1.shl(b.bitpos))
    else: discard
  else: discard

  if a.kind == b.kind: return 0

  if a.kind == nkeAlias: return 1
  if b.kind == nkeAlias: return -1

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
  of nkeAlias:
    let alias = enumVal.alias.parseEnumName(enumsName, vendorTags)
    if enumVal.isExtended:
      result &= "# Provided by {enumVal.providedBy}\n".fmt
    result &= "{enumsName}.defineAlias({name}, {alias})".fmt
    if enumVal.comment.isSome:
      result &= enumVal.comment.get.commentify.indent(1)

proc renderBasics*(enums: NodeEnum; vendorTags: VendorTags): string =
  let name = enums.name.removeVkPrefix
  if enums.comment.isSome:
    result &= enums.comment.get.commentify.LF
  if enums.enumVals.len == 0:
    result &= "{name}* = UnusedEnum".fmt
    return
  result &= "{name}* {enumPragma} = enum\n".fmt
  result &= enums
    .enumVals
    .filterIt(it.kind != nkeAlias)
    .sorted(cmp)
    .mapIt(it.render(vendorTags, name))
    .join("\n").indent(2)


proc renderAliases*(enums: NodeEnum; vendorTags: VendorTags): string =
  let name = enums.name.removeVkPrefix
  result &= enums
    .enumVals
    .filterIt(it.kind == nkeAlias)
    .mapIt(it.render(vendorTags, name))
    .join("\n")

proc render*(constant: NodeConst): string =
  let name = constant.name.removeVkPrefix.toUpperCamel
  case constant.kind
  of nkacValue:
    result = "const {name}* = {constant.value}".fmt
    if constant.comment.isSome:
      result &= constant.comment.get.commentify.indent(1)
  of nkacAlias:
    result = "template {name}*(): untyped =\n".fmt
    if constant.comment.isSome:
      result &= constant.comment.get.commentify.indent(2).LF
    result &= constant.alias.toUpperCamel.indent(2)
    return

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
  of nkbNormal:
    "{name}* = distinct Flags".fmt
  of nkbAlias:
    "{name}* = {Alias}"


proc render*(handle: NodeHandle): string =
  let
    name = handle.name.replaceBasicTypes
    handleType = handle.handleType
  case handleType
  of "VK_DEFINE_HANDLE":
    "{name}* = distinct Handle".fmt
  of "VK_DEFINE_NON_DISPATCHABLE_HANDLE":
    "{name}* = distinct NonDispatchableHandle".fmt
  else:
    "FIXME: [Unsupported HANDLE]\n{repr handle}".fmt.commentify

proc renderCage*(command: NodeCommand): string =
  if command.kind == nkcNormal:
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
  of nkcNormal:
    let theType = command.theType.parseTypeName
    let procHeader = "proc {name}*(".fmt
    let procParams = command.params
      .mapIt( block:
        let name = it.name.parseParamName
        let theType = it.theType.parseTypeName(it.ptrLv)
        "      {name}: {theType};".fmt)
    let procFutter = "    ): {theType} {commandPragma} =\n".fmt
    let cageName = name & "Cage"
    let cageParams = command.params.mapIt(it.name.parseParamName)

    result &= procHeader
    if procParams.len != 0:
      result &= '\n' & procParams.join("\n") & '\n'
    result &= procFutter
    result &= "  {cageName}({cageParams.join(\",\")})".fmt
    return
  of nkcAlias:
    let alias = command.alias.parseCommandName
    return "const {name}* = {alias}".fmt

proc render*(basetype: NodeBasetype): string =
  let
    name = basetype.name.removeVkPrefix
    theType = basetype.theType.replaceBasicTypes
  "{name}* = distinct {theType}".fmt

proc render*(nodeType: NodeType; vendorTags: VendorTags): string =
  case nodeType.kind
  of nktBasetype:
    return nodeType.nodeBasetype.render
  of nktEnum:
    return nodeType.nodeEnum.renderBasics(vendorTags)
  of nktBitmask:
    return nodeType.nodeBitmask.render
  of nktStruct:
    return nodeType.nodeStruct.render
  of nktFuncPtr:
    return nodeType.nodeFuncPtr.render
  of nktHandle:
    return nodeType.nodeHandle.render
  of nktUnexpected:
    return nodeType.msg

proc render*(nodeTypes: NodeTypes; vendorTags: VendorTags): string =
  if nodeTypes.len == 0: return
  result = "type\n"
  result &= nodeTypes.mapIt(it.render(vendorTags)).join("\n").indent(2)

proc compile*(require: NodeRequire; resources: Resources): NodeRequire =
  result = NodeRequire(
    isCompiled: true,
    comment: require.comment,
    vendorTags: resources.vendorTags,
    types: newTable[string, NodeType](),
    commands: newTable[string, NodeCommand](),
    consts: newTable[string, NodeConst](),
    defines: newTable[string, NodeDefine](),
    enumAliases: newTable[string, NodeEnum](),
    nodesUnexpected: newTable[string, string](),
  )
  for req in require.targets:
    try:
      case req.kind
      of nkrCommand:
        result.commands[req.name] = resources.commands[req.name]
      of nkrApiConst:
        result.consts[req.name] = resources.apiConstants[req.name]
      of nkrConst:
        result.consts[req.name] = NodeConst(
          name: req.name,
          kind: nkacValue,
          value: req.value)
      of nkrConstAlias:
        result.consts[req.name] = NodeConst(
          name: req.name,
          kind: nkacAlias,
          alias: req.alias)
      of nkrType:
        if resources.types.hasKey(req.name):
          result.types[req.name] = resources.types[req.name]
          if resources.enumAliases.hasKey(req.name):
            result.enumAliases[req.name] = resources.enumAliases[req.name]
        elif resources.defines.hasKey(req.name):
          result.defines[req.name] = resources.defines[req.name]
        else:
          result.types[req.name] = NodeType(
            kind: nktUnexpected,
            msg: "TODO: [Unsupported Type]\n{req}".fmt.commentify)
      of nkrEnumExtend:
        # E.g. <enum offset="0" extends="VkStructureType" name="VK_STRUCTURE_TYPE_DEBUG_UTILS_OBJECT_NAME_INFO_EXT"/>
        # Above enum value is already included in "features/vk10.nim", so here is nothing to do.
        discard
      of nkrUnexpected:
        result.nodesUnexpected[req.name] = "TODO: [Unsupported Type]\nraw:\n{req.raw.rawText.indent(2)}".fmt.commentify
    except:
      error ResourcesNotFound, "{getCurrentExceptionMsg()}\n{req}".fmt

proc renderCommandLoaderComponent*(require: NodeRequire): string =
  if require.commands.len == 0: return
  var commandLoaderDef = newSeq[string]()

  if require.comment.isSome:
    commandLoaderDef.add require.comment.get.underline('-').commentify
  for name, command in require.commands:
    commandLoaderDef.add "{name.parseCommandName}Cage << \"{name}\"".fmt

  return commandLoaderDef.join("\n")

proc renderCommandLoader*(libFile: LibFile): string =
  var commandLoaderDefs = newSeq[string]()

  for require in libFile.requires:
    let def = require.renderCommandLoaderComponent()
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

proc render*(libFile: LibFile): string =
  var renderedNodes: seq[string]
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

  block Solve_types_first:
    var
      cntUnexpected: Natural
      cntAllEnumVal: Natural
      typeDefs: seq[seq[string]]

    for require in libFile.requires:
      if require.types.len == 0: continue

      typeDefs.add @[]
      if require.comment.isSome:
        typeDefs[^1].add @[require.comment.get.underline('-').commentify]
      for key, val in require.types:
        if key notin renderedNodes:
          inc cntAllEnumVal
          if val.kind == nktUnexpected: inc cntUnexpected
          typeDefs[^1].add val.render(require.vendorTags)
          renderedNodes.add key

    result.add if cntAllEnumVal == cntUnexpected: "# type".LF
      else: "type".LF
    result &= typeDefs.mapIt(it.join("\n").indent(2)).join("\n\n").LF.LF

  block Solve_others:
    for require in libFile.requires:
      # result &= require.render.LF
      let reqDef = block:
        var reqDef: string
        if require.comment.isSome:
          reqDef &= require.comment.get.underline('-').commentify.LF

        for key, val in require.enumAliases:
          reqDef &= val.renderAliases(require.vendorTags).LF

        for key, val in require.defines:
          if key notin renderedNodes:
            reqDef &= val.render.LF
            renderedNodes.add key
        for key, val in require.consts:
          if key notin renderedNodes:
            reqDef &= val.render.LF
            renderedNodes.add key

        if require.commands.len != 0:
          reqDef &= "var # commands".LF
          for key, val in require.commands:
            if key notin renderedNodes:
              reqDef &= val.renderCage.indent(2).LF
          reqDef.LF
          for key, val in require.commands:
            if key notin renderedNodes:
              reqDef &= val.renderAccessor.LF.LF
              renderedNodes.add key
        for key, val in require.nodesUnexpected:
          if key notin renderedNodes:
            reqDef &= val.LF
            renderedNodes.add key
        reqDef

      result &= reqDef.LF

  if libFile.fileName in ["vk10", "vk11"]: # Insert_basic_loader:
    result &= libFile.fileName.renderInstanceCommandLoader
    result.LF
    result.LF

  result &= libFile.renderCommandLoader

proc compile*(libFile: var LibFile; resources: Resources): LibFile =
  libFile.isCompiled = true
  libFile.requires = libFile.requires.mapIt(it.compile(resources))
  result = libFile
#!SECTION

# SECTION extractors
proc extractNodeEnumValue*(typeDef: XmlNode): Option[NodeEnumVal] {.raises: [UnexpectedXmlError].} =
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
    if typeDef.kind != xnElement: raiseUnexpectedXmlError(
      title"@Enum Value Extraction >",
      $typeDef)

    if typeDef.tag in ["unused", "comment"]:
      # Since enum values are later sorted, it is difficult to handle such comment tag.
      return
    if typeDef.tag != "enum": raiseUnexpectedXmlError(
      title"@Enum Value Extraction >",
      $typeDef)

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

  var xResult = NodeEnumVal(
    name: typeDef.name,
    comment: ?typeDef.comment,
    kind:
      if value.isSome: nkeValue
      elif bitpos.isSome: nkeBitpos
      elif alias.isSome: nkeAlias
      else: raiseUnexpectedXmlError(
        title"The enum value does'nt has any value, bitpos or alias attr.",
        $typeDef); return
    )

  case xResult.kind
  of nkeValue:
    xResult.value = value.get.val
    xResult.isHex = value.get.isHex
    return some xResult
  of nkeBitpos:
    xResult.bitpos = bitpos.get
    return some xResult
  of nkeAlias:
    xResult.alias = alias.get
    return some xResult


proc extractNodeEnum*(enumDef: XmlNode): Option[NodeEnum] {.raises: [UnexpectedXmlError].} =
  if enumDef.kind != xnElement or
     enumDef.tag != "enums":
    return
  if enumDef.name == "API Constants":
    return

  var xResult = NodeEnum(
    name: enumDef.name,
    comment: ?enumDef.comment)

  for child in enumDef:
    try: xResult.enumVals.add child.extractNodeEnumValue.get
    except UnpackDefect: discard

  return some xResult

proc extractNodeApiConstVal*(typeDef: XmlNode): NodeConst {.raises: [UnexpectedXmlError].} =
  if typeDef.tag != "enum":
    raiseUnexpectedXmlError(
      title"@API Constant Value Extraction >",
      $typeDef)
  result = NodeConst(
    name: typeDef.name,
    comment: ?typeDef.comment,
    kind:
      if (?typeDef.value).isSome: nkacValue
      elif (?typeDef.alias).isSome: nkacAlias
      else:
        raiseUnexpectedXmlError(
          title"The API Constant does'nt has both value and alias attr.",
          $typeDef); return
    )

  case result.kind
  of nkacValue:
    result.value = typeDef.value
      .replace("~0ULL", "uint.high")
      .replace("~0U", "uint.high")
  of nkacAlias:
    result.alias = typeDef.alias

proc extractVendorTags*(tags: XmlNode): VendorTags =
  assert tags.tag == "tags"
  tags
    .findAll("tag")
    .mapIt((name: it.name))
    .filterIt((?it.name).isSome)

proc extractNodeFuncPointer*(typeDef: XmlNode): NodeFuncPtr =
  # extract funcpointer definition data from such as following xml:
  # <type category="funcpointer">typedef void (VKAPI_PTR *<name>PFN_vkInternalAllocationNotification</name>)(
  #   <type>void</type>*                    pUserData,
  #   <type>size_t</type>                   size,
  #   <type>VkInternalAllocationType</type> allocationType,
  #   <type>VkSystemAllocationScope</type>  allocationScope);</type>
  assert typeDef.tag == "type"
  assert typeDef.category == "funcpointer"
  new result
  var atArgDef: bool
  for child in typeDef:
    case child.kind
    of xnElement:
      case child.tag
      of "name": # The name tag in "funcpointer" represents the func name.
        result.name = child.innerText.parseWords[0]
      of "type": # The type tag in "funcpointer" represents the arg names.
        #                name, theType,                     ptrLv
        result.args.add ("", child.innerText.parseWords[0], 0.Natural)
      if not atArgDef:
        atArgDef = true
    of xnText:
      let words = child
        .innerText
        .parseWords({',', ';', '(', ')'})
        .filterInvalidArgParams

      if words.len == 0: continue

      if not atArgDef:
        result.ptrLv += words[0].count("*")
        result.theType = words[0].replace("*", "")
      else:
        if result.args.len == 0: # for the func that has no (void) arguments
          continue
        result.args[^1].ptrLv += words.mapIt(it.count("*")).foldl(a+b)
        result.args[^1].name = words
          .mapIt(it.replace("*", ""))
          .filterIt(it.len != 0)
          .join(" ")
    else:
      discard

proc extractNodeDefine*(typeDef: XmlNode): NodeDefine =
  assert typeDef.tag == "type"
  result = NodeDefine(
    name:
      if (?typeDef.name).isSome: typeDef.name
      else: typeDef["name"].innerText.parseWords[0])
  result.str =
    try: defineComponents[result.name](typeDef)
    except: error UndefinedMacro, $typedef; return

proc extractNodeStruct*(typeDef: XmlNode): NodeStruct =
  # Extract struct definition data from such as following xml:
  #
  # <type category="struct" name="VkImageBlit">
  #   <member><type>VkImageSubresourceLayers</type> <name>srcSubresource</name></member>
  #   <member><type>VkOffset3D</type>             <name>srcOffsets</name>[2]<comment>Specified in pixels for both compressed and uncompressed images</comment></member>
  #   <member><type>VkImageSubresourceLayers</type> <name>dstSubresource</name></member>
  #   <member><type>VkOffset3D</type>             <name>dstOffsets</name>[2]<comment>Specified in pixels for both compressed and uncompressed images</comment></member>
  # </type>
  template lastMember(node: NodeStruct): untyped = node.members[^1]
  assert typeDef.tag == "type"
  assert typeDef.category in ["struct", "union"]
  result = NodeStruct(
    name: typeDef.name,
    comment: ?typeDef.comment,
    isUnion: case typeDef.category
      of "struct": false
      of "union": true
      else: return nil)
  for member in typeDef.findAll("member"):
    #                   name, theType, ptrLv,     arrLens
    result.members.add ("",    "",     0.Natural, newSeq[Natural]())
    for m in member:
      case m.kind
      of xnElement:
        case m.tag
        of "type":
          result.lastMember.theType = m.innerText.parseWords[0]
        of "name":
          result.lastMember.name = m.innerText.parseWords[0]
      of xnText:
        let words = m.innerText.parseWords.filterInvalidArgParams
        if words.len == 0: continue
        result.lastMember.ptrLv += words.join.count("*")
        #  E.g. "[3]", "[2][3]" or "[1][2][3]".
        #  Raise exception if it pattern is as "[a][b]"
        if words[0][0] == '[' and words[0][^1] == ']':
          result.lastMember.length =
            words[0].parseWords({'[', ']'}).mapIt(it.parseInt.Natural)
      else: discard

proc extractNodeBitmask*(typeDef: Xmlnode): NodeBitmask {.raises: [UnexpectedXmlError]} =
  if typeDef.tag != "type" or typeDef.category != "bitmask":
    raiseUnexpectedXmlError(
      title"@Bitmask Extraction >",
      typeDef.rawText.splitLines.filter((i, x) => i < 5).join("\n")
    )
  result = NodeBitmask(
    kind:
      if typeDef["type"] != nil and
         typeDef["name"] != nil :
        nkbNormal

      elif (?typeDef{"alias"}).isSome and
           (?typeDef{"name"}).isSome:
        nkbAlias

      else: raiseUnexpectedXmlError(
        title"@Flagbits Extraction >",
        $typeDef); return
  )
  case result.kind
  of nkbNormal:
    result.name = typeDef["name"].innerText.parseWords[0]
    result.flagbitsReq = ?typeDef{"requires"}
  of nkbAlias:
    result.name = typeDef{"name"}
    result.alias = typeDef{"alias"}

proc extractNodeHandle*(typeDef: XmlNode): NodeHandle =
  assert typeDef.tag == "type"
  assert typeDef.category == "handle"
  result = NodeHandle(
    parent: ?typeDef{"parent"})
  for child in typeDef:
    case child.kind
    of xnElement:
      if child.tag == "type":
        result.handleType = child.innerText.parseWords[0]
      elif child.tag == "name":
        result.name = child.innerText.parseWords[0]
    else: discard

proc extractNodeCommand*(typeDef: XmlNode): NodeCommand =
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

  assert typeDef.tag == "command"
  result = NodeCommand(kind: if (?typeDef{"alias"}).isSome: nkcAlias else: nkcNormal)
  case result.kind
  of nkcAlias:
    result.name = typeDef{"name"}
    result.alias= typeDef{"alias"}
  of nkcNormal:
    result.successCodes = typeDef{"successcodes"}.parseWords({','})
    result.errorCodes = typeDef{"errorcodes"}.parseWords({','})
    for child in typeDef:
      case child.kind
      of xnElement:
        case child.tag
        of "proto":
          result.name = child.child("name").innerText.parseWords[0]
          result.theType = child.child("type").innerText.parseWords[0]
        of "param":
          result.params.add(("", "", 0.Natural))
          for cparam in child:
            case cparam.kind
            of xnText:
              result.params[^1].ptrLv += cparam.innerText.count("*")
            of xnElement:
              case cparam.tag
              of "type":
                result.params[^1].theType = cparam.innerText.parseWords[0]
              of "name":
                result.params[^1].name = cparam.innerText.parseWords[0]
              else: discard
            else: discard
        else: discard
      else: discard

proc extractNodeBasetype*(typeDef: XmlNode): NodeBasetype =
  assert typeDef.tag == "type"
  assert typeDef.category == "basetype"
  NodeBasetype(
    name: typeDef["name"].innerText.parseWords[0],
    theType: block:
      let ctype = typeDef["type"]
      if ctype != nil: ctype.innerText.parseWords[0]
      else: "object"
  )

proc extractAllNodeEnumExtensions*(rootXml: XmlNode; vendorTags: VendorTags): TableRef[string, seq[NodeEnumVal]] =
  debug ":::Extracting enum extending info..."
  let extFeatures = rootXml
    .findAll("feature")
    .map(xml => xml
      .findAll("enum")
      .filter(E => (?E{"extends"}).isSome)
      .map(E => (xml{"name"}, E)))
    .concat
    .map( proc(it: (string, XmlNode)): NodeEnumVal =
      result = NodeEnumVal(
        kind:
          if (?it[1]{"extnumber"}).isSome and (?it[1]{"offset"}).isSome: nkeValue
          elif (?it[1]{"bitpos"}).isSome: nkeBitpos
          elif (?it[1]{"alias"}).isSome: nkeAlias
          else: return nil,
        name: it[1]{"name"},
        comment: ?it[1]{"comment"},
        isExtended: true,
        extends: it[1]{"extends"},
        providedBy: it[0])
      case result.kind
      of nkeValue:
        result.value = "1000{it[1].attr(\"extnumber\").parseInt-1:04}{it[1].attr(\"offset\").parseInt:04}".fmt.parseInt
      of nkeBitpos:
        result.bitpos = it[1]{"bitpos"}.parseInt
      of nkeAlias:
        result.alias = it[1]{"alias"}
    )
    .filterIt(it != nil)
  let extExtensions = rootXml
    .findAll("extensions")[0]
    .findAll("extension")
    .map(xml => xml
      .findAll("enum")
      .filter(E => (?E{"extends"}).isSome)
      .map(E => (xml{"name"}, xml{"number"}.parseInt, E)))
    .concat
    .map( proc(it: (string, int, XmlNode)): NodeEnumVal =
      result = NodeEnumVal(
        kind:
          if (?it[2]{"offset"}).isSome: nkeValue
          elif (?it[2]{"bitpos"}).isSome: nkeBitpos
          elif (?it[2]{"alias"}).isSome: nkeAlias
          else: return nil,
        name: it[2]{"name"},
        comment: ?it[2]{"comment"},
        isExtended: true,
        extends: it[2]{"extends"},
        providedBy: it[0])
      case result.kind
      of nkeValue:
        result.value = "1000{it[1]-1:04}{it[2].attr(\"offset\").parseInt:04}".fmt.parseInt
      of nkeBitpos:
        result.bitpos = it[2]{"bitpos"}.parseInt
      of nkeAlias:
        result.alias = it[2]{"alias"}
    )
    .filterIt(it != nil)

  var enumExts = concat(extFeatures, extExtensions)
    .mapit((valName: it.name.parseEnumName(it.extends, vendorTags), E: it))
  var enumExtValues = enumExts.filterIt(it.E.kind == nkeValue)
  var enumExtBitposes = enumExts.filterIt(it.E.kind == nkeBitpos)
  var enumExtAliases = enumExts.filterIt(it.E.kind == nkeAlias)

  for i in countdown(enumExtValues.high, enumExtValues.low):
    for j in enumExtValues.low..<i:
      if enumExtValues[i].valName == enumExtValues[j].valName:
        enumExtValues.delete(i)
        break
      if enumExtValues[i].E.extends == enumExtValues[j].E.extends:
        if enumExtValues[i].E.value == enumExtValues[j].E.value:
          enumExtValues.delete(i)
          break
  for i in countdown(enumExtBitposes.high, enumExtBitposes.low):
    for j in enumExtBitposes.low..<i:
      if enumExtBitposes[i].valName == enumExtBitposes[j].valName:
        enumExtBitposes.delete(i)
        break
      if enumExtBitposes[i].E.extends == enumExtBitposes[j].E.extends:
        if enumExtBitposes[i].E.bitpos == enumExtBitposes[j].E.bitpos:
          enumExtBitposes.delete(i)
          break
  for i in countdown(enumExtAliases.high, enumExtAliases.low):
    let aliasNameI = enumExtAliases[i].E.alias.parseEnumName(enumExtAliases[i].E.extends, vendorTags)
    block remove_duplicate_alias:
      for enumv in enumExtValues:
        if aliasNameI == enumv.valName:
          enumExtAliases.delete(i)
          break remove_duplicate_alias
      for enumb in enumExtBitposes:
        if aliasNameI == enumb.valName:
          enumExtAliases.delete(i)
          break remove_duplicate_alias

  enumExts = concat(enumExtValues, enumExtBitposes, enumExtAliases)

  result = enumExts
    .mapIt(it.E.extends)
    .map(enumName => (enumName, enumExts.mapIt(it.E).filterIt(it.extends == enumName)))
    .newTable
  debug ":DONE"

#!SECTION

proc extractNodeRequire*(typeDef: XmlNode): NodeRequire =
  template lastTarget(x: untyped): untyped =
    x.targets[^1]
  assert typeDef.tag == "require"
  result = NodeRequire(
    comment: ?typeDef.comment)
  for child in typeDef:
    if child.kind != xnElement: continue
    result.targets.add NodeRequireVal(
      name: child.name,
      kind: case child.tag
        of "comment":
          info title"Unprocessed Comment in require section", child.innerText.parseWords.join(" ")
          continue
        of "type": nkrType
        of "command": nkrCommand
        of "enum":
          if (?child{"extends"}).isSome: nkrEnumExtend
          elif (?child{"value"}).isSome: nkrConst
          elif (?child{"alias"}).isSome: nkrConstAlias
          else:nkrApiConst
        else: nkrUnexpected
    )
    case result.lastTarget.kind
    of nkrConst:
      result.lastTarget.value = child{"value"}
    of nkrConstAlias:
      result.lastTarget.alias = child{"alias"}
    of nkrUnexpected:
      result.lastTarget.raw = child
    else: discard

proc extractResources*(rootXml: XmlNode): Resources =
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

  new result
  result.vendorTags = rootXml
    .child("tags")
    .extractVendorTags

  result.apiConstants = enumsXmlTable["API Constants"]
    .findAll("enum")
    .mapIt(it.extractNodeApiConstVal)
    .zipTable

  result.defines = typeXmlSeq
    .filterByCategory("define")
    .mapIt(it.extractNodeDefine)
    .zipTable

  result.commands = rootXml
    .child("commands")
    .findAll("command")
    .mapIt(it.extractNodeCommand)
    .zipTable

  let enumExts = rootXml.extractAllNodeEnumExtensions(result.vendorTags)

  let allEnums = typeXmlSeq
    .filterByCategory("enum")
    .mapIt( block:
      var retval: NodeEnum =
        try: enumsXmlTable[it.name].extractNodeEnum.get
        except UnexpectedXmlError:
          error getCurrentExceptionMsg()
          NodeEnum(name: it.name, enumVals: @[])
        except KeyError, UnpackDefect:
          NodeEnum(name: it.name, enumVals: @[])
      if enumExts.hasKey(retval.name):
        retval.enumVals.add enumExts[retval.name]
      retval
    )

  result.enumAliases = allEnums
    .filter(nodeEnum => nodeEnum.enumVals.anyIt(it.kind==nkeAlias))
    .zipTable

  result.types = concat(
    allEnums
      .mapIt((it.name, NodeType(kind: nktEnum, nodeEnum: it))),
    typeXmlSeq
      .filterByCategory("bitmask")
      .mapIt(
        try: it.extractNodeBitmask
        except UnexpectedXmlError:
          error getCurrentExceptionMsg()
          nil)
      .filterIt(not it.isNil)
      .mapIt((it.name, NodeType(kind: nktBitmask, nodeBitmask: it))),
    typeXmlSeq
      .filterByCategory("funcpointer")
      .mapIt(it.extractNodeFuncPointer)
      .mapIt((it.name, NodeType(kind: nktFuncPtr, nodeFuncPtr: it))),
    typeXmlSeq
      .filterByCategory("struct", "union")
      .mapIt(it.extractNodeStruct)
      .mapIt((it.name, NodeType(kind: nktStruct, nodeStruct: it))),
    typeXmlSeq
      .filterByCategory("basetype")
      .mapIt(it.extractNodeBasetype)
      .mapIt((it.name, NodeType(kind: nktBasetype, nodeBasetype: it))),
    typeXmlSeq
      .filterByCategory("handle")
      .mapIt(it.extractNodehandle)
      .mapIt((it.name, NodeType(kind: nktHandle, nodeHandle: it))),
  ).newTable