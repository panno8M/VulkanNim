
import ../platform
import ../features/vk10
import VK_KHR_get_physical_device_properties2


type
  CoarseSampleOrderCustomNV* = object
    shadingRate*: ShadingRatePaletteEntryNV
    sampleCount*: uint32
    sampleLocationCount*: uint32
    pSampleLocations*: ptr CoarseSampleLocationNV
  PipelineViewportShadingRateImageStateCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    shadingRateImageEnable*: Bool32
    viewportCount*: uint32
    pShadingRatePalettes*: ptr ShadingRatePaletteNV
  PipelineViewportCoarseSampleOrderStateCreateInfoNV* = object
    sType*: StructureType
    pNext*: pointer
    sampleOrderType*: CoarseSampleOrderTypeNV
    customSampleOrderCount*: uint32
    pCustomSampleOrders*: ptr CoarseSampleOrderCustomNV
  CoarseSampleLocationNV* = object
    pixelX*: uint32
    pixelY*: uint32
    sample*: uint32
  PhysicalDeviceShadingRateImageFeaturesNV* = object
    sType*: StructureType
    pNext*: pointer
    shadingRateImage*: Bool32
    shadingRateCoarseSampleOrder*: Bool32
  ShadingRatePaletteNV* = object
    shadingRatePaletteEntryCount*: uint32
    pShadingRatePaletteEntries*: ptr ShadingRatePaletteEntryNV
  ShadingRatePaletteEntryNV* {.size: sizeof(int32), pure.} = enum
    NoInvocations = 0
    Vk16InvocationsPerPixel = 1
    Vk8InvocationsPerPixel = 2
    Vk4InvocationsPerPixel = 3
    Vk2InvocationsPerPixel = 4
    Vk1InvocationPerPixel = 5
    Vk1InvocationPer2x1Pixels = 6
    Vk1InvocationPer1x2Pixels = 7
    Vk1InvocationPer2x2Pixels = 8
    Vk1InvocationPer4x2Pixels = 9
    Vk1InvocationPer2x4Pixels = 10
    Vk1InvocationPer4x4Pixels = 11
  CoarseSampleOrderTypeNV* {.size: sizeof(int32), pure.} = enum
    Default = 0
    Custom = 1
    PixelMajor = 2
    SampleMajor = 3
  PhysicalDeviceShadingRateImagePropertiesNV* = object
    sType*: StructureType
    pNext*: pointer
    shadingRateTexelSize*: Extent2D
    shadingRatePaletteSize*: uint32
    shadingRateMaxCoarseSamples*: uint32

const NvShadingRateImageExtensionName* = "VK_NV_shading_rate_image"
const NvShadingRateImageSpecVersion* = 3
var # commands
  cmdSetCoarseSampleOrderNVCage: proc(commandBuffer: CommandBuffer; sampleOrderType: CoarseSampleOrderTypeNV; customSampleOrderCount: uint32; pCustomSampleOrders: ptr CoarseSampleOrderCustomNV;): void {.cdecl.}
  cmdSetViewportShadingRatePaletteNVCage: proc(commandBuffer: CommandBuffer; firstViewport: uint32; viewportCount: uint32; pShadingRatePalettes: ptr ShadingRatePaletteNV;): void {.cdecl.}
  cmdBindShadingRateImageNVCage: proc(commandBuffer: CommandBuffer; imageView: ImageView; imageLayout: ImageLayout;): void {.cdecl.}

proc cmdSetCoarseSampleOrderNV*(
      commandBuffer: CommandBuffer;
      sampleOrderType: CoarseSampleOrderTypeNV;
      customSampleOrderCount: uint32;
      pCustomSampleOrders: ptr CoarseSampleOrderCustomNV;
    ): void {.cdecl.} =
  cmdSetCoarseSampleOrderNVCage(commandBuffer,sampleOrderType,customSampleOrderCount,pCustomSampleOrders)

proc cmdSetViewportShadingRatePaletteNV*(
      commandBuffer: CommandBuffer;
      firstViewport: uint32;
      viewportCount: uint32;
      pShadingRatePalettes: ptr ShadingRatePaletteNV;
    ): void {.cdecl.} =
  cmdSetViewportShadingRatePaletteNVCage(commandBuffer,firstViewport,viewportCount,pShadingRatePalettes)

proc cmdBindShadingRateImageNV*(
      commandBuffer: CommandBuffer;
      imageView: ImageView;
      imageLayout: ImageLayout;
    ): void {.cdecl.} =
  cmdBindShadingRateImageNVCage(commandBuffer,imageView,imageLayout)


proc loadVK_NV_shading_rate_image*(instance: Instance) =
  instance.defineLoader(`<<`)

  cmdSetCoarseSampleOrderNVCage << "vkCmdSetCoarseSampleOrderNV"
  cmdSetViewportShadingRatePaletteNVCage << "vkCmdSetViewportShadingRatePaletteNV"
  cmdBindShadingRateImageNVCage << "vkCmdBindShadingRateImageNV"