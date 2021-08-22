
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  PhysicalDeviceShaderImageFootprintFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    imageFootprint*: Bool32

const NvShaderImageFootprintExtensionName* = "VK_NV_shader_image_footprint"
const NvShaderImageFootprintSpecVersion* = 2

