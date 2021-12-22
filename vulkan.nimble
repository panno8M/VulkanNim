# Package

version     = "0.1.0"
author      = "Panno"
description = "Vulkan bindings for Nim"
license     = "MIT"
srcDir      = "src"

# Dependencies

requires "nim >= 1.0.0"

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
    exec "curl https://raw.githubusercontent.com/KhronosGroup/Vulkan-Docs/master/xml/vk.xml > vk.xml"

  exec """
  nim c -r generator/libgen
  rm -f generator/libgen
  """