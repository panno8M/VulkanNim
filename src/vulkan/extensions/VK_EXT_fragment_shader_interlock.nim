
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  PhysicalDeviceFragmentShaderInterlockFeaturesEXT* = object
    sType*: StructureType
    pNext*: pointer
    fragmentShaderSampleInterlock*: Bool32
    fragmentShaderPixelInterlock*: Bool32
    fragmentShaderShadingRateInterlock*: Bool32

const ExtFragmentShaderInterlockSpecVersion* = 1
const ExtFragmentShaderInterlockExtensionName* = "VK_EXT_fragment_shader_interlock"

