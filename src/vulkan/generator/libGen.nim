import xmltree
import strformat
import strutils
import sequtils
import parseutils
import tables
import logging
import times
import options
import os

import ./utils
import ./nodedefs
import ./libgennodes
import ./liblogger


# let logger = newMyLogger(open("log", fmWrite), fmtStr="[$time] - \x1b[32m$levelname\x1b[0m ")
let logger = newMyLogger(open("log", fmWrite), fmtStr="[$time] - $levelname ".fmt)
addHandler(logger)

const libRoot = "src/vulkan"
let fileName = newTable [
    ("VK_VERSION_1_0", "features/vk10"),
    ("VK_VERSION_1_1", "features/vk11"),
    ("VK_VERSION_1_2", "features/vk12"),
  ]
let dependencies = newTable [
  ("VK_VERSION_1_0", @[("platform", false), ]),
  ("VK_VERSION_1_1", @[("platform", false), ("features/vk10", true)]),
  ("VK_VERSION_1_2", @[("platform", false), ("features/vk11", true)]),
]

proc generate*() =
  var updatedFiles: seq[string]
  var library = [
    ("platform", LibFile(fileName: "platform", fileHeader: "src/vulkan/generator/platform.nim".readFile))
  ].newTable
  let fileGroup = [
    ("extensions/VK_KHR_surface", @["extensions/VK_KHR_display", #["extensions/VK_KHR_swapchain"]#])
  ].newTable
  # let fileGroup = newTable[string, seq[string]]()
  let
    xml = getVulkanXML()
    resources = xml.extractResources

  for feature in xml.findAll("feature"):

    let
      comment = feature{"comment"}
      name = feature{"name"}
    var
      libFile = LibFile(requires: newSeq[NodeRequire](),
          fileName: fileName[name],
          deps: dependencies[name]
        )
    if libFile.fileName == "features/vk10":
      libFile.fileFooter = "src/vulkan/generator/additionalOperations.nim".readFile

    if (?comment).isSome:
      libFile.fileHeader &= comment.underline('=').commentify

    for require in feature.findAll("require"):
      libFile.requires.add require.extractNodeRequire

    library[libFile.fileName] = libFile

  let dependenciesBasic = @[("platform", false), ("features/vk10", false)]
  for extension in xml["extensions"].findAll("extension"):
    let name = extension{"name"}
    block Invalid_Extension_Test:
      let words = name.parseWords({'_'})
      if words.len == 4 and words[2] == "extension":
        try: discard words[3].parseInt; continue
        except: break Invalid_Extension_Test
    let requires = extension{"requires"}.parseWords({','}).mapIt(("extensions"/it, false))
    var
      libFile = LibFile(
        requires: newSeq[NodeRequire](),
        fileName: "extensions"/name,
        deps: dependenciesBasic.concat(requires)
      )
    if (?extension.comment).isSome:
      libFile.fileHeader &= extension.comment.underline('=').commentify

    for require in extension.findAll("require"):
      libFile.requires.add require.extractNodeRequire

    if libFile.requires.len != 0:
      library[libFile.fileName] = libFile

  for fileName, mergeMaterials in fileGroup:
    library.merge(fileName, mergeMaterials)

  for fileName, libFile in library:
    if libFile.isNil: continue
    let
      filePath = libRoot/libFile.fileName & ".nim"
      res = libFile.render(library, resources)
      resStart = res.skipUntil('\n')
      store = filePath.readFile
      storeStart = store.skipUntil('\n')
    if res[resStart..^1] != store[storeStart..^1]:
      filePath.writeFile res
      updatedFiles.add filePath

  if updatedFiles.len == 0:
    notice title"Generate Complate! No API files have been updated."
  else:
    notice title"Generate Complate! Following API files have been updated:":
      updatedFiles.join("\n").indent(2)