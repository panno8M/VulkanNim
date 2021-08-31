# Generated at 2021-08-31T01:21:03Z
# VK_KHR_external_fence_capabilities


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk11
export VK_KHR_get_physical_device_properties2

const
  KhrExternalFenceCapabilitiesSpecVersion* = 1
  KhrExternalFenceCapabilitiesExtensionName* = "VK_KHR_external_fence_capabilities"
  LuidSizeKhr* = LuidSize

type # enums and bitmasks
  ExternalFenceHandleTypeFlagsKHR* = ExternalFenceHandleTypeFlags
  ExternalFenceHandleTypeFlagBitsKHR* = distinct UnusedEnum
  ExternalFenceFeatureFlagsKHR* = ExternalFenceFeatureFlags
  ExternalFenceFeatureFlagBitsKHR* = distinct UnusedEnum

type
  PhysicalDeviceExternalFenceInfoKHR* = object
  ExternalFencePropertiesKHR* = object
  PhysicalDeviceIDPropertiesKHR* = object

const getPhysicalDeviceExternalFencePropertiesKHR* = getPhysicalDeviceExternalFenceProperties
StructureType.defineAliases:
  physicalDeviceExternalFenceInfo as physicalDeviceExternalFenceInfoKhr
  externalFenceProperties as externalFencePropertiesKhr
  physicalDeviceIdProperties as physicalDeviceIdPropertiesKhr

ExternalFenceHandleTypeFlagBits.defineAliases:
  opaqueFd as opaqueFdKhr
  opaqueWin32 as opaqueWin32Khr
  opaqueWin32Kmt as opaqueWin32KmtKhr
  syncFd as syncFdKhr

ExternalFenceFeatureFlagBits.defineAliases:
  exportable as exportableKhr
  importable as importableKhr

