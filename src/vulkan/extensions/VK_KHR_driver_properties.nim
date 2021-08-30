# Generated at 2021-08-30T23:05:46Z
# VK_KHR_driver_properties


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
import ../features/vk12

const
  KhrDriverPropertiesSpecVersion* = 1
  KhrDriverPropertiesExtensionName* = "VK_KHR_driver_properties"
  MaxDriverNameSizeKhr* = MaxDriverNameSize
  MaxDriverInfoSizeKhr* = MaxDriverInfoSize

type
  DriverIdKHR* = distinct UnusedEnum
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

