# Generated at 2021-09-09T01:49:36Z
# VK_KHR_driver_properties


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk12
export VK_KHR_get_physical_device_properties2

const
  KhrDriverPropertiesSpecVersion* = 1
  KhrDriverPropertiesExtensionName* = "VK_KHR_driver_properties"
  MaxDriverNameSizeKhr* = MaxDriverNameSize
  MaxDriverInfoSizeKhr* = MaxDriverInfoSize

type # enums and bitmasks
  DriverIdKHR* = distinct UnusedEnum

type
  ConformanceVersionKHR* = object
  PhysicalDeviceDriverPropertiesKHR* = object

DriverId.defineAliases:
  amdProprietary as amdProprietaryKhr
  amdOpenSource as amdOpenSourceKhr
  mesaRadv as mesaRadvKhr
  nvidiaProprietary as nvidiaProprietaryKhr
  intelProprietaryWindows as intelProprietaryWindowsKhr
  intelOpenSourceMesa as intelOpenSourceMesaKhr
  imaginationProprietary as imaginationProprietaryKhr
  qualcommProprietary as qualcommProprietaryKhr
  armProprietary as armProprietaryKhr
  googleSwiftshader as googleSwiftshaderKhr
  ggpProprietary as ggpProprietaryKhr
  broadcomProprietary as broadcomProprietaryKhr

StructureType.defineAliases:
  physicalDeviceDriverProperties as physicalDeviceDriverPropertiesKhr


