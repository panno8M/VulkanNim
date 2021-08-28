# Generated at 2021-08-28T00:52:26Z
# VK_KHR_external_semaphore_capabilities
# ======================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  KhrExternalSemaphoreCapabilitiesSpecVersion* = 1
  KhrExternalSemaphoreCapabilitiesExtensionName* = "VK_KHR_external_semaphore_capabilities"
  LuidSizeKhr* = LuidSize

type
  {name}* = {Alias}
  ExternalSemaphoreHandleTypeFlagBitsKHR* = UnusedEnum
  {name}* = {Alias}
  ExternalSemaphoreFeatureFlagBitsKHR* = UnusedEnum
  PhysicalDeviceExternalSemaphoreInfoKHR* = object
  ExternalSemaphorePropertiesKHR* = object
  PhysicalDeviceIDPropertiesKHR* = object

var # commands
  
const getPhysicalDeviceExternalSemaphorePropertiesKHR* = getPhysicalDeviceExternalSemaphoreProperties
ExternalSemaphoreFeatureFlagBits.defineAliases:
  Exportable as ExportableBitKhr
  Importable as ImportableBitKhr

ExternalSemaphoreHandleTypeFlagBits.defineAliases:
  OpaqueFd as OpaqueFdBitKhr
  OpaqueWin32 as OpaqueWin32BitKhr
  OpaqueWin32Kmt as OpaqueWin32KmtBitKhr
  D3d12Fence as D3d12FenceBitKhr
  SyncFd as SyncFdBitKhr

StructureType.defineAliases:
  PhysicalDeviceExternalSemaphoreInfo as PhysicalDeviceExternalSemaphoreInfoKhr
  ExternalSemaphoreProperties as ExternalSemaphorePropertiesKhr
  PhysicalDeviceIdProperties as PhysicalDeviceIdPropertiesKhr

proc loadVK_KHR_external_semaphore_capabilities*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceExternalSemaphorePropertiesKHRCage << "vkGetPhysicalDeviceExternalSemaphorePropertiesKHR"