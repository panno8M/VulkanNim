# VK_EXT_video_decode_h264

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtVideoDecodeH264SpecVersion* = 3
  ExtVideoDecodeH264ExtensionName* = "VK_EXT_video_decode_h264"

type
  VideoDecodeH264ProfileEXT* = object
    sType* {.constant: (StructureType.videoDecodeH264ProfileExt).}: StructureType
    pNext* {.optional.}: pointer
    stdProfileIdc*: StdVideoH264ProfileIdc
    pictureLayout*: VideoDecodeH264PictureLayoutFlagsEXT
  VideoDecodeH264CapabilitiesEXT* = object
    sType* {.constant: (StructureType.videoDecodeH264CapabilitiesExt).}: StructureType
    pNext* {.optional.}: pointer
    maxLevel*: uint32
    fieldOffsetGranularity*: Offset2D
    stdExtensionVersion*: ExtensionProperties
  VideoDecodeH264SessionCreateInfoEXT* = object
    sType* {.constant: (StructureType.videoDecodeH264SessionCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    flags*: VideoDecodeH264CreateFlagsEXT
    pStdExtensionVersion*: ptr ExtensionProperties
  VideoDecodeH264SessionParametersCreateInfoEXT* = object
    sType* {.constant: (StructureType.videoDecodeH264SessionParametersCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    maxSpsStdCount*: uint32
    maxPpsStdCount*: uint32
    pParametersAddInfo* {.optional.}: ptr VideoDecodeH264SessionParametersAddInfoEXT
  VideoDecodeH264SessionParametersAddInfoEXT* = object
    sType* {.constant: (StructureType.videoDecodeH264SessionParametersAddInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    spsStdCount*: uint32
    pSpsStd* {.optional, length: spsStdCount.}: arrPtr[StdVideoH264SequenceParameterSet]
    ppsStdCount*: uint32
    pPpsStd* {.optional, length: ppsStdCount.}: arrPtr[StdVideoH264PictureParameterSet]
  VideoDecodeH264PictureInfoEXT* = object
    sType* {.constant: (StructureType.videoDecodeH264PictureInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    pStdPictureInfo*: ptr StdVideoDecodeH264PictureInfo
    slicesCount*: uint32
    pSlicesDataOffsets* {.length: slicesCount.}: arrPtr[uint32]
  VideoDecodeH264MvcEXT* = object
    sType* {.constant: (StructureType.videoDecodeH264MvcExt).}: StructureType
    pNext* {.optional.}: pointer
    pStdMvc*: ptr StdVideoDecodeH264Mvc
  VideoDecodeH264DpbSlotInfoEXT* = object
    sType* {.constant: (StructureType.videoDecodeH264DpbSlotInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    pStdReferenceInfo*: ptr StdVideoDecodeH264ReferenceInfo



