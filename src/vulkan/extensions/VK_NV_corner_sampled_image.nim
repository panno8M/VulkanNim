
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2




type
  PhysicalDeviceCornerSampledImageFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    cornerSampledImage*: Bool32


