import std/strutils
import std/os
import std/sequtils
import std/sugar
import std/strformat
import std/options
import std/tables
import std/times

import ./utils
import ./nodedefs
import ./rendering
import ./structuredstring

type CommandRenderingMode = enum
  crmAll
  crmInstance
  crmDevice

proc renderCommandLoaderComponent*(require: NodeRequire; resources: Resources; commandRenderingMode = crmAll): string =
  if require.targets.filterIt(it.kind == nkrCommand).len == 0: return
  var commandLoaderDef = newSeq[string]()

  for req in require.targets.filter(x => x.kind == nkrCommand):
    if not resources.commands.hasKey(req.name): continue
    let command = resources.commands[req.name]
    if command.kind == nkbrAlias or
       command.loadMode == lmPreload: continue

    commandLoaderDef.add case commandRenderingMode
      of crmInstance:
        if command.loadMode != lmWithInstance: continue
        "instance.loadCommand {req.name.parseCommandname}".fmt
      of crmDevice:
        if command.loadMode != lmWithDevice: continue
        "device.loadCommand {req.name.parseCommandname}".fmt
      of crmAll:
        "instance.loadCommand {req.name.parseCommandname}".fmt

  if require.comment.isSome and commandLoaderDef.len != 0:
    commandLoaderDef.insert(require.comment.get.commentify, 0)

  return commandLoaderDef.join("\n")


proc renderCommandLoader*(libFile: LibFile; resources: Resources; commandRenderingMode = crmAll): string =
  var resultDefs: seq[string]

  for i, fileRequire in libFile.requires:
    let loaderName = @[libFile.fileName].concat(libFile.mergedFileNames)[i].splitFile.name.capitalizeAscii
    var commandLoaderDefs = newSeq[string]()
    for require in fileRequire:
      let def = require.renderCommandLoaderComponent(resources, commandRenderingMode)
      if not def.isEmptyOrWhitespace:
        commandLoaderDefs.add def

    if commandLoaderDefs.len != 0:
      let loaderHeader = case commandRenderingMode
        of crmAll: "proc loadAll{loaderName}*(instance: Instance) =\n".fmt
        of crmInstance: "proc load{loaderName}*(instance: Instance) =\n".fmt
        of crmDevice: "proc load{loaderName}*(device: Device) =\n".fmt

      resultDefs.add(
        loaderHeader &
        commandLoaderDefs.mapIt(it.indent(2)).join("\n\n")
      )
  resultDefs.join("\n\n")

proc render*(libFile: LibFile; library: Library; resources: Resources): string =
  var renderedNodes: seq[string]
  result &= "# Generated at {now().utc()}\n".fmt
  result &= libFile.fileName.splitFile.name.commentify
  result.LF
  if libFile.mergedFileNames.len != 0:
    result &= libFile.mergedFileNames.mapIt(it.splitFile.name).join("\n").commentify
    result.LF
  if not libFile.fileHeader.isEmptyOrWhitespace:
    result &= libFile.fileHeader
    result.LF

  result.LF

  let dependencies = libFile
    .deps
    .mapIt( block:
      let (idir, iname, iext) = library[it.fileName].fileName.splitFile
      let (ldir, lname, lext) = libFile.fileName.splitFile
      if libFile.fileName == "extensions/VK_EXT_debug_marker" and
         iname == "VK_EXT_debug_report":
        (fileName: "", exportit: false)
      elif idir == ldir: (fileName: "."/iname, exportit: it.exportit)
      else: (fileName: ".."/idir/iname, exportit: it.exportit))
    .filterIt(not it.fileName.isEmptyOrWhitespace)
    .deduplicate
  if dependencies.len != 0:
    result &= dependencies
      .mapIt("import {it.fileName}".fmt)
      .join("\n").LF
    if dependencies.filterIt(it.exportit).len != 0:
      result &= dependencies
        .filterIt(it.exportIt)
        .mapIt("export {it.fileName.splitFile.name}".fmt)
        .join("\n").LF
    result.LF

  if libFile.fileName != "platform":
    result &= "prepareVulkanLibDef()\n\n"

  block Solve_basetypes:
    var typeDefs: seq[seq[string]]
    for fileRequire in libFile.requires:
      for require in fileRequire:
        let typeTargets = require.targets.filterIt(it.kind in {nkrType})
        if typeTargets.len == 0: continue

        var typeDef: seq[string]

        for req in typeTargets:
          if req.name in renderedNodes: continue

          if resources.basetypes.hasKey(req.name):
            typeDef.add resources.basetypes[req.name].render
            renderedNodes.add req.name

        if typeDef.len != 0:
          typeDefs.add case require.comment.isSome
            of true: concat(@[require.comment.get.commentify], typeDef)
            of false: typeDef

    if typeDefs.len != 0:
      result.add "type # basetypes\n"
      result &= typeDefs.mapIt(it.join("\n").indent(2)).join("\n\n").LF.LF

  block Solve_consts:
    var reqDefs: seq[seq[string]]
    for fileRequire in libFile.requires:
      for require in fileRequire:
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

          of nkrApiConst:
            if resources.consts.hasKey(req.name):
              reqDef.add resources.consts[req.name].render
              renderedNodes.add req.name

            elif resources.constAliases.hasKey(req.name):
              reqDef.add resources.constAliases[req.name].render
              renderedNodes.add req.name

          of nkrType:
            if resources.structs.hasKey(req.name):
              let struct = resources.structs[req.name]
              if struct.requiredConstNames.len == 0: continue
              for reqConst in struct.requiredConstNames:
                if reqConst in renderedNodes: continue
                if resources.consts.hasKey(reqConst):
                  reqDef.add resources.consts[reqConst].render
                  renderedNodes.add reqConst

          else: discard
        if reqDef.len != 0:
          reqDefs.add case require.comment.isSome
            of true: concat(@[require.comment.get.commentify], reqDef)
            of false: reqDef
    if reqDefs.len != 0:
      result.add "const\n"
      result.add reqDefs
        .mapIt(it.map(s => s.indent(2)).join("\n"))
        .join("\n\n")
      result.LF
      result.LF

  block Solve_types:
    var typeDefs: seq[seq[string]]
    for fileRequire in libFile.requires:
      for require in fileRequire:
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
          elif resources.handles.hasKey(req.name):
            typeDef.add resources.handles[req.name].render
            renderedNodes.add req.name

        if typeDef.len != 0:
          typeDefs.add case require.comment.isSome
            of true: concat(@[require.comment.get.underline('-').commentify], typeDef)
            of false: typeDef

    if typeDefs.len != 0:
      result.add "type".LF
      result &= typeDefs.mapIt(it.join("\n").indent(2)).join("\n\n").LF.LF

  block Solve_others:
    var reqDefs: seq[seq[string]]
    for fileRequire in libFile.requires:
      for require in fileRequire:
        reqDefs.add @[]
        if require.comment.isSome:
          reqDefs[^1].add require.comment.get.underline('-').commentify

        for req in require.targets.filter(x => x.kind == nkrType):
          if req.name notin renderedNodes:
            if resources.defines.hasKey(req.name):
              reqDefs[^1].add resources.defines[req.name].render
              renderedNodes.add req.name

        let reqCommands = require.targets.filter(x => x.kind == nkrCommand)
        if reqCommands.len != 0:
          for reqCommand in reqCommands:
            if reqCommand.name in renderedNodes: continue
            if resources.commands.hasKey(reqCommand.name):
              reqDefs[^1].add resources.commands[reqCommand.name].render
              renderedNodes.add reqCommand.name

    if reqDefs.len != 0:
      result &= reqDefs.mapIt(it.join("\n")).filterIt(it.len != 0).join("\n\n\n")
      result.LF
      result.LF

  if libFile.fileName == "features/vk10":
    result &= readFile("generator/resources/loadoperators.nim")
    result.LF
    result.LF

  block Render_command_loaders:
    let loadAll = libFile.renderCommandLoader(resources)
    if loadAll.len != 0:
      result &= loadAll
      result.LF
      result.LF
    let loadInstance = libFile.renderCommandLoader(resources, crmInstance)
    if loadInstance.len != 0:
      result &= loadInstance
      result.LF
      result.LF
    let loadDevice = libFile.renderCommandLoader(resources, crmDevice)
    if loadDevice.len != 0:
      result &= loadDevice
      result.LF
      result.LF

  if not libFile.fileFooter.isEmptyOrWhitespace:
    result.LF
    result &= libFile.fileFooter


proc merge*(library: var Library; base: string; materials: varargs[string]) =
  if not library.hasKey(base) or
     materials.anyIt(not library.hasKey(it)):
    return

  var result: LibFile = library[base]
  for material in materials:
    let lib = library[material]
    library[material] = result
    result.requires.add lib.requires
    result.deps.add lib.deps
    result.mergedFileNames.add lib.fileName

  result.requires = result.requires.deduplicate

  for i in countdown(result.deps.high, result.deps.low):
    if result.deps[i].filename in materials or
       result.deps[i].filename == result.fileName:
      result.deps.delete(i)