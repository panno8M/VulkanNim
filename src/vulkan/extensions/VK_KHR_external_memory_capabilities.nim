# Generated at 2021-08-31T05:18:46Z
# VK_KHR_external_memory_capabilities


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk11
export VK_KHR_get_physical_device_properties2

const
  KhrExternalMemoryCapabilitiesSpecVersion* = 1
  KhrExternalMemoryCapabilitiesExtensionName* = "VK_KHR_external_memory_capabilities"
  LuidSizeKhr* = LuidSize

type # enums and bitmasks
  ExternalMemoryHandleTypeFlagsKHR* = ExternalMemoryHandleTypeFlags
  ExternalMemoryHandleTypeFlagBitsKHR* = distinct UnusedEnum
  ExternalMemoryFeatureFlagsKHR* = ExternalMemoryFeatureFlags
  ExternalMemoryFeatureFlagBitsKHR* = distinct UnusedEnum

type
  ExternalMemoryPropertiesKHR* = object
  PhysicalDeviceExternalImageFormatInfoKHR* = object
  ExternalImageFormatPropertiesKHR* = object
  PhysicalDeviceExternalBufferInfoKHR* = object
  ExternalBufferPropertiesKHR* = object
  PhysicalDeviceIDPropertiesKHR* = object

const getPhysicalDeviceExternalBufferPropertiesKHR* = getPhysicalDeviceExternalBufferProperties
ExternalMemoryFeatureFlagBits.defineAliases:
  dedicatedOnly as dedicatedOnlyKhr
  exportable as exportableKhr
  importable as importableKhr

StructureType.defineAliases:
  physicalDeviceExternalImageFormatInfo as physicalDeviceExternalImageFormatInfoKhr
  externalImageFormatProperties as externalImageFormatPropertiesKhr
  physicalDeviceExternalBufferInfo as physicalDeviceExternalBufferInfoKhr
  externalBufferProperties as externalBufferPropertiesKhr
  physicalDeviceIdProperties as physicalDeviceIdPropertiesKhr

ExternalMemoryHandleTypeFlagBits.defineAliases:
  opaqueFd as opaqueFdKhr
  opaqueWin32 as opaqueWin32Khr
  opaqueWin32Kmt as opaqueWin32KmtKhr
  d3d11Texture as d3d11TextureKhr
  d3d11TextureKmt as d3d11TextureKmtKhr
  d3d12Heap as d3d12HeapKhr
  d3d12Resource as d3d12ResourceKhr


