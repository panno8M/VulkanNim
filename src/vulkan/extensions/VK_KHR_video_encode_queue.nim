# Generated at 2021-12-26T16:57:02Z
# VK_KHR_video_encode_queue

import ../platform

import ../features/vk10
import ./VK_KHR_video_queue
import ./VK_KHR_synchronization2
import ./VK_KHR_format_feature_flags2
export VK_KHR_video_queue
export VK_KHR_synchronization2
export VK_KHR_format_feature_flags2
prepareVulkanLibDef()

const
  KhrVideoEncodeQueueSpecVersion* = 3
  KhrVideoEncodeQueueExtensionName* = "VK_KHR_video_encode_queue"

type
  VideoEncodeInfoKHR* = object
    sType* {.constant: (StructureType.videoEncodeInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: VideoEncodeFlagsKHR
    qualityLevel*: uint32
    codedExtent*: Extent2D
    dstBitstreamBuffer*: Buffer
    dstBitstreamBufferOffset*: DeviceSize
    dstBitstreamBufferMaxRange*: DeviceSize
    srcPictureResource*: VideoPictureResourceKHR
    pSetupReferenceSlot*: ptr VideoReferenceSlotKHR
    referenceSlotCount* {.optional.}: uint32
    pReferenceSlots* {.length: referenceSlotCount.}: arrPtr[VideoReferenceSlotKHR]
    precedingExternallyEncodedBytes*: uint32
  VideoEncodeRateControlInfoKHR* = object
    sType* {.constant: (StructureType.videoEncodeRateControlInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags*: VideoEncodeRateControlFlagsKHR
    rateControlMode*: VideoEncodeRateControlModeFlagBitsKHR
    layerCount*: uint8
    pLayerConfigs* {.length: layerCount.}: arrPtr[VideoEncodeRateControlLayerInfoKHR]
  VideoEncodeRateControlLayerInfoKHR* = object
    sType* {.constant: (StructureType.videoEncodeRateControlLayerInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    averageBitrate*: uint32
    maxBitrate*: uint32
    frameRateNumerator*: uint32
    frameRateDenominator*: uint32
    virtualBufferSizeInMs*: uint32
    initialVirtualBufferSizeInMs*: uint32

proc cmdEncodeVideoKHR*(
      commandBuffer: CommandBuffer;
      pEncodeInfo: ptr VideoEncodeInfoKHR;
    ): void {.cdecl, lazyload("vkCmdEncodeVideoKHR", DeviceLevel).}

proc loadAllVK_KHR_video_encode_queue*(instance: Instance) =
  instance.loadCommand cmdEncodeVideoKHR

proc loadVK_KHR_video_encode_queue*(device: Device) =
  device.loadCommand cmdEncodeVideoKHR

