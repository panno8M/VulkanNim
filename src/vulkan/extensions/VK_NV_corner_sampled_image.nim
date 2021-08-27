
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  NvCornerSampledImageSpecVersion* = 2
  NvCornerSampledImageExtensionName* = "VK_NV_corner_sampled_image"

type
  PhysicalDeviceCornerSampledImageFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    cornerSampledImage*: Bool32


