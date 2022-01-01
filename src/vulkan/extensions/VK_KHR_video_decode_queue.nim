# VK_KHR_video_decode_queue

import ../features/vk10
import VK_KHR_video_queue
import VK_KHR_synchronization2
import ../platform
import VK_KHR_format_feature_flags2
prepareVulkanLibDef()

const
  KhrVideoDecodeQueueSpecVersion* = 2
  KhrVideoDecodeQueueExtensionName* = "VK_KHR_video_decode_queue"

type
  VideoDecodeInfoKHR* = object
    sType* {.constant: (StructureType.videoDecodeInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: VideoDecodeFlagsKHR
    codedOffset*: Offset2D
    codedExtent*: Extent2D
    srcBuffer*: Buffer
    srcBufferOffset*: DeviceSize
    srcBufferRange*: DeviceSize
    dstPictureResource*: VideoPictureResourceKHR
    pSetupReferenceSlot*: ptr VideoReferenceSlotKHR
    referenceSlotCount* {.optional.}: uint32
    pReferenceSlots* {.length: referenceSlotCount.}: arrPtr[VideoReferenceSlotKHR]

proc cmdDecodeVideoKHR*(
      commandBuffer: CommandBuffer;
      pFrameInfo: ptr VideoDecodeInfoKHR;
    ): void {.cdecl, lazyload("vkCmdDecodeVideoKHR", DeviceLevel).}

proc loadAllVK_KHR_video_decode_queue*(instance: Instance) = instance.loadCommands:
  cmdDecodeVideoKHR
proc loadVK_KHR_video_decode_queue*(device: Device) = device.loadCommands:
  cmdDecodeVideoKHR
