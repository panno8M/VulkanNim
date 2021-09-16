# Generated at 2021-09-12T04:58:23Z
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
    sType* {.constant: (StructureType.sampleLocationsInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    sampleLocationsPerPixel* {.optional.}: SampleCountFlagBits
    sampleLocationGridSize*: Extent2D
    sampleLocationsCount* {.optional.}: uint32
    pSampleLocations*: ptr SampleLocationEXT
  AttachmentSampleLocationsEXT* = object
    attachmentIndex*: uint32
    sampleLocationsInfo*: SampleLocationsInfoEXT
  SubpassSampleLocationsEXT* = object
    subpassIndex*: uint32
    sampleLocationsInfo*: SampleLocationsInfoEXT
  RenderPassSampleLocationsBeginInfoEXT* = object
    sType* {.constant: (StructureType.renderPassSampleLocationsBeginInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    attachmentInitialSampleLocationsCount* {.optional.}: uint32
    pAttachmentInitialSampleLocations*: ptr AttachmentSampleLocationsEXT
    postSubpassSampleLocationsCount* {.optional.}: uint32
    pPostSubpassSampleLocations*: ptr SubpassSampleLocationsEXT
  PipelineSampleLocationsStateCreateInfoEXT* = object
    sType* {.constant: (StructureType.pipelineSampleLocationsStateCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    sampleLocationsEnable*: Bool32
    sampleLocationsInfo*: SampleLocationsInfoEXT
  PhysicalDeviceSampleLocationsPropertiesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceSampleLocationsPropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
    sampleLocationSampleCounts*: SampleCountFlags
    maxSampleLocationGridSize*: Extent2D
    sampleLocationCoordinateRange*: array[2, float32]
    sampleLocationSubPixelBits*: uint32
    variableSampleLocations*: Bool32
  MultisamplePropertiesEXT* = object
    sType* {.constant: (StructureType.multisamplePropertiesExt).}: StructureType
    pNext* {.optional.}: pointer
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
  cmdSetSampleLocationsEXT.load(instance)
  getPhysicalDeviceMultisamplePropertiesEXT.load(instance)

proc loadVK_EXT_sample_locations*(instance: Instance) =
  getPhysicalDeviceMultisamplePropertiesEXT.load(instance)

proc loadVK_EXT_sample_locations*(device: Device) =
  cmdSetSampleLocationsEXT.load(device)

