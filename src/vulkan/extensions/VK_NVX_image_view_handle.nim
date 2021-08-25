
import ../platform
import ../features/vk10


type
  ImageViewAddressPropertiesNVX* = object
    sType*: StructureType
    pNext*: pointer
    deviceAddress*: DeviceAddress
    size*: DeviceSize
  ImageViewHandleInfoNVX* = object
    sType*: StructureType
    pNext*: pointer
    imageView*: ImageView
    descriptorType*: DescriptorType
    sampler*: Sampler

const NvxImageViewHandleSpecVersion* = 2
const NvxImageViewHandleExtensionName* = "VK_NVX_image_view_handle"
var # commands
  getImageViewAddressNVXCage: proc(device: Device; imageView: ImageView; pProperties: ptr ImageViewAddressPropertiesNVX;): Result {.cdecl.}
  getImageViewHandleNVXCage: proc(device: Device; pInfo: ptr ImageViewHandleInfoNVX;): uint32 {.cdecl.}

proc getImageViewAddressNVX*(
      device: Device;
      imageView: ImageView;
      pProperties: ptr ImageViewAddressPropertiesNVX;
    ): Result {.cdecl, discardable.} =
  getImageViewAddressNVXCage(device,imageView,pProperties)

proc getImageViewHandleNVX*(
      device: Device;
      pInfo: ptr ImageViewHandleInfoNVX;
    ): uint32 {.cdecl.} =
  getImageViewHandleNVXCage(device,pInfo)


proc loadVK_NVX_image_view_handle*(instance: Instance) =
  instance.defineLoader(`<<`)

  getImageViewAddressNVXCage << "vkGetImageViewAddressNVX"
  getImageViewHandleNVXCage << "vkGetImageViewHandleNVX"