# Generated at 2021-09-09T01:49:36Z
# VK_EXT_sample_locations


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  ExtSampleLocationsSpecVersion* = 1
  ExtSampleLocationsExtensionName* = "VK_EXT_sample_locations"

type
  SampleLocationEXT* = object
    x*: float32
    y*: float32
  SampleLocationsInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    sampleLocationsPerPixel*: SampleCountFlagBits
    sampleLocationGridSize*: Extent2D
    sampleLocationsCount*: uint32
    pSampleLocations*: ptr SampleLocationEXT
  AttachmentSampleLocationsEXT* = object
    attachmentIndex*: uint32
    sampleLocationsInfo*: SampleLocationsInfoEXT
  SubpassSampleLocationsEXT* = object
    subpassIndex*: uint32
    sampleLocationsInfo*: SampleLocationsInfoEXT
  RenderPassSampleLocationsBeginInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    attachmentInitialSampleLocationsCount*: uint32
    pAttachmentInitialSampleLocations*: ptr AttachmentSampleLocationsEXT
    postSubpassSampleLocationsCount*: uint32
    pPostSubpassSampleLocations*: ptr SubpassSampleLocationsEXT
  PipelineSampleLocationsStateCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    sampleLocationsEnable*: Bool32
    sampleLocationsInfo*: SampleLocationsInfoEXT
  PhysicalDeviceSampleLocationsPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    sampleLocationSampleCounts*: SampleCountFlags
    maxSampleLocationGridSize*: Extent2D
    sampleLocationCoordinateRange*: array[2, float32]
    sampleLocationSubPixelBits*: uint32
    variableSampleLocations*: Bool32
  MultisamplePropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    maxSampleLocationGridSize*: Extent2D

proc cmdSetSampleLocationsEXT*(
      commandBuffer: CommandBuffer;
      pSampleLocationsInfo: ptr SampleLocationsInfoEXT;
    ): void {.cdecl, lazyload("vkCmdSetSampleLocationsEXT", DeviceLevel).}
proc getPhysicalDeviceMultisamplePropertiesEXT*(
      physicalDevice: PhysicalDevice;
      samples: SampleCountFlagBits;
      pMultisampleProperties: ptr MultisamplePropertiesEXT;
    ): void {.cdecl, lazyload("vkGetPhysicalDeviceMultisamplePropertiesEXT", InstanceLevel).}

proc loadAllVK_EXT_sample_locations*(instance: Instance) =
  cmdSetSampleLocationsEXT.smartLoad(instance)
  getPhysicalDeviceMultisamplePropertiesEXT.smartLoad(instance)

proc loadVK_EXT_sample_locations*(instance: Instance) =
  getPhysicalDeviceMultisamplePropertiesEXT.smartLoad(instance)

proc loadVK_EXT_sample_locations*(device: Device) =
  cmdSetSampleLocationsEXT.smartLoad(device)

