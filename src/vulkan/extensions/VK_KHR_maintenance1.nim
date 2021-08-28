# Generated at 2021-08-28T00:52:26Z
# VK_KHR_maintenance1
# =================================

import ../platform
import ../features/vk10


const
  KhrMaintenance1SpecVersion* = 2
  KhrMaintenance1ExtensionName* = "VK_KHR_maintenance1"

type
  {name}* = {Alias}

var # commands
  
const trimCommandPoolKHR* = trimCommandPool
Result.defineAliases:
  ErrorOutOfPoolMemory as ErrorOutOfPoolMemoryKhr

FormatFeatureFlagBits.defineAliases:
  TransferSrc as TransferSrcBitKhr
  TransferDst as TransferDstBitKhr

ImageCreateFlagBits.defineAliases:
  Vk2dArrayCompatible as Vk2dArrayCompatibleBitKhr

proc loadVK_KHR_maintenance1*(instance: Instance) =
  instance.defineLoader(`<<`)

  trimCommandPoolKHRCage << "vkTrimCommandPoolKHR"