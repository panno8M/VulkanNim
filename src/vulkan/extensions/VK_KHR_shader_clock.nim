
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  PhysicalDeviceShaderClockFeaturesKHR* = object
    sType*: StructureType
    pNext*: pointer
    shaderSubgroupClock*: Bool32
    shaderDeviceClock*: Bool32

const KhrShaderClockSpecVersion* = 1
const KhrShaderClockExtensionName* = "VK_KHR_shader_clock"

