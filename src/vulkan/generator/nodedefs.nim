import tables
import options

type
  VendorTag* = object
    name*: string
  VendorTags* = seq[VendorTag]
  Resources* = ref object
    vendorTags*: VendorTags
    basetypes*: TableRef[string,  NodeBasetype]
    bitmasks*: TableRef[string,  NodeBitmask]
    structs*: TableRef[string,  NodeStruct]
    funcPtrs*: TableRef[string,  NodeFuncPtr]
    handles*: TableRef[string,  NodeHandle]
    enums*: TableRef[string,  NodeEnum]
    enumAliases*: TableRef[string, seq[NodeEnumAlias]]
    commands*: TableRef[string, NodeCommand]
    consts*: TableRef[string, NodeConst]
    constAliases*: TableRef[string, NodeConstAlias]
    defines*: TableRef[string, NodeDefine]


  NodeRequire* = ref object
    comment*: Option[string]
    targets*: seq[NodeRequireVal]

  LibFile* = ref object
    fileHeader*: string
    fileName*: string
    dependencies*: seq[tuple[fileName: string; exportIt: bool]]
    requires*: seq[NodeRequire]

  NodeKindEnum* = enum
    nkeValue
    nkeBitpos
  NodeKindBasicResource* = enum
    nkbrNormal
    nkbrAlias

  NodeEnumAlias* = ref object
    enumName*: string
    name*: string
    comment*: Option[string]
    alias*: string
    case isExtended*: bool
    of true:
      providedBy*: string
    of false: discard
  NodeEnumVal* = ref object
    name*: string
    comment*: Option[string]
    case kind*: NodeKindEnum
    of nkeValue:
      value*: int
      isHex*: bool
    of nkeBitpos:
      bitpos*: int
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
    # enumAliases*: seq[NodeEnumAlias]
  NodeConst* = ref object
    name*: string
    value*: string
    comment*: Option[string]
  NodeConstAlias* = ref object
    name*: string
    alias*: string
    comment*: Option[string]
  NodeFuncPtr* = ref object
    name*: string
    theType*: string
    ptrLv*: Natural
    args*: seq[tuple[name, theType: string, ptrLv: Natural]]
  NodeDefine* = ref object
    name*: string
    str*: string
  NodeArrayLength* = ref object
    case useConst*: bool
    of true:
      name*: string
    of false:
      value*: Natural
  NodeStructMember* = ref object
    name*: string
    theType*: string
    ptrLv*: Natural
    length*: seq[NodeArrayLength]
  NodeStruct* = ref object
    isUnion*: bool
    name*: string
    comment*: Option[string]
    members*: seq[NodeStructMember]
    requiredConstNames*: seq[string]
  NodeBitmask* = ref object
    name*: string
    case kind*: NodeKindBasicResource
    of nkbrNormal:
      flagbitsReq*: Option[string]
    of nkbrAlias:
      alias*: string
  NodeHandle* = ref object
    name*: string
    case kind*: NodeKindBasicResource
    of nkbrNormal:
      handleType*: string
      parent*: Option[string]
    of nkbrAlias:
      alias*: string
  NodeCommandParam* = ref object
    name*: string
    theType*: string
    ptrLv*: Natural
  NodeCommand* = ref object
    name*: string
    case kind*: NodeKindBasicResource
    of nkbrNormal:
      theType*: string
      successCodes*: seq[string]
      errorCodes*: seq[string]
      params*: seq[NodeCommandParam]
    of nkbrAlias:
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
  NodeRequireVal* = object
    name*: string
    case kind*: NodeKindRequire
    of nkrConst:
      value*: string
    of nkrConstAlias:
      alias*: string
    else: discard
