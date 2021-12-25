# Generated at 2021-10-24T02:03:03Z
# VK_KHR_sampler_mirror_clamp_to_edge

import ../platform
import ../features/vk10
import ../features/vk12

prepareVulkanLibDef()

const
  KhrSamplerMirrorClampToEdgeSpecVersion* = 3
  KhrSamplerMirrorClampToEdgeExtensionName* = "VK_KHR_sampler_mirror_clamp_to_edge"
  SamplerAddressModeMirrorClampToEdge* = 4

SamplerAddressMode.defineAliases:
  mirrorClampToEdge as mirrorClampToEdgeKhr


