import xmltree
import strformat
import strutils
import sequtils
import tables
import os
import options
import logging
import times

import ./utils
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

    headerComment &= "Generated at {now()}\n".fmt
    headerComment &= "{api} {number}".fmt
    if not comment.isEmptyOrWhitespace: headerComment &= "\n" & comment
    libFile.fileHeader &= headerComment.underline('=').commentify.LF

    for require in feature.findAll("require"):
      libFile.requires.add require.extractNodeRequire

    "{featureFilePath}/{fileName[name]}.nim".fmt.writeFile libFile.compile(resources).render
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
      libFile = LibFile(requires: newSeq[NodeRequire](),
          fileName: name,
          dependencies: dependenciesBasic.concat(requires.mapIt((it, false)))
        )

    for require in extension.findAll("require"):
      try:
        libFile.requires.add require.extractNodeRequire
      except:
        echo getCurrentExceptionMsg()
        echo "extract error @" & name
    
    if libFile.requires.len == 0: continue

    "src/vulkan/extensions/{name}.nim".fmt.writeFile(
      libFile.compile(resources).render()
    )
    # if libFile.fileName == "VK_ANDROID_native_buffer":
    #   echo repr libFile.compile(resources)


  echo "done!"