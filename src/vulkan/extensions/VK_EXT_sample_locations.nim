
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  MultisamplePropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    maxSampleLocationGridSize*: Extent2D
  RenderPassSampleLocationsBeginInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    attachmentInitialSampleLocationsCount*: uint32
    pAttachmentInitialSampleLocations*: ptr AttachmentSampleLocationsEXT
    postSubpassSampleLocationsCount*: uint32
    pPostSubpassSampleLocations*: ptr SubpassSampleLocationsEXT
  SampleLocationEXT* = object
    x*: float32
    y*: float32
  AttachmentSampleLocationsEXT* = object
    attachmentIndex*: uint32
    sampleLocationsInfo*: SampleLocationsInfoEXT
  SubpassSampleLocationsEXT* = object
    subpassIndex*: uint32
    sampleLocationsInfo*: SampleLocationsInfoEXT
  PhysicalDeviceSampleLocationsPropertiesEXT* = object
    sType*: StructureType
    pNext*: pointer
    sampleLocationSampleCounts*: SampleCountFlags
    maxSampleLocationGridSize*: Extent2D
    sampleLocationCoordinateRange*: array[2, float32]
    sampleLocationSubPixelBits*: uint32
    variableSampleLocations*: Bool32
  PipelineSampleLocationsStateCreateInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    sampleLocationsEnable*: Bool32
    sampleLocationsInfo*: SampleLocationsInfoEXT
  SampleLocationsInfoEXT* = object
    sType*: StructureType
    pNext*: pointer
    sampleLocationsPerPixel*: SampleCountFlagBits
    sampleLocationGridSize*: Extent2D
    sampleLocationsCount*: uint32
    pSampleLocations*: ptr SampleLocationEXT

const ExtSampleLocationsSpecVersion* = 1
const ExtSampleLocationsExtensionName* = "VK_EXT_sample_locations"
var # commands
  getPhysicalDeviceMultisamplePropertiesEXTCage: proc(physicalDevice: PhysicalDevice; samples: SampleCountFlagBits; pMultisampleProperties: ptr MultisamplePropertiesEXT;): void {.cdecl.}
  cmdSetSampleLocationsEXTCage: proc(commandBuffer: CommandBuffer; pSampleLocationsInfo: ptr SampleLocationsInfoEXT;): void {.cdecl.}

proc getPhysicalDeviceMultisamplePropertiesEXT*(
      physicalDevice: PhysicalDevice;
      samples: SampleCountFlagBits;
      pMultisampleProperties: ptr MultisamplePropertiesEXT;
    ): void {.cdecl.} =
  getPhysicalDeviceMultisamplePropertiesEXTCage(physicalDevice,samples,pMultisampleProperties)

proc cmdSetSampleLocationsEXT*(
      commandBuffer: CommandBuffer;
      pSampleLocationsInfo: ptr SampleLocationsInfoEXT;
    ): void {.cdecl.} =
  cmdSetSampleLocationsEXTCage(commandBuffer,pSampleLocationsInfo)


proc loadVK_EXT_sample_locations*(instance: Instance) =
  instance.defineLoader(`<<`)

  getPhysicalDeviceMultisamplePropertiesEXTCage << "vkGetPhysicalDeviceMultisamplePropertiesEXT"
  cmdSetSampleLocationsEXTCage << "vkCmdSetSampleLocationsEXT"