# Generated at 2021-09-16T08:32:06Z
# VK_NV_shading_rate_image


import ../platform
import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2

const
  NvShadingRateImageSpecVersion* = 3
  NvShadingRateImageExtensionName* = "VK_NV_shading_rate_image"

type # enums and bitmasks
  ShadingRatePaletteEntryNV* {.size: sizeof(int32), pure.} = enum
    noInvocationsNv = 0
    e16InvocationsPerPixelNv = 1
    e8InvocationsPerPixelNv = 2
    e4InvocationsPerPixelNv = 3
    e2InvocationsPerPixelNv = 4
    e1InvocationPerPixelNv = 5
    e1InvocationPer2x1PixelsNv = 6
    e1InvocationPer1x2PixelsNv = 7
    e1InvocationPer2x2PixelsNv = 8
    e1InvocationPer4x2PixelsNv = 9
    e1InvocationPer2x4PixelsNv = 10
    e1InvocationPer4x4PixelsNv = 11
  CoarseSampleOrderTypeNV* {.size: sizeof(int32), pure.} = enum
    defaultNv = 0
    customNv = 1
    pixelMajorNv = 2
    sampleMajorNv = 3

type
  ShadingRatePaletteNV* = object
    shadingRatePaletteEntryCount*: uint32
    pShadingRatePaletteEntries*: ptr ShadingRatePaletteEntryNV
  PipelineViewportShadingRateImageStateCreateInfoNV* = object
    sType* {.constant: (StructureType.pipelineViewportShadingRateImageStateCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    shadingRateImageEnable*: Bool32
    viewportCount*: uint32
    pShadingRatePalettes*: ptr ShadingRatePaletteNV
  PhysicalDeviceShadingRateImageFeaturesNV* = object
    sType* {.constant: (StructureType.physicalDeviceShadingRateImageFeaturesNv).}: StructureType
    pNext* {.optional.}: pointer
    shadingRateImage*: Bool32
    shadingRateCoarseSampleOrder*: Bool32
  PhysicalDeviceShadingRateImagePropertiesNV* = object
    sType* {.constant: (StructureType.physicalDeviceShadingRateImagePropertiesNv).}: StructureType
    pNext* {.optional.}: pointer
    shadingRateTexelSize*: Extent2D
    shadingRatePaletteSize*: uint32
    shadingRateMaxCoarseSamples*: uint32
  CoarseSampleLocationNV* = object
    pixelX*: uint32
    pixelY*: uint32
    sample*: uint32
  CoarseSampleOrderCustomNV* = object
    shadingRate*: ShadingRatePaletteEntryNV
    sampleCount*: uint32
    sampleLocationCount*: uint32
    pSampleLocations*: ptr CoarseSampleLocationNV
  PipelineViewportCoarseSampleOrderStateCreateInfoNV* = object
    sType* {.constant: (StructureType.pipelineViewportCoarseSampleOrderStateCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    sampleOrderType*: CoarseSampleOrderTypeNV
    customSampleOrderCount* {.optional.}: uint32
    pCustomSampleOrders*: ptr CoarseSampleOrderCustomNV

proc cmdBindShadingRateImageNV*(
      commandBuffer: CommandBuffer;
      imageView = default(ImageView);
      imageLayout: ImageLayout;
    ): void {.cdecl, lazyload("vkCmdBindShadingRateImageNV", DeviceLevel).}
proc cmdSetViewportShadingRatePaletteNV*(
      commandBuffer: CommandBuffer;
      firstViewport: uint32;
      viewportCount: uint32;
      pShadingRatePalettes {.length: viewportCount.}: ptr ShadingRatePaletteNV;
    ): void {.cdecl, lazyload("vkCmdSetViewportShadingRatePaletteNV", DeviceLevel).}
proc cmdSetCoarseSampleOrderNV*(
      commandBuffer: CommandBuffer;
      sampleOrderType: CoarseSampleOrderTypeNV;
      customSampleOrderCount = default(uint32);
      pCustomSampleOrders {.length: customSampleOrderCount.}: ptr CoarseSampleOrderCustomNV;
    ): void {.cdecl, lazyload("vkCmdSetCoarseSampleOrderNV", DeviceLevel).}

proc loadAllVK_NV_shading_rate_image*(instance: Instance) =
  cmdBindShadingRateImageNV.load(instance)
  cmdSetViewportShadingRatePaletteNV.load(instance)
  cmdSetCoarseSampleOrderNV.load(instance)

proc loadVK_NV_shading_rate_image*(device: Device) =
  cmdBindShadingRateImageNV.load(device)
  cmdSetViewportShadingRatePaletteNV.load(device)
  cmdSetCoarseSampleOrderNV.load(device)

