
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  ExternalSemaphoreFeatureFlagBitsKHR* = UnusedEnum
  PhysicalDeviceIDPropertiesKHR* = object
  # TODO: [Unsupported Type]
  # (name: "VkExternalSemaphoreFeatureFlagsKHR", kind: nkrType)
  ExternalSemaphoreHandleTypeFlagBitsKHR* = UnusedEnum
  ExternalSemaphorePropertiesKHR* = object
  PhysicalDeviceExternalSemaphoreInfoKHR* = object
  # TODO: [Unsupported Type]
  # (name: "VkExternalSemaphoreHandleTypeFlagsKHR", kind: nkrType)

const KhrExternalSemaphoreCapabilitiesSpecVersion* = 1
template LuidSizeKhr*(): untyped =
  VkLuidSize
const KhrExternalSemaphoreCapabilitiesExtensionName* = "VK_KHR_external_semaphore_capabilities"
var # commands
  

const getPhysicalDeviceExternalSemaphorePropertiesKHR* = getPhysicalDeviceExternalSemaphoreProperties


proc loadVK_KHR_external_semaphore_capabilities*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceExternalSemaphorePropertiesKHRCage << "vkGetPhysicalDeviceExternalSemaphorePropertiesKHR"