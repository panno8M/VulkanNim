# Generated at 2021-12-30T16:35:41Z
# VK_FUCHSIA_buffer_collection

import ../platform

import ../features/vk10
import ./VK_FUCHSIA_external_memory
import ./VK_KHR_sampler_ycbcr_conversion
export VK_FUCHSIA_external_memory
export VK_KHR_sampler_ycbcr_conversion
prepareVulkanLibDef()

const
  FuchsiaBufferCollectionSpecVersion* = 2
  FuchsiaBufferCollectionExtensionName* = "VK_FUCHSIA_buffer_collection"

type
  BufferCollectionCreateInfoFUCHSIA* = object
    sType* {.constant: (StructureType.bufferCollectionCreateInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    collectionToken*: zx_handle_t
  ImportMemoryBufferCollectionFUCHSIA* = object
    sType* {.constant: (StructureType.importMemoryBufferCollectionFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    collection*: BufferCollectionFUCHSIA
    index*: uint32
  BufferCollectionImageCreateInfoFUCHSIA* = object
    sType* {.constant: (StructureType.bufferCollectionImageCreateInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    collection*: BufferCollectionFUCHSIA
    index*: uint32
  BufferConstraintsInfoFUCHSIA* = object
    sType* {.constant: (StructureType.bufferConstraintsInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    createInfo*: BufferCreateInfo
    requiredFormatFeatures* {.optional.}: FormatFeatureFlags
    bufferCollectionConstraints*: BufferCollectionConstraintsInfoFUCHSIA
  BufferCollectionBufferCreateInfoFUCHSIA* = object
    sType* {.constant: (StructureType.bufferCollectionBufferCreateInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    collection*: BufferCollectionFUCHSIA
    index*: uint32
  BufferCollectionPropertiesFUCHSIA* = object
    sType* {.constant: (StructureType.bufferCollectionPropertiesFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    memoryTypeBits*: uint32
    bufferCount*: uint32
    createInfoIndex*: uint32
    sysmemPixelFormat*: uint64
    formatFeatures*: FormatFeatureFlags
    sysmemColorSpaceIndex*: SysmemColorSpaceFUCHSIA
    samplerYcbcrConversionComponents*: ComponentMapping
    suggestedYcbcrModel*: SamplerYcbcrModelConversion
    suggestedYcbcrRange*: SamplerYcbcrRange
    suggestedXChromaOffset*: ChromaLocation
    suggestedYChromaOffset*: ChromaLocation
  SysmemColorSpaceFUCHSIA* = object
    sType* {.constant: (StructureType.sysmemColorSpaceFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    colorSpace*: uint32
  ImageConstraintsInfoFUCHSIA* = object
    sType* {.constant: (StructureType.imageConstraintsInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    formatConstraintsCount*: uint32
    pFormatConstraints* {.length: formatConstraintsCount.}: arrPtr[ImageFormatConstraintsInfoFUCHSIA]
    bufferCollectionConstraints*: BufferCollectionConstraintsInfoFUCHSIA
    flags* {.optional.}: ImageConstraintsInfoFlagsFUCHSIA
  ImageFormatConstraintsInfoFUCHSIA* = object
    sType* {.constant: (StructureType.imageFormatConstraintsInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    imageCreateInfo*: ImageCreateInfo
    requiredFormatFeatures*: FormatFeatureFlags
    flags* {.optional.}: ImageFormatConstraintsFlagsFUCHSIA
    sysmemPixelFormat* {.optional.}: uint64
    colorSpaceCount*: uint32
    pColorSpaces*: ptr SysmemColorSpaceFUCHSIA
  BufferCollectionConstraintsInfoFUCHSIA* = object
    sType* {.constant: (StructureType.bufferCollectionConstraintsInfoFuchsia).}: StructureType
    pNext* {.optional.}: pointer
    minBufferCount*: uint32
    maxBufferCount*: uint32
    minBufferCountForCamping*: uint32
    minBufferCountForDedicatedSlack*: uint32
    minBufferCountForSharedSlack*: uint32

proc createBufferCollectionFUCHSIA*(
      device: Device;
      pCreateInfo: ptr BufferCollectionCreateInfoFUCHSIA;
      pAllocator = default(ptr AllocationCallbacks);
      pCollection: ptr BufferCollectionFUCHSIA;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorInvalidExternalHandle, errorInitializationFailed),
      lazyload("vkCreateBufferCollectionFUCHSIA", DeviceLevel).}
proc setBufferCollectionImageConstraintsFUCHSIA*(
      device: Device;
      collection: BufferCollectionFUCHSIA;
      pImageConstraintsInfo: ptr ImageConstraintsInfoFUCHSIA;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorInitializationFailed, errorOutOfHostMemory, errorFormatNotSupported),
      lazyload("vkSetBufferCollectionImageConstraintsFUCHSIA", DeviceLevel).}
proc setBufferCollectionBufferConstraintsFUCHSIA*(
      device: Device;
      collection: BufferCollectionFUCHSIA;
      pBufferConstraintsInfo: ptr BufferConstraintsInfoFUCHSIA;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorInitializationFailed, errorOutOfHostMemory, errorFormatNotSupported),
      lazyload("vkSetBufferCollectionBufferConstraintsFUCHSIA", DeviceLevel).}
proc destroyBufferCollectionFUCHSIA*(
      device: Device;
      collection: BufferCollectionFUCHSIA;
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, lazyload("vkDestroyBufferCollectionFUCHSIA", DeviceLevel).}
proc getBufferCollectionPropertiesFUCHSIA*(
      device: Device;
      collection: BufferCollectionFUCHSIA;
      pProperties: ptr BufferCollectionPropertiesFUCHSIA;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorInitializationFailed),
      lazyload("vkGetBufferCollectionPropertiesFUCHSIA", DeviceLevel).}

proc loadAllVK_FUCHSIA_buffer_collection*(instance: Instance) =
  instance.loadCommand createBufferCollectionFUCHSIA
  instance.loadCommand setBufferCollectionImageConstraintsFUCHSIA
  instance.loadCommand setBufferCollectionBufferConstraintsFUCHSIA
  instance.loadCommand destroyBufferCollectionFUCHSIA
  instance.loadCommand getBufferCollectionPropertiesFUCHSIA
proc loadVK_FUCHSIA_buffer_collection*(device: Device) =
  device.loadCommand createBufferCollectionFUCHSIA
  device.loadCommand setBufferCollectionImageConstraintsFUCHSIA
  device.loadCommand setBufferCollectionBufferConstraintsFUCHSIA
  device.loadCommand destroyBufferCollectionFUCHSIA
  device.loadCommand getBufferCollectionPropertiesFUCHSIA
