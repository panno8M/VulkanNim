
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  RenderPassFragmentDensityMapCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    fragmentDensityMapAttachment*: AttachmentReference
  PhysicalDeviceFragmentDensityMapPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    minFragmentDensityTexelSize*: Extent2D
    maxFragmentDensityTexelSize*: Extent2D
    fragmentDensityInvocations*: Bool32
  PhysicalDeviceFragmentDensityMapFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    fragmentDensityMap*: Bool32
    fragmentDensityMapDynamic*: Bool32
    fragmentDensityMapNonSubsampledImages*: Bool32

const ExtFragmentDensityMapExtensionName* = "VK_EXT_fragment_density_map"
const ExtFragmentDensityMapSpecVersion* = 1

