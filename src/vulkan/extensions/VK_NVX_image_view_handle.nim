# Generated at 2021-09-09T01:49:36Z
# VK_NVX_image_view_handle


import ../platform
import ../features/vk10

const
  NvxImageViewHandleSpecVersion* = 2
  NvxImageViewHandleExtensionName* = "VK_NVX_image_view_handle"

type
  ImageViewHandleInfoNVX* = object
    sType*: StructureType
    pNext*: pointer
    imageView*: ImageView
    descriptorType*: DescriptorType
    sampler*: Sampler
  ImageViewAddressPropertiesNVX* = object
    sType*: StructureType
    pNext*: pointer
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
    ): Result {.cdecl, lazyload("vkGetImageViewAddressNVX", DeviceLevel).}

proc loadAllVK_NVX_image_view_handle*(instance: Instance) =
  getImageViewHandleNVX.smartLoad(instance)
  getImageViewAddressNVX.smartLoad(instance)

proc loadVK_NVX_image_view_handle*(device: Device) =
  getImageViewHandleNVX.smartLoad(device)
  getImageViewAddressNVX.smartLoad(device)

