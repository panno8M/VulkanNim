
import ../platform
import ../features/vk10




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
proc loadVK_KHR_get_physical_device_properties2*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceFeatures2KHRCage << "vkGetPhysicalDeviceFeatures2KHR"
  getPhysicalDeviceProperties2KHRCage << "vkGetPhysicalDeviceProperties2KHR"
  getPhysicalDeviceFormatProperties2KHRCage << "vkGetPhysicalDeviceFormatProperties2KHR"
  getPhysicalDeviceImageFormatProperties2KHRCage << "vkGetPhysicalDeviceImageFormatProperties2KHR"
  getPhysicalDeviceQueueFamilyProperties2KHRCage << "vkGetPhysicalDeviceQueueFamilyProperties2KHR"
  getPhysicalDeviceMemoryProperties2KHRCage << "vkGetPhysicalDeviceMemoryProperties2KHR"
  getPhysicalDeviceSparseImageFormatProperties2KHRCage << "vkGetPhysicalDeviceSparseImageFormatProperties2KHR"