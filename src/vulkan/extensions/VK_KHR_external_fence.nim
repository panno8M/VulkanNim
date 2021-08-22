
import ../platform
import ../features/vk10
import VK_KHR_external_fence_capabilities


type
  # TODO: [Unsupported Type]
  # (name: "VkFenceImportFlagsKHR", kind: nkrType)
  ExportFenceCreateInfoKHR* = object
  FenceImportFlagBitsKHR* = UnusedEnum

const KhrExternalFenceExtensionName* = "VK_KHR_external_fence"
const KhrExternalFenceSpecVersion* = 1

