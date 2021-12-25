# Generated at 2021-12-25T14:19:30Z
# VK_KHR_get_physical_device_properties2

import ../platform
import ../features/vk10
import ../features/vk11

prepareVulkanLibDef()

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

const getPhysicalDeviceFeatures2KHR* = getPhysicalDeviceFeatures2
const getPhysicalDeviceProperties2KHR* = getPhysicalDeviceProperties2
const getPhysicalDeviceFormatProperties2KHR* = getPhysicalDeviceFormatProperties2
const getPhysicalDeviceImageFormatProperties2KHR* = getPhysicalDeviceImageFormatProperties2
const getPhysicalDeviceQueueFamilyProperties2KHR* = getPhysicalDeviceQueueFamilyProperties2
const getPhysicalDeviceMemoryProperties2KHR* = getPhysicalDeviceMemoryProperties2
const getPhysicalDeviceSparseImageFormatProperties2KHR* = getPhysicalDeviceSparseImageFormatProperties2

