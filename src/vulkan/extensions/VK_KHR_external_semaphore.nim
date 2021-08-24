
import ../platform
import ../features/vk10
import VK_KHR_external_semaphore_capabilities


type
  ExportSemaphoreCreateInfoKHR* = object
  SemaphoreImportFlagBitsKHR* = UnusedEnum
  {name}* = {Alias}

const KhrExternalSemaphoreSpecVersion* = 1
const KhrExternalSemaphoreExtensionName* = "VK_KHR_external_semaphore"

