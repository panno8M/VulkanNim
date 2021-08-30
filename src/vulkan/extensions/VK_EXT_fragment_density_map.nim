# Generated at 2021-08-30T14:31:10Z
# VK_EXT_fragment_density_map


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2

const
  ExtFragmentDensityMapSpecVersion* = 1
  ExtFragmentDensityMapExtensionName* = "VK_EXT_fragment_density_map"

type
  PhysicalDeviceFragmentDensityMapFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    fragmentDensityMap*: Bool32
    fragmentDensityMapDynamic*: Bool32
    fragmentDensityMapNonSubsampledImages*: Bool32
  PhysicalDeviceFragmentDensityMapPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    minFragmentDensityTexelSize*: Extent2D
    maxFragmentDensityTexelSize*: Extent2D
    fragmentDensityInvocations*: Bool32
  RenderPassFragmentDensityMapCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    fragmentDensityMapAttachment*: AttachmentReference


