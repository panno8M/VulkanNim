
import ../platform
import ../features/vk10
import VK_KHR_create_renderpass2


type
  SubpassDescriptionDepthStencilResolveKHR* = object
  ResolveModeFlagBitsKHR* = UnusedEnum
  {name}* = {Alias}
  PhysicalDeviceDepthStencilResolvePropertiesKHR* = object

const KhrDepthStencilResolveExtensionName* = "VK_KHR_depth_stencil_resolve"
const KhrDepthStencilResolveSpecVersion* = 1

