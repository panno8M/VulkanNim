# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_NVX_image_view_handle

import ../tools
const
  # VK_NVX_image_view_handle
  NvxImageViewHandleSpecVersion* = 2
  NvxImageViewHandleExtensionName* = "VK_NVX_image_view_handle"


# VK_NVX_image_view_handle
# ========================
proc getImageViewHandleNVX*(
      device: Device;
      pInfo: ptr ImageViewHandleInfoNVX;
    ): uint32 {.lazyload("vkGetImageViewHandleNVX", DeviceLevel).}
proc getImageViewAddressNVX*(
      device: Device;
      imageView: ImageView;
      pProperties: ptr ImageViewAddressPropertiesNVX;
    ): Result {.lazyload("vkGetImageViewAddressNVX", DeviceLevel),
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorUnknown].}


proc loadAllVK_NVX_image_view_handle*(instance: Instance) = instance.loadCommands:
  getImageViewHandleNVX
  getImageViewAddressNVX
proc loadVK_NVX_image_view_handle*(device: Device) = device.loadCommands:
  getImageViewHandleNVX
  getImageViewAddressNVX