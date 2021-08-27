
import ../platform
import ../features/vk10
import VK_KHR_sampler_ycbcr_conversion


const
  ExtYcbcrImageArraysSpecVersion* = 1
  ExtYcbcrImageArraysExtensionName* = "VK_EXT_ycbcr_image_arrays"

type
  PhysicalDeviceYcbcrImageArraysFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    ycbcrImageArrays*: Bool32


