# VK_EXT_video_encode_h265

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  ExtVideoEncodeH265SpecVersion* = 3
  ExtVideoEncodeH265ExtensionName* = "VK_EXT_video_encode_h265"

type
  VideoEncodeH265CapabilitiesEXT* = object
    sType* {.constant: (StructureType.videoEncodeH265CapabilitiesExt).}: StructureType
    pNext* {.optional.}: pointer
    flags*: VideoEncodeH265CapabilityFlagsEXT
    inputModeFlags*: VideoEncodeH265InputModeFlagsEXT
    outputModeFlags*: VideoEncodeH265OutputModeFlagsEXT
    ctbSizes*: VideoEncodeH265CtbSizeFlagsEXT
    inputImageDataAlignment*: Extent2D
    maxNumL0ReferenceForP*: uint8
    maxNumL0ReferenceForB*: uint8
    maxNumL1Reference*: uint8
    maxNumSubLayers*: uint8
    qualityLevelCount*: uint8
    stdExtensionVersion*: ExtensionProperties
  VideoEncodeH265SessionCreateInfoEXT* = object
    sType* {.constant: (StructureType.videoEncodeH265SessionCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    flags*: VideoEncodeH265CreateFlagsEXT
    pStdExtensionVersion*: ptr ExtensionProperties
  VideoEncodeH265SessionParametersCreateInfoEXT* = object
    sType* {.constant: (StructureType.videoEncodeH265SessionParametersCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    maxVpsStdCount*: uint32
    maxSpsStdCount*: uint32
    maxPpsStdCount*: uint32
    pParametersAddInfo* {.optional.}: ptr VideoEncodeH265SessionParametersAddInfoEXT
  VideoEncodeH265SessionParametersAddInfoEXT* = object
    sType* {.constant: (StructureType.videoEncodeH265SessionParametersAddInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    vpsStdCount*: uint32
    pVpsStd* {.optional, length: vpsStdCount.}: arrPtr[StdVideoH265VideoParameterSet]
    spsStdCount*: uint32
    pSpsStd* {.optional, length: spsStdCount.}: arrPtr[StdVideoH265SequenceParameterSet]
    ppsStdCount*: uint32
    pPpsStd* {.optional, length: ppsStdCount.}: arrPtr[StdVideoH265PictureParameterSet]
  VideoEncodeH265VclFrameInfoEXT* = object
    sType* {.constant: (StructureType.videoEncodeH265VclFrameInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    pReferenceFinalLists* {.optional.}: ptr VideoEncodeH265ReferenceListsEXT
    naluSliceEntryCount*: uint32
    pNaluSliceEntries* {.length: naluSliceEntryCount.}: arrPtr[VideoEncodeH265NaluSliceEXT]
    pCurrentPictureInfo*: ptr StdVideoEncodeH265PictureInfo
  VideoEncodeH265EmitPictureParametersEXT* = object
    sType* {.constant: (StructureType.videoEncodeH265EmitPictureParametersExt).}: StructureType
    pNext* {.optional.}: pointer
    vpsId*: uint8
    spsId*: uint8
    emitVpsEnable*: Bool32
    emitSpsEnable*: Bool32
    ppsIdEntryCount* {.optional.}: uint32
    ppsIdEntries* {.length: ppsIdEntryCount.}: arrPtr[uint8]
  VideoEncodeH265DpbSlotInfoEXT* = object
    sType* {.constant: (StructureType.videoEncodeH265DpbSlotInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    slotIndex*: int8
    pStdReferenceInfo*: ptr StdVideoEncodeH265ReferenceInfo
  VideoEncodeH265NaluSliceEXT* = object
    sType* {.constant: (StructureType.videoEncodeH265NaluSliceExt).}: StructureType
    pNext* {.optional.}: pointer
    ctbCount*: uint32
    pReferenceFinalLists* {.optional.}: ptr VideoEncodeH265ReferenceListsEXT
    pSliceHeaderStd*: ptr StdVideoEncodeH265SliceHeader
  VideoEncodeH265ProfileEXT* = object
    sType* {.constant: (StructureType.videoEncodeH265ProfileExt).}: StructureType
    pNext* {.optional.}: pointer
    stdProfileIdc*: StdVideoH265ProfileIdc
  VideoEncodeH265ReferenceListsEXT* = object
    sType* {.constant: (StructureType.videoEncodeH265ReferenceListsExt).}: StructureType
    pNext* {.optional.}: pointer
    referenceList0EntryCount* {.optional.}: uint8
    pReferenceList0Entries* {.length: referenceList0EntryCount.}: arrPtr[VideoEncodeH265DpbSlotInfoEXT]
    referenceList1EntryCount* {.optional.}: uint8
    pReferenceList1Entries* {.length: referenceList1EntryCount.}: arrPtr[VideoEncodeH265DpbSlotInfoEXT]
    pReferenceModifications*: ptr StdVideoEncodeH265ReferenceModifications
  VideoEncodeH265RateControlInfoEXT* = object
    sType* {.constant: (StructureType.videoEncodeH265RateControlInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    gopFrameCount*: uint32
    idrPeriod*: uint32
    consecutiveBFrameCount*: uint32
    rateControlStructure*: VideoEncodeH265RateControlStructureFlagBitsEXT
    subLayerCount*: uint8
  VideoEncodeH265RateControlLayerInfoEXT* = object
    sType* {.constant: (StructureType.videoEncodeH265RateControlLayerInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    temporalId*: uint8
    useInitialRcQp*: Bool32
    initialRcQp*: VideoEncodeH265QpEXT
    useMinQp*: Bool32
    minQp*: VideoEncodeH265QpEXT
    useMaxQp*: Bool32
    maxQp*: VideoEncodeH265QpEXT
    useMaxFrameSize*: Bool32
    maxFrameSize*: VideoEncodeH265FrameSizeEXT
  VideoEncodeH265QpEXT* = object
    qpI*: int32
    qpP*: int32
    qpB*: int32
  VideoEncodeH265FrameSizeEXT* = object
    frameISize*: uint32
    framePSize*: uint32
    frameBSize*: uint32



