# Generated at 2021-08-30T14:31:10Z
# VK_KHR_maintenance2


import ../platform
import ../features/vk10

const
  KhrMaintenance2SpecVersion* = 1
  KhrMaintenance2ExtensionName* = "VK_KHR_maintenance2"

type
  PhysicalDevicePointClippingPropertiesKHR* = object
  PointClippingBehaviorKHR* = distinct UnusedEnum
  RenderPassInputAttachmentAspectCreateInfoKHR* = object
  InputAttachmentAspectReferenceKHR* = object
  ImageViewUsageCreateInfoKHR* = object
  TessellationDomainOriginKHR* = distinct UnusedEnum
  PipelineTessellationDomainOriginStateCreateInfoKHR* = object

PointClippingBehavior.defineAliases:
  allClipPlanes as allClipPlanesKhr
  userClipPlanesOnly as userClipPlanesOnlyKhr

StructureType.defineAliases:
  physicalDevicePointClippingProperties as physicalDevicePointClippingPropertiesKhr
  renderPassInputAttachmentAspectCreateInfo as renderPassInputAttachmentAspectCreateInfoKhr
  imageViewUsageCreateInfo as imageViewUsageCreateInfoKhr
  pipelineTessellationDomainOriginStateCreateInfo as pipelineTessellationDomainOriginStateCreateInfoKhr

TessellationDomainOrigin.defineAliases:
  upperLeft as upperLeftKhr
  lowerLeft as lowerLeftKhr

ImageCreateFlagBits.defineAliases:
  blockTexelViewCompatible as blockTexelViewCompatibleKhr
  extendedUsage as extendedUsageKhr

ImageLayout.defineAliases:
  depthReadOnlyStencilAttachmentOptimal as depthReadOnlyStencilAttachmentOptimalKhr
  depthAttachmentStencilReadOnlyOptimal as depthAttachmentStencilReadOnlyOptimalKhr

