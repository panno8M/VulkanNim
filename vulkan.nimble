# Package

version     = "0.1.0"
author      = "Panno"
description = "Vulkan bindings for Nim"
license     = "MIT"
srcDir      = "src"
bin         = @["vulkan"]
installExt  = @["nim"]

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