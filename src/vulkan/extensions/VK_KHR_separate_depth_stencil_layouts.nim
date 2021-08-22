
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2
import VK_KHR_create_renderpass2


type
  AttachmentDescriptionStencilLayoutKHR* = object
  PhysicalDeviceSeparateDepthStencilLayoutsFeaturesKHR* = object
  AttachmentReferenceStencilLayoutKHR* = object

const KhrSeparateDepthStencilLayoutsSpecVersion* = 1
const KhrSeparateDepthStencilLayoutsExtensionName* = "VK_KHR_separate_depth_stencil_layouts"

