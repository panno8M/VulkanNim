import xmltree
import strformat
import strutils
import sequtils
import tables
import logging
import options
import os

import ./utils
import ./nodedefs
import ./liblogger
import ./extraction
import ./rendering
import ./libfiles
import ./structuredstring


# let logger = newMyLogger(open("log", fmWrite), fmtStr="[$time] - \x1b[32m$levelname\x1b[0m ")
let logger = newMyLogger(open("log", fmWrite), fmtStr="[$time] - $levelname ".fmt)
addHandler(logger)

const libRoot = "src/vulkan"

let
  xml = getVulkanXML()
  resources = xml.extractResources

const warningText = """
# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.
"""


proc genBaseTypes*() =
  let file = open("src/vulkan/basetypes.nim", fmWrite)
  defer: close file
  file.write warningText
  file.write "type\n"
  for key, val in resources.basetypes:
    case val.kind
    of nkbExternal: discard
    of nkbNormal:
      file.write "  "
      file.write val.render
      file.write "\n"

  file.write "\n"

  var consts = sstring(kind: skBlock, title: "const")
  consts.add %"# == Constants == #"
  for key, val in resources.consts      : consts.add %val.render()
  consts.add %"# == Aliases == #"
  for key, val in resources.constAliases: consts.add %val.render()
  file.write $consts

proc genHandles* =
  block HandleTypes:
    let file = open("src/vulkan/handles/handleTypes.nim", fmWrite)
    defer: close file
    file.write warningText

    var handleTypes = sstring(kind: skBlock, title: "type HandleTypes* = enum")
    handleTypes.add %"HtNil"
    for key, val in resources.handles:
      let str = val.renderHandleType()
      handleTypes.add str
    file.write $handleTypes

  block Handles:
    let file = open("src/vulkan/handles/handleConcretes.nim", fmWrite)
    defer: close file
    file.write warningText

    file.write """
import handleTypes
import handleOperations

"""

    var handles = sstring(kind: skBlock, title: "type")
    for key, val in resources.handles: handles.add %val.render()

    file.write $handles

proc genEnums*() =
  var rendered: seq[string]

  template openFile(filePath: string) =
    let file {.inject.} = filePath.open(fmWrite)
    defer: close file
    file.write warningText


  proc renderComponent(feature: XmlNode, enumAliases: TableRef[string, NodeEnumAliases], rendered: var seq[string]): Option[sstring] =
    var res = sstring(kind: skBlock)
    for requiresXml in feature.findAll("require"):
      for req in requiresXml.extractNodeRequire.targets:
        if req.name in rendered: continue
        case req.kind

        of nkrType:
          if resources.enums.haskey(req.name):
            res.add render( resources.enums[req.name], resources.vendorTags )
          elif resources.bitmasks.hasKey(req.name):
            res.add render( resources.bitmasks[req.name] )
          if resources.enumAliases.hasKey(req.name):
            enumAliases[req.name] = resources.enumAliases[req.name]
          rendered.add req.name

        of nkrEnumExtendAlias:
          if enumAliases.hasKey(req.extends):
            enumAliases[req.extends].aliases.add NodeEnumAlias(
              name: req.name,
              alias: req.enumAlias,
            )
          else:
            enumAliases[req.extends] = NodeEnumAliases(
              name: req.extends,
              aliases: @[NodeEnumAlias(
                name: req.name,
                alias: req.enumAlias,
              )]
            )

        else: discard

    if res.sons.len > 0:
      res.sons.insert( %feature{"name"}
        .removeVkPrefix
        .replace("_", " ")
        .underline('-')
        .commentify,
        0)
      return some res
    return none sstring

  block:
    openFile( "src/vulkan/enums.nim" )
    file.write """

import utils/enumutilities
import basetypes

"""
    var enumAliases = newTable[string, NodeEnumAliases]()
    var results = sstring(kind: skBlock, title: "type")
    for x in xml.findAll("feature"):
      results.add renderComponent(x, enumAliases, rendered)
    for x in xml.findAll("extensions"):
      results.add renderComponent(x, enumAliases, rendered)
    
    file.write results
    file.write "\n\n\n"

    results = sstring(kind: skBlock)
    for key, val in enumAliases:
      results.add val.render(resources.vendorTags)

    file.write $results

proc isValidExtension(name: string): bool =
  let words = name.parseWords({'_'})
  if words.len >= 1 and words[1] == "RESERVED": return false

  if words.len == 4 and words[2] == "extension":
    try:
      discard words[3].parseInt
      return false
    except: discard

  return true

proc generate*() =
  var features = new TableRef[string, Feature]
  var libfiles: seq[LibFile]

  let
    platformFile = LibFile(path: "platform", dummy: true)
    platformFeature = Feature(name: "platform")
  platformFeature.affiliate platformFile
  features["platform"] = platformFeature

  # = VULKAN FEATURES =

  for featureXML in xml.findAll("feature"):

    let
      comment = featureXML{"comment"}
      name = featureXML{"name"}

    var feature = Feature(name: name)
    features[name] = feature

    if (?comment).isSome:
      feature.header = some comment.underline('=').commentify

    for require in featureXML.findAll("require"):
      feature.requires.add require.extractNodeRequire

    var file = new LibFile
    libfiles.add file

    feature.affiliate file
    feature.imports.add platformFeature.name
    case feature.name
    of "VK_VERSION_1_0":
      file.path = "features/vk10"
    of "VK_VERSION_1_1":
      file.path = "features/vk11"
      feature.imports.add "VK_VERSION_1_0"
    of "VK_VERSION_1_2":
      file.path = "features/vk12"
      feature.imports.add @["VK_VERSION_1_0", "VK_VERSION_1_1"]
    else: discard

  # = VULKAN EXTENSIONS =

  let allextfile = LibFile(path: "extensions")
  let allextfeat = Feature(name: "extensions")
  allextfeat.affiliate allextfile
  libfiles.add allextfile
  features[allextfeat.name] = allextfeat

  let envfile = (
    windows : LibFile(path: "extensions"/"environment"/"windows" ),
    linux   : LibFile(path: "extensions"/"environment"/"linux"   ),
    directfb: LibFile(path: "extensions"/"environment"/"directfb"),
    metal   : LibFile(path: "extensions"/"environment"/"metal"   ),
    macos   : LibFile(path: "extensions"/"environment"/"macos"   ),
    ios     : LibFile(path: "extensions"/"environment"/"ios"     ),
    android : LibFile(path: "extensions"/"environment"/"android" ),
  )

  let vendorFile = (
    ggp    : LibFile(path: "extensions"/"vendor"/"ggp"    ),
    fuchsia: LibFile(path: "extensions"/"vendor"/"fuchsia"),
  )

  let functionFile = (
    maintenance:       LibFile(path: "extensions"/"function"/"maintenance"      ),
    display:           Libfile(path: "extensions"/"function"/"display"          ),
    drawIndirectCount: LibFile(path: "extensions"/"function"/"drawindirectcount"),
  )
  
  let specifics = [
    envfile.windows,
    envfile.linux,
    envfile.directfb,
    envfile.metal,
    envfile.macos,
    envfile.ios,
    envfile.android,

    vendorFile.ggp,
    vendorFile.fuchsia,

    functionFile.maintenance,
    functionFile.display,
    functionFile.drawIndirectCount,
    ]
  libfiles.add specifics

  let fileGroup = [
    ("win32", envfile.windows),
    ("wayland", envfile.linux),
    ("xlib", envfile.linux),
    ("xcb", envfile.linux),
    ("directfb", envfile.directfb),
    ("metal", envfile.metal),
    ("macos", envfile.macos),
    ("ios", envfile.ios),
    ("android", envfile.android),
    ("VK_ANDROID", envfile.android),
    ("VK_GGP", vendorFile.ggp),
    ("VK_FUCHSIA", vendorFile.fuchsia),
    ("VK_KHR_maintenance", functionFile.maintenance),
    ("display", functionFile.display),
    ("swapchain", functionFile.display),
    ("draw_indirect_count", functionFile.drawIndirectCount)
  ].newTable

  when true:
    let customVersion = [
      ("VK_NV_device_generated_commands", @["VK_VERSION_1_0", "VK_VERSION_1_1"]),
      ("VK_EXT_buffer_device_address",    @["VK_VERSION_1_2"]),
    ].newTable
    for extension in xml["extensions"].findAll("extension"):
      let name = extension{"name"}
      if not name.isValidExtension: continue

      var feature = Feature(name: name)

      # let needsImport = extension{"requires"}.parseWords({','})
      let promotedto = ?extension{"promotedto"}

      if customVersion.hasKey(feature.name):
        feature.imports.add customVersion[feature.name]
      else: feature.imports.add "VK_VERSION_1_0"
      # feature.imports.add needsImport
      if promotedto.isSome:
        feature.imports.add promotedto.get

      if (?extension.comment).isSome:
        feature.header = some extension.comment.underline('=').commentify

      feature.imports.add platformFeature.name

      for require in extension.findAll("require"):
        # if (?require{"extension"}).isSome:
        #   feature.imports.add require{"extension"}
        feature.requires.add require.extractNodeRequire

      if feature.requires.len != 0:
        features[name] = feature

      block MAKE_FILE:
        allextfeat.imports.add feature.name

        if feature.affiliation.isNil:
          for keyword, file in fileGroup:
            if feature.name.find(keyword) != -1:
              feature.affiliate file
              break MAKE_FILE
          
        var file = new LibFile
        libfiles.add file

        file.path = "extensions"/feature.name
        feature.affiliate file


  # = MERGE AND RENDER =

  var updatedFiles: seq[string]
  for libFile in libfiles:
    if libFile.isNil: continue
    let
      res = libFile.render(features, resources)
      filePath = &"{libRoot/libFile.path}.nim"
    if res.isNone: continue
    if res.get.isChanged(filePath):
      filePath.writeFile res.get
      updatedFiles.add filePath

  if updatedFiles.len == 0:
    notice title"Generate Complate! No API files have been updated."
  else:
    notice title"Generate Complate! Following API files have been updated:":
      updatedFiles.join("\n").indent(2)

when isMainModule:
  generate()
  genBaseTypes()
  genHandles()
  genEnums()