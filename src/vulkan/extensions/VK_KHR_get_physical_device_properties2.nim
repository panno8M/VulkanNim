
import ../platform
import ../features/vk10


type
  SparseImageFormatProperties2KHR* = object
  PhysicalDeviceMemoryProperties2KHR* = object
  ImageFormatProperties2KHR* = object
  FormatProperties2KHR* = object
  PhysicalDeviceImageFormatInfo2KHR* = object
  PhysicalDeviceFeatures2KHR* = object
  QueueFamilyProperties2KHR* = object
  PhysicalDeviceSparseImageFormatInfo2KHR* = object
  PhysicalDeviceProperties2KHR* = object

const KhrGetPhysicalDeviceProperties2ExtensionName* = "VK_KHR_get_physical_device_properties2"
const KhrGetPhysicalDeviceProperties2SpecVersion* = 2
var # commands
  
  
  
  
  
  
  

const getPhysicalDeviceProperties2KHR* = getPhysicalDeviceProperties2

const getPhysicalDeviceSparseImageFormatProperties2KHR* = getPhysicalDeviceSparseImageFormatProperties2

const getPhysicalDeviceQueueFamilyProperties2KHR* = getPhysicalDeviceQueueFamilyProperties2

const getPhysicalDeviceImageFormatProperties2KHR* = getPhysicalDeviceImageFormatProperties2

const getPhysicalDeviceFormatProperties2KHR* = getPhysicalDeviceFormatProperties2

const getPhysicalDeviceFeatures2KHR* = getPhysicalDeviceFeatures2

const getPhysicalDeviceMemoryProperties2KHR* = getPhysicalDeviceMemoryProperties2


proc loadVK_KHR_get_physical_device_properties2*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceProperties2KHRCage << "vkGetPhysicalDeviceProperties2KHR"
  getPhysicalDeviceSparseImageFormatProperties2KHRCage << "vkGetPhysicalDeviceSparseImageFormatProperties2KHR"
  getPhysicalDeviceQueueFamilyProperties2KHRCage << "vkGetPhysicalDeviceQueueFamilyProperties2KHR"
  getPhysicalDeviceImageFormatProperties2KHRCage << "vkGetPhysicalDeviceImageFormatProperties2KHR"
  getPhysicalDeviceFormatProperties2KHRCage << "vkGetPhysicalDeviceFormatProperties2KHR"
  getPhysicalDeviceFeatures2KHRCage << "vkGetPhysicalDeviceFeatures2KHR"
  getPhysicalDeviceMemoryProperties2KHRCage << "vkGetPhysicalDeviceMemoryProperties2KHR"