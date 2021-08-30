# Generated at 2021-08-30T14:31:10Z
# VK_EXT_sample_locations


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2

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

var # commands
  cmdSetSampleLocationsEXTCage: proc(commandBuffer: CommandBuffer; pSampleLocationsInfo: ptr SampleLocationsInfoEXT;): void {.cdecl.}
  getPhysicalDeviceMultisamplePropertiesEXTCage: proc(physicalDevice: PhysicalDevice; samples: SampleCountFlagBits; pMultisampleProperties: ptr MultisamplePropertiesEXT;): void {.cdecl.}
proc cmdSetSampleLocationsEXT*(
      commandBuffer: CommandBuffer;
      pSampleLocationsInfo: ptr SampleLocationsInfoEXT;
    ): void {.cdecl.} =
  cmdSetSampleLocationsEXTCage(commandBuffer,pSampleLocationsInfo)
proc getPhysicalDeviceMultisamplePropertiesEXT*(
      physicalDevice: PhysicalDevice;
      samples: SampleCountFlagBits;
      pMultisampleProperties: ptr MultisamplePropertiesEXT;
    ): void {.cdecl.} =
  getPhysicalDeviceMultisamplePropertiesEXTCage(physicalDevice,samples,pMultisampleProperties)
proc loadVK_EXT_sample_locations*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdSetSampleLocationsEXTCage << "vkCmdSetSampleLocationsEXT"
  getPhysicalDeviceMultisamplePropertiesEXTCage << "vkGetPhysicalDeviceMultisamplePropertiesEXT"