
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2




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


