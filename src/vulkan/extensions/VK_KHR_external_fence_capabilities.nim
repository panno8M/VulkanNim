
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  PhysicalDeviceIDPropertiesKHR* = object
  ExternalFencePropertiesKHR* = object
  # TODO: [Unsupported Type]
  # (name: "VkExternalFenceFeatureFlagsKHR", kind: nkrType)
  ExternalFenceFeatureFlagBitsKHR* = UnusedEnum
  PhysicalDeviceExternalFenceInfoKHR* = object
  ExternalFenceHandleTypeFlagBitsKHR* = UnusedEnum
  # TODO: [Unsupported Type]
  # (name: "VkExternalFenceHandleTypeFlagsKHR", kind: nkrType)

template LuidSizeKhr*(): untyped =
  VkLuidSize
const KhrExternalFenceCapabilitiesSpecVersion* = 1
const KhrExternalFenceCapabilitiesExtensionName* = "VK_KHR_external_fence_capabilities"
var # commands
  

const getPhysicalDeviceExternalFencePropertiesKHR* = getPhysicalDeviceExternalFenceProperties


proc loadVK_KHR_external_fence_capabilities*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceExternalFencePropertiesKHRCage << "vkGetPhysicalDeviceExternalFencePropertiesKHR"