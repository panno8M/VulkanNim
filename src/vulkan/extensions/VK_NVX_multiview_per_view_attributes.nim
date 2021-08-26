
import ../platform
import ../features/vk10
import VK_KHR_multiview




type
  PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX* = object
    sType*: StructureType
    pNext*: pointer
    perViewPositionAllComponents*: Bool32


