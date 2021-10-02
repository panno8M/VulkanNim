# Generated at 2021-10-02T09:29:45Z
# VK_NVX_image_view_handle


import ../platform
import ../features/vk10

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
  getImageViewHandleNVX.load(instance)
  getImageViewAddressNVX.load(instance)

proc loadVK_NVX_image_view_handle*(device: Device) =
  getImageViewHandleNVX.load(device)
  getImageViewAddressNVX.load(device)

