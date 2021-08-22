
import ../platform
import ../features/vk10
import VK_KHR_sampler_ycbcr_conversion


type
  PhysicalDeviceYcbcrImageArraysFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    ycbcrImageArrays*: Bool32

const ExtYcbcrImageArraysExtensionName* = "VK_EXT_ycbcr_image_arrays"
const ExtYcbcrImageArraysSpecVersion* = 1

