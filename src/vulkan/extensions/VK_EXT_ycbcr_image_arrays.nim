
import ../platform
import ../features/vk10
import VK_KHR_sampler_ycbcr_conversion




type
  PhysicalDeviceYcbcrImageArraysFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    ycbcrImageArrays*: Bool32


