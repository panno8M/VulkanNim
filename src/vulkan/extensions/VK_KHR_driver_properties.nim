# Generated at 2021-08-28T00:52:26Z
# VK_KHR_driver_properties
# =================================

import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


const
  KhrDriverPropertiesSpecVersion* = 1
  KhrDriverPropertiesExtensionName* = "VK_KHR_driver_properties"
  MaxDriverNameSizeKhr* = MaxDriverNameSize
  MaxDriverInfoSizeKhr* = MaxDriverInfoSize

type
  DriverIdKHR* = UnusedEnum
  ConformanceVersionKHR* = object
  PhysicalDeviceDriverPropertiesKHR* = object

DriverId.defineAliases:
  AmdProprietary as AmdProprietaryKhr
  AmdOpenSource as AmdOpenSourceKhr
  MesaRadv as MesaRadvKhr
  NvidiaProprietary as NvidiaProprietaryKhr
  IntelProprietaryWindows as IntelProprietaryWindowsKhr
  IntelOpenSourceMesa as IntelOpenSourceMesaKhr
  ImaginationProprietary as ImaginationProprietaryKhr
  QualcommProprietary as QualcommProprietaryKhr
  ArmProprietary as ArmProprietaryKhr
  GoogleSwiftshader as GoogleSwiftshaderKhr
  GgpProprietary as GgpProprietaryKhr
  BroadcomProprietary as BroadcomProprietaryKhr

StructureType.defineAliases:
  PhysicalDeviceDriverProperties as PhysicalDeviceDriverPropertiesKhr

