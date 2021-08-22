# import vulkan/features/[vk10, vk11, vk12]

# export vk10
# export vk11
# export vk12

when isMainModule:
  import ./vulkan/generator/libGen

  libGen.generate()