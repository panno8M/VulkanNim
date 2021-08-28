# Generated at 2021-08-28T00:52:26Z
# VK_KHR_external_fence_capabilities
# ==================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  KhrExternalFenceCapabilitiesSpecVersion* = 1
  KhrExternalFenceCapabilitiesExtensionName* = "VK_KHR_external_fence_capabilities"
  LuidSizeKhr* = LuidSize

type
  {name}* = {Alias}
  ExternalFenceHandleTypeFlagBitsKHR* = UnusedEnum
  {name}* = {Alias}
  ExternalFenceFeatureFlagBitsKHR* = UnusedEnum
  PhysicalDeviceExternalFenceInfoKHR* = object
  ExternalFencePropertiesKHR* = object
  PhysicalDeviceIDPropertiesKHR* = object

var # commands
  
const getPhysicalDeviceExternalFencePropertiesKHR* = getPhysicalDeviceExternalFenceProperties
StructureType.defineAliases:
  PhysicalDeviceExternalFenceInfo as PhysicalDeviceExternalFenceInfoKhr
  ExternalFenceProperties as ExternalFencePropertiesKhr
  PhysicalDeviceIdProperties as PhysicalDeviceIdPropertiesKhr

ExternalFenceHandleTypeFlagBits.defineAliases:
  OpaqueFd as OpaqueFdBitKhr
  OpaqueWin32 as OpaqueWin32BitKhr
  OpaqueWin32Kmt as OpaqueWin32KmtBitKhr
  SyncFd as SyncFdBitKhr

ExternalFenceFeatureFlagBits.defineAliases:
  Exportable as ExportableBitKhr
  Importable as ImportableBitKhr

proc loadVK_KHR_external_fence_capabilities*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceExternalFencePropertiesKHRCage << "vkGetPhysicalDeviceExternalFencePropertiesKHR"