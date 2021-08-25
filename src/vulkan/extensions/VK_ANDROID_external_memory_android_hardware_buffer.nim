
import ../platform
import ../features/vk10
import VK_KHR_sampler_ycbcr_conversion
import VK_KHR_external_memory
import VK_EXT_queue_family_foreign
import VK_KHR_dedicated_allocation


type
  AHardwareBuffer* = distinct object
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
  MemoryGetAndroidHardwareBufferInfoANDROID* = object
    sType*: StructureType
    pNext*: pointer
    memory*: DeviceMemory
  ExternalFormatANDROID* = object
    sType*: StructureType
    pNext*: pointer
    externalFormat*: uint64
  AndroidHardwareBufferPropertiesANDROID* = object
    sType*: StructureType
    pNext*: pointer
    allocationSize*: DeviceSize
    memoryTypeBits*: uint32
  ImportAndroidHardwareBufferInfoANDROID* = object
    sType*: StructureType
    pNext*: pointer
    buffer*: ptr AHardwareBuffer
  AndroidHardwareBufferUsageANDROID* = object
    sType*: StructureType
    pNext*: pointer
    androidHardwareBufferUsage*: uint64

const AndroidExternalMemoryAndroidHardwareBufferExtensionName* = "VK_ANDROID_external_memory_android_hardware_buffer"
const AndroidExternalMemoryAndroidHardwareBufferSpecVersion* = 3
var # commands
  getAndroidHardwareBufferPropertiesANDROIDCage: proc(device: Device; buffer: ptr AHardwareBuffer; pProperties: ptr AndroidHardwareBufferPropertiesANDROID;): Result {.cdecl.}
  getMemoryAndroidHardwareBufferANDROIDCage: proc(device: Device; pInfo: ptr MemoryGetAndroidHardwareBufferInfoANDROID; pBuffer: ptr ptr AHardwareBuffer;): Result {.cdecl.}

proc getAndroidHardwareBufferPropertiesANDROID*(
      device: Device;
      buffer: ptr AHardwareBuffer;
      pProperties: ptr AndroidHardwareBufferPropertiesANDROID;
    ): Result {.cdecl, discardable.} =
  getAndroidHardwareBufferPropertiesANDROIDCage(device,buffer,pProperties)

proc getMemoryAndroidHardwareBufferANDROID*(
      device: Device;
      pInfo: ptr MemoryGetAndroidHardwareBufferInfoANDROID;
      pBuffer: ptr ptr AHardwareBuffer;
    ): Result {.cdecl, discardable.} =
  getMemoryAndroidHardwareBufferANDROIDCage(device,pInfo,pBuffer)


proc loadVK_ANDROID_external_memory_android_hardware_buffer*(instance: Instance) =
  instance.defineLoader(`<<`)

  getAndroidHardwareBufferPropertiesANDROIDCage << "vkGetAndroidHardwareBufferPropertiesANDROID"
  getMemoryAndroidHardwareBufferANDROIDCage << "vkGetMemoryAndroidHardwareBufferANDROID"