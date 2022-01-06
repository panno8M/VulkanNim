{.experimental: "strictFuncs".}

import strutils
import sequtils
import sugar
import strformat
import options
import xmltree
import tables
import logging
import times

import ./utils
import ./nodedefs
import ./liblogger
import ./defineTypeComponents

type UnexpectedXmlStructureError* = object of CatchableError
template xmlError*(title: Title; strs: varargs[string, `$`]): untyped =
  raise UnexpectedXmlStructureError.newException(logMsg(title, strs))
func invalidStructure*(at: string): Title =
    title("@" & at & " > invalid structure")

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

func extractNodeEnum*(enumDef: XmlNode): (Option[NodeEnum], Option[NodeEnumAliases]) {.raises: [UnexpectedXmlStructureError].} =
  if enumDef.kind != xnElement or
     enumDef.tag != "enums":
    return
  if enumDef.name == "API Constants":
    return

  var resultEnum = NodeEnum(
    name: enumDef.name,
    comment: ?enumDef.comment)
  var resultAliases = NodeEnumAliases(
    name: enumDef.name)

  for child in enumDef:
    let (value, alias) = child.extractNodeEnumValue
    if value.isSome: resultEnum.enumVals.add value.get
    if alias.isSome: resultAliases.aliases.add alias.get

  result[0] = some resultEnum
  if resultAliases.aliases.len != 0: result[1] = some resultAliases

func extractNodeApiConstVal*(typeDef: XmlNode): (Option[NodeConst], Option[NodeConstAlias]) {.raises: [UnexpectedXmlStructureError].} =
  if typeDef.tag != "enum":
    xmlError title"@API constant value Extraction >": $typeDef
  result = if (?typeDef.value).isSome: (
      some NodeConst(
        name: typeDef.name,
        value: typeDef.value
          .replace("~0ULL", "uint64.high")
          .replace("~0U", "uint32.high")
          .replace("~1U", "uint32.high-1")
          .replace("~2U", "uint32.high-2"),
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

  #  <type category="funcpointer">typedef void (VKAPI_PTR *<name>PFN_vkFreeFunction</name>)(
  #                     This one means the above astarisk ^
  result.ptrLv -= 1

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
      arrayStyle:
        if ((?typeDef{"len"}).isSome or (?typeDef{"altlen"}).isSome):
          nasPtr
        elif typeDef.findAll("enum").len != 0 or typeDef.innerText.find({'[', ']'}) != -1:
          nasFix
        else:
          nasNotArray
    )

    if (?typeDef{"values"}).isSome:
      result[0].values = some typeDef{"values"}
    else:
      result[0].optional = (typeDef{"optional"} == "true") or (result[0].name == "pNext")


    if result[0].arrayStyle == nasPtr:
      let ptrcnt = typedef.`$`.count("*")
      if ptrcnt != 0:
        result[0].ptrLen.setlen(ptrcnt)

      if (?typeDef{"altlen"}).isSome:
        result[0].ptrLen[0] = some typeDef{"altlen"}.replace("/", " /")
      elif (?typeDef{"len"}).isSome:
        for i, v in typeDef{"len"}.parseWords({','}):
          if v == "null-terminated": continue
          result[0].ptrLen[i] = some v

    if result[0].arrayStyle == nasNotArray:
      result[0].ptrLv = typedef.`$`.count("*")

    for m in typeDef:
      if m.kind == xnElement and m.tag == "enum":
        result[0].dim.add NodeArrayDimention(useConst: true, name: m.innerText.parseWords[0])
        result[1].add m.innerText.parseWords[0]

      if m.kind != xnText: continue
      let words = m.text.parseWords.filterInvalidArgParams
      if words.len == 0: continue
      #  E.g. "[3]", "[2][3]" or "[1][2][3]".
      #  Raise exception if it pattern is as "[a][b]"
      if words[0][0] == '[' and words[0][^1] == ']':
        result[0].dim.add words[0]
          .parseWords({'[', ']'})
          .mapIt(try:    some it.parseInt.Natural
                 except: none Natural)
          .filterIt(it.isSome)
          .mapIt(NodeArrayDimention(useConst: false, value: it.get))


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
      objectType: typeDef{"objtypeenum"},
      handleKind: case typeDef["type"].innerText.parseWords[0]
        of "VK_DEFINE_HANDLE": HandleKind.Handle
        of "VK_DEFINE_NON_DISPATCHABLE_HANDLE": HandleKind.NonDispatchableHandle
        else: xmlError title"@handle Extraction > Unknowun handle": $typeDef
      ,
      parent: ?typeDef{"parent"})

proc extractNodeCommand*(typeDef: XmlNode): NodeCommand {.raises: [UnexpectedXmlStructureError].} =
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
        optional: param{"optional"} == "true",
        arrayStyle:
          if param{"len"}.`?`.isSome: nasPtr
          else: nasNotArray
      )
      case result.params[^1].arrayStyle
      of nasNotArray:
        result.params[^1].ptrLv = param.`$`.count("*")
      of nasPtr:
        result.params[^1].ptrLen.setLen(param.`$`.count("*"))
        for i, x in param{"len"}.parseWords({','}):
          if x == "null-terminated": continue
          result.params[^1].ptrLen[i] = some x
      else: discard


    result.loadMode =
      # All of commands provided by extensions has vendor suffix and that is upper case.
      if result.name[^1].isLowerAscii or result.name[^1].isDigit: lmPreload
      elif result.params[0].theType in ["VkInstance", "VkPhysicalDevice"]: lmWithInstance
      else: lmWithDevice


func extractNodeBasetype*(typeDef: XmlNode): NodeBasetype {.raises: [UnexpectedXmlStructureError].} =
  if typeDef.kind != xnElement or
     typeDef.tag != "type" or
     typeDef.category != "basetype":
    xmlError invalidStructure("basetype Extraction"): $typeDef
  NodeBasetype(
    kind: nkbNormal,
    name: typeDef["name"].innerText.parseWords[0],
    theType: block:
      let ctype = typeDef["type"]
      if ctype != nil: ctype.innerText.parseWords[0]
      else: "object"
  )
func extractNodeExternalReq*(typeDef: XmlNode): NodeBasetype {.raises: [UnexpectedXmlStructureError].} =
  if typeDef.kind != xnElement or
     typeDef.tag != "type" or
     (?typeDef{"requires"}).isNone:
    xmlError invalidStructure("external requires Extraction"): $typeDef
  NodeBasetype(
    kind: nkbExternal,
    name: typeDef.name,
    path: typeDef{"requires"},
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
      let value =
        try: some theEnum{"value"}.parseInt
        except: none int
      let offset =
        try: some theEnum{"offset"}.parseInt
        except: none int
      let bitpos =
        try: some theEnum{"bitpos"}.parseInt
        except: none int
      if (extnumber.isSome and offset.isSome) or value.isSome or bitpos.isSome:
        var nodeEnumVal = NodeEnumVal(
          name: theEnum.name,
          comment: ?theEnum.comment,
          isExtended: true,
          extends: theEnum{"extends"},
          providedBy: enumsRoot.name,
          kind:
            if bitpos.isSome: nkeBitpos
            else: nkeValue
        )
        case nodeEnumVal.kind
        of nkeValue:
          try:
            nodeEnumVal.value =
              if value.isSome: value.get
              else:
                let val = "1000{extnumber.get-1:03}{offset.get:03}".fmt.parseInt
                if theEnum{"dir"} == "-": -val
                else: val
            if resources.enums[nodeEnumVal.extends].enumVals.findIt(it.kind == nkeValue and it.value == nodeEnumVal.value) == nil:
              resources.enums[nodeEnumVal.extends].enumVals.add nodeEnumVal
          except ValueError:
            xmlError title"@enum extends Extraction > cannot parse the value": $theEnum
          except KeyError:
            xmlError title"@enum extends Extraction >": $theEnum
        of nkeBitpos:
          try:
            nodeEnumVal.bitpos = bitpos.get
            if resources.enums[nodeEnumVal.extends].enumVals.findIt(it.kind == nkeBitpos and it.bitpos == nodeEnumVal.bitpos) == nil:
              resources.enums[nodeEnumVal.extends].enumVals.add nodeEnumVal
          except KeyError:
            xmlError title"@enum extends Extraction >": $theEnum
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
          if (?child{"extends"}).isSome and
             (?child{"alias"}).isSome:   nkrEnumExtendAlias
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
    of nkrEnumExtendAlias:
      result.lastTarget.enumAlias = child{"alias"}
      result.lastTarget.extends = child{"extends"}
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
    enumAliases: newTable[string, NodeEnumAliases](),
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
      if enumAliases.isSome:
        result.enumAliases[xmlType.name] = enumAliases.get
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
  result.basetypes = concat(
    typeXmlSeq
      .filterByCategory("basetype")
      .mapIt(it.extractNodeBasetype),
    typeXmlSeq.filterIt((?it{"requires"}).isSome)
      .mapIt(it.extractNodeExternalReq),
    ).zipTable
  result.handles = typeXmlSeq
    .filterByCategory("handle")
    .mapIt(it.extractNodehandle)
    .zipTable
