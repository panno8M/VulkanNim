# Generated at 2021-08-30T23:05:46Z
# VK_KHR_maintenance1


import ../platform
import ../features/vk10
import ../features/vk11

const
  KhrMaintenance1SpecVersion* = 2
  KhrMaintenance1ExtensionName* = "VK_KHR_maintenance1"

type
  {name}* = {Alias}

const trimCommandPoolKHR* = trimCommandPool
Result.defineAliases:
  errorOutOfPoolMemory as errorOutOfPoolMemoryKhr

FormatFeatureFlagBits.defineAliases:
  transferSrc as transferSrcKhr
  transferDst as transferDstKhr

ImageCreateFlagBits.defineAliases:
  vk2dArrayCompatible as vk2dArrayCompatibleKhr

