# VK_EXT_video_decode_h265

import ../features/vk10
import VK_KHR_video_decode_queue
import ../platform
prepareVulkanLibDef()

const
  ExtVideoDecodeH265SpecVersion* = 1
  ExtVideoDecodeH265ExtensionName* = "VK_EXT_video_decode_h265"

type
  VideoDecodeH265ProfileEXT* = object
    sType* {.constant: (StructureType.videoDecodeH265ProfileExt).}: StructureType
    pNext* {.optional.}: pointer
    stdProfileIdc*: StdVideoH265ProfileIdc
  VideoDecodeH265CapabilitiesEXT* = object
    sType* {.constant: (StructureType.videoDecodeH265CapabilitiesExt).}: StructureType
    pNext* {.optional.}: pointer
    maxLevel*: uint32
    stdExtensionVersion*: ExtensionProperties
  VideoDecodeH265SessionCreateInfoEXT* = object
    sType* {.constant: (StructureType.videoDecodeH265SessionCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    flags*: VideoDecodeH265CreateFlagsEXT
    pStdExtensionVersion*: ptr ExtensionProperties
  VideoDecodeH265SessionParametersCreateInfoEXT* = object
    sType* {.constant: (StructureType.videoDecodeH265SessionParametersCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    maxSpsStdCount*: uint32
    maxPpsStdCount*: uint32
    pParametersAddInfo* {.optional.}: ptr VideoDecodeH265SessionParametersAddInfoEXT
  VideoDecodeH265SessionParametersAddInfoEXT* = object
    sType* {.constant: (StructureType.videoDecodeH265SessionParametersAddInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    spsStdCount*: uint32
    pSpsStd* {.optional, length: spsStdCount.}: arrPtr[StdVideoH265SequenceParameterSet]
    ppsStdCount*: uint32
    pPpsStd* {.optional, length: ppsStdCount.}: arrPtr[StdVideoH265PictureParameterSet]
  VideoDecodeH265PictureInfoEXT* = object
    sType* {.constant: (StructureType.videoDecodeH265PictureInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    pStdPictureInfo*: ptr StdVideoDecodeH265PictureInfo
    slicesCount*: uint32
    pSlicesDataOffsets* {.length: slicesCount.}: arrPtr[uint32]
  VideoDecodeH265DpbSlotInfoEXT* = object
    sType* {.constant: (StructureType.videoDecodeH265DpbSlotInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    pStdReferenceInfo*: ptr StdVideoDecodeH265ReferenceInfo



