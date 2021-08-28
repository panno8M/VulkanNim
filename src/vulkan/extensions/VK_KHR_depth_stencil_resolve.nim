# Generated at 2021-08-28T00:52:26Z
# VK_KHR_depth_stencil_resolve
# =================================

import ../platform
import ../features/vk10
import VK_KHR_create_renderpass2


const
  KhrDepthStencilResolveSpecVersion* = 1
  KhrDepthStencilResolveExtensionName* = "VK_KHR_depth_stencil_resolve"

type
  SubpassDescriptionDepthStencilResolveKHR* = object
  PhysicalDeviceDepthStencilResolvePropertiesKHR* = object
  ResolveModeFlagBitsKHR* = UnusedEnum
  {name}* = {Alias}

ResolveModeFlagBits.defineAliases:
  None as NoneKhr
  SampleZero as SampleZeroBitKhr
  Average as AverageBitKhr
  Min as MinBitKhr
  Max as MaxBitKhr

StructureType.defineAliases:
  PhysicalDeviceDepthStencilResolveProperties as PhysicalDeviceDepthStencilResolvePropertiesKhr
  SubpassDescriptionDepthStencilResolve as SubpassDescriptionDepthStencilResolveKhr

