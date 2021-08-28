# Generated at 2021-08-28T00:52:26Z
# VK_KHR_maintenance2
# =================================

import ../platform
import ../features/vk10


const
  KhrMaintenance2SpecVersion* = 1
  KhrMaintenance2ExtensionName* = "VK_KHR_maintenance2"

type
  PhysicalDevicePointClippingPropertiesKHR* = object
  PointClippingBehaviorKHR* = UnusedEnum
  RenderPassInputAttachmentAspectCreateInfoKHR* = object
  InputAttachmentAspectReferenceKHR* = object
  ImageViewUsageCreateInfoKHR* = object
  TessellationDomainOriginKHR* = UnusedEnum
  PipelineTessellationDomainOriginStateCreateInfoKHR* = object

PointClippingBehavior.defineAliases:
  AllClipPlanes as AllClipPlanesKhr
  UserClipPlanesOnly as UserClipPlanesOnlyKhr

StructureType.defineAliases:
  PhysicalDevicePointClippingProperties as PhysicalDevicePointClippingPropertiesKhr
  RenderPassInputAttachmentAspectCreateInfo as RenderPassInputAttachmentAspectCreateInfoKhr
  ImageViewUsageCreateInfo as ImageViewUsageCreateInfoKhr
  PipelineTessellationDomainOriginStateCreateInfo as PipelineTessellationDomainOriginStateCreateInfoKhr

TessellationDomainOrigin.defineAliases:
  UpperLeft as UpperLeftKhr
  LowerLeft as LowerLeftKhr

ImageCreateFlagBits.defineAliases:
  BlockTexelViewCompatible as BlockTexelViewCompatibleBitKhr
  ExtendedUsage as ExtendedUsageBitKhr

ImageLayout.defineAliases:
  DepthReadOnlyStencilAttachmentOptimal as DepthReadOnlyStencilAttachmentOptimalKhr
  DepthAttachmentStencilReadOnlyOptimal as DepthAttachmentStencilReadOnlyOptimalKhr

