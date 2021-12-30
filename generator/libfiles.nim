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

proc renderCommandLoaderComponent*(require: NodeRequire; resources: Resources; commandRenderingMode = crmAll): Option[string] =
  template needsLoader(command: NodeCommand): bool =
    command.kind != nkbrAlias and command.loadMode != lmPreload

  if require.targets.filterIt(it.kind == nkrCommand).len == 0: return
  var commandLoaderDef = newSeq[string]()

  for req in require.targets.filter(x => x.kind == nkrCommand):
    try:
      let command = resources.commands[req.name]
      if not command.needsLoader: continue

      commandLoaderDef.add case commandRenderingMode
        of crmInstance:
          if command.loadMode != lmWithInstance: continue
          "instance.loadCommand {req.name.parseCommandname}".fmt
        of crmDevice:
          if command.loadMode != lmWithDevice: continue
          "device.loadCommand {req.name.parseCommandname}".fmt
        of crmAll:
          "instance.loadCommand {req.name.parseCommandname}".fmt
    except KeyError: discard

  if commandLoaderDef.len != 0:
    if require.comment.isSome:
      commandLoaderDef.insert(require.comment.get.commentify, 0)
    return some commandLoaderDef.join("\n")



proc renderCommandLoader*(libFile: LibFile; resources: Resources; commandRenderingMode = crmAll): Option[string] =
  var resultDefs = sstring(kind: skBlock)
  let loaderNames = concat(@[libFile.fileName], libFile.mergedFileNames)
    .mapIt(it.splitFile.name.capitalizeAscii)

  for i, fileRequire in libFile.requires:
    let loaderName = loaderNames[i]
    var commandLoaderDefs = sstring(kind: skBlock, title: case commandRenderingMode
      of crmAll: "proc loadAll{loaderName}*(instance: Instance) =".fmt
      of crmInstance: "proc load{loaderName}*(instance: Instance) =".fmt
      of crmDevice: "proc load{loaderName}*(device: Device) =".fmt)
    for require in fileRequire: commandLoaderDefs.add do:
      require.renderCommandLoaderComponent(resources, commandRenderingMode)

    if commandLoaderDefs.sons.len != 0:
      # commandLoaderDefs.add ""
      resultDefs.add commandLoaderDefs
  if resultDefs.sons.len != 0:
    return some $resultDefs

proc render*(libFile: LibFile; library: Library; resources: Resources): string =
  var renderedNodes: seq[string]
  result.add "# Generated at {now().utc()}\n".fmt
  result.add libFile.fileName.splitFile.name.commentify
  result.add "\n"
  if libFile.mergedFileNames.len != 0:
    result.add libFile.mergedFileNames.mapIt(it.splitFile.name).join("\n").commentify
    result.add "\n"
  if not libFile.fileHeader.isEmptyOrWhitespace:
    result.add libFile.fileHeader
    result.add "\n"

  result.add "\n"

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
    result.add dependencies
      .mapIt("import {it.fileName}".fmt)
      .join("\n")
    result.add "\n"
    if dependencies.filterIt(it.exportit).len != 0:
      result.add dependencies
        .filterIt(it.exportIt)
        .mapIt("export {it.fileName.splitFile.name}".fmt)
        .join("\n")
    result.add "\n"

  if libFile.fileName != "platform":
    result.add "prepareVulkanLibDef()\n\n"

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
      result.add "\n"
      result.add "\n"

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

        if typeDef.len != 0:
          typeDefs.add case require.comment.isSome
            of true: concat(@[require.comment.get.underline('-').commentify], typeDef)
            of false: typeDef

    if typeDefs.len != 0:
      result.add "type\n"
      result.add typeDefs.mapIt(it.join("\n").indent(2)).join("\n\n")
      result.add "\n\n"

  block Solve_others:
    var reqDefs: seq[seq[string]]
    for fileRequire in libFile.requires:
      for require in fileRequire:
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
      result.add reqDefs.mapIt(it.join("\n")).filterIt(it.len != 0).join("\n\n\n")
      result.add "\n\n"

  for renderingMode in CommandRenderingMode:
    let rendered = libFile.renderCommandLoader(resources, renderingMode)
    if rendered.isSome:
      result.add rendered.get
      result.add "\n"

  if not libFile.fileFooter.isEmptyOrWhitespace:
    result.add "\n"
    result.add libFile.fileFooter


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