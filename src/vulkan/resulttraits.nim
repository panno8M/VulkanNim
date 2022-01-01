from enums import Result
import std/macros {.all.}
import std/sequtils

macro genErrorResults =
  let resultvals = Result.getTypeImpl[1..^1]

  let errorTypes = nnkTypeSection.newTree(
    resultvals
      .filterIt( it.repr[0..4] == "error" )
      .map( proc(x: NimNode): NimNode =
        nnkTypeDef.newTree(
          ident(x.repr[5..^1] & "Defect").postfix("*"),
          newEmptyNode(),
          nnkObjectTy.newTree(
            newEmptyNode(),
            nnkOfInherit.newTree(ident"CatchableError"),
            newEmptyNode()))))
  
  return newStmtList(
    errorTypes
  )

genErrorResults

macro withCheck*(p: proc; args: varargs[untyped]): Result = 
  let errors = p.customPragmaNode().findChild(it.len > 0 and it[0].repr == "errorCodes")[1][1][0..^1]
  if errors.len == 0:
    return quote do: `p`(`args`)

  let errorCases = errors.map proc(x: NimNode): NimNode =
    let defect = ident(x.repr[5..^1] & "Defect")
    nnkOfBranch.newTree(
      ident(x.repr),
      quote do:
        raise newException(`defect`, $`defect`)
    )

  let res = quote do:
    let res = `p`(`args`)
    res
  result = newStmtList(
    nnkCaseStmt.newNimNode
      .add(res)
      .add(errorCases)
      .add( nnkElse.newTree(res[1]) )
  )



when isMainModule:
  import std/sugar

  import vulkan/features/vk10
  import vulkan/extensions/VK_EXT_debug_utils {.all.}
  import vulkan/enums
  import vulkan/commandloaders {.all.}
  import vulkan/basetypes
  import vulkan/handles
  import vulkan/additionalOperations

  proc callback(
        messageSeverity: DebugUtilsMessageSeverityFlagBitsEXT;
        messageTypes: DebugUtilsMessageTypeFlagsEXT;
        pCallbackData: ptr DebugUtilsMessengerCallbackDataEXT;
        pUserData: pointer;
      ): Bool32 {.cdecl.} =
    echo pCallbackData[].pMessage

  var
    instance_ci = InstanceCreateInfo{
      enabledExtensionCount: 1,
      ppEnabledExtensionNames: [ExtDebugUtilsExtensionName].allocCStringArray()
      }
    instance: Instance

    debugger_ci = DebugUtilsMessengerCreateInfoEXT{
      messageSeverity: DebugUtilsMessageSeverityFlagBitsEXT.errorExt,
      messageType: DebugUtilsMessageTypeFlagsEXT.all,
      pfnUserCallback: callback
      }
    debugger: DebugUtilsMessengerEXT


  dump createInstance.withCheck(addr instance_ci, nil, addr instance)

  instance.loadCommand createDebugUtilsMessengerEXT

  dump createDebugUtilsMessengerEXT.withCheck(instance, addr debugger_ci, nil, addr debugger)

  # echo case (
  #   let res = createInstance(addr ci, nil, addr x)
  #   res)
  # of errorOutOfHostMemory:
  #   raise newException(OutOfHostMemoryDefect, $OutOfHostMemoryDefect)
  # of errorOutOfDeviceMemory:
  #   raise newException(OutOfDeviceMemoryDefect, $OutOfDeviceMemoryDefect)
  # of errorInitializationFailed:
  #   raise newException(InitializationFailedDefect, $InitializationFailedDefect)
  # of errorLayerNotPresent:
  #   raise newException(LayerNotPresentDefect, $LayerNotPresentDefect)
  # of errorExtensionNotPresent:
  #   raise newException(ExtensionNotPresentDefect, $ExtensionNotPresentDefect)
  # of errorIncompatibleDriver:
  #   raise newException(IncompatibleDriverDefect, $IncompatibleDriverDefect)
  # else: res