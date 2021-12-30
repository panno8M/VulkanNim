# Generated at 2021-12-30T16:35:41Z
# VK_ANDROID_external_memory_android_hardware_buffer

import ../platform

import ../features/vk11
import ./VK_KHR_sampler_ycbcr_conversion
import ./VK_KHR_external_memory
import ./VK_EXT_queue_family_foreign
import ./VK_KHR_dedicated_allocation
import ./VK_KHR_format_feature_flags2
export VK_KHR_sampler_ycbcr_conversion
export VK_KHR_external_memory
export VK_EXT_queue_family_foreign
export VK_KHR_dedicated_allocation
export VK_KHR_format_feature_flags2
prepareVulkanLibDef()

const
  AndroidExternalMemoryAndroidHardwareBufferSpecVersion* = 4
  AndroidExternalMemoryAndroidHardwareBufferExtensionName* = "VK_ANDROID_external_memory_android_hardware_buffer"

type
  AndroidHardwareBufferUsageANDROID* = object
    sType* {.constant: (StructureType.androidHardwareBufferUsageAndroid).}: StructureType
    pNext* {.optional.}: pointer
    androidHardwareBufferUsage*: uint64
  AndroidHardwareBufferPropertiesANDROID* = object
    sType* {.constant: (StructureType.androidHardwareBufferPropertiesAndroid).}: StructureType
    pNext* {.optional.}: pointer
    allocationSize*: DeviceSize
    memoryTypeBits*: uint32
  AndroidHardwareBufferFormatPropertiesANDROID* = object
    sType* {.constant: (StructureType.androidHardwareBufferFormatPropertiesAndroid).}: StructureType
    pNext* {.optional.}: pointer
    format*: Format
    externalFormat*: uint64
    formatFeatures*: FormatFeatureFlags
    samplerYcbcrConversionComponents*: ComponentMapping
    suggestedYcbcrModel*: SamplerYcbcrModelConversion
    suggestedYcbcrRange*: SamplerYcbcrRange
    suggestedXChromaOffset*: ChromaLocation
    suggestedYChromaOffset*: ChromaLocation
  ImportAndroidHardwareBufferInfoANDROID* = object
    sType* {.constant: (StructureType.importAndroidHardwareBufferInfoAndroid).}: StructureType
    pNext* {.optional.}: pointer
    buffer*: ptr AHardwareBuffer
  MemoryGetAndroidHardwareBufferInfoANDROID* = object
    sType* {.constant: (StructureType.memoryGetAndroidHardwareBufferInfoAndroid).}: StructureType
    pNext* {.optional.}: pointer
    memory*: DeviceMemory
  ExternalFormatANDROID* = object
    sType* {.constant: (StructureType.externalFormatAndroid).}: StructureType
    pNext* {.optional.}: pointer
    externalFormat*: uint64

  AndroidHardwareBufferFormatProperties2ANDROID* = object
    sType* {.constant: (StructureType.androidHardwareBufferFormatProperties2Android).}: StructureType
    pNext* {.optional.}: pointer
    format*: Format
    externalFormat*: uint64
    formatFeatures*: FormatFeatureFlags2KHR
    samplerYcbcrConversionComponents*: ComponentMapping
    suggestedYcbcrModel*: SamplerYcbcrModelConversion
    suggestedYcbcrRange*: SamplerYcbcrRange
    suggestedXChromaOffset*: ChromaLocation
    suggestedYChromaOffset*: ChromaLocation

proc getAndroidHardwareBufferPropertiesANDROID*(
      device: Device;
      buffer: ptr AHardwareBuffer;
      pProperties: ptr AndroidHardwareBufferPropertiesANDROID;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorInvalidExternalHandleKhr),
      lazyload("vkGetAndroidHardwareBufferPropertiesANDROID", DeviceLevel).}
proc getMemoryAndroidHardwareBufferANDROID*(
      device: Device;
      pInfo: ptr MemoryGetAndroidHardwareBufferInfoANDROID;
      pBuffer: ptr ptr AHardwareBuffer;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorTooManyObjects, errorOutOfHostMemory),
      lazyload("vkGetMemoryAndroidHardwareBufferANDROID", DeviceLevel).}

proc loadAllVK_ANDROID_external_memory_android_hardware_buffer*(instance: Instance) =
  instance.loadCommand getAndroidHardwareBufferPropertiesANDROID
  instance.loadCommand getMemoryAndroidHardwareBufferANDROID
proc loadVK_ANDROID_external_memory_android_hardware_buffer*(device: Device) =
  device.loadCommand getAndroidHardwareBufferPropertiesANDROID
  device.loadCommand getMemoryAndroidHardwareBufferANDROID
