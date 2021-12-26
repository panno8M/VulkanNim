# Generated at 2021-12-26T10:16:14Z
# VK_NVX_image_view_handle

import ../platform

import ../features/vk10

prepareVulkanLibDef()

const
  NvxImageViewHandleSpecVersion* = 2
  NvxImageViewHandleExtensionName* = "VK_NVX_image_view_handle"

type
  ImageViewHandleInfoNVX* = object
    sType* {.constant: (StructureType.imageViewHandleInfoNvx).}: StructureType
    pNext* {.optional.}: pointer
    imageView*: ImageView
    descriptorType*: DescriptorType
    sampler* {.optional.}: Sampler
  ImageViewAddressPropertiesNVX* = object
    sType* {.constant: (StructureType.imageViewAddressPropertiesNvx).}: StructureType
    pNext* {.optional.}: pointer
    deviceAddress*: DeviceAddress
    size*: DeviceSize

proc getImageViewHandleNVX*(
      device: Device;
      pInfo: ptr ImageViewHandleInfoNVX;
    ): uint32 {.cdecl, lazyload("vkGetImageViewHandleNVX", DeviceLevel).}
proc getImageViewAddressNVX*(
      device: Device;
      imageView: ImageView;
      pProperties: ptr ImageViewAddressPropertiesNVX;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorUnknown),
      lazyload("vkGetImageViewAddressNVX", DeviceLevel).}

proc loadAllVK_NVX_image_view_handle*(instance: Instance) =
  instance.loadCommand getImageViewHandleNVX
  instance.loadCommand getImageViewAddressNVX

proc loadVK_NVX_image_view_handle*(device: Device) =
  device.loadCommand getImageViewHandleNVX
  device.loadCommand getImageViewAddressNVX

