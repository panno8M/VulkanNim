# Generated at 2021-08-28T00:52:26Z
# VK_KHR_external_memory_capabilities
# ===================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  KhrExternalMemoryCapabilitiesSpecVersion* = 1
  KhrExternalMemoryCapabilitiesExtensionName* = "VK_KHR_external_memory_capabilities"
  LuidSizeKhr* = LuidSize

type
  {name}* = {Alias}
  ExternalMemoryHandleTypeFlagBitsKHR* = UnusedEnum
  {name}* = {Alias}
  ExternalMemoryFeatureFlagBitsKHR* = UnusedEnum
  ExternalMemoryPropertiesKHR* = object
  PhysicalDeviceExternalImageFormatInfoKHR* = object
  ExternalImageFormatPropertiesKHR* = object
  PhysicalDeviceExternalBufferInfoKHR* = object
  ExternalBufferPropertiesKHR* = object
  PhysicalDeviceIDPropertiesKHR* = object

var # commands
  
const getPhysicalDeviceExternalBufferPropertiesKHR* = getPhysicalDeviceExternalBufferProperties
ExternalMemoryFeatureFlagBits.defineAliases:
  DedicatedOnly as DedicatedOnlyBitKhr
  Exportable as ExportableBitKhr
  Importable as ImportableBitKhr

StructureType.defineAliases:
  PhysicalDeviceExternalImageFormatInfo as PhysicalDeviceExternalImageFormatInfoKhr
  ExternalImageFormatProperties as ExternalImageFormatPropertiesKhr
  PhysicalDeviceExternalBufferInfo as PhysicalDeviceExternalBufferInfoKhr
  ExternalBufferProperties as ExternalBufferPropertiesKhr
  PhysicalDeviceIdProperties as PhysicalDeviceIdPropertiesKhr

ExternalMemoryHandleTypeFlagBits.defineAliases:
  OpaqueFd as OpaqueFdBitKhr
  OpaqueWin32 as OpaqueWin32BitKhr
  OpaqueWin32Kmt as OpaqueWin32KmtBitKhr
  D3d11Texture as D3d11TextureBitKhr
  D3d11TextureKmt as D3d11TextureKmtBitKhr
  D3d12Heap as D3d12HeapBitKhr
  D3d12Resource as D3d12ResourceBitKhr

proc loadVK_KHR_external_memory_capabilities*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceExternalBufferPropertiesKHRCage << "vkGetPhysicalDeviceExternalBufferPropertiesKHR"