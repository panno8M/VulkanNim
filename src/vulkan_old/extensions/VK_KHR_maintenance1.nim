# Generated at 2021-10-24T02:03:04Z
# VK_KHR_maintenance1

import ../platform
import ../features/vk10
import ../features/vk11

prepareVulkanLibDef()

const
  KhrMaintenance1SpecVersion* = 2
  KhrMaintenance1ExtensionName* = "VK_KHR_maintenance1"

type # enums and bitmasks
  CommandPoolTrimFlagsKHR* = CommandPoolTrimFlags

const trimCommandPoolKHR* = trimCommandPool
Result.defineAliases:
  errorOutOfPoolMemory as errorOutOfPoolMemoryKhr

FormatFeatureFlagBits.defineAliases:
  transferSrc as transferSrcKhr
  transferDst as transferDstKhr

ImageCreateFlagBits.defineAliases:
  e2dArrayCompatible as e2dArrayCompatibleKhr


