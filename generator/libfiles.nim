import std/strutils
import std/os
import std/sequtils
import std/sugar
import std/strformat
import std/options
import std/tables
import std/algorithm

import ./utils
import ./nodedefs
import ./rendering
import ./structuredstring

type CommandRenderingMode = enum
  crmAll
  crmInstance
  crmDevice

type
  Feature* = ref object
    affiliation*: LibFile
    name*: string
    imports*: seq[string]
    exports*: seq[string]
    requires*: seq[NodeRequire]
    comment*: Option[string]
  LibFile* = ref object
    path*: string
    features*: seq[string]


proc affiliate*(feature: Feature; libFile: LibFile) =
  libFile.features.add feature.name
  feature.affiliation = libFile

proc renderCommandLoaderComponent*(require: NodeRequire; resources: Resources; renderingMode = crmAll): Option[string] =
  template needsLoader(command: NodeCommand; current: CommandRenderingMode): bool =
    command.kind != nkbrAlias and (
      case command.loadMode
      of lmWithInstance: current in {crmAll, crmInstance}
      of lmWithDevice:   current in {crmAll, crmDevice}
      of lmPreload:      false)

  if require.targets.filterIt(it.kind == nkrCommand).len == 0: return
  var commandLoaderDef = newSeq[string]()

  for req in require.targets.filter(x => x.kind == nkrCommand):
    try:
      let command = resources.commands[req.name]
      if not command.needsLoader(renderingMode): continue
      commandLoaderDef.add req.name.parseCommandname
    except KeyError: discard

  if commandLoaderDef.len != 0:
    if require.comment.isSome:
      commandLoaderDef.insert(require.comment.get.commentify, 0)
    return some commandLoaderDef.join("\n")



proc renderCommandLoader*(libFile: LibFile; featureTable: TableRef[string, Feature]; resources: Resources; commandRenderingMode = crmAll): Option[string] =
  var resultDefs = sstring(kind: skBlock)

  for feature in libFile.features:
    let feature = featureTable[feature]
    let loaderName = feature.name.splitFile.name.capitalizeAscii
    var commandLoaderDefs = sstring(kind: skBlock, title: case commandRenderingMode
      of crmAll: "proc loadAll{loaderName}*(instance: Instance) = instance.loadCommands:".fmt
      of crmInstance: "proc load{loaderName}*(instance: Instance) = instance.loadCommands:".fmt
      of crmDevice: "proc load{loaderName}*(device: Device) = device.loadCommands:".fmt)
    for require in feature.requires: commandLoaderDefs.add do:
      require.renderCommandLoaderComponent(resources, commandRenderingMode)

    if commandLoaderDefs.sons.len != 0:
      resultDefs.add commandLoaderDefs

  if resultDefs.sons.len != 0:
    return some $resultDefs


var libfileDepsLookup = new TableRef[string, seq[LibFile]]

proc getAllLibFilesNeeded(libFile: LibFile; featureTable: TableRef[string, Feature]): seq[LibFile] =
  if libfileDepsLookup.hasKey(libFile.path):
    return libfileDepsLookup[libfile.path]

  let imports = libFile
    .features
    .mapIt(featureTable[it].imports)
    .concat
    .deduplicate
  
  if imports.len == 0:
    libfileDepsLookup[libFile.path] = @[libFile]
    return @[libFile]

  let importFiles = imports
    .mapIt(featureTable[it].affiliation)
    .deduplicate
    .filterIt(it.path != libFile.path)

  result.add libFile
  result.add importfiles
  # NOTE: for cyclic import
  libfileDepsLookup[libFile.path] = result.deduplicate

  result.add importFiles
    .mapIt(it.getAllLibFilesNeeded(featureTable))
    .concat.deduplicate
  libfileDepsLookup[libFile.path] = result.deduplicate

  libfileDepsLookup[libFile.path]

proc solveImports*(libFile: LibFile; featureTable: TableRef[string, Feature]): Option[string] =

  # var deps = libFile.features.mapIt(featureTable[it].imports).concat.deduplicate
  var depfiles = libFile.getAllLibFilesNeeded(featureTable)


  var depimports = depfiles
    .mapIt(it.features)
    .concat
    .deduplicate
    .mapIt(featureTable[it].imports)
    .concat
    .deduplicate
  for feature in libFile.features:
    let idx = depimports.find(feature)
    if idx != -1:
      depimports.delete(idx)

  if depimports.len == 0: return

  let filepathes = depimports.mapIt(featureTable[it].affiliation.path).deduplicate

  let currentDir = libFile.path.splitFile.dir.parseWords({'/'})

  let importPathes = filepathes.map proc(it: string): string =
    result = "import "
    let spl = it.splitFile
    var dir = spl.dir.parseWords({'/'})
    var current = currentDir
    let name = spl.name

    var branchidx: int
    for i in 0..<min(dir.len, current.len):
      if dir[i] == current[i]:
        branchidx = i+1
      else: break

    result.add "../".repeat(current.len-branchidx)
    if branchidx < dir.len:
      result.add dir[branchidx..^1].mapIt(it & "/").join()
    
    result.add name

  some importPathes.join("\n")

proc solveExports*(libFile: LibFile; featureTable: TableRef[string, Feature]): Option[string] =
  let res = libfile
    .features
    .mapIt(featureTable[it].exports)
    .concat
    .deduplicate
    .mapIt(featureTable[it].affiliation.path.splitFile.name)
    .deduplicate
    .mapIt("export " & it)
    .join("\n")
  if not res.isEmptyOrWhitespace: return some res


proc renderCommands*(libFile: LibFile; featureTable: TableRef[string, Feature]; resources: Resources): sstring =
  result = sstring(kind: skBlock)
  var renderedNodes: seq[string]

  var headerStr = sstring(kind: skBlock)

  var constStr = sstring(kind: skBlock, title: "const")
  var commandsStr = sstring(kind: skBlock)

  for feature in libFile.features:
    var featureStr = sstring(kind: skBlock)
    for require in featureTable[feature].requires:
      var reqStr = sstring(kind: skBlock)

      for req in require.targets.filter(x => x.kind in {nkrApiConst, nkrConst, nkrConstAlias, nkrType}):
        if req.name in renderedNodes: continue

        case req.kind
        of nkrConst:
          reqStr.add render NodeConst(name: req.name, value: req.value)
          renderedNodes.add req.name

        of nkrConstAlias:
          reqStr.add render NodeConstAlias(name: req.name, alias: req.alias)
          renderedNodes.add req.name

        else: discard

      if reqStr.sons.len != 0:
        if require.comment.isSome:
          reqStr.sons.insert(comment require.comment.get, 0)
        featureStr.add reqStr
    if featureStr.sons.len != 0:
      featureStr.sons.insert(comment feature, 0)
      constStr.add featureStr

  for feature in libFile.features:
    var featureStr = sstring(kind: skBlock)
    var needsTools: bool
    for require in featureTable[feature].requires:
      var reqStr = sstring(kind: skBlock)

      for req in require.targets.filter(x => x.kind == nkrType):
        if req.name notin renderedNodes:
          if resources.defines.hasKey(req.name):
            reqStr.add render resources.defines[req.name]
            renderedNodes.add req.name

      let reqCommands = require.targets.filter(x => x.kind == nkrCommand)
      if reqCommands.len != 0:
        for reqCommand in reqCommands:
          if reqCommand.name in renderedNodes: continue
          if resources.commands.hasKey(reqCommand.name):
            reqStr.add render resources.commands[reqCommand.name]
            renderedNodes.add reqCommand.name
            if resources.commands[reqCommand.name].kind == nkbrNormal:
              needsTools = true

      if reqStr.sons.len != 0:
        if require.comment.isSome:
          reqStr.sons.insert(comment require.comment.get, 0)
        featureStr.add reqStr
        if needsTools:
          featureTable[feature].imports.add "tools"
    if featureStr.sons.len != 0:
      featureStr.sons.insert(comment feature.underline('='), 0)
      commandsStr.add featureStr
      commandsStr.add ""

  var featureInfos: seq[string]
  for feature in libfile.features:
    featureInfos.add $feature.comment
  featureInfos.sort
  headerStr.add featureInfos.join("\n")
  headerStr.add ""
  let imports = libFile.solveImports(featureTable)
  headerStr.add imports
  let exports = libFile.solveExports(featureTable)
  headerStr.add exports

  result.add headerStr
  if constStr.sons.len != 0:
    result.add constStr
  result.add "\n"
  if commandsStr.sons.len != 0:
    result.add commandsStr
    result.add ""


  for renderingMode in CommandRenderingMode:
    let rendered = libFile.renderCommandLoader(featureTable, resources, renderingMode)
    if rendered.isSome:
      result.add rendered.get