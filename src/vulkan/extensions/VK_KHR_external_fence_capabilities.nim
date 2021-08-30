# Generated at 2021-08-30T23:05:46Z
# VK_KHR_external_fence_capabilities


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk11

const
  KhrExternalFenceCapabilitiesSpecVersion* = 1
  KhrExternalFenceCapabilitiesExtensionName* = "VK_KHR_external_fence_capabilities"
  LuidSizeKhr* = LuidSize

type
  {name}* = {Alias}
  ExternalFenceHandleTypeFlagBitsKHR* = distinct UnusedEnum
  {name}* = {Alias}
  ExternalFenceFeatureFlagBitsKHR* = distinct UnusedEnum
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

