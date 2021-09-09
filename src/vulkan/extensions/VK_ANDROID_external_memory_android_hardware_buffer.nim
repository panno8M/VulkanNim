# Generated at 2021-09-09T01:49:36Z
# VK_ANDROID_external_memory_android_hardware_buffer


import ../platform
import ../features/vk11
import ./VK_KHR_sampler_ycbcr_conversion
import ./VK_KHR_external_memory
import ./VK_EXT_queue_family_foreign
import ./VK_KHR_dedicated_allocation
export VK_KHR_sampler_ycbcr_conversion
export VK_KHR_external_memory
export VK_EXT_queue_family_foreign
export VK_KHR_dedicated_allocation

type # basetypes
  AHardwareBuffer* = distinct object

const
  AndroidExternalMemoryAndroidHardwareBufferSpecVersion* = 3
  AndroidExternalMemoryAndroidHardwareBufferExtensionName* = "VK_ANDROID_external_memory_android_hardware_buffer"

type
  AndroidHardwareBufferUsageANDROID* = object
    sType*: StructureType
    pNext*: pointer
    androidHardwareBufferUsage*: uint64
  AndroidHardwareBufferPropertiesANDROID* = object
    sType*: StructureType
    pNext*: pointer
    allocationSize*: DeviceSize
    memoryTypeBits*: uint32
  AndroidHardwareBufferFormatPropertiesANDROID* = object
    sType*: StructureType
    pNext*: pointer
    format*: Format
    externalFormat*: uint64
    formatFeatures*: FormatFeatureFlags
    samplerYcbcrConversionComponents*: ComponentMapping
    suggestedYcbcrModel*: SamplerYcbcrModelConversion
    suggestedYcbcrRange*: SamplerYcbcrRange
    suggestedXChromaOffset*: ChromaLocation
    suggestedYChromaOffset*: ChromaLocation
  ImportAndroidHardwareBufferInfoANDROID* = object
    sType*: StructureType
    pNext*: pointer
    buffer*: ptr AHardwareBuffer
  MemoryGetAndroidHardwareBufferInfoANDROID* = object
    sType*: StructureType
    pNext*: pointer
    memory*: DeviceMemory
  ExternalFormatANDROID* = object
    sType*: StructureType
    pNext*: pointer
    externalFormat*: uint64

proc getAndroidHardwareBufferPropertiesANDROID*(
      device: Device;
      buffer: ptr AHardwareBuffer;
      pProperties: ptr AndroidHardwareBufferPropertiesANDROID;
    ): Result {.cdecl, lazyload("vkGetAndroidHardwareBufferPropertiesANDROID", DeviceLevel).}
proc getMemoryAndroidHardwareBufferANDROID*(
      device: Device;
      pInfo: ptr MemoryGetAndroidHardwareBufferInfoANDROID;
      pBuffer: ptr ptr AHardwareBuffer;
    ): Result {.cdecl, lazyload("vkGetMemoryAndroidHardwareBufferANDROID", DeviceLevel).}

proc loadAllVK_ANDROID_external_memory_android_hardware_buffer*(instance: Instance) =
  getAndroidHardwareBufferPropertiesANDROID.smartLoad(instance)
  getMemoryAndroidHardwareBufferANDROID.smartLoad(instance)

proc loadVK_ANDROID_external_memory_android_hardware_buffer*(device: Device) =
  getAndroidHardwareBufferPropertiesANDROID.smartLoad(device)
  getMemoryAndroidHardwareBufferANDROID.smartLoad(device)

