
import ../platform
import ../features/vk10
import VK_KHR_create_renderpass2


type
  SubpassDescriptionDepthStencilResolveKHR* = object
  ResolveModeFlagBitsKHR* = UnusedEnum
  # TODO: [Unsupported Type]
  # (name: "VkResolveModeFlagsKHR", kind: nkrType)
  PhysicalDeviceDepthStencilResolvePropertiesKHR* = object

const KhrDepthStencilResolveExtensionName* = "VK_KHR_depth_stencil_resolve"
const KhrDepthStencilResolveSpecVersion* = 1

