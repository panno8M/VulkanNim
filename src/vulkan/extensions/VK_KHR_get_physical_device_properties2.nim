# Generated at 2021-08-30T14:31:10Z
# VK_KHR_get_physical_device_properties2


import ../platform
import ../features/vk10

const
  KhrGetPhysicalDeviceProperties2SpecVersion* = 2
  KhrGetPhysicalDeviceProperties2ExtensionName* = "VK_KHR_get_physical_device_properties2"

type
  PhysicalDeviceFeatures2KHR* = object
  PhysicalDeviceProperties2KHR* = object
  FormatProperties2KHR* = object
  ImageFormatProperties2KHR* = object
  PhysicalDeviceImageFormatInfo2KHR* = object
  QueueFamilyProperties2KHR* = object
  PhysicalDeviceMemoryProperties2KHR* = object
  SparseImageFormatProperties2KHR* = object
  PhysicalDeviceSparseImageFormatInfo2KHR* = object

var # commands
  
  
  
  
  
  
  
const getPhysicalDeviceFeatures2KHR* = getPhysicalDeviceFeatures2
const getPhysicalDeviceProperties2KHR* = getPhysicalDeviceProperties2
const getPhysicalDeviceFormatProperties2KHR* = getPhysicalDeviceFormatProperties2
const getPhysicalDeviceImageFormatProperties2KHR* = getPhysicalDeviceImageFormatProperties2
const getPhysicalDeviceQueueFamilyProperties2KHR* = getPhysicalDeviceQueueFamilyProperties2
const getPhysicalDeviceMemoryProperties2KHR* = getPhysicalDeviceMemoryProperties2
const getPhysicalDeviceSparseImageFormatProperties2KHR* = getPhysicalDeviceSparseImageFormatProperties2
StructureType.defineAliases:
  physicalDeviceFeatures2 as physicalDeviceFeatures2Khr
  physicalDeviceProperties2 as physicalDeviceProperties2Khr
  formatProperties2 as formatProperties2Khr
  imageFormatProperties2 as imageFormatProperties2Khr
  physicalDeviceImageFormatInfo2 as physicalDeviceImageFormatInfo2Khr
  queueFamilyProperties2 as queueFamilyProperties2Khr
  physicalDeviceMemoryProperties2 as physicalDeviceMemoryProperties2Khr
  sparseImageFormatProperties2 as sparseImageFormatProperties2Khr
  physicalDeviceSparseImageFormatInfo2 as physicalDeviceSparseImageFormatInfo2Khr

proc loadVK_KHR_get_physical_device_properties2*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceFeatures2KHRCage << "vkGetPhysicalDeviceFeatures2KHR"
  getPhysicalDeviceProperties2KHRCage << "vkGetPhysicalDeviceProperties2KHR"
  getPhysicalDeviceFormatProperties2KHRCage << "vkGetPhysicalDeviceFormatProperties2KHR"
  getPhysicalDeviceImageFormatProperties2KHRCage << "vkGetPhysicalDeviceImageFormatProperties2KHR"
  getPhysicalDeviceQueueFamilyProperties2KHRCage << "vkGetPhysicalDeviceQueueFamilyProperties2KHR"
  getPhysicalDeviceMemoryProperties2KHRCage << "vkGetPhysicalDeviceMemoryProperties2KHR"
  getPhysicalDeviceSparseImageFormatProperties2KHRCage << "vkGetPhysicalDeviceSparseImageFormatProperties2KHR"