import xmltree
import strformat
import strutils
import sequtils
import parseutils
import tables
import logging
import times
import options
import streams

import ./utils
import ./nodedefs
import ./libgennodes
import ./liblogger


# let logger = newMyLogger(open("log", fmWrite), fmtStr="[$time] - \x1b[32m$levelname\x1b[0m ")
let logger = newMyLogger(open("log", fmWrite), fmtStr="[$time] - $levelname ".fmt)
addHandler(logger)

const featureFilePath = "src/vulkan/features"
let fileName = newTable [
    ("VK_VERSION_1_0", "vk10"),
    ("VK_VERSION_1_1", "vk11"),
    ("VK_VERSION_1_2", "vk12"),
  ]
let dependencies = newTable [
  ("VK_VERSION_1_0", @[("../platform", false), ]),
  ("VK_VERSION_1_1", @[("../platform", false), ("vk10", true)]),
  ("VK_VERSION_1_2", @[("../platform", false), ("vk11", true)]),
]

proc generate*() =
  let
    xml = getVulkanXML()
    resources = xml.extractResources

  for feature in xml.findAll("feature"):

    let
      api = feature{"api"}
      number = feature{"number"}
      comment = feature{"comment"}
      name = feature{"name"}
    var
      headerComment: string
      libFile = LibFile(requires: newSeq[NodeRequire](),
          fileName: fileName[name],
          dependencies: dependencies[name]
        )

    headerComment &= "Generated at {now().utc()}\n".fmt
    headerComment &= "{api} {number}".fmt
    if (?comment).isSome: headerComment &= "\n" & comment
    libFile.fileHeader &= headerComment.underline('=').commentify.LF

    for require in feature.findAll("require"):
      libFile.requires.add require.extractNodeRequire

    block:
      let
        filePath = "{featureFilePath}/{fileName[name]}.nim".fmt
        res = libFile.render(resources)
        resStart = res.skipUntil('\n')
        store = filePath.readFile
        storeStart = store.skipUntil('\n')
      if res[resStart..^1] != store[storeStart..^1]: filePath.writeFile res

  let dependenciesBasic = @[("../platform", false), ("../features/vk10", false)]
  for extension in xml["extensions"].findAll("extension"):
    let name = extension{"name"}
    block Invalid_Extension_Test:
      let words = name.parseWords({'_'})
      if words.len == 4 and
        words[2] == "extension":
          try:
            discard words[3].parseInt
            continue
          except: break Invalid_Extension_Test
    let requires = extension{"requires"}.parseWords({','})
    var
      headerComment: string
      libFile = LibFile(requires: newSeq[NodeRequire](),
          fileName: name,
          dependencies: dependenciesBasic.concat(requires.mapIt((it, false)))
        )
    headerComment &= "Generated at {now().utc()}\n{name}".fmt
    if (?extension.comment).isSome: headerComment &= '\n' & extension.comment
    libFile.fileHeader &= headerComment.underline('=').commentify.LF

    for require in extension.findAll("require"):
      try:
        libFile.requires.add require.extractNodeRequire
      except:
        echo getCurrentExceptionMsg()
        echo "extract error @" & name

    if libFile.requires.len == 0: continue

    block:
      let
        filePath = "src/vulkan/extensions/{name}.nim".fmt
        res = libFile.render(resources)
        resStart = res.skipUntil('\n')
        store = filePath.readFile
        storeStart = store.skipUntil('\n')
      if res[resStart..^1] != store[storeStart..^1]: filePath.writeFile res


  notice "Generate Complate!"