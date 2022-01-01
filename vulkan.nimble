# Package

version     = "0.1.0"
author      = "Panno"
description = "Vulkan bindings for Nim"
license     = "MIT"
srcDir      = "src"

# Dependencies

requires "nim >= 1.0.0"

import strformat

task watch, "":
  exec """
  ./watch.sh src/vulkan/generator/libGen.nim 'nimble run'
  """

task sandbox, "":
  exec """
  ./watch.sh tests/sandbox.nim 'nim c -r tests/sandbox'
  """

task generate, "":
  if not fileExists "vk.xml":
    exec "curl https://raw.githubusercontent.com/KhronosGroup/Vulkan-Docs/main/xml/vk.xml > vk.xml"

  exec """
  nim c -r generator/libgen
  rm -f generator/libgen
  """

task bench, "":
  if paramCount() != 9:
    quit("only needs path relative to bench/")
  exec &"""
    nim c -r bench/{paramStr(9)}
    rm -f bench/{paramStr(9)}
  """
