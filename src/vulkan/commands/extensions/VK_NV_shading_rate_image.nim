# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_NV_shading_rate_image

import ../tools
const
  # VK_NV_shading_rate_image
  NvShadingRateImageSpecVersion* = 3
  NvShadingRateImageExtensionName* = "VK_NV_shading_rate_image"


# VK_NV_shading_rate_image
# ========================
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