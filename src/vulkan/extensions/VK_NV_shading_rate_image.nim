# VK_NV_shading_rate_image

import ../features/vk10
import VK_KHR_get_physical_device_properties2
import ../platform
prepareVulkanLibDef()

const
  NvShadingRateImageSpecVersion* = 3
  NvShadingRateImageExtensionName* = "VK_NV_shading_rate_image"

type
  ShadingRatePaletteNV* = object
    shadingRatePaletteEntryCount*: uint32
    pShadingRatePaletteEntries* {.length: shadingRatePaletteEntryCount.}: arrPtr[ShadingRatePaletteEntryNV]
  PipelineViewportShadingRateImageStateCreateInfoNV* = object
    sType* {.constant: (StructureType.pipelineViewportShadingRateImageStateCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    shadingRateImageEnable*: Bool32
    viewportCount* {.optional.}: uint32
    pShadingRatePalettes* {.length: viewportCount.}: arrPtr[ShadingRatePaletteNV]
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
    pSampleLocations* {.length: sampleLocationCount.}: arrPtr[CoarseSampleLocationNV]
  PipelineViewportCoarseSampleOrderStateCreateInfoNV* = object
    sType* {.constant: (StructureType.pipelineViewportCoarseSampleOrderStateCreateInfoNv).}: StructureType
    pNext* {.optional.}: pointer
    sampleOrderType*: CoarseSampleOrderTypeNV
    customSampleOrderCount* {.optional.}: uint32
    pCustomSampleOrders* {.length: customSampleOrderCount.}: arrPtr[CoarseSampleOrderCustomNV]

proc cmdBindShadingRateImageNV*(
      commandBuffer: CommandBuffer;
      imageView = default(ImageView);
      imageLayout: ImageLayout;
    ): void {.cdecl, lazyload("vkCmdBindShadingRateImageNV", DeviceLevel).}
proc cmdSetViewportShadingRatePaletteNV*(
      commandBuffer: CommandBuffer;
      firstViewport: uint32;
      viewportCount: uint32;
      pShadingRatePalettes {.length: viewportCount.}: arrPtr[ShadingRatePaletteNV];
    ): void {.cdecl, lazyload("vkCmdSetViewportShadingRatePaletteNV", DeviceLevel).}
proc cmdSetCoarseSampleOrderNV*(
      commandBuffer: CommandBuffer;
      sampleOrderType: CoarseSampleOrderTypeNV;
      customSampleOrderCount = default(uint32);
      pCustomSampleOrders {.length: customSampleOrderCount.}: arrPtr[CoarseSampleOrderCustomNV];
    ): void {.cdecl, lazyload("vkCmdSetCoarseSampleOrderNV", DeviceLevel).}

proc loadAllVK_NV_shading_rate_image*(instance: Instance) = instance.loadCommands:
  cmdBindShadingRateImageNV
  cmdSetViewportShadingRatePaletteNV
  cmdSetCoarseSampleOrderNV
proc loadVK_NV_shading_rate_image*(device: Device) = device.loadCommands:
  cmdBindShadingRateImageNV
  cmdSetViewportShadingRatePaletteNV
  cmdSetCoarseSampleOrderNV
