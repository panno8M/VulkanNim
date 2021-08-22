
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  PhysicalDeviceExternalImageFormatInfoKHR* = object
  PhysicalDeviceIDPropertiesKHR* = object
  PhysicalDeviceExternalBufferInfoKHR* = object
  ExternalMemoryFeatureFlagBitsKHR* = UnusedEnum
  ExternalMemoryHandleTypeFlagBitsKHR* = UnusedEnum
  # TODO: [Unsupported Type]
  # (name: "VkExternalMemoryHandleTypeFlagsKHR", kind: nkrType)
  ExternalImageFormatPropertiesKHR* = object
  # TODO: [Unsupported Type]
  # (name: "VkExternalMemoryFeatureFlagsKHR", kind: nkrType)
  ExternalMemoryPropertiesKHR* = object
  ExternalBufferPropertiesKHR* = object

const KhrExternalMemoryCapabilitiesSpecVersion* = 1
template LuidSizeKhr*(): untyped =
  VkLuidSize
const KhrExternalMemoryCapabilitiesExtensionName* = "VK_KHR_external_memory_capabilities"
var # commands
  

const getPhysicalDeviceExternalBufferPropertiesKHR* = getPhysicalDeviceExternalBufferProperties


proc loadVK_KHR_external_memory_capabilities*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceExternalBufferPropertiesKHRCage << "vkGetPhysicalDeviceExternalBufferPropertiesKHR"