# VK_KHR_android_surface
# VK_ANDROID_native_buffer
# VK_ANDROID_external_memory_android_hardware_buffer

import ../../features/vk10
import ../../platform
prepareVulkanLibDef()

const
  KhrAndroidSurfaceSpecVersion* = 6
  KhrAndroidSurfaceExtensionName* = "VK_KHR_android_surface"

  AndroidNativeBufferSpecVersion* = 8
  AndroidNativeBufferNumber* = 11
  AndroidNativeBufferExtensionName* = "VK_ANDROID_native_buffer"
  AndroidNativeBufferName* = AndroidNativeBufferExtensionName

  AndroidExternalMemoryAndroidHardwareBufferSpecVersion* = 4
  AndroidExternalMemoryAndroidHardwareBufferExtensionName* = "VK_ANDROID_external_memory_android_hardware_buffer"

type
  AndroidSurfaceCreateInfoKHR* = object
    sType* {.constant: (StructureType.androidSurfaceCreateInfoKhr).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: AndroidSurfaceCreateFlagsKHR
    window*: ptr ANativeWindow

  NativeBufferANDROID* = object
    sType* {.constant: (StructureType.nativeBufferAndroid).}: StructureType
    pNext* {.optional.}: pointer
    handle*: pointer
    stride*: int
    format*: int
    usage*: int
    usage2*: NativeBufferUsage2ANDROID
  SwapchainImageCreateInfoANDROID* = object
    sType* {.constant: (StructureType.swapchainImageCreateInfoAndroid).}: StructureType
    pNext* {.optional.}: pointer
    usage*: SwapchainImageUsageFlagsANDROID
  PhysicalDevicePresentationPropertiesANDROID* = object
    sType* {.constant: (StructureType.physicalDevicePresentationPropertiesAndroid).}: StructureType
    pNext* {.optional.}: pointer
    sharedImage*: Bool32
  NativeBufferUsage2ANDROID* = object
    consumer*: uint64
    producer*: uint64

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

proc createAndroidSurfaceKHR*(
      instance: Instance;
      pCreateInfo: ptr AndroidSurfaceCreateInfoKHR;
      pAllocator = default(ptr AllocationCallbacks);
      pSurface: ptr SurfaceKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorOutOfDeviceMemory, Result.errorNativeWindowInUseKhr],
      lazyload("vkCreateAndroidSurfaceKHR", InstanceLevel).}


proc getSwapchainGrallocUsageANDROID*(
      device: Device;
      format: Format;
      imageUsage: ImageUsageFlags;
      grallocUsage: ptr int;
    ): Result {.cdecl, lazyload("vkGetSwapchainGrallocUsageANDROID", DeviceLevel).}
proc acquireImageANDROID*(
      device: Device;
      image: Image;
      nativeFenceFd: int;
      semaphore: Semaphore;
      fence: Fence;
    ): Result {.cdecl, lazyload("vkAcquireImageANDROID", DeviceLevel).}
proc queueSignalReleaseImageANDROID*(
      queue: Queue;
      waitSemaphoreCount: uint32;
      pWaitSemaphores {.length: waitSemaphoreCount.}: arrPtr[Semaphore];
      image: Image;
      pNativeFenceFd: ptr int;
    ): Result {.cdecl, lazyload("vkQueueSignalReleaseImageANDROID", DeviceLevel).}
proc getSwapchainGrallocUsage2ANDROID*(
      device: Device;
      format: Format;
      imageUsage: ImageUsageFlags;
      swapchainImageUsage: SwapchainImageUsageFlagsANDROID;
      grallocConsumerUsage: ptr uint64;
      grallocProducerUsage: ptr uint64;
    ): Result {.cdecl, lazyload("vkGetSwapchainGrallocUsage2ANDROID", DeviceLevel).}


proc getAndroidHardwareBufferPropertiesANDROID*(
      device: Device;
      buffer: ptr AHardwareBuffer;
      pProperties: ptr AndroidHardwareBufferPropertiesANDROID;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorOutOfHostMemory, Result.errorInvalidExternalHandleKhr],
      lazyload("vkGetAndroidHardwareBufferPropertiesANDROID", DeviceLevel).}
proc getMemoryAndroidHardwareBufferANDROID*(
      device: Device;
      pInfo: ptr MemoryGetAndroidHardwareBufferInfoANDROID;
      pBuffer: ptr ptr AHardwareBuffer;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorTooManyObjects, Result.errorOutOfHostMemory],
      lazyload("vkGetMemoryAndroidHardwareBufferANDROID", DeviceLevel).}

proc loadAllVK_KHR_android_surface*(instance: Instance) = instance.loadCommands:
  createAndroidSurfaceKHR
proc loadAllVK_ANDROID_native_buffer*(instance: Instance) = instance.loadCommands:
  getSwapchainGrallocUsageANDROID
  acquireImageANDROID
  queueSignalReleaseImageANDROID
  getSwapchainGrallocUsage2ANDROID
proc loadAllVK_ANDROID_external_memory_android_hardware_buffer*(instance: Instance) = instance.loadCommands:
  getAndroidHardwareBufferPropertiesANDROID
  getMemoryAndroidHardwareBufferANDROID
proc loadVK_KHR_android_surface*(instance: Instance) = instance.loadCommands:
  createAndroidSurfaceKHR
proc loadVK_ANDROID_native_buffer*(device: Device) = device.loadCommands:
  getSwapchainGrallocUsageANDROID
  acquireImageANDROID
  queueSignalReleaseImageANDROID
  getSwapchainGrallocUsage2ANDROID
proc loadVK_ANDROID_external_memory_android_hardware_buffer*(device: Device) = device.loadCommands:
  getAndroidHardwareBufferPropertiesANDROID
  getMemoryAndroidHardwareBufferANDROID
