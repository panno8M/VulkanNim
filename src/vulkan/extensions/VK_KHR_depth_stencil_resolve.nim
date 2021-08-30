# Generated at 2021-08-30T14:31:10Z
# VK_KHR_depth_stencil_resolve


import ../platform
import ../features/vk10
import ./VK_KHR_create_renderpass2

const
  KhrDepthStencilResolveSpecVersion* = 1
  KhrDepthStencilResolveExtensionName* = "VK_KHR_depth_stencil_resolve"

type
  SubpassDescriptionDepthStencilResolveKHR* = object
  PhysicalDeviceDepthStencilResolvePropertiesKHR* = object
  ResolveModeFlagBitsKHR* = distinct UnusedEnum
  {name}* = {Alias}

ResolveModeFlagBits.defineAliases:
  none as noneKhr
  sampleZero as sampleZeroKhr
  average as averageKhr
  min as minKhr
  max as maxKhr

StructureType.defineAliases:
  physicalDeviceDepthStencilResolveProperties as physicalDeviceDepthStencilResolvePropertiesKhr
  subpassDescriptionDepthStencilResolve as subpassDescriptionDepthStencilResolveKhr

