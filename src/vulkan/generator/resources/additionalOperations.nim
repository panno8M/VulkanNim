
# Bitmask operations
# Utility for bitmask operation added independently
# =================================================

import macros
import strformat
import strutils
import sequtils
import sets
import options

proc `==`*[Flagbits: enum](a, b: Flags[Flagbits]): bool =
  a.uint32 == b.uint32

macro `toFlagSets`*[Flagbits: enum](Type: typedesc[Flagbits]; bits: varargs[untyped]): HashSet[Flagbits] =
  if (repr Type).find("FlagBits") == -1:
    macros.error("Expect the enum that has the suffix Flagbits, got " & repr Type)
  # var resultStr = "{DebugUtilsMessageSeverityFlagBitsEXT.VerboseBitExt}"
  var resultStr = "toHashSet(["
  for bit in bits: resultStr.add "{repr Type}.{bit},".fmt
  resultStr.add "])"
  return resultStr.parseStmt
template `{}`*[Flagbits: enum](Type: typedesc[Flagbits]; bits: varargs[untyped]): HashSet[Flagbits] =
  Type.toFlagSets(bits)

converter toFlagSets*[Flagbits: enum](flags: Flags[Flagbits]): HashSet[Flagbits] =
  var val = 1.uint32
  let flags = flags.uint32
  while val <= flags:
    if (val and flags) != 0:
      result.incl Flagbits(val)
    val = val shl 1
proc `{}`*[Flagbits: enum](flags: Flags[Flagbits]): HashSet[Flagbits] =
  flags.toFlagSets

converter toFlags*[Flagbits: enum](flagsets: HashSet[Flagbits]): Flags[Flagbits] =
  for flagset in flagsets:
    result = result or flagset
proc `<+>`*[Flagbits: enum](flagsets: HashSet[Flagbits]): Flags[Flagbits] =
  flagsets.toFlags

converter toFlags*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  Flags[Flagbits](flagbits)
proc `<+>`*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  flagbits.toFlags

proc `all`*[Flagbits: enum](Type: typedesc[Flags[Flagbits]]): Flags[Flagbits] =
  Flags[Flagbits](Flagbits.high.ord.shl(1) - 1)
proc `all`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] = flags.typeof.all
proc `all`*[Flagbits: enum](Type: typedesc[HashSet[Flagbits]]): HashSet[Flagbits] = Flags[Flagbits].all.toFlagSets
proc `all`*[Flagbits: enum](flagsets: HashSet[Flagbits]): HashSet[Flagbits] = flagsets.typeof.all

proc `none`*[Flagbits: enum](Type: typedesc[HashSet[Flagbits]]): HashSet[Flagbits] = return
proc `none`*[Flagbits: enum](flagsets: HashSet[Flagbits]): HashSet[Flagbits] = flagsets.typeof.none
proc `none`*[Flagbits: enum](Type: typedesc[Flags[Flagbits]]): Flags[Flagbits] = return
proc `none`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] = flags.typeof.none

proc isSome*[Flagbits: enum](flags: Flags[Flagbits]): bool = flags != Flags[Flagbits].none
proc isSome*[Flagbits: enum](flagsets: HashSet[Flagbits]): bool = flagsets.len != 0

proc isNone*[Flagbits: enum](flags: Flags[Flagbits]): bool = flags == Flags[Flagbits].none
proc isNone*[Flagbits: enum](flagsets: HashSet[Flagbits]): bool = flagsets.len == 0

proc `and`*[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] =
  Flags[Flagbits]((a.uint32 and b.uint32) and Flags[Flagbits].all.uint32)
proc `and`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a and <+>b
proc `and`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = b and a
proc `and`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = <+>a and <+>b

proc `or`*[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] =
  Flags[Flagbits]((a.uint32 or b.uint32) and Flags[Flagbits].all.uint32)
proc `or`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a or <+>b
proc `or`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = b or a
proc `or`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = <+>a or <+>b

proc `xor`*[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] =
  # if Flags.all is 00011111:
  # 00011100 xor 00011000 = 00000100
  # 00011100 xor 10000000 = 00011100
  #              ^ overflowed value must be ignored.
  not (a and b) and (a or b)
proc `xor`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a xor <+>b
proc `xor`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = b xor a
proc `xor`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = <+>a xor <+>b

proc `not`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] =
  Flags[Flagbits](flags.all.uint32 and not flags.uint32)

proc `not`*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  not flagbits.toFlags

proc `not`*[Flagbits: enum](flagsets: HashSet[Flagbits]): HashSet[Flagbits] =
  (not flagsets.toFlags).toFlagSets

proc `*`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a and b
proc `*`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a and b
proc `*`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a and b
proc `*`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a and b

proc `+`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a or b
proc `+`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a or b
proc `+`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a or b
proc `+`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a or b

proc `-+-`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a xor b
proc `-+-`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a xor b
proc `-+-`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a xor b
proc `-+-`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a xor b

proc `-`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a and not b
proc `-`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a and not b
proc `-`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a and not b
proc `-`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a and not b

proc contains*[Flagbits: enum](flags: Flags[Flagbits]; flagbits: Flagbits): bool =
  (flags and flagbits) != flags.none

converter toString*[Flagbits: enum](flags: Flags[Flagbits]): string =
  $flags.toFlagSets
proc `$`*[Flagbits: enum](flags: Flags[Flagbits]): string =
  flags.toString

import tables
var flagbitsCache = newTable[string, uint32]()

proc `carefulAll`*[Flagbits: enum](Type: typedesc[Flags[Flagbits]]): Flags[Flagbits] =
  ## Mainly used for flags with non-contiguous bits, such as the DebugUtilsMessageSeverity flag.
  try:
    return Flags[Flagbits](flagbitsCache[$Type])
  except KeyError:
    var x = Flagbits.low.ord
    while x <= Flagbits.high.ord:
      let bit = Flagbits(x)
      if not ($bit)[0].isDigit:
        result = result or bit
      x = x shl 1
    flagbitsCache[$Type] = result.uint32

proc `carefulNot`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] =
  ## Mainly used for flags with non-contiguous bits, such as the DebugUtilsMessageSeverity flag.
  Flags[Flagbits](flags.typeof.carefulAll.uint32 and not flags.uint32)
proc `carefulNot`*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  ## Mainly used for flags with non-contiguous bits, such as the DebugUtilsMessageSeverity flag.
  carefulNot flagbits.toFlags


# Handle operations
# Utility for handle operation added independently
# ================================================

proc `==`*[T](a, b: Handle[T]): bool = a.pointer == b.pointer
proc `==`*[T](a: Handle[T]; b: Handle[HandleType]): bool = a.pointer == b.pointer
template `==`*[T](a: Handle[HandleType]; b: Handle[T]): bool = b == a
proc `==`*(a, b: Handle[HandleType]): bool = a.pointer == b.pointer

proc `==`*[T](a, b: NonDispatchableHandle[T]): bool = a.pointer == b.pointer
proc `==`*[T](a: NonDispatchableHandle[T]; b: NonDispatchableHandle[HandleType]): bool = a.pointer == b.pointer
template `==`*[T](a: NonDispatchableHandle[HandleType]; b: NonDispatchableHandle[T]): bool = b == a
proc `==`*(a, b: NonDispatchableHandle[HandleType]): bool = a.pointer == b.pointer


# Bool32 operations
# =================

converter toString*(b: Bool32): string = (if b.uint32 == 1: "VkTrue" else: "VkFalse")
proc `$`*(b: Bool32): string = b.toString

converter toBool*(b: Bool32): bool = bool(b)
converter toBool32*(b: bool): Bool32 = Bool32(b)


# Struct Constructor
# It makes it easier to understand what is optional, what is
# implicitly determined, and what needs to be explicitly set
# for many items in the vulkan structure. It also makes it
# easier to write the creation of structures.
# ==========================================================

macro makeConstructor*(Struct: typedesc[object]): untyped =
  runnableExamples:
    import ../platform
    type InstanceCreateInfo* = object
      sType* {.constant: (StructureType.instanceCreateInfo).}: StructureType
      pNext* {.optional.}: pointer
      flags* {.optional.}: InstanceCreateFlags
      pApplicationInfo* {.optional.}: ptr ApplicationInfo
      enabledLayerCount* {.optional.}: uint32
      ppEnabledLayerNames*: cstringArray
      enabledExtensionCount* {.optional.}: uint32
      ppEnabledExtensionNames*: cstringArray

    let instanceCreateInfoConstructor = Instance.makeConstructor()

    # makeConstructor expands the constructor for InstanceCreateInfo as follows:
    # This proc is the same as the contents of instanceCreateInfoConstructor
    discard proc(
          # sType: It is omitted because the {.constant.} pragma has been set.
          pNext = default(pointer); # Members with the optional pragma are set to the initial value of that type.
          flags = default(InstanceCreateFlags); # optional
          pApplicationInfo = default(ptr ApplicationInfo); # optional
          enabledLayerCount = default(uint32); # optional
          ppEnabledLayerNames: cstringArray;
          enabledExtensionCount = default(uint32); # optional
          ppEnabledExtensionNames: cstringArray;
        ): InstanceCreateInfo =
      InstanceCreateInfo(
        sType: StructureType.instanceCreateInfo, # The values set in the constant pragma are directly expanded here.
        pNext: pNext,
        flags: flags,
        pApplicationInfo: pApplicationInfo,
        enabledLayerCount: enabledLayerCount,
        ppEnabledLayerNames: ppEnabledLayerNames,
        enabledExtensionCount: enabledExtensionCount,
        ppEnabledExtensionNames: ppEnabledExtensionNames,
      )

    var instanceCreateInfo = instanceCreateInfoConstructor(
      enabledLayerCount = 0,
      ppEnabledLayerNames = nil,
      enabledExtensionCount = 0,
      ppEnabledExtensionNames = nil,
    )

    echo repr InstanceCreateInfo
    # stdout:
    #   [sType = instanceCreateInfo,
    #   pNext = nil,
    #   flags = 0,
    #   pApplicationInfo = nil,
    #   enabledLayerCount = 0,
    #   ppEnabledLayerNames = nil,
    #   enabledExtensionCount = 0,
    #   ppEnabledExtensionNames = nil]

  type Arg = object
    name: NimNode
    theType: NimNode
    value: Option[NimNode]
    optional: bool
  var args: seq[Arg]

  let impl = Struct.getImpl
  let objName = impl[0]
  let objRecList = impl[2][2]
  for rec in objRecList:
    rec.expectKind nnkIdentDefs
    var arg: Arg
    case rec[0].kind
    of nnkIdent: arg.name = rec[0]
    of nnkPostfix:
      let postfix = rec[0]
      if postfix[0].kind == nnkIdent and postfix[0].eqIdent "*":
        arg.name = postfix[1]
      else: error("Unexpected node", rec[0])
    of nnkPragmaExpr:
      let pragmaExpr = rec[0]

      case pragmaExpr[0].kind
      of nnkIdent: arg.name = pragmaExpr[0]
      of nnkPostfix:
        let postfix = pragmaExpr[0]
        if postfix[0].kind == nnkIdent and postfix[0].eqIdent "*":
          arg.name = postfix[1]
        else: error("Unexpected node", pragmaExpr[0])
      else: error("Unexpected node", pragmaExpr[0])

      pragmaExpr[1].expectKind nnkPragma
      let pragmas = pragmaExpr[1]
      for pragma in pragmas:
        case pragma.kind
        of nnkSym:
          if $pragma == "optional": arg.optional = true
        of nnkExprColonExpr, nnkCall:
          if $pragma[0] == "constant": arg.value = some pragma[1]
        else: error("Unexpected statement", pragma)
    else: error("Unexpected node", rec[0])

    arg.theType = rec[1]

    args.add arg

  let procParams = args.map(proc(arg: Arg): NimNode =
    if arg.value.isSome: newEmptyNode()
    else:
      newIdentDefs(
        name = arg.name,
        kind =
          if arg.optional: newEmptyNode()
          else: arg.theType,
        default =
          if arg.optional: ident"default".newCall ident"typeof".newCall arg.theType
          else: newEmptyNode(),
      )
    ).filterIt(it != newEmptyNode())
  let constrParams = args.map proc(arg: Arg): NimNode =
    if arg.value.isSome: newColonExpr(arg.name, arg.value.get)
    else: newColonExpr(arg.name, arg.name)

  newProc(
    params = @[objName].concat(procParams),
    body = newStmtList().add(
      newNimNode(nnkObjConstr)
        .add(objName)
        .add(constrParams)
      ),
    procType = nnkLambda
  )
macro construct*(struct: typedesc[object]; procArgs: varargs[untyped]): untyped =
  ## Execute the constructor immediately. It can be written
  ## concisely, but the disadvantages are that error messages
  ## are difficult to read and that lambda expressions are
  ## generated for each of the multiple calls.
  runnableExamples:
    import ../platform
    type InstanceCreateInfo* = object
      sType* {.constant: (StructureType.instanceCreateInfo).}: StructureType
      pNext* {.optional.}: pointer
      flags* {.optional.}: InstanceCreateFlags
      pApplicationInfo* {.optional.}: ptr ApplicationInfo
      enabledLayerCount* {.optional.}: uint32
      ppEnabledLayerNames*: cstringArray
      enabledExtensionCount* {.optional.}: uint32
      ppEnabledExtensionNames*: cstringArray

    var instanceCreateInfo = InstanceCreateInfo.construct(
      enabledLayerCount = 0,
      ppEnabledLayerNames = nil,
      enabledExtensionCount = 0,
      ppEnabledExtensionNames = nil,
    )

  return ident"makeConstructor".newCall(struct).newCall(procArgs[0..^1])