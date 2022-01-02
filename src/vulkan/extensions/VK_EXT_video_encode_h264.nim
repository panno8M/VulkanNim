# VK_EXT_video_encode_h264

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtVideoEncodeH264SpecVersion* = 3
  ExtVideoEncodeH264ExtensionName* = "VK_EXT_video_encode_h264"

type
  VideoEncodeH264CapabilitiesEXT* = object
    sType* {.constant: (StructureType.videoEncodeH264CapabilitiesExt).}: StructureType
    pNext* {.optional.}: pointer
    flags*: VideoEncodeH264CapabilityFlagsEXT
    inputModeFlags*: VideoEncodeH264InputModeFlagsEXT
    outputModeFlags*: VideoEncodeH264OutputModeFlagsEXT
    minPictureSizeInMbs*: Extent2D
    maxPictureSizeInMbs*: Extent2D
    inputImageDataAlignment*: Extent2D
    maxNumL0ReferenceForP*: uint8
    maxNumL0ReferenceForB*: uint8
    maxNumL1Reference*: uint8
    qualityLevelCount*: uint8
    stdExtensionVersion*: ExtensionProperties
  VideoEncodeH264SessionCreateInfoEXT* = object
    sType* {.constant: (StructureType.videoEncodeH264SessionCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    flags*: VideoEncodeH264CreateFlagsEXT
    maxPictureSizeInMbs*: Extent2D
    pStdExtensionVersion*: ptr ExtensionProperties
  VideoEncodeH264SessionParametersCreateInfoEXT* = object
    sType* {.constant: (StructureType.videoEncodeH264SessionParametersCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    maxSpsStdCount*: uint32
    maxPpsStdCount*: uint32
    pParametersAddInfo* {.optional.}: ptr VideoEncodeH264SessionParametersAddInfoEXT
  VideoEncodeH264SessionParametersAddInfoEXT* = object
    sType* {.constant: (StructureType.videoEncodeH264SessionParametersAddInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    spsStdCount*: uint32
    pSpsStd* {.optional, length: spsStdCount.}: arrPtr[StdVideoH264SequenceParameterSet]
    ppsStdCount*: uint32
    pPpsStd* {.optional, length: ppsStdCount.}: arrPtr[StdVideoH264PictureParameterSet]
  VideoEncodeH264VclFrameInfoEXT* = object
    sType* {.constant: (StructureType.videoEncodeH264VclFrameInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    refDefaultFinalList0EntryCount*: uint8
    pRefDefaultFinalList0Entries* {.length: refDefaultFinalList0EntryCount.}: arrPtr[VideoEncodeH264DpbSlotInfoEXT]
    refDefaultFinalList1EntryCount*: uint8
    pRefDefaultFinalList1Entries* {.length: refDefaultFinalList1EntryCount.}: arrPtr[VideoEncodeH264DpbSlotInfoEXT]
    naluSliceEntryCount*: uint32
    pNaluSliceEntries* {.length: naluSliceEntryCount.}: arrPtr[VideoEncodeH264NaluSliceEXT]
    pCurrentPictureInfo*: ptr VideoEncodeH264DpbSlotInfoEXT
  VideoEncodeH264EmitPictureParametersEXT* = object
    sType* {.constant: (StructureType.videoEncodeH264EmitPictureParametersExt).}: StructureType
    pNext* {.optional.}: pointer
    spsId*: uint8
    emitSpsEnable*: Bool32
    ppsIdEntryCount*: uint32
    ppsIdEntries* {.length: ppsIdEntryCount.}: arrPtr[uint8]
  VideoEncodeH264DpbSlotInfoEXT* = object
    sType* {.constant: (StructureType.videoEncodeH264DpbSlotInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    slotIndex*: int8
    pStdPictureInfo*: ptr StdVideoEncodeH264PictureInfo
  VideoEncodeH264NaluSliceEXT* = object
    sType* {.constant: (StructureType.videoEncodeH264NaluSliceExt).}: StructureType
    pNext* {.optional.}: pointer
    pSliceHeaderStd*: ptr StdVideoEncodeH264SliceHeader
    mbCount*: uint32
    refFinalList0EntryCount*: uint8
    pRefFinalList0Entries* {.length: refFinalList0EntryCount.}: arrPtr[VideoEncodeH264DpbSlotInfoEXT]
    refFinalList1EntryCount*: uint8
    pRefFinalList1Entries* {.length: refFinalList1EntryCount.}: arrPtr[VideoEncodeH264DpbSlotInfoEXT]
  VideoEncodeH264ProfileEXT* = object
    sType* {.constant: (StructureType.videoEncodeH264ProfileExt).}: StructureType
    pNext* {.optional.}: pointer
    stdProfileIdc*: StdVideoH264ProfileIdc
  VideoEncodeH264RateControlInfoEXT* = object
    sType* {.constant: (StructureType.videoEncodeH264RateControlInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    gopFrameCount*: uint32
    idrPeriod*: uint32
    consecutiveBFrameCount*: uint32
    rateControlStructure*: VideoEncodeH264RateControlStructureFlagBitsEXT
    temporalLayerCount*: uint8
  VideoEncodeH264RateControlLayerInfoEXT* = object
    sType* {.constant: (StructureType.videoEncodeH264RateControlLayerInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    temporalLayerId*: uint8
    useInitialRcQp*: Bool32
    initialRcQp*: VideoEncodeH264QpEXT
    useMinQp*: Bool32
    minQp*: VideoEncodeH264QpEXT
    useMaxQp*: Bool32
    maxQp*: VideoEncodeH264QpEXT
    useMaxFrameSize*: Bool32
    maxFrameSize*: VideoEncodeH264FrameSizeEXT
  VideoEncodeH264QpEXT* = object
    qpI*: int32
    qpP*: int32
    qpB*: int32
  VideoEncodeH264FrameSizeEXT* = object
    frameISize*: uint32
    framePSize*: uint32
    frameBSize*: uint32



