# Generated at 2021-10-24T02:03:03Z
# VK_KHR_external_semaphore_capabilities

import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk11
export VK_KHR_get_physical_device_properties2

prepareVulkanLibDef()

const
  KhrExternalSemaphoreCapabilitiesSpecVersion* = 1
  KhrExternalSemaphoreCapabilitiesExtensionName* = "VK_KHR_external_semaphore_capabilities"
  LuidSizeKhr* = LuidSize

type # enums and bitmasks
  ExternalSemaphoreHandleTypeFlagsKHR* = ExternalSemaphoreHandleTypeFlags
  ExternalSemaphoreHandleTypeFlagBitsKHR* = distinct UnusedEnum
  ExternalSemaphoreFeatureFlagsKHR* = ExternalSemaphoreFeatureFlags
  ExternalSemaphoreFeatureFlagBitsKHR* = distinct UnusedEnum

type
  PhysicalDeviceExternalSemaphoreInfoKHR* = object
  ExternalSemaphorePropertiesKHR* = object
  PhysicalDeviceIDPropertiesKHR* = object

const getPhysicalDeviceExternalSemaphorePropertiesKHR* = getPhysicalDeviceExternalSemaphoreProperties
ExternalSemaphoreFeatureFlagBits.defineAliases:
  exportable as exportableKhr
  importable as importableKhr

ExternalSemaphoreHandleTypeFlagBits.defineAliases:
  opaqueFd as opaqueFdKhr
  opaqueWin32 as opaqueWin32Khr
  opaqueWin32Kmt as opaqueWin32KmtKhr
  d3d12Fence as d3d12FenceKhr
  syncFd as syncFdKhr

StructureType.defineAliases:
  physicalDeviceExternalSemaphoreInfo as physicalDeviceExternalSemaphoreInfoKhr
  externalSemaphoreProperties as externalSemaphorePropertiesKhr
  physicalDeviceIdProperties as physicalDeviceIdPropertiesKhr


