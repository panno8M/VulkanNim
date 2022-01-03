import std/strutils
import std/os
import std/sequtils
import std/sugar
import std/strformat
import std/options
import std/tables

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
    header*: Option[string]
    footer*: Option[string]
    requires*: seq[NodeRequire]
  LibFile* = ref object
    path*: string
    header*: Option[string]
    footer*: Option[string]
    features*: seq[string]
    dummy*: bool
  # LibFile.features .. Feature.affiliation
  # Feature.deps is used for import section


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


proc isChanged*(newText, oldPath: string): bool =
  let oldText =
    if oldPath.fileExists: oldPath.readFile
    else: return true
  newText != oldText

proc solveImports*(libFile: LibFile; featureTable: TableRef[string, Feature]): Option[string] =
  var deps = libFile.features.mapIt(featureTable[it].imports).concat().deduplicate()
  for feature in libFile.features:
    let idx = deps.find(feature)
    if idx != -1:
      deps.delete(idx)

  if deps.len == 0: return

  let filepathes = deps.mapIt(featureTable[it].affiliation.path).deduplicate

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


proc render*(libFile: LibFile; featureTable: TableRef[string, Feature]; resources: Resources): Option[string] =
  if libFile.dummy: return

  var res: string

  var renderedNodes: seq[string]
  res.add libFile.features.mapIt(featureTable[it].name).join("\n").commentify
  res.add "\n"
  if libFile.header.isSome:
    res.add libFile.header.get
    res.add "\n"

  res.add "\n"
  
  let imports = libFile.solveImports(featureTable)
  res.add imports
  res.add "\n"

  if imports.isSome and imports.get.find("platform") != -1:
    res.add "prepareVulkanLibDef()\n\n"

  block Solve_consts:
    var reqDefs: seq[seq[string]]
    for feature in libFile.features:
      for require in featureTable[feature].requires:
        var reqDef: seq[string]

        for req in require.targets.filter(x => x.kind in {nkrApiConst, nkrConst, nkrConstAlias, nkrType}):
          if req.name in renderedNodes: continue

          case req.kind
          of nkrConst:
            reqDef.add NodeConst(name: req.name, value: req.value).render
            renderedNodes.add req.name

          of nkrConstAlias:
            reqDef.add NodeConstAlias(name: req.name, alias: req.alias).render
            renderedNodes.add req.name


          else: discard
        if reqDef.len != 0:
          reqDefs.add case require.comment.isSome
            of true: concat(@[require.comment.get.commentify], reqDef)
            of false: reqDef
    if reqDefs.len != 0:
      res.add "const\n"
      res.add reqDefs
        .mapIt(it.map(s => s.indent(2)).join("\n"))
        .join("\n\n")
      res.add "\n"
      res.add "\n"

  block Solve_types:
    var typeDefs: seq[seq[string]]
    for feature in libFile.features:
      for require in featureTable[feature].requires:
        let typeTargets = require.targets.filterIt(it.kind in {nkrType})
        if typeTargets.len == 0: continue

        var typeDef: seq[string]

        for req in typeTargets:
          if req.name in renderedNodes: continue

          if resources.structs.hasKey(req.name):
            typeDef.add resources.structs[req.name].render
            renderedNodes.add req.name
          elif resources.funcPtrs.hasKey(req.name):
            typeDef.add resources.funcPtrs[req.name].render
            renderedNodes.add req.name

        if typeDef.len != 0:
          typeDefs.add case require.comment.isSome
            of true: concat(@[require.comment.get.underline('-').commentify], typeDef)
            of false: typeDef

    if typeDefs.len != 0:
      res.add "type\n"
      res.add typeDefs.mapIt(it.join("\n").indent(2)).join("\n\n")
      res.add "\n\n"

  block Solve_others:
    var reqDefs: seq[seq[string]]
    for feature in libFile.features:
      for require in featureTable[feature].requires:
        var reqDef: seq[string]

        for req in require.targets.filter(x => x.kind == nkrType):
          if req.name notin renderedNodes:
            if resources.defines.hasKey(req.name):
              reqDef.add resources.defines[req.name].render
              renderedNodes.add req.name

        let reqCommands = require.targets.filter(x => x.kind == nkrCommand)
        if reqCommands.len != 0:
          for reqCommand in reqCommands:
            if reqCommand.name in renderedNodes: continue
            if resources.commands.hasKey(reqCommand.name):
              reqDef.add resources.commands[reqCommand.name].render
              renderedNodes.add reqCommand.name

        if reqDef.len != 0 and require.comment.isSome:
          reqDef.insert(require.comment.get.underline('-').commentify, 0)
        reqDefs.add reqDef

    if reqDefs.len != 0:
      res.add reqDefs.mapIt(it.join("\n")).filterIt(it.len != 0).join("\n\n\n")
      res.add "\n\n"

  for renderingMode in CommandRenderingMode:
    let rendered = libFile.renderCommandLoader(featureTable, resources, renderingMode)
    if rendered.isSome:
      res.add rendered.get
      res.add "\n"

  if libFile.footer.isSome:
    res.add "\n"
    res.add libFile.footer
  
  return some res
