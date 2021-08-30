# Generated at 2021-08-29T23:53:04Z
# vulkan 1.0
# Vulkan core API interface definitions
# =====================================

import ../platform


type # basetypes
  # Fundamental types used by many commands and structures
  Bool32* = distinct uint32
  DeviceAddress* = distinct uint64
  DeviceSize* = distinct uint64
  Flags*[Flagbits] = distinct uint32

  # Pipeline commands
  SampleMask* = distinct uint32

const
  # API constants
  AttachmentUnused* = (uint32.high)
  False* = Bool32(0)
  LodClampNone* = 1000.0f
  QueueFamilyIgnored* = (uint32.high)
  RemainingArrayLayers* = (uint32.high)
  RemainingMipLevels* = (uint32.high)
  SubpassExternal* = (uint32.high)
  True* = Bool32(1)
  WholeSize* = (uint64.high)

  # Device initialization
  MaxMemoryTypes* = 32
  MaxMemoryHeaps* = 16 # The maximum number of unique memory heaps, each of which supporting 1 or more memory types
  MaxPhysicalDeviceNameSize* = 256
  UuidSize* = 16

  # Extension discovery commands
  MaxExtensionNameSize* = 256

  # Layer discovery commands
  MaxDescriptionSize* = 256

type
  # Fundamental types used by many commands and structures
  # ------------------------------------------------------
  Extent2D* = object
    width*: uint32
    height*: uint32
  Extent3D* = object
    width*: uint32
    height*: uint32
    depth*: uint32
  Offset2D* = object
    x*: int32
    y*: int32
  Offset3D* = object
    x*: int32
    y*: int32
    z*: int32
  Rect2D* = object
    offset*: Offset2D
    extent*: Extent2D
  # API result codes
  Result* {.size: sizeof(int32), pure.} = enum
    errorUnknown = -13 # An unknown error has occurred, due to an implementation or application bug
    errorFragmentedPool = -12 # A requested pool allocation has failed due to fragmentation of the pool's memory
    errorFormatNotSupported = -11 # Requested format is not supported on this device
    errorTooManyObjects = -10 # Too many objects of the type have already been created
    errorIncompatibleDriver = -9 # Unable to find a Vulkan driver
    errorFeatureNotPresent = -8 # Requested feature is not available on this device
    errorExtensionNotPresent = -7 # Extension specified does not exist
    errorLayerNotPresent = -6 # Layer specified does not exist
    errorMemoryMapFailed = -5 # Mapping of a memory object has failed
    errorDeviceLost = -4 # The logical device has been lost. See <<devsandqueues-lost-device>>
    errorInitializationFailed = -3 # Initialization of a object has failed
    errorOutOfDeviceMemory = -2 # A device memory allocation has failed
    errorOutOfHostMemory = -1 # A host memory allocation has failed
    success = 0 # Command completed successfully
    notReady = 1 # A fence or query has not yet completed
    timeout = 2 # A wait operation has not completed in the specified time
    eventSet = 3 # An event is signaled
    eventReset = 4 # An event is unsignaled
    incomplete = 5 # A return array was too small for the result
    # Provided by VK_KHR_surface
    errorSurfaceLostKhr = 1000000000
    # Provided by VK_KHR_surface
    errorNativeWindowInUseKhr = 1000000001
    # Provided by VK_KHR_swapchain
    suboptimalKhr = 1000001003
    # Provided by VK_KHR_swapchain
    errorOutOfDateKhr = 1000001004
    # Provided by VK_KHR_display_swapchain
    errorIncompatibleDisplayKhr = 1000003001
    # Provided by VK_EXT_debug_report
    errorValidationFailedExt = 1000011001
    # Provided by VK_NV_glsl_shader
    errorInvalidShaderNv = 1000012000
    # Provided by VK_VERSION_1_1
    errorOutOfPoolMemory = 1000069000
    # Provided by VK_VERSION_1_1
    errorInvalidExternalHandle = 1000072003
    # Provided by VK_KHR_ray_tracing
    errorIncompatibleVersionKhr = 1000150000
    # Provided by VK_EXT_image_drm_format_modifier
    errorInvalidDrmFormatModifierPlaneLayoutExt = 1000158000
    # Provided by VK_VERSION_1_2
    errorFragmentation = 1000161000
    # Provided by VK_EXT_global_priority
    errorNotPermittedExt = 1000174001
    # Provided by VK_EXT_full_screen_exclusive
    errorFullScreenExclusiveModeLostExt = 1000255000
    # Provided by VK_VERSION_1_2
    errorInvalidOpaqueCaptureAddress = 1000257000
    # Provided by VK_KHR_deferred_host_operations
    threadIdleKhr = 1000268000
    # Provided by VK_KHR_deferred_host_operations
    threadDoneKhr = 1000268001
    # Provided by VK_KHR_deferred_host_operations
    operationDeferredKhr = 1000268002
    # Provided by VK_KHR_deferred_host_operations
    operationNotDeferredKhr = 1000268003
    # Provided by VK_EXT_pipeline_creation_cache_control
    pipelineCompileRequiredExt = 1000297000
  # Structure type enumerant
  StructureType* {.size: sizeof(int32), pure.} = enum
    applicationInfo = 0
    instanceCreateInfo = 1
    deviceQueueCreateInfo = 2
    deviceCreateInfo = 3
    submitInfo = 4
    memoryAllocateInfo = 5
    mappedMemoryRange = 6
    bindSparseInfo = 7
    fenceCreateInfo = 8
    semaphoreCreateInfo = 9
    eventCreateInfo = 10
    queryPoolCreateInfo = 11
    bufferCreateInfo = 12
    bufferViewCreateInfo = 13
    imageCreateInfo = 14
    imageViewCreateInfo = 15
    shaderModuleCreateInfo = 16
    pipelineCacheCreateInfo = 17
    pipelineShaderStageCreateInfo = 18
    pipelineVertexInputStateCreateInfo = 19
    pipelineInputAssemblyStateCreateInfo = 20
    pipelineTessellationStateCreateInfo = 21
    pipelineViewportStateCreateInfo = 22
    pipelineRasterizationStateCreateInfo = 23
    pipelineMultisampleStateCreateInfo = 24
    pipelineDepthStencilStateCreateInfo = 25
    pipelineColorBlendStateCreateInfo = 26
    pipelineDynamicStateCreateInfo = 27
    graphicsPipelineCreateInfo = 28
    computePipelineCreateInfo = 29
    pipelineLayoutCreateInfo = 30
    samplerCreateInfo = 31
    descriptorSetLayoutCreateInfo = 32
    descriptorPoolCreateInfo = 33
    descriptorSetAllocateInfo = 34
    writeDescriptorSet = 35
    copyDescriptorSet = 36
    framebufferCreateInfo = 37
    renderPassCreateInfo = 38
    commandPoolCreateInfo = 39
    commandBufferAllocateInfo = 40
    commandBufferInheritanceInfo = 41
    commandBufferBeginInfo = 42
    renderPassBeginInfo = 43
    bufferMemoryBarrier = 44
    imageMemoryBarrier = 45
    memoryBarrier = 46
    loaderInstanceCreateInfo = 47 # Reserved for internal use by the loader, layers, and ICDs
    loaderDeviceCreateInfo = 48 # Reserved for internal use by the loader, layers, and ICDs
    # Provided by VK_VERSION_1_2
    physicalDeviceVulkan11Features = 49
    # Provided by VK_VERSION_1_2
    physicalDeviceVulkan11Properties = 50
    # Provided by VK_VERSION_1_2
    physicalDeviceVulkan12Features = 51
    # Provided by VK_VERSION_1_2
    physicalDeviceVulkan12Properties = 52
    # Provided by VK_KHR_swapchain
    swapchainCreateInfoKhr = 1000001000
    # Provided by VK_KHR_swapchain
    presentInfoKhr = 1000001001
    # Provided by VK_KHR_display
    displayModeCreateInfoKhr = 1000002000
    # Provided by VK_KHR_display
    displaySurfaceCreateInfoKhr = 1000002001
    # Provided by VK_KHR_display_swapchain
    displayPresentInfoKhr = 1000003000
    # Provided by VK_KHR_xlib_surface
    xlibSurfaceCreateInfoKhr = 1000004000
    # Provided by VK_KHR_xcb_surface
    xcbSurfaceCreateInfoKhr = 1000005000
    # Provided by VK_KHR_wayland_surface
    waylandSurfaceCreateInfoKhr = 1000006000
    # Provided by VK_KHR_android_surface
    androidSurfaceCreateInfoKhr = 1000008000
    # Provided by VK_KHR_win32_surface
    win32SurfaceCreateInfoKhr = 1000009000
    # Provided by VK_ANDROID_native_buffer
    nativeBufferAndroid = 1000010000
    # Provided by VK_ANDROID_native_buffer
    swapchainImageCreateInfoAndroid = 1000010001
    # Provided by VK_ANDROID_native_buffer
    physicalDevicePresentationPropertiesAndroid = 1000010002
    # Provided by VK_EXT_debug_report
    debugReportCallbackCreateInfoExt = 1000011000
    # Provided by VK_AMD_rasterization_order
    pipelineRasterizationStateRasterizationOrderAmd = 1000018000
    # Provided by VK_EXT_debug_marker
    debugMarkerObjectNameInfoExt = 1000022000
    # Provided by VK_EXT_debug_marker
    debugMarkerObjectTagInfoExt = 1000022001
    # Provided by VK_EXT_debug_marker
    debugMarkerMarkerInfoExt = 1000022002
    # Provided by VK_NV_dedicated_allocation
    dedicatedAllocationImageCreateInfoNv = 1000026000
    # Provided by VK_NV_dedicated_allocation
    dedicatedAllocationBufferCreateInfoNv = 1000026001
    # Provided by VK_NV_dedicated_allocation
    dedicatedAllocationMemoryAllocateInfoNv = 1000026002
    # Provided by VK_EXT_transform_feedback
    physicalDeviceTransformFeedbackFeaturesExt = 1000028000
    # Provided by VK_EXT_transform_feedback
    physicalDeviceTransformFeedbackPropertiesExt = 1000028001
    # Provided by VK_EXT_transform_feedback
    pipelineRasterizationStateStreamCreateInfoExt = 1000028002
    # Provided by VK_NVX_image_view_handle
    imageViewHandleInfoNvx = 1000030000
    # Provided by VK_NVX_image_view_handle
    imageViewAddressPropertiesNvx = 1000030001
    # Provided by VK_AMD_texture_gather_bias_lod
    textureLodGatherFormatPropertiesAmd = 1000041000
    # Provided by VK_GGP_stream_descriptor_surface
    streamDescriptorSurfaceCreateInfoGgp = 1000049000
    # Provided by VK_NV_corner_sampled_image
    physicalDeviceCornerSampledImageFeaturesNv = 1000050000
    # Provided by VK_VERSION_1_1
    renderPassMultiviewCreateInfo = 1000053000
    # Provided by VK_VERSION_1_1
    physicalDeviceMultiviewFeatures = 1000053001
    # Provided by VK_VERSION_1_1
    physicalDeviceMultiviewProperties = 1000053002
    # Provided by VK_NV_external_memory
    externalMemoryImageCreateInfoNv = 1000056000
    # Provided by VK_NV_external_memory
    exportMemoryAllocateInfoNv = 1000056001
    # Provided by VK_NV_external_memory_win32
    importMemoryWin32HandleInfoNv = 1000057000
    # Provided by VK_NV_external_memory_win32
    exportMemoryWin32HandleInfoNv = 1000057001
    # Provided by VK_NV_win32_keyed_mutex
    win32KeyedMutexAcquireReleaseInfoNv = 1000058000
    # Provided by VK_VERSION_1_1
    physicalDeviceFeatures2 = 1000059000
    # Provided by VK_VERSION_1_1
    physicalDeviceProperties2 = 1000059001
    # Provided by VK_VERSION_1_1
    formatProperties2 = 1000059002
    # Provided by VK_VERSION_1_1
    imageFormatProperties2 = 1000059003
    # Provided by VK_VERSION_1_1
    physicalDeviceImageFormatInfo2 = 1000059004
    # Provided by VK_VERSION_1_1
    queueFamilyProperties2 = 1000059005
    # Provided by VK_VERSION_1_1
    physicalDeviceMemoryProperties2 = 1000059006
    # Provided by VK_VERSION_1_1
    sparseImageFormatProperties2 = 1000059007
    # Provided by VK_VERSION_1_1
    physicalDeviceSparseImageFormatInfo2 = 1000059008
    # Provided by VK_VERSION_1_1
    memoryAllocateFlagsInfo = 1000060000
    # Provided by VK_VERSION_1_1
    deviceGroupRenderPassBeginInfo = 1000060003
    # Provided by VK_VERSION_1_1
    deviceGroupCommandBufferBeginInfo = 1000060004
    # Provided by VK_VERSION_1_1
    deviceGroupSubmitInfo = 1000060005
    # Provided by VK_VERSION_1_1
    deviceGroupBindSparseInfo = 1000060006
    # Provided by VK_KHR_swapchain
    deviceGroupPresentCapabilitiesKhr = 1000060007
    # Provided by VK_KHR_swapchain
    imageSwapchainCreateInfoKhr = 1000060008
    # Provided by VK_KHR_swapchain
    bindImageMemorySwapchainInfoKhr = 1000060009
    # Provided by VK_KHR_swapchain
    acquireNextImageInfoKhr = 1000060010
    # Provided by VK_KHR_swapchain
    deviceGroupPresentInfoKhr = 1000060011
    # Provided by VK_KHR_swapchain
    deviceGroupSwapchainCreateInfoKhr = 1000060012
    # Provided by VK_VERSION_1_1
    bindBufferMemoryDeviceGroupInfo = 1000060013
    # Provided by VK_VERSION_1_1
    bindImageMemoryDeviceGroupInfo = 1000060014
    # Provided by VK_EXT_validation_flags
    validationFlagsExt = 1000061000
    # Provided by VK_NN_vi_surface
    viSurfaceCreateInfoNn = 1000062000
    # Provided by VK_VERSION_1_1
    physicalDeviceShaderDrawParametersFeatures = 1000063000
    # Provided by VK_EXT_texture_compression_astc_hdr
    physicalDeviceTextureCompressionAstcHdrFeaturesExt = 1000066000
    # Provided by VK_EXT_astc_decode_mode
    imageViewAstcDecodeModeExt = 1000067000
    # Provided by VK_EXT_astc_decode_mode
    physicalDeviceAstcDecodeFeaturesExt = 1000067001
    # Provided by VK_VERSION_1_1
    physicalDeviceGroupProperties = 1000070000
    # Provided by VK_VERSION_1_1
    deviceGroupDeviceCreateInfo = 1000070001
    # Provided by VK_VERSION_1_1
    physicalDeviceExternalImageFormatInfo = 1000071000
    # Provided by VK_VERSION_1_1
    externalImageFormatProperties = 1000071001
    # Provided by VK_VERSION_1_1
    physicalDeviceExternalBufferInfo = 1000071002
    # Provided by VK_VERSION_1_1
    externalBufferProperties = 1000071003
    # Provided by VK_VERSION_1_1
    physicalDeviceIdProperties = 1000071004
    # Provided by VK_VERSION_1_1
    externalMemoryBufferCreateInfo = 1000072000
    # Provided by VK_VERSION_1_1
    externalMemoryImageCreateInfo = 1000072001
    # Provided by VK_VERSION_1_1
    exportMemoryAllocateInfo = 1000072002
    # Provided by VK_KHR_external_memory_win32
    importMemoryWin32HandleInfoKhr = 1000073000
    # Provided by VK_KHR_external_memory_win32
    exportMemoryWin32HandleInfoKhr = 1000073001
    # Provided by VK_KHR_external_memory_win32
    memoryWin32HandlePropertiesKhr = 1000073002
    # Provided by VK_KHR_external_memory_win32
    memoryGetWin32HandleInfoKhr = 1000073003
    # Provided by VK_KHR_external_memory_fd
    importMemoryFdInfoKhr = 1000074000
    # Provided by VK_KHR_external_memory_fd
    memoryFdPropertiesKhr = 1000074001
    # Provided by VK_KHR_external_memory_fd
    memoryGetFdInfoKhr = 1000074002
    # Provided by VK_KHR_win32_keyed_mutex
    win32KeyedMutexAcquireReleaseInfoKhr = 1000075000
    # Provided by VK_VERSION_1_1
    physicalDeviceExternalSemaphoreInfo = 1000076000
    # Provided by VK_VERSION_1_1
    externalSemaphoreProperties = 1000076001
    # Provided by VK_VERSION_1_1
    exportSemaphoreCreateInfo = 1000077000
    # Provided by VK_KHR_external_semaphore_win32
    importSemaphoreWin32HandleInfoKhr = 1000078000
    # Provided by VK_KHR_external_semaphore_win32
    exportSemaphoreWin32HandleInfoKhr = 1000078001
    # Provided by VK_KHR_external_semaphore_win32
    d3d12FenceSubmitInfoKhr = 1000078002
    # Provided by VK_KHR_external_semaphore_win32
    semaphoreGetWin32HandleInfoKhr = 1000078003
    # Provided by VK_KHR_external_semaphore_fd
    importSemaphoreFdInfoKhr = 1000079000
    # Provided by VK_KHR_external_semaphore_fd
    semaphoreGetFdInfoKhr = 1000079001
    # Provided by VK_KHR_push_descriptor
    physicalDevicePushDescriptorPropertiesKhr = 1000080000
    # Provided by VK_EXT_conditional_rendering
    commandBufferInheritanceConditionalRenderingInfoExt = 1000081000
    # Provided by VK_EXT_conditional_rendering
    physicalDeviceConditionalRenderingFeaturesExt = 1000081001
    # Provided by VK_EXT_conditional_rendering
    conditionalRenderingBeginInfoExt = 1000081002
    # Provided by VK_VERSION_1_2
    physicalDeviceShaderFloat16Int8Features = 1000082000
    # Provided by VK_VERSION_1_1
    physicalDevice16bitStorageFeatures = 1000083000
    # Provided by VK_KHR_incremental_present
    presentRegionsKhr = 1000084000
    # Provided by VK_VERSION_1_1
    descriptorUpdateTemplateCreateInfo = 1000085000
    # Provided by VK_NV_clip_space_w_scaling
    pipelineViewportWScalingStateCreateInfoNv = 1000087000
    # Provided by VK_EXT_display_surface_counter
    surfaceCapabilities2Ext = 1000090000
    # Provided by VK_EXT_display_control
    displayPowerInfoExt = 1000091000
    # Provided by VK_EXT_display_control
    deviceEventInfoExt = 1000091001
    # Provided by VK_EXT_display_control
    displayEventInfoExt = 1000091002
    # Provided by VK_EXT_display_control
    swapchainCounterCreateInfoExt = 1000091003
    # Provided by VK_GOOGLE_display_timing
    presentTimesInfoGoogle = 1000092000
    # Provided by VK_VERSION_1_1
    physicalDeviceSubgroupProperties = 1000094000
    # Provided by VK_NVX_multiview_per_view_attributes
    physicalDeviceMultiviewPerViewAttributesPropertiesNvx = 1000097000
    # Provided by VK_NV_viewport_swizzle
    pipelineViewportSwizzleStateCreateInfoNv = 1000098000
    # Provided by VK_EXT_discard_rectangles
    physicalDeviceDiscardRectanglePropertiesExt = 1000099000
    # Provided by VK_EXT_discard_rectangles
    pipelineDiscardRectangleStateCreateInfoExt = 1000099001
    # Provided by VK_EXT_conservative_rasterization
    physicalDeviceConservativeRasterizationPropertiesExt = 1000101000
    # Provided by VK_EXT_conservative_rasterization
    pipelineRasterizationConservativeStateCreateInfoExt = 1000101001
    # Provided by VK_EXT_depth_clip_enable
    physicalDeviceDepthClipEnableFeaturesExt = 1000102000
    # Provided by VK_EXT_depth_clip_enable
    pipelineRasterizationDepthClipStateCreateInfoExt = 1000102001
    # Provided by VK_EXT_hdr_metadata
    hdrMetadataExt = 1000105000
    # Provided by VK_VERSION_1_2
    physicalDeviceImagelessFramebufferFeatures = 1000108000
    # Provided by VK_VERSION_1_2
    framebufferAttachmentsCreateInfo = 1000108001
    # Provided by VK_VERSION_1_2
    framebufferAttachmentImageInfo = 1000108002
    # Provided by VK_VERSION_1_2
    renderPassAttachmentBeginInfo = 1000108003
    # Provided by VK_VERSION_1_2
    attachmentDescription2 = 1000109000
    # Provided by VK_VERSION_1_2
    attachmentReference2 = 1000109001
    # Provided by VK_VERSION_1_2
    subpassDescription2 = 1000109002
    # Provided by VK_VERSION_1_2
    subpassDependency2 = 1000109003
    # Provided by VK_VERSION_1_2
    renderPassCreateInfo2 = 1000109004
    # Provided by VK_VERSION_1_2
    subpassBeginInfo = 1000109005
    # Provided by VK_VERSION_1_2
    subpassEndInfo = 1000109006
    # Provided by VK_KHR_shared_presentable_image
    sharedPresentSurfaceCapabilitiesKhr = 1000111000
    # Provided by VK_VERSION_1_1
    physicalDeviceExternalFenceInfo = 1000112000
    # Provided by VK_VERSION_1_1
    externalFenceProperties = 1000112001
    # Provided by VK_VERSION_1_1
    exportFenceCreateInfo = 1000113000
    # Provided by VK_KHR_external_fence_win32
    importFenceWin32HandleInfoKhr = 1000114000
    # Provided by VK_KHR_external_fence_win32
    exportFenceWin32HandleInfoKhr = 1000114001
    # Provided by VK_KHR_external_fence_win32
    fenceGetWin32HandleInfoKhr = 1000114002
    # Provided by VK_KHR_external_fence_fd
    importFenceFdInfoKhr = 1000115000
    # Provided by VK_KHR_external_fence_fd
    fenceGetFdInfoKhr = 1000115001
    # Provided by VK_KHR_performance_query
    physicalDevicePerformanceQueryFeaturesKhr = 1000116000
    # Provided by VK_KHR_performance_query
    physicalDevicePerformanceQueryPropertiesKhr = 1000116001
    # Provided by VK_KHR_performance_query
    queryPoolPerformanceCreateInfoKhr = 1000116002
    # Provided by VK_KHR_performance_query
    performanceQuerySubmitInfoKhr = 1000116003
    # Provided by VK_KHR_performance_query
    acquireProfilingLockInfoKhr = 1000116004
    # Provided by VK_KHR_performance_query
    performanceCounterKhr = 1000116005
    # Provided by VK_KHR_performance_query
    performanceCounterDescriptionKhr = 1000116006
    # Provided by VK_VERSION_1_1
    physicalDevicePointClippingProperties = 1000117000
    # Provided by VK_VERSION_1_1
    renderPassInputAttachmentAspectCreateInfo = 1000117001
    # Provided by VK_VERSION_1_1
    imageViewUsageCreateInfo = 1000117002
    # Provided by VK_VERSION_1_1
    pipelineTessellationDomainOriginStateCreateInfo = 1000117003
    # Provided by VK_KHR_get_surface_capabilities2
    physicalDeviceSurfaceInfo2Khr = 1000119000
    # Provided by VK_KHR_get_surface_capabilities2
    surfaceCapabilities2Khr = 1000119001
    # Provided by VK_KHR_get_surface_capabilities2
    surfaceFormat2Khr = 1000119002
    # Provided by VK_VERSION_1_1
    physicalDeviceVariablePointersFeatures = 1000120000
    # Provided by VK_KHR_get_display_properties2
    displayProperties2Khr = 1000121000
    # Provided by VK_KHR_get_display_properties2
    displayPlaneProperties2Khr = 1000121001
    # Provided by VK_KHR_get_display_properties2
    displayModeProperties2Khr = 1000121002
    # Provided by VK_KHR_get_display_properties2
    displayPlaneInfo2Khr = 1000121003
    # Provided by VK_KHR_get_display_properties2
    displayPlaneCapabilities2Khr = 1000121004
    # Provided by VK_MVK_ios_surface
    iosSurfaceCreateInfoM = 1000122000
    # Provided by VK_MVK_macos_surface
    macosSurfaceCreateInfoM = 1000123000
    # Provided by VK_VERSION_1_1
    memoryDedicatedRequirements = 1000127000
    # Provided by VK_VERSION_1_1
    memoryDedicatedAllocateInfo = 1000127001
    # Provided by VK_EXT_debug_utils
    debugUtilsObjectNameInfoExt = 1000128000
    # Provided by VK_EXT_debug_utils
    debugUtilsObjectTagInfoExt = 1000128001
    # Provided by VK_EXT_debug_utils
    debugUtilsLabelExt = 1000128002
    # Provided by VK_EXT_debug_utils
    debugUtilsMessengerCallbackDataExt = 1000128003
    # Provided by VK_EXT_debug_utils
    debugUtilsMessengerCreateInfoExt = 1000128004
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    androidHardwareBufferUsageAndroid = 1000129000
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    androidHardwareBufferPropertiesAndroid = 1000129001
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    androidHardwareBufferFormatPropertiesAndroid = 1000129002
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    importAndroidHardwareBufferInfoAndroid = 1000129003
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    memoryGetAndroidHardwareBufferInfoAndroid = 1000129004
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    externalFormatAndroid = 1000129005
    # Provided by VK_VERSION_1_2
    physicalDeviceSamplerFilterMinmaxProperties = 1000130000
    # Provided by VK_VERSION_1_2
    samplerReductionModeCreateInfo = 1000130001
    # Provided by VK_EXT_inline_uniform_block
    physicalDeviceInlineUniformBlockFeaturesExt = 1000138000
    # Provided by VK_EXT_inline_uniform_block
    physicalDeviceInlineUniformBlockPropertiesExt = 1000138001
    # Provided by VK_EXT_inline_uniform_block
    writeDescriptorSetInlineUniformBlockExt = 1000138002
    # Provided by VK_EXT_inline_uniform_block
    descriptorPoolInlineUniformBlockCreateInfoExt = 1000138003
    # Provided by VK_EXT_sample_locations
    sampleLocationsInfoExt = 1000143000
    # Provided by VK_EXT_sample_locations
    renderPassSampleLocationsBeginInfoExt = 1000143001
    # Provided by VK_EXT_sample_locations
    pipelineSampleLocationsStateCreateInfoExt = 1000143002
    # Provided by VK_EXT_sample_locations
    physicalDeviceSampleLocationsPropertiesExt = 1000143003
    # Provided by VK_EXT_sample_locations
    multisamplePropertiesExt = 1000143004
    # Provided by VK_VERSION_1_1
    protectedSubmitInfo = 1000145000
    # Provided by VK_VERSION_1_1
    physicalDeviceProtectedMemoryFeatures = 1000145001
    # Provided by VK_VERSION_1_1
    physicalDeviceProtectedMemoryProperties = 1000145002
    # Provided by VK_VERSION_1_1
    deviceQueueInfo2 = 1000145003
    # Provided by VK_VERSION_1_1
    bufferMemoryRequirementsInfo2 = 1000146000
    # Provided by VK_VERSION_1_1
    imageMemoryRequirementsInfo2 = 1000146001
    # Provided by VK_VERSION_1_1
    imageSparseMemoryRequirementsInfo2 = 1000146002
    # Provided by VK_VERSION_1_1
    memoryRequirements2 = 1000146003
    # Provided by VK_VERSION_1_1
    sparseImageMemoryRequirements2 = 1000146004
    # Provided by VK_VERSION_1_2
    imageFormatListCreateInfo = 1000147000
    # Provided by VK_EXT_blend_operation_advanced
    physicalDeviceBlendOperationAdvancedFeaturesExt = 1000148000
    # Provided by VK_EXT_blend_operation_advanced
    physicalDeviceBlendOperationAdvancedPropertiesExt = 1000148001
    # Provided by VK_EXT_blend_operation_advanced
    pipelineColorBlendAdvancedStateCreateInfoExt = 1000148002
    # Provided by VK_NV_fragment_coverage_to_color
    pipelineCoverageToColorStateCreateInfoNv = 1000149000
    # Provided by VK_KHR_ray_tracing
    accelerationStructureBuildGeometryInfoKhr = 1000150000
    # Provided by VK_KHR_ray_tracing
    accelerationStructureCreateGeometryTypeInfoKhr = 1000150001
    # Provided by VK_KHR_ray_tracing
    accelerationStructureDeviceAddressInfoKhr = 1000150002
    # Provided by VK_KHR_ray_tracing
    accelerationStructureGeometryAabbsDataKhr = 1000150003
    # Provided by VK_KHR_ray_tracing
    accelerationStructureGeometryInstancesDataKhr = 1000150004
    # Provided by VK_KHR_ray_tracing
    accelerationStructureGeometryTrianglesDataKhr = 1000150005
    # Provided by VK_KHR_ray_tracing
    accelerationStructureGeometryKhr = 1000150006
    # Provided by VK_KHR_ray_tracing
    accelerationStructureMemoryRequirementsInfoKhr = 1000150008
    # Provided by VK_KHR_ray_tracing
    accelerationStructureVersionKhr = 1000150009
    # Provided by VK_KHR_ray_tracing
    copyAccelerationStructureInfoKhr = 1000150010
    # Provided by VK_KHR_ray_tracing
    copyAccelerationStructureToMemoryInfoKhr = 1000150011
    # Provided by VK_KHR_ray_tracing
    copyMemoryToAccelerationStructureInfoKhr = 1000150012
    # Provided by VK_KHR_ray_tracing
    physicalDeviceRayTracingFeaturesKhr = 1000150013
    # Provided by VK_KHR_ray_tracing
    physicalDeviceRayTracingPropertiesKhr = 1000150014
    # Provided by VK_KHR_ray_tracing
    rayTracingPipelineCreateInfoKhr = 1000150015
    # Provided by VK_KHR_ray_tracing
    rayTracingShaderGroupCreateInfoKhr = 1000150016
    # Provided by VK_KHR_ray_tracing
    accelerationStructureCreateInfoKhr = 1000150017
    # Provided by VK_KHR_ray_tracing
    rayTracingPipelineInterfaceCreateInfoKhr = 1000150018
    # Provided by VK_NV_framebuffer_mixed_samples
    pipelineCoverageModulationStateCreateInfoNv = 1000152000
    # Provided by VK_NV_shader_sm_builtins
    physicalDeviceShaderSmBuiltinsFeaturesNv = 1000154000
    # Provided by VK_NV_shader_sm_builtins
    physicalDeviceShaderSmBuiltinsPropertiesNv = 1000154001
    # Provided by VK_VERSION_1_1
    samplerYcbcrConversionCreateInfo = 1000156000
    # Provided by VK_VERSION_1_1
    samplerYcbcrConversionInfo = 1000156001
    # Provided by VK_VERSION_1_1
    bindImagePlaneMemoryInfo = 1000156002
    # Provided by VK_VERSION_1_1
    imagePlaneMemoryRequirementsInfo = 1000156003
    # Provided by VK_VERSION_1_1
    physicalDeviceSamplerYcbcrConversionFeatures = 1000156004
    # Provided by VK_VERSION_1_1
    samplerYcbcrConversionImageFormatProperties = 1000156005
    # Provided by VK_VERSION_1_1
    bindBufferMemoryInfo = 1000157000
    # Provided by VK_VERSION_1_1
    bindImageMemoryInfo = 1000157001
    # Provided by VK_EXT_image_drm_format_modifier
    drmFormatModifierPropertiesListExt = 1000158000
    # Provided by VK_EXT_image_drm_format_modifier
    drmFormatModifierPropertiesExt = 1000158001
    # Provided by VK_EXT_image_drm_format_modifier
    physicalDeviceImageDrmFormatModifierInfoExt = 1000158002
    # Provided by VK_EXT_image_drm_format_modifier
    imageDrmFormatModifierListCreateInfoExt = 1000158003
    # Provided by VK_EXT_image_drm_format_modifier
    imageDrmFormatModifierExplicitCreateInfoExt = 1000158004
    # Provided by VK_EXT_image_drm_format_modifier
    imageDrmFormatModifierPropertiesExt = 1000158005
    # Provided by VK_EXT_validation_cache
    validationCacheCreateInfoExt = 1000160000
    # Provided by VK_EXT_validation_cache
    shaderModuleValidationCacheCreateInfoExt = 1000160001
    # Provided by VK_VERSION_1_2
    descriptorSetLayoutBindingFlagsCreateInfo = 1000161000
    # Provided by VK_VERSION_1_2
    physicalDeviceDescriptorIndexingFeatures = 1000161001
    # Provided by VK_VERSION_1_2
    physicalDeviceDescriptorIndexingProperties = 1000161002
    # Provided by VK_VERSION_1_2
    descriptorSetVariableDescriptorCountAllocateInfo = 1000161003
    # Provided by VK_VERSION_1_2
    descriptorSetVariableDescriptorCountLayoutSupport = 1000161004
    # Provided by VK_NV_shading_rate_image
    pipelineViewportShadingRateImageStateCreateInfoNv = 1000164000
    # Provided by VK_NV_shading_rate_image
    physicalDeviceShadingRateImageFeaturesNv = 1000164001
    # Provided by VK_NV_shading_rate_image
    physicalDeviceShadingRateImagePropertiesNv = 1000164002
    # Provided by VK_NV_shading_rate_image
    pipelineViewportCoarseSampleOrderStateCreateInfoNv = 1000164005
    # Provided by VK_NV_ray_tracing
    rayTracingPipelineCreateInfoNv = 1000165000
    # Provided by VK_NV_ray_tracing
    accelerationStructureCreateInfoNv = 1000165001
    # Provided by VK_NV_ray_tracing
    geometryNv = 1000165003
    # Provided by VK_NV_ray_tracing
    geometryTrianglesNv = 1000165004
    # Provided by VK_NV_ray_tracing
    geometryAabbNv = 1000165005
    # Provided by VK_KHR_ray_tracing
    bindAccelerationStructureMemoryInfoKhr = 1000165006
    # Provided by VK_KHR_ray_tracing
    writeDescriptorSetAccelerationStructureKhr = 1000165007
    # Provided by VK_NV_ray_tracing
    accelerationStructureMemoryRequirementsInfoNv = 1000165008
    # Provided by VK_NV_ray_tracing
    physicalDeviceRayTracingPropertiesNv = 1000165009
    # Provided by VK_NV_ray_tracing
    rayTracingShaderGroupCreateInfoNv = 1000165011
    # Provided by VK_NV_ray_tracing
    accelerationStructureInfoNv = 1000165012
    # Provided by VK_NV_representative_fragment_test
    physicalDeviceRepresentativeFragmentTestFeaturesNv = 1000166000
    # Provided by VK_NV_representative_fragment_test
    pipelineRepresentativeFragmentTestStateCreateInfoNv = 1000166001
    # Provided by VK_VERSION_1_1
    physicalDeviceMaintenance3Properties = 1000168000
    # Provided by VK_VERSION_1_1
    descriptorSetLayoutSupport = 1000168001
    # Provided by VK_EXT_filter_cubic
    physicalDeviceImageViewImageFormatInfoExt = 1000170000
    # Provided by VK_EXT_filter_cubic
    filterCubicImageViewImageFormatPropertiesExt = 1000170001
    # Provided by VK_EXT_global_priority
    deviceQueueGlobalPriorityCreateInfoExt = 1000174000
    # Provided by VK_VERSION_1_2
    physicalDeviceShaderSubgroupExtendedTypesFeatures = 1000175000
    # Provided by VK_VERSION_1_2
    physicalDevice8bitStorageFeatures = 1000177000
    # Provided by VK_EXT_external_memory_host
    importMemoryHostPointerInfoExt = 1000178000
    # Provided by VK_EXT_external_memory_host
    memoryHostPointerPropertiesExt = 1000178001
    # Provided by VK_EXT_external_memory_host
    physicalDeviceExternalMemoryHostPropertiesExt = 1000178002
    # Provided by VK_VERSION_1_2
    physicalDeviceShaderAtomicInt64Features = 1000180000
    # Provided by VK_KHR_shader_clock
    physicalDeviceShaderClockFeaturesKhr = 1000181000
    # Provided by VK_AMD_pipeline_compiler_control
    pipelineCompilerControlCreateInfoAmd = 1000183000
    # Provided by VK_EXT_calibrated_timestamps
    calibratedTimestampInfoExt = 1000184000
    # Provided by VK_AMD_shader_core_properties
    physicalDeviceShaderCorePropertiesAmd = 1000185000
    # Provided by VK_AMD_memory_overallocation_behavior
    deviceMemoryOverallocationCreateInfoAmd = 1000189000
    # Provided by VK_EXT_vertex_attribute_divisor
    physicalDeviceVertexAttributeDivisorPropertiesExt = 1000190000
    # Provided by VK_EXT_vertex_attribute_divisor
    pipelineVertexInputDivisorStateCreateInfoExt = 1000190001
    # Provided by VK_EXT_vertex_attribute_divisor
    physicalDeviceVertexAttributeDivisorFeaturesExt = 1000190002
    # Provided by VK_GGP_frame_token
    presentFrameTokenGgp = 1000191000
    # Provided by VK_EXT_pipeline_creation_feedback
    pipelineCreationFeedbackCreateInfoExt = 1000192000
    # Provided by VK_VERSION_1_2
    physicalDeviceDriverProperties = 1000196000
    # Provided by VK_VERSION_1_2
    physicalDeviceFloatControlsProperties = 1000197000
    # Provided by VK_VERSION_1_2
    physicalDeviceDepthStencilResolveProperties = 1000199000
    # Provided by VK_VERSION_1_2
    subpassDescriptionDepthStencilResolve = 1000199001
    # Provided by VK_NV_compute_shader_derivatives
    physicalDeviceComputeShaderDerivativesFeaturesNv = 1000201000
    # Provided by VK_NV_mesh_shader
    physicalDeviceMeshShaderFeaturesNv = 1000202000
    # Provided by VK_NV_mesh_shader
    physicalDeviceMeshShaderPropertiesNv = 1000202001
    # Provided by VK_NV_fragment_shader_barycentric
    physicalDeviceFragmentShaderBarycentricFeaturesNv = 1000203000
    # Provided by VK_NV_shader_image_footprint
    physicalDeviceShaderImageFootprintFeaturesNv = 1000204000
    # Provided by VK_NV_scissor_exclusive
    pipelineViewportExclusiveScissorStateCreateInfoNv = 1000205000
    # Provided by VK_NV_scissor_exclusive
    physicalDeviceExclusiveScissorFeaturesNv = 1000205002
    # Provided by VK_NV_device_diagnostic_checkpoints
    checkpointDataNv = 1000206000
    # Provided by VK_NV_device_diagnostic_checkpoints
    queueFamilyCheckpointPropertiesNv = 1000206001
    # Provided by VK_VERSION_1_2
    physicalDeviceTimelineSemaphoreFeatures = 1000207000
    # Provided by VK_VERSION_1_2
    physicalDeviceTimelineSemaphoreProperties = 1000207001
    # Provided by VK_VERSION_1_2
    semaphoreTypeCreateInfo = 1000207002
    # Provided by VK_VERSION_1_2
    timelineSemaphoreSubmitInfo = 1000207003
    # Provided by VK_VERSION_1_2
    semaphoreWaitInfo = 1000207004
    # Provided by VK_VERSION_1_2
    semaphoreSignalInfo = 1000207005
    # Provided by VK_INTEL_shader_integer_functions2
    physicalDeviceShaderIntegerFunctions2FeaturesIntel = 1000209000
    # Provided by VK_INTEL_performance_query
    queryPoolPerformanceQueryCreateInfoIntel = 1000210000
    # Provided by VK_INTEL_performance_query
    initializePerformanceApiInfoIntel = 1000210001
    # Provided by VK_INTEL_performance_query
    performanceMarkerInfoIntel = 1000210002
    # Provided by VK_INTEL_performance_query
    performanceStreamMarkerInfoIntel = 1000210003
    # Provided by VK_INTEL_performance_query
    performanceOverrideInfoIntel = 1000210004
    # Provided by VK_INTEL_performance_query
    performanceConfigurationAcquireInfoIntel = 1000210005
    # Provided by VK_VERSION_1_2
    physicalDeviceVulkanMemoryModelFeatures = 1000211000
    # Provided by VK_EXT_pci_bus_info
    physicalDevicePciBusInfoPropertiesExt = 1000212000
    # Provided by VK_AMD_display_native_hdr
    displayNativeHdrSurfaceCapabilitiesAmd = 1000213000
    # Provided by VK_AMD_display_native_hdr
    swapchainDisplayNativeHdrCreateInfoAmd = 1000213001
    # Provided by VK_FUCHSIA_imagepipe_surface
    imagepipeSurfaceCreateInfoFuchsia = 1000214000
    # Provided by VK_EXT_metal_surface
    metalSurfaceCreateInfoExt = 1000217000
    # Provided by VK_EXT_fragment_density_map
    physicalDeviceFragmentDensityMapFeaturesExt = 1000218000
    # Provided by VK_EXT_fragment_density_map
    physicalDeviceFragmentDensityMapPropertiesExt = 1000218001
    # Provided by VK_EXT_fragment_density_map
    renderPassFragmentDensityMapCreateInfoExt = 1000218002
    # Provided by VK_VERSION_1_2
    physicalDeviceScalarBlockLayoutFeatures = 1000221000
    # Provided by VK_EXT_subgroup_size_control
    physicalDeviceSubgroupSizeControlPropertiesExt = 1000225000
    # Provided by VK_EXT_subgroup_size_control
    pipelineShaderStageRequiredSubgroupSizeCreateInfoExt = 1000225001
    # Provided by VK_EXT_subgroup_size_control
    physicalDeviceSubgroupSizeControlFeaturesExt = 1000225002
    # Provided by VK_AMD_shader_core_properties2
    physicalDeviceShaderCoreProperties2Amd = 1000227000
    # Provided by VK_AMD_device_coherent_memory
    physicalDeviceCoherentMemoryFeaturesAmd = 1000229000
    # Provided by VK_EXT_memory_budget
    physicalDeviceMemoryBudgetPropertiesExt = 1000237000
    # Provided by VK_EXT_memory_priority
    physicalDeviceMemoryPriorityFeaturesExt = 1000238000
    # Provided by VK_EXT_memory_priority
    memoryPriorityAllocateInfoExt = 1000238001
    # Provided by VK_KHR_surface_protected_capabilities
    surfaceProtectedCapabilitiesKhr = 1000239000
    # Provided by VK_NV_dedicated_allocation_image_aliasing
    physicalDeviceDedicatedAllocationImageAliasingFeaturesNv = 1000240000
    # Provided by VK_VERSION_1_2
    physicalDeviceSeparateDepthStencilLayoutsFeatures = 1000241000
    # Provided by VK_VERSION_1_2
    attachmentReferenceStencilLayout = 1000241001
    # Provided by VK_VERSION_1_2
    attachmentDescriptionStencilLayout = 1000241002
    # Provided by VK_EXT_buffer_device_address
    physicalDeviceBufferDeviceAddressFeaturesExt = 1000244000
    # Provided by VK_VERSION_1_2
    bufferDeviceAddressInfo = 1000244001
    # Provided by VK_EXT_buffer_device_address
    bufferDeviceAddressCreateInfoExt = 1000244002
    # Provided by VK_EXT_tooling_info
    physicalDeviceToolPropertiesExt = 1000245000
    # Provided by VK_VERSION_1_2
    imageStencilUsageCreateInfo = 1000246000
    # Provided by VK_EXT_validation_features
    validationFeaturesExt = 1000247000
    # Provided by VK_NV_cooperative_matrix
    physicalDeviceCooperativeMatrixFeaturesNv = 1000249000
    # Provided by VK_NV_cooperative_matrix
    cooperativeMatrixPropertiesNv = 1000249001
    # Provided by VK_NV_cooperative_matrix
    physicalDeviceCooperativeMatrixPropertiesNv = 1000249002
    # Provided by VK_NV_coverage_reduction_mode
    physicalDeviceCoverageReductionModeFeaturesNv = 1000250000
    # Provided by VK_NV_coverage_reduction_mode
    pipelineCoverageReductionStateCreateInfoNv = 1000250001
    # Provided by VK_NV_coverage_reduction_mode
    framebufferMixedSamplesCombinationNv = 1000250002
    # Provided by VK_EXT_fragment_shader_interlock
    physicalDeviceFragmentShaderInterlockFeaturesExt = 1000251000
    # Provided by VK_EXT_ycbcr_image_arrays
    physicalDeviceYcbcrImageArraysFeaturesExt = 1000252000
    # Provided by VK_VERSION_1_2
    physicalDeviceUniformBufferStandardLayoutFeatures = 1000253000
    # Provided by VK_EXT_full_screen_exclusive
    surfaceFullScreenExclusiveInfoExt = 1000255000
    # Provided by VK_EXT_full_screen_exclusive
    surfaceFullScreenExclusiveWin32InfoExt = 1000255001
    # Provided by VK_EXT_full_screen_exclusive
    surfaceCapabilitiesFullScreenExclusiveExt = 1000255002
    # Provided by VK_EXT_headless_surface
    headlessSurfaceCreateInfoExt = 1000256000
    # Provided by VK_VERSION_1_2
    physicalDeviceBufferDeviceAddressFeatures = 1000257000
    # Provided by VK_VERSION_1_2
    bufferOpaqueCaptureAddressCreateInfo = 1000257002
    # Provided by VK_VERSION_1_2
    memoryOpaqueCaptureAddressAllocateInfo = 1000257003
    # Provided by VK_VERSION_1_2
    deviceMemoryOpaqueCaptureAddressInfo = 1000257004
    # Provided by VK_EXT_line_rasterization
    physicalDeviceLineRasterizationFeaturesExt = 1000259000
    # Provided by VK_EXT_line_rasterization
    pipelineRasterizationLineStateCreateInfoExt = 1000259001
    # Provided by VK_EXT_line_rasterization
    physicalDeviceLineRasterizationPropertiesExt = 1000259002
    # Provided by VK_EXT_shader_atomic_float
    physicalDeviceShaderAtomicFloatFeaturesExt = 1000260000
    # Provided by VK_VERSION_1_2
    physicalDeviceHostQueryResetFeatures = 1000261000
    # Provided by VK_EXT_index_type_uint8
    physicalDeviceIndexTypeUint8FeaturesExt = 1000265000
    # Provided by VK_EXT_extended_dynamic_state
    physicalDeviceExtendedDynamicStateFeaturesExt = 1000267000
    # Provided by VK_KHR_deferred_host_operations
    deferredOperationInfoKhr = 1000268000
    # Provided by VK_KHR_pipeline_executable_properties
    physicalDevicePipelineExecutablePropertiesFeaturesKhr = 1000269000
    # Provided by VK_KHR_pipeline_executable_properties
    pipelineInfoKhr = 1000269001
    # Provided by VK_KHR_pipeline_executable_properties
    pipelineExecutablePropertiesKhr = 1000269002
    # Provided by VK_KHR_pipeline_executable_properties
    pipelineExecutableInfoKhr = 1000269003
    # Provided by VK_KHR_pipeline_executable_properties
    pipelineExecutableStatisticKhr = 1000269004
    # Provided by VK_KHR_pipeline_executable_properties
    pipelineExecutableInternalRepresentationKhr = 1000269005
    # Provided by VK_EXT_shader_demote_to_helper_invocation
    physicalDeviceShaderDemoteToHelperInvocationFeaturesExt = 1000276000
    # Provided by VK_NV_device_generated_commands
    physicalDeviceDeviceGeneratedCommandsPropertiesNv = 1000277000
    # Provided by VK_NV_device_generated_commands
    graphicsShaderGroupCreateInfoNv = 1000277001
    # Provided by VK_NV_device_generated_commands
    graphicsPipelineShaderGroupsCreateInfoNv = 1000277002
    # Provided by VK_NV_device_generated_commands
    indirectCommandsLayoutTokenNv = 1000277003
    # Provided by VK_NV_device_generated_commands
    indirectCommandsLayoutCreateInfoNv = 1000277004
    # Provided by VK_NV_device_generated_commands
    generatedCommandsInfoNv = 1000277005
    # Provided by VK_NV_device_generated_commands
    generatedCommandsMemoryRequirementsInfoNv = 1000277006
    # Provided by VK_NV_device_generated_commands
    physicalDeviceDeviceGeneratedCommandsFeaturesNv = 1000277007
    # Provided by VK_EXT_texel_buffer_alignment
    physicalDeviceTexelBufferAlignmentFeaturesExt = 1000281000
    # Provided by VK_EXT_texel_buffer_alignment
    physicalDeviceTexelBufferAlignmentPropertiesExt = 1000281001
    # Provided by VK_QCOM_render_pass_transform
    commandBufferInheritanceRenderPassTransformInfoQcom = 1000282000
    # Provided by VK_QCOM_render_pass_transform
    renderPassTransformBeginInfoQcom = 1000282001
    # Provided by VK_EXT_robustness2
    physicalDeviceRobustness2FeaturesExt = 1000286000
    # Provided by VK_EXT_robustness2
    physicalDeviceRobustness2PropertiesExt = 1000286001
    # Provided by VK_EXT_custom_border_color
    samplerCustomBorderColorCreateInfoExt = 1000287000
    # Provided by VK_EXT_custom_border_color
    physicalDeviceCustomBorderColorPropertiesExt = 1000287001
    # Provided by VK_EXT_custom_border_color
    physicalDeviceCustomBorderColorFeaturesExt = 1000287002
    # Provided by VK_KHR_pipeline_library
    pipelineLibraryCreateInfoKhr = 1000290000
    # Provided by VK_EXT_private_data
    physicalDevicePrivateDataFeaturesExt = 1000295000
    # Provided by VK_EXT_private_data
    devicePrivateDataCreateInfoExt = 1000295001
    # Provided by VK_EXT_private_data
    privateDataSlotCreateInfoExt = 1000295002
    # Provided by VK_EXT_pipeline_creation_cache_control
    physicalDevicePipelineCreationCacheControlFeaturesExt = 1000297000
    # Provided by VK_NV_device_diagnostics_config
    physicalDeviceDiagnosticsConfigFeaturesNv = 1000300000
    # Provided by VK_NV_device_diagnostics_config
    deviceDiagnosticsConfigCreateInfoNv = 1000300001
    # Provided by VK_QCOM_extension_310
    reservedQcom = 1000309000
    # Provided by VK_EXT_fragment_density_map2
    physicalDeviceFragmentDensityMap2FeaturesExt = 1000332000
    # Provided by VK_EXT_fragment_density_map2
    physicalDeviceFragmentDensityMap2PropertiesExt = 1000332001
    # Provided by VK_EXT_image_robustness
    physicalDeviceImageRobustnessFeaturesExt = 1000335000
    # Provided by VK_EXT_4444_formats
    physicalDevice4444FormatsFeaturesExt = 1000340000
    # Provided by VK_EXT_directfb_surface
    directfbSurfaceCreateInfoExt = 1000346000

  # These types are part of the API, though not directly used in API commands or data structures
  # --------------------------------------------------------------------------------------------
  BaseInStructure* = object
    sType*: StructureType
    pNext*: ptr BaseInStructure
  BaseOutStructure* = object
    sType*: StructureType
    pNext*: ptr BaseOutStructure
  BufferMemoryBarrier* = object
    sType*: StructureType
    pNext*: pointer
    srcAccessMask*: AccessFlags
    dstAccessMask*: AccessFlags
    srcQueueFamilyIndex*: uint32
    dstQueueFamilyIndex*: uint32
    buffer*: Buffer
    offset*: DeviceSize
    size*: DeviceSize
  DispatchIndirectCommand* = object
    x*: uint32
    y*: uint32
    z*: uint32
  DrawIndexedIndirectCommand* = object
    indexCount*: uint32
    instanceCount*: uint32
    firstIndex*: uint32
    vertexOffset*: int32
    firstInstance*: uint32
  DrawIndirectCommand* = object
    vertexCount*: uint32
    instanceCount*: uint32
    firstVertex*: uint32
    firstInstance*: uint32
  ImageMemoryBarrier* = object
    sType*: StructureType
    pNext*: pointer
    srcAccessMask*: AccessFlags
    dstAccessMask*: AccessFlags
    oldLayout*: ImageLayout
    newLayout*: ImageLayout
    srcQueueFamilyIndex*: uint32
    dstQueueFamilyIndex*: uint32
    image*: Image
    subresourceRange*: ImageSubresourceRange
  MemoryBarrier* = object
    sType*: StructureType
    pNext*: pointer
    srcAccessMask*: AccessFlags
    dstAccessMask*: AccessFlags
  # Enums to track objects of various types
  ObjectType* {.size: sizeof(int32), pure.} = enum
    unknown = 0
    instance = 1 # VkInstance
    physicalDevice = 2 # VkPhysicalDevice
    device = 3 # VkDevice
    queue = 4 # VkQueue
    semaphore = 5 # VkSemaphore
    commandBuffer = 6 # VkCommandBuffer
    fence = 7 # VkFence
    deviceMemory = 8 # VkDeviceMemory
    buffer = 9 # VkBuffer
    image = 10 # VkImage
    event = 11 # VkEvent
    queryPool = 12 # VkQueryPool
    bufferView = 13 # VkBufferView
    imageView = 14 # VkImageView
    shaderModule = 15 # VkShaderModule
    pipelineCache = 16 # VkPipelineCache
    pipelineLayout = 17 # VkPipelineLayout
    renderPass = 18 # VkRenderPass
    pipeline = 19 # VkPipeline
    descriptorSetLayout = 20 # VkDescriptorSetLayout
    sampler = 21 # VkSampler
    descriptorPool = 22 # VkDescriptorPool
    descriptorSet = 23 # VkDescriptorSet
    framebuffer = 24 # VkFramebuffer
    commandPool = 25 # VkCommandPool
    # Provided by VK_KHR_surface
    surfaceKhr = 1000000000 # VkSurfaceKHR
    # Provided by VK_KHR_swapchain
    swapchainKhr = 1000001000 # VkSwapchainKHR
    # Provided by VK_KHR_display
    displayKhr = 1000002000 # VkDisplayKHR
    # Provided by VK_KHR_display
    displayModeKhr = 1000002001 # VkDisplayModeKHR
    # Provided by VK_EXT_debug_report
    debugReportCallbackExt = 1000011000 # VkDebugReportCallbackEXT
    # Provided by VK_VERSION_1_1
    descriptorUpdateTemplate = 1000085000
    # Provided by VK_EXT_debug_utils
    debugUtilsMessengerExt = 1000128000 # VkDebugUtilsMessengerEXT
    # Provided by VK_VERSION_1_1
    samplerYcbcrConversion = 1000156000
    # Provided by VK_EXT_validation_cache
    validationCacheExt = 1000160000 # VkValidationCacheEXT
    # Provided by VK_KHR_ray_tracing
    accelerationStructureKhr = 1000165000
    # Provided by VK_INTEL_performance_query
    performanceConfigurationIntel = 1000210000
    # Provided by VK_KHR_deferred_host_operations
    deferredOperationKhr = 1000268000
    # Provided by VK_NV_device_generated_commands
    indirectCommandsLayoutNv = 1000277000 # VkIndirectCommandsLayoutNV
    # Provided by VK_EXT_private_data
    privateDataSlotExt = 1000295000
  VendorId* {.size: sizeof(int32), pure.} = enum
    viv = 0x00010001 # Vivante vendor ID
    vsi = 0x00010002 # VeriSilicon vendor ID
    kazan = 0x00010003 # Kazan Software Renderer
    codeplay = 0x00010004 # Codeplay Software Ltd. vendor ID
    mesa = 0x00010005 # Mesa vendor ID

  # API constants
  # -------------
  PipelineCacheHeaderVersion* {.size: sizeof(int32), pure.} = enum
    one = 1

  # Device initialization
  # ---------------------
  AllocationFunction* = proc(
      pUserData: pointer;
      size: uint;
      alignment: uint;
      allocationScope: SystemAllocationScope;
    ): pointer {.cdecl.}
  FreeFunction* = proc(
      pUserData: pointer;
      pMemory: pointer;
    ): void {.cdecl.}
  InternalAllocationNotification* = proc(
      pUserData: pointer;
      size: uint;
      allocationType: InternalAllocationType;
      allocationScope: SystemAllocationScope;
    ): void {.cdecl.}
  InternalFreeNotification* = proc(
      pUserData: pointer;
      size: uint;
      allocationType: InternalAllocationType;
      allocationScope: SystemAllocationScope;
    ): void {.cdecl.}
  ReallocationFunction* = proc(
      pUserData: pointer;
      pOriginal: pointer;
      size: uint;
      alignment: uint;
      allocationScope: SystemAllocationScope;
    ): pointer {.cdecl.}
  VoidFunction* = proc(): void {.cdecl.}
  AllocationCallbacks* = object
    pUserData*: pointer
    pfnAllocation*: AllocationFunction
    pfnReallocation*: ReallocationFunction
    pfnFree*: FreeFunction
    pfnInternalAllocation*: InternalAllocationNotification
    pfnInternalFree*: InternalFreeNotification
  ApplicationInfo* = object
    sType*: StructureType
    pNext*: pointer
    pApplicationName*: cstring
    applicationVersion*: uint32
    pEngineName*: cstring
    engineVersion*: uint32
    apiVersion*: uint32
  # Vulkan format definitions
  Format* {.size: sizeof(int32), pure.} = enum
    undefined = 0
    r4g4UnormPack8 = 1
    r4g4b4a4UnormPack16 = 2
    b4g4r4a4UnormPack16 = 3
    r5g6b5UnormPack16 = 4
    b5g6r5UnormPack16 = 5
    r5g5b5a1UnormPack16 = 6
    b5g5r5a1UnormPack16 = 7
    a1r5g5b5UnormPack16 = 8
    r8Unorm = 9
    r8Snorm = 10
    r8Uscaled = 11
    r8Sscaled = 12
    r8Uint = 13
    r8Sint = 14
    r8Srgb = 15
    r8g8Unorm = 16
    r8g8Snorm = 17
    r8g8Uscaled = 18
    r8g8Sscaled = 19
    r8g8Uint = 20
    r8g8Sint = 21
    r8g8Srgb = 22
    r8g8b8Unorm = 23
    r8g8b8Snorm = 24
    r8g8b8Uscaled = 25
    r8g8b8Sscaled = 26
    r8g8b8Uint = 27
    r8g8b8Sint = 28
    r8g8b8Srgb = 29
    b8g8r8Unorm = 30
    b8g8r8Snorm = 31
    b8g8r8Uscaled = 32
    b8g8r8Sscaled = 33
    b8g8r8Uint = 34
    b8g8r8Sint = 35
    b8g8r8Srgb = 36
    r8g8b8a8Unorm = 37
    r8g8b8a8Snorm = 38
    r8g8b8a8Uscaled = 39
    r8g8b8a8Sscaled = 40
    r8g8b8a8Uint = 41
    r8g8b8a8Sint = 42
    r8g8b8a8Srgb = 43
    b8g8r8a8Unorm = 44
    b8g8r8a8Snorm = 45
    b8g8r8a8Uscaled = 46
    b8g8r8a8Sscaled = 47
    b8g8r8a8Uint = 48
    b8g8r8a8Sint = 49
    b8g8r8a8Srgb = 50
    a8b8g8r8UnormPack32 = 51
    a8b8g8r8SnormPack32 = 52
    a8b8g8r8UscaledPack32 = 53
    a8b8g8r8SscaledPack32 = 54
    a8b8g8r8UintPack32 = 55
    a8b8g8r8SintPack32 = 56
    a8b8g8r8SrgbPack32 = 57
    a2r10g10b10UnormPack32 = 58
    a2r10g10b10SnormPack32 = 59
    a2r10g10b10UscaledPack32 = 60
    a2r10g10b10SscaledPack32 = 61
    a2r10g10b10UintPack32 = 62
    a2r10g10b10SintPack32 = 63
    a2b10g10r10UnormPack32 = 64
    a2b10g10r10SnormPack32 = 65
    a2b10g10r10UscaledPack32 = 66
    a2b10g10r10SscaledPack32 = 67
    a2b10g10r10UintPack32 = 68
    a2b10g10r10SintPack32 = 69
    r16Unorm = 70
    r16Snorm = 71
    r16Uscaled = 72
    r16Sscaled = 73
    r16Uint = 74
    r16Sint = 75
    r16Sfloat = 76
    r16g16Unorm = 77
    r16g16Snorm = 78
    r16g16Uscaled = 79
    r16g16Sscaled = 80
    r16g16Uint = 81
    r16g16Sint = 82
    r16g16Sfloat = 83
    r16g16b16Unorm = 84
    r16g16b16Snorm = 85
    r16g16b16Uscaled = 86
    r16g16b16Sscaled = 87
    r16g16b16Uint = 88
    r16g16b16Sint = 89
    r16g16b16Sfloat = 90
    r16g16b16a16Unorm = 91
    r16g16b16a16Snorm = 92
    r16g16b16a16Uscaled = 93
    r16g16b16a16Sscaled = 94
    r16g16b16a16Uint = 95
    r16g16b16a16Sint = 96
    r16g16b16a16Sfloat = 97
    r32Uint = 98
    r32Sint = 99
    r32Sfloat = 100
    r32g32Uint = 101
    r32g32Sint = 102
    r32g32Sfloat = 103
    r32g32b32Uint = 104
    r32g32b32Sint = 105
    r32g32b32Sfloat = 106
    r32g32b32a32Uint = 107
    r32g32b32a32Sint = 108
    r32g32b32a32Sfloat = 109
    r64Uint = 110
    r64Sint = 111
    r64Sfloat = 112
    r64g64Uint = 113
    r64g64Sint = 114
    r64g64Sfloat = 115
    r64g64b64Uint = 116
    r64g64b64Sint = 117
    r64g64b64Sfloat = 118
    r64g64b64a64Uint = 119
    r64g64b64a64Sint = 120
    r64g64b64a64Sfloat = 121
    b10g11r11UfloatPack32 = 122
    e5b9g9r9UfloatPack32 = 123
    d16Unorm = 124
    x8D24UnormPack32 = 125
    d32Sfloat = 126
    s8Uint = 127
    d16UnormS8Uint = 128
    d24UnormS8Uint = 129
    d32SfloatS8Uint = 130
    bc1RgbUnormBlock = 131
    bc1RgbSrgbBlock = 132
    bc1RgbaUnormBlock = 133
    bc1RgbaSrgbBlock = 134
    bc2UnormBlock = 135
    bc2SrgbBlock = 136
    bc3UnormBlock = 137
    bc3SrgbBlock = 138
    bc4UnormBlock = 139
    bc4SnormBlock = 140
    bc5UnormBlock = 141
    bc5SnormBlock = 142
    bc6hUfloatBlock = 143
    bc6hSfloatBlock = 144
    bc7UnormBlock = 145
    bc7SrgbBlock = 146
    etc2R8g8b8UnormBlock = 147
    etc2R8g8b8SrgbBlock = 148
    etc2R8g8b8a1UnormBlock = 149
    etc2R8g8b8a1SrgbBlock = 150
    etc2R8g8b8a8UnormBlock = 151
    etc2R8g8b8a8SrgbBlock = 152
    eacR11UnormBlock = 153
    eacR11SnormBlock = 154
    eacR11g11UnormBlock = 155
    eacR11g11SnormBlock = 156
    astc4x4UnormBlock = 157
    astc4x4SrgbBlock = 158
    astc5x4UnormBlock = 159
    astc5x4SrgbBlock = 160
    astc5x5UnormBlock = 161
    astc5x5SrgbBlock = 162
    astc6x5UnormBlock = 163
    astc6x5SrgbBlock = 164
    astc6x6UnormBlock = 165
    astc6x6SrgbBlock = 166
    astc8x5UnormBlock = 167
    astc8x5SrgbBlock = 168
    astc8x6UnormBlock = 169
    astc8x6SrgbBlock = 170
    astc8x8UnormBlock = 171
    astc8x8SrgbBlock = 172
    astc10x5UnormBlock = 173
    astc10x5SrgbBlock = 174
    astc10x6UnormBlock = 175
    astc10x6SrgbBlock = 176
    astc10x8UnormBlock = 177
    astc10x8SrgbBlock = 178
    astc10x10UnormBlock = 179
    astc10x10SrgbBlock = 180
    astc12x10UnormBlock = 181
    astc12x10SrgbBlock = 182
    astc12x12UnormBlock = 183
    astc12x12SrgbBlock = 184
    # Provided by VK_IMG_format_pvrtc
    pvrtc12bppUnormBlockImg = 1000054000
    # Provided by VK_IMG_format_pvrtc
    pvrtc14bppUnormBlockImg = 1000054001
    # Provided by VK_IMG_format_pvrtc
    pvrtc22bppUnormBlockImg = 1000054002
    # Provided by VK_IMG_format_pvrtc
    pvrtc24bppUnormBlockImg = 1000054003
    # Provided by VK_IMG_format_pvrtc
    pvrtc12bppSrgbBlockImg = 1000054004
    # Provided by VK_IMG_format_pvrtc
    pvrtc14bppSrgbBlockImg = 1000054005
    # Provided by VK_IMG_format_pvrtc
    pvrtc22bppSrgbBlockImg = 1000054006
    # Provided by VK_IMG_format_pvrtc
    pvrtc24bppSrgbBlockImg = 1000054007
    # Provided by VK_EXT_texture_compression_astc_hdr
    astc4x4SfloatBlockExt = 1000066000
    # Provided by VK_EXT_texture_compression_astc_hdr
    astc5x4SfloatBlockExt = 1000066001
    # Provided by VK_EXT_texture_compression_astc_hdr
    astc5x5SfloatBlockExt = 1000066002
    # Provided by VK_EXT_texture_compression_astc_hdr
    astc6x5SfloatBlockExt = 1000066003
    # Provided by VK_EXT_texture_compression_astc_hdr
    astc6x6SfloatBlockExt = 1000066004
    # Provided by VK_EXT_texture_compression_astc_hdr
    astc8x5SfloatBlockExt = 1000066005
    # Provided by VK_EXT_texture_compression_astc_hdr
    astc8x6SfloatBlockExt = 1000066006
    # Provided by VK_EXT_texture_compression_astc_hdr
    astc8x8SfloatBlockExt = 1000066007
    # Provided by VK_EXT_texture_compression_astc_hdr
    astc10x5SfloatBlockExt = 1000066008
    # Provided by VK_EXT_texture_compression_astc_hdr
    astc10x6SfloatBlockExt = 1000066009
    # Provided by VK_EXT_texture_compression_astc_hdr
    astc10x8SfloatBlockExt = 1000066010
    # Provided by VK_EXT_texture_compression_astc_hdr
    astc10x10SfloatBlockExt = 1000066011
    # Provided by VK_EXT_texture_compression_astc_hdr
    astc12x10SfloatBlockExt = 1000066012
    # Provided by VK_EXT_texture_compression_astc_hdr
    astc12x12SfloatBlockExt = 1000066013
    # Provided by VK_VERSION_1_1
    g8b8g8r8422Unorm = 1000156000
    # Provided by VK_VERSION_1_1
    b8g8r8g8422Unorm = 1000156001
    # Provided by VK_VERSION_1_1
    g8B8R83plane420Unorm = 1000156002
    # Provided by VK_VERSION_1_1
    g8B8r82plane420Unorm = 1000156003
    # Provided by VK_VERSION_1_1
    g8B8R83plane422Unorm = 1000156004
    # Provided by VK_VERSION_1_1
    g8B8r82plane422Unorm = 1000156005
    # Provided by VK_VERSION_1_1
    g8B8R83plane444Unorm = 1000156006
    # Provided by VK_VERSION_1_1
    r10x6UnormPack16 = 1000156007
    # Provided by VK_VERSION_1_1
    r10x6g10x6Unorm2pack16 = 1000156008
    # Provided by VK_VERSION_1_1
    r10x6g10x6b10x6a10x6Unorm4pack16 = 1000156009
    # Provided by VK_VERSION_1_1
    g10x6b10x6g10x6r10x6422Unorm4pack16 = 1000156010
    # Provided by VK_VERSION_1_1
    b10x6g10x6r10x6g10x6422Unorm4pack16 = 1000156011
    # Provided by VK_VERSION_1_1
    g10x6B10x6R10x63plane420Unorm3pack16 = 1000156012
    # Provided by VK_VERSION_1_1
    g10x6B10x6r10x62plane420Unorm3pack16 = 1000156013
    # Provided by VK_VERSION_1_1
    g10x6B10x6R10x63plane422Unorm3pack16 = 1000156014
    # Provided by VK_VERSION_1_1
    g10x6B10x6r10x62plane422Unorm3pack16 = 1000156015
    # Provided by VK_VERSION_1_1
    g10x6B10x6R10x63plane444Unorm3pack16 = 1000156016
    # Provided by VK_VERSION_1_1
    r12x4UnormPack16 = 1000156017
    # Provided by VK_VERSION_1_1
    r12x4g12x4Unorm2pack16 = 1000156018
    # Provided by VK_VERSION_1_1
    r12x4g12x4b12x4a12x4Unorm4pack16 = 1000156019
    # Provided by VK_VERSION_1_1
    g12x4b12x4g12x4r12x4422Unorm4pack16 = 1000156020
    # Provided by VK_VERSION_1_1
    b12x4g12x4r12x4g12x4422Unorm4pack16 = 1000156021
    # Provided by VK_VERSION_1_1
    g12x4B12x4R12x43plane420Unorm3pack16 = 1000156022
    # Provided by VK_VERSION_1_1
    g12x4B12x4r12x42plane420Unorm3pack16 = 1000156023
    # Provided by VK_VERSION_1_1
    g12x4B12x4R12x43plane422Unorm3pack16 = 1000156024
    # Provided by VK_VERSION_1_1
    g12x4B12x4r12x42plane422Unorm3pack16 = 1000156025
    # Provided by VK_VERSION_1_1
    g12x4B12x4R12x43plane444Unorm3pack16 = 1000156026
    # Provided by VK_VERSION_1_1
    g16b16g16r16422Unorm = 1000156027
    # Provided by VK_VERSION_1_1
    b16g16r16g16422Unorm = 1000156028
    # Provided by VK_VERSION_1_1
    g16B16R163plane420Unorm = 1000156029
    # Provided by VK_VERSION_1_1
    g16B16r162plane420Unorm = 1000156030
    # Provided by VK_VERSION_1_1
    g16B16R163plane422Unorm = 1000156031
    # Provided by VK_VERSION_1_1
    g16B16r162plane422Unorm = 1000156032
    # Provided by VK_VERSION_1_1
    g16B16R163plane444Unorm = 1000156033
    # Provided by VK_EXT_extension_289
    astc3x3x3UnormBlockExt = 1000288000
    # Provided by VK_EXT_extension_289
    astc3x3x3SrgbBlockExt = 1000288001
    # Provided by VK_EXT_extension_289
    astc3x3x3SfloatBlockExt = 1000288002
    # Provided by VK_EXT_extension_289
    astc4x3x3UnormBlockExt = 1000288003
    # Provided by VK_EXT_extension_289
    astc4x3x3SrgbBlockExt = 1000288004
    # Provided by VK_EXT_extension_289
    astc4x3x3SfloatBlockExt = 1000288005
    # Provided by VK_EXT_extension_289
    astc4x4x3UnormBlockExt = 1000288006
    # Provided by VK_EXT_extension_289
    astc4x4x3SrgbBlockExt = 1000288007
    # Provided by VK_EXT_extension_289
    astc4x4x3SfloatBlockExt = 1000288008
    # Provided by VK_EXT_extension_289
    astc4x4x4UnormBlockExt = 1000288009
    # Provided by VK_EXT_extension_289
    astc4x4x4SrgbBlockExt = 1000288010
    # Provided by VK_EXT_extension_289
    astc4x4x4SfloatBlockExt = 1000288011
    # Provided by VK_EXT_extension_289
    astc5x4x4UnormBlockExt = 1000288012
    # Provided by VK_EXT_extension_289
    astc5x4x4SrgbBlockExt = 1000288013
    # Provided by VK_EXT_extension_289
    astc5x4x4SfloatBlockExt = 1000288014
    # Provided by VK_EXT_extension_289
    astc5x5x4UnormBlockExt = 1000288015
    # Provided by VK_EXT_extension_289
    astc5x5x4SrgbBlockExt = 1000288016
    # Provided by VK_EXT_extension_289
    astc5x5x4SfloatBlockExt = 1000288017
    # Provided by VK_EXT_extension_289
    astc5x5x5UnormBlockExt = 1000288018
    # Provided by VK_EXT_extension_289
    astc5x5x5SrgbBlockExt = 1000288019
    # Provided by VK_EXT_extension_289
    astc5x5x5SfloatBlockExt = 1000288020
    # Provided by VK_EXT_extension_289
    astc6x5x5UnormBlockExt = 1000288021
    # Provided by VK_EXT_extension_289
    astc6x5x5SrgbBlockExt = 1000288022
    # Provided by VK_EXT_extension_289
    astc6x5x5SfloatBlockExt = 1000288023
    # Provided by VK_EXT_extension_289
    astc6x6x5UnormBlockExt = 1000288024
    # Provided by VK_EXT_extension_289
    astc6x6x5SrgbBlockExt = 1000288025
    # Provided by VK_EXT_extension_289
    astc6x6x5SfloatBlockExt = 1000288026
    # Provided by VK_EXT_extension_289
    astc6x6x6UnormBlockExt = 1000288027
    # Provided by VK_EXT_extension_289
    astc6x6x6SrgbBlockExt = 1000288028
    # Provided by VK_EXT_extension_289
    astc6x6x6SfloatBlockExt = 1000288029
    # Provided by VK_EXT_4444_formats
    a4r4g4b4UnormPack16Ext = 1000340000
    # Provided by VK_EXT_4444_formats
    a4b4g4r4UnormPack16Ext = 1000340001
  FormatFeatureFlagBits* {.size: sizeof(int32), pure.} = enum
    sampledImage = 0x00000001 # Format can be used for sampled images (SAMPLED_IMAGE and COMBINED_IMAGE_SAMPLER descriptor types)
    storageImage = 0x00000002 # Format can be used for storage images (STORAGE_IMAGE descriptor type)
    storageImageAtomic = 0x00000004 # Format supports atomic operations in case it is used for storage images
    uniformTexelBuffer = 0x00000008 # Format can be used for uniform texel buffers (TBOs)
    storageTexelBuffer = 0x00000010 # Format can be used for storage texel buffers (IBOs)
    storageTexelBufferAtomic = 0x00000020 # Format supports atomic operations in case it is used for storage texel buffers
    vertexBuffer = 0x00000040 # Format can be used for vertex buffers (VBOs)
    colorAttachment = 0x00000080 # Format can be used for color attachment images
    colorAttachmentBlend = 0x00000100 # Format supports blending in case it is used for color attachment images
    depthStencilAttachment = 0x00000200 # Format can be used for depth/stencil attachment images
    blitSrc = 0x00000400 # Format can be used as the source image of blits with vkCmdBlitImage
    blitDst = 0x00000800 # Format can be used as the destination image of blits with vkCmdBlitImage
    sampledImageFilterLinear = 0x00001000 # Format can be filtered with VK_FILTER_LINEAR when being sampled
    # Provided by VK_IMG_filter_cubic
    sampledImageFilterCubicImg = 0x00002000 # Format can be filtered with VK_FILTER_CUBIC_IMG when being sampled
    # Provided by VK_VERSION_1_1
    transferSrc = 0x00004000 # Format can be used as the source image of image transfer commands
    # Provided by VK_VERSION_1_1
    transferDst = 0x00008000 # Format can be used as the destination image of image transfer commands
    # Provided by VK_VERSION_1_2
    sampledImageFilterMinmax = 0x00010000 # Format can be used with min/max reduction filtering
    # Provided by VK_VERSION_1_1
    midpointChromaSamples = 0x00020000 # Format can have midpoint rather than cosited chroma samples
    # Provided by VK_VERSION_1_1
    sampledImageYcbcrConversionLinearFilter = 0x00040000 # Format can be used with linear filtering whilst color conversion is enabled
    # Provided by VK_VERSION_1_1
    sampledImageYcbcrConversionSeparateReconstructionFilter = 0x00080000 # Format can have different chroma, min and mag filters
    # Provided by VK_VERSION_1_1
    sampledImageYcbcrConversionChromaReconstructionExplicit = 0x00100000
    # Provided by VK_VERSION_1_1
    sampledImageYcbcrConversionChromaReconstructionExplicitForceable = 0x00200000
    # Provided by VK_VERSION_1_1
    disjoint = 0x00400000 # Format supports disjoint planes
    # Provided by VK_VERSION_1_1
    cositedChromaSamples = 0x00800000 # Format can have cosited rather than midpoint chroma samples
    # Provided by VK_EXT_fragment_density_map
    fragmentDensityMapExt = 0x01000000
    # Provided by VK_AMD_extension_25
    reserved25Khr = 0x02000000
    # Provided by VK_AMD_extension_25
    reserved26Khr = 0x04000000
    # Provided by VK_AMD_extension_24
    reserved27Khr = 0x08000000
    # Provided by VK_AMD_extension_24
    reserved28Khr = 0x10000000
    # Provided by VK_KHR_ray_tracing
    accelerationStructureVertexBufferKhr = 0x20000000
    # Provided by VK_AMD_extension_227
    amdReserved30 = 0x40000000
  FormatFeatureFlags* = Flags[FormatFeatureFlagBits]
  FormatProperties* = object
    linearTilingFeatures*: FormatFeatureFlags
    optimalTilingFeatures*: FormatFeatureFlags
    bufferFeatures*: FormatFeatureFlags
  ImageCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    sparseBinding = 0x00000001 # Image should support sparse backing
    sparseResidency = 0x00000002 # Image should support sparse backing with partial residency
    sparseAliased = 0x00000004 # Image should support constent data access to physical memory ranges mapped into multiple locations of sparse images
    mutableFormat = 0x00000008 # Allows image views to have different format than the base image
    cubeCompatible = 0x00000010 # Allows creating image views with cube type from the created image
    # Provided by VK_VERSION_1_1
    vk2dArrayCompatible = 0x00000020 # The 3D image can be viewed as a 2D or 2D array image
    # Provided by VK_VERSION_1_1
    splitInstanceBindRegions = 0x00000040 # Allows using VkBindImageMemoryDeviceGroupInfo::pSplitInstanceBindRegions when binding memory to the image
    # Provided by VK_VERSION_1_1
    blockTexelViewCompatible = 0x00000080
    # Provided by VK_VERSION_1_1
    extendedUsage = 0x00000100
    # Provided by VK_VERSION_1_1
    disjoint = 0x00000200
    # Provided by VK_VERSION_1_1
    alias = 0x00000400
    # Provided by VK_VERSION_1_1
    protected = 0x00000800 # Image requires protected memory
    # Provided by VK_EXT_sample_locations
    sampleLocationsCompatibleDepthExt = 0x00001000
    # Provided by VK_NV_corner_sampled_image
    cornerSampledNv = 0x00002000
    # Provided by VK_EXT_fragment_density_map
    subsampledExt = 0x00004000
  ImageCreateFlags* = Flags[ImageCreateFlagBits]
  ImageFormatProperties* = object
    maxExtent*: Extent3D
    maxMipLevels*: uint32
    maxArrayLayers*: uint32
    sampleCounts*: SampleCountFlags
    maxResourceSize*: DeviceSize
  ImageTiling* {.size: sizeof(int32), pure.} = enum
    optimal = 0
    linear = 1
    # Provided by VK_EXT_image_drm_format_modifier
    drmFormatModifierExt = 1000158000
  ImageType* {.size: sizeof(int32), pure.} = enum
    vk1d = 0
    vk2d = 1
    vk3d = 2
  ImageUsageFlagBits* {.size: sizeof(int32), pure.} = enum
    transferSrc = 0x00000001 # Can be used as a source of transfer operations
    transferDst = 0x00000002 # Can be used as a destination of transfer operations
    sampled = 0x00000004 # Can be sampled from (SAMPLED_IMAGE and COMBINED_IMAGE_SAMPLER descriptor types)
    storage = 0x00000008 # Can be used as storage image (STORAGE_IMAGE descriptor type)
    colorAttachment = 0x00000010 # Can be used as framebuffer color attachment
    depthStencilAttachment = 0x00000020 # Can be used as framebuffer depth/stencil attachment
    transientAttachment = 0x00000040 # Image data not needed outside of rendering
    inputAttachment = 0x00000080 # Can be used as framebuffer input attachment
    # Provided by VK_NV_shading_rate_image
    shadingRateImageNv = 0x00000100
    # Provided by VK_EXT_fragment_density_map
    fragmentDensityMapExt = 0x00000200
    # Provided by VK_AMD_extension_25
    reserved10Khr = 0x00000400
    # Provided by VK_AMD_extension_25
    reserved11Khr = 0x00000800
    # Provided by VK_AMD_extension_25
    reserved12Khr = 0x00001000
    # Provided by VK_AMD_extension_24
    reserved13Khr = 0x00002000
    # Provided by VK_AMD_extension_24
    reserved14Khr = 0x00004000
    # Provided by VK_AMD_extension_24
    reserved15Khr = 0x00008000
    # Provided by VK_QCOM_extension_173
    reserved16Qcom = 0x00010000
    # Provided by VK_QCOM_extension_173
    reserved17Qcom = 0x00020000
  ImageUsageFlags* = Flags[ImageUsageFlagBits]
  Instance* = object of Handle
  InstanceCreateFlags* = Flags[distinct UnusedEnum]
  InstanceCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: InstanceCreateFlags
    pApplicationInfo*: ptr ApplicationInfo
    enabledLayerCount*: uint32
    ppEnabledLayerNames*: cstringArray
    enabledExtensionCount*: uint32
    ppEnabledExtensionNames*: cstringArray
  InternalAllocationType* {.size: sizeof(int32), pure.} = enum
    executable = 0
  MemoryHeap* = object
    size*: DeviceSize
    flags*: MemoryHeapFlags
  MemoryHeapFlagBits* {.size: sizeof(int32), pure.} = enum
    deviceLocal = 0x00000001 # If set, heap represents device memory
    # Provided by VK_VERSION_1_1
    multiInstance = 0x00000002 # If set, heap allocations allocate multiple instances by default
    # Provided by VK_KHR_extension_309
    reserved2Khr = 0x00000004
  MemoryHeapFlags* = Flags[MemoryHeapFlagBits]
  MemoryPropertyFlagBits* {.size: sizeof(int32), pure.} = enum
    deviceLocal = 0x00000001 # If otherwise stated, then allocate memory on device
    hostVisible = 0x00000002 # Memory is mappable by host
    hostCoherent = 0x00000004 # Memory will have i/o coherency. If not set, application may need to use vkFlushMappedMemoryRanges and vkInvalidateMappedMemoryRanges to flush/invalidate host cache
    hostCached = 0x00000008 # Memory will be cached by the host
    lazilyAllocated = 0x00000010 # Memory may be allocated by the driver when it is required
    # Provided by VK_VERSION_1_1
    protected = 0x00000020 # Memory is protected
    # Provided by VK_AMD_device_coherent_memory
    deviceCoherentAmd = 0x00000040
    # Provided by VK_AMD_device_coherent_memory
    deviceUncachedAmd = 0x00000080
  MemoryPropertyFlags* = Flags[MemoryPropertyFlagBits]
  MemoryType* = object
    propertyFlags*: MemoryPropertyFlags
    heapIndex*: uint32
  PhysicalDevice* = object of Handle
  PhysicalDeviceFeatures* = object
    robustBufferAccess*: Bool32
    fullDrawIndexUint32*: Bool32
    imageCubeArray*: Bool32
    independentBlend*: Bool32
    geometryShader*: Bool32
    tessellationShader*: Bool32
    sampleRateShading*: Bool32
    dualSrcBlend*: Bool32
    logicOp*: Bool32
    multiDrawIndirect*: Bool32
    drawIndirectFirstInstance*: Bool32
    depthClamp*: Bool32
    depthBiasClamp*: Bool32
    fillModeNonSolid*: Bool32
    depthBounds*: Bool32
    wideLines*: Bool32
    largePoints*: Bool32
    alphaToOne*: Bool32
    multiViewport*: Bool32
    samplerAnisotropy*: Bool32
    textureCompressionETC2*: Bool32
    textureCompressionASTC_LDR*: Bool32
    textureCompressionBC*: Bool32
    occlusionQueryPrecise*: Bool32
    pipelineStatisticsQuery*: Bool32
    vertexPipelineStoresAndAtomics*: Bool32
    fragmentStoresAndAtomics*: Bool32
    shaderTessellationAndGeometryPointSize*: Bool32
    shaderImageGatherExtended*: Bool32
    shaderStorageImageExtendedFormats*: Bool32
    shaderStorageImageMultisample*: Bool32
    shaderStorageImageReadWithoutFormat*: Bool32
    shaderStorageImageWriteWithoutFormat*: Bool32
    shaderUniformBufferArrayDynamicIndexing*: Bool32
    shaderSampledImageArrayDynamicIndexing*: Bool32
    shaderStorageBufferArrayDynamicIndexing*: Bool32
    shaderStorageImageArrayDynamicIndexing*: Bool32
    shaderClipDistance*: Bool32
    shaderCullDistance*: Bool32
    shaderFloat64*: Bool32
    shaderInt64*: Bool32
    shaderInt16*: Bool32
    shaderResourceResidency*: Bool32
    shaderResourceMinLod*: Bool32
    sparseBinding*: Bool32
    sparseResidencyBuffer*: Bool32
    sparseResidencyImage2D*: Bool32
    sparseResidencyImage3D*: Bool32
    sparseResidency2Samples*: Bool32
    sparseResidency4Samples*: Bool32
    sparseResidency8Samples*: Bool32
    sparseResidency16Samples*: Bool32
    sparseResidencyAliased*: Bool32
    variableMultisampleRate*: Bool32
    inheritedQueries*: Bool32
  PhysicalDeviceLimits* = object
    maxImageDimension1D*: uint32
    maxImageDimension2D*: uint32
    maxImageDimension3D*: uint32
    maxImageDimensionCube*: uint32
    maxImageArrayLayers*: uint32
    maxTexelBufferElements*: uint32
    maxUniformBufferRange*: uint32
    maxStorageBufferRange*: uint32
    maxPushConstantsSize*: uint32
    maxMemoryAllocationCount*: uint32
    maxSamplerAllocationCount*: uint32
    bufferImageGranularity*: DeviceSize
    sparseAddressSpaceSize*: DeviceSize
    maxBoundDescriptorSets*: uint32
    maxPerStageDescriptorSamplers*: uint32
    maxPerStageDescriptorUniformBuffers*: uint32
    maxPerStageDescriptorStorageBuffers*: uint32
    maxPerStageDescriptorSampledImages*: uint32
    maxPerStageDescriptorStorageImages*: uint32
    maxPerStageDescriptorInputAttachments*: uint32
    maxPerStageResources*: uint32
    maxDescriptorSetSamplers*: uint32
    maxDescriptorSetUniformBuffers*: uint32
    maxDescriptorSetUniformBuffersDynamic*: uint32
    maxDescriptorSetStorageBuffers*: uint32
    maxDescriptorSetStorageBuffersDynamic*: uint32
    maxDescriptorSetSampledImages*: uint32
    maxDescriptorSetStorageImages*: uint32
    maxDescriptorSetInputAttachments*: uint32
    maxVertexInputAttributes*: uint32
    maxVertexInputBindings*: uint32
    maxVertexInputAttributeOffset*: uint32
    maxVertexInputBindingStride*: uint32
    maxVertexOutputComponents*: uint32
    maxTessellationGenerationLevel*: uint32
    maxTessellationPatchSize*: uint32
    maxTessellationControlPerVertexInputComponents*: uint32
    maxTessellationControlPerVertexOutputComponents*: uint32
    maxTessellationControlPerPatchOutputComponents*: uint32
    maxTessellationControlTotalOutputComponents*: uint32
    maxTessellationEvaluationInputComponents*: uint32
    maxTessellationEvaluationOutputComponents*: uint32
    maxGeometryShaderInvocations*: uint32
    maxGeometryInputComponents*: uint32
    maxGeometryOutputComponents*: uint32
    maxGeometryOutputVertices*: uint32
    maxGeometryTotalOutputComponents*: uint32
    maxFragmentInputComponents*: uint32
    maxFragmentOutputAttachments*: uint32
    maxFragmentDualSrcAttachments*: uint32
    maxFragmentCombinedOutputResources*: uint32
    maxComputeSharedMemorySize*: uint32
    maxComputeWorkGroupCount*: array[3, uint32]
    maxComputeWorkGroupInvocations*: uint32
    maxComputeWorkGroupSize*: array[3, uint32]
    subPixelPrecisionBits*: uint32
    subTexelPrecisionBits*: uint32
    mipmapPrecisionBits*: uint32
    maxDrawIndexedIndexValue*: uint32
    maxDrawIndirectCount*: uint32
    maxSamplerLodBias*: float32
    maxSamplerAnisotropy*: float32
    maxViewports*: uint32
    maxViewportDimensions*: array[2, uint32]
    viewportBoundsRange*: array[2, float32]
    viewportSubPixelBits*: uint32
    minMemoryMapAlignment*: uint
    minTexelBufferOffsetAlignment*: DeviceSize
    minUniformBufferOffsetAlignment*: DeviceSize
    minStorageBufferOffsetAlignment*: DeviceSize
    minTexelOffset*: int32
    maxTexelOffset*: uint32
    minTexelGatherOffset*: int32
    maxTexelGatherOffset*: uint32
    minInterpolationOffset*: float32
    maxInterpolationOffset*: float32
    subPixelInterpolationOffsetBits*: uint32
    maxFramebufferWidth*: uint32
    maxFramebufferHeight*: uint32
    maxFramebufferLayers*: uint32
    framebufferColorSampleCounts*: SampleCountFlags
    framebufferDepthSampleCounts*: SampleCountFlags
    framebufferStencilSampleCounts*: SampleCountFlags
    framebufferNoAttachmentsSampleCounts*: SampleCountFlags
    maxColorAttachments*: uint32
    sampledImageColorSampleCounts*: SampleCountFlags
    sampledImageIntegerSampleCounts*: SampleCountFlags
    sampledImageDepthSampleCounts*: SampleCountFlags
    sampledImageStencilSampleCounts*: SampleCountFlags
    storageImageSampleCounts*: SampleCountFlags
    maxSampleMaskWords*: uint32
    timestampComputeAndGraphics*: Bool32
    timestampPeriod*: float32
    maxClipDistances*: uint32
    maxCullDistances*: uint32
    maxCombinedClipAndCullDistances*: uint32
    discreteQueuePriorities*: uint32
    pointSizeRange*: array[2, float32]
    lineWidthRange*: array[2, float32]
    pointSizeGranularity*: float32
    lineWidthGranularity*: float32
    strictLines*: Bool32
    standardSampleLocations*: Bool32
    optimalBufferCopyOffsetAlignment*: DeviceSize
    optimalBufferCopyRowPitchAlignment*: DeviceSize
    nonCoherentAtomSize*: DeviceSize
  PhysicalDeviceMemoryProperties* = object
    memoryTypeCount*: uint32
    memoryTypes*: array[MaxMemoryTypes, MemoryType]
    memoryHeapCount*: uint32
    memoryHeaps*: array[MaxMemoryHeaps, MemoryHeap]
  PhysicalDeviceProperties* = object
    apiVersion*: uint32
    driverVersion*: uint32
    vendorID*: uint32
    deviceID*: uint32
    deviceType*: PhysicalDeviceType
    deviceName*: array[MaxPhysicalDeviceNameSize, char]
    pipelineCacheUUID*: array[UuidSize, uint8]
    limits*: PhysicalDeviceLimits
    sparseProperties*: PhysicalDeviceSparseProperties
  PhysicalDeviceSparseProperties* = object
    residencyStandard2DBlockShape*: Bool32
    residencyStandard2DMultisampleBlockShape*: Bool32
    residencyStandard3DBlockShape*: Bool32
    residencyAlignedMipSize*: Bool32
    residencyNonResidentStrict*: Bool32
  PhysicalDeviceType* {.size: sizeof(int32), pure.} = enum
    other = 0
    integratedGpu = 1
    discreteGpu = 2
    virtualGpu = 3
    cpu = 4
  QueueFamilyProperties* = object
    queueFlags*: QueueFlags
    queueCount*: uint32
    timestampValidBits*: uint32
    minImageTransferGranularity*: Extent3D
  QueueFlagBits* {.size: sizeof(int32), pure.} = enum
    graphics = 0x00000001 # Queue supports graphics operations
    compute = 0x00000002 # Queue supports compute operations
    transfer = 0x00000004 # Queue supports transfer operations
    sparseBinding = 0x00000008 # Queue supports sparse resource memory management operations
    # Provided by VK_VERSION_1_1
    protected = 0x00000010 # Queues may support protected operations
    # Provided by VK_AMD_extension_25
    reserved5Khr = 0x00000020
    # Provided by VK_AMD_extension_24
    reserved6Khr = 0x00000040
  QueueFlags* = Flags[QueueFlagBits]
  SampleCountFlagBits* {.size: sizeof(int32), pure.} = enum
    vk1 = 0x00000001 # Sample count 1 supported
    vk2 = 0x00000002 # Sample count 2 supported
    vk4 = 0x00000004 # Sample count 4 supported
    vk8 = 0x00000008 # Sample count 8 supported
    vk16 = 0x00000010 # Sample count 16 supported
    vk32 = 0x00000020 # Sample count 32 supported
    vk64 = 0x00000040 # Sample count 64 supported
  SampleCountFlags* = Flags[SampleCountFlagBits]
  SystemAllocationScope* {.size: sizeof(int32), pure.} = enum
    command = 0
    `object` = 1
    cache = 2
    device = 3
    instance = 4

  # Device commands
  # ---------------
  Device* = object of Handle
  DeviceCreateFlags* = Flags[distinct UnusedEnum]
  DeviceCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DeviceCreateFlags
    queueCreateInfoCount*: uint32
    pQueueCreateInfos*: ptr DeviceQueueCreateInfo
    enabledLayerCount*: uint32
    ppEnabledLayerNames*: cstringArray
    enabledExtensionCount*: uint32
    ppEnabledExtensionNames*: cstringArray
    pEnabledFeatures*: ptr PhysicalDeviceFeatures
  DeviceQueueCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_VERSION_1_1
    protected = 0x00000001 # Queue is a protected-capable device queue
  DeviceQueueCreateFlags* = Flags[DeviceQueueCreateFlagBits]
  DeviceQueueCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DeviceQueueCreateFlags
    queueFamilyIndex*: uint32
    queueCount*: uint32
    pQueuePriorities*: ptr float32

  # Extension discovery commands
  # ----------------------------
  ExtensionProperties* = object
    extensionName*: array[MaxExtensionNameSize, char]
    specVersion*: uint32

  # Layer discovery commands
  # ------------------------
  LayerProperties* = object
    layerName*: array[MaxExtensionNameSize, char]
    specVersion*: uint32
    implementationVersion*: uint32
    description*: array[MaxDescriptionSize, char]

  # Queue commands
  # --------------
  PipelineStageFlagBits* {.size: sizeof(int32), pure.} = enum
    topOfPipe = 0x00000001 # Before subsequent commands are processed
    drawIndirect = 0x00000002 # Draw/DispatchIndirect command fetch
    vertexInput = 0x00000004 # Vertex/index fetch
    vertexShader = 0x00000008 # Vertex shading
    tessellationControlShader = 0x00000010 # Tessellation control shading
    tessellationEvaluationShader = 0x00000020 # Tessellation evaluation shading
    geometryShader = 0x00000040 # Geometry shading
    fragmentShader = 0x00000080 # Fragment shading
    earlyFragmentTests = 0x00000100 # Early fragment (depth and stencil) tests
    lateFragmentTests = 0x00000200 # Late fragment (depth and stencil) tests
    colorAttachmentOutput = 0x00000400 # Color attachment writes
    computeShader = 0x00000800 # Compute shading
    transfer = 0x00001000 # Transfer/copy operations
    bottomOfPipe = 0x00002000 # After previous commands have completed
    host = 0x00004000 # Indicates host (CPU) is a source/sink of the dependency
    allGraphics = 0x00008000 # All stages of the graphics pipeline
    allCommands = 0x00010000 # All stages supported on the queue
    # Provided by VK_NV_device_generated_commands
    commandPreprocessNv = 0x00020000
    # Provided by VK_EXT_conditional_rendering
    conditionalRenderingExt = 0x00040000 # A pipeline stage for conditional rendering predicate fetch
    # Provided by VK_NV_mesh_shader
    taskShaderNv = 0x00080000
    # Provided by VK_NV_mesh_shader
    meshShaderNv = 0x00100000
    # Provided by VK_KHR_ray_tracing
    rayTracingShaderKhr = 0x00200000
    # Provided by VK_NV_shading_rate_image
    shadingRateImageNv = 0x00400000
    # Provided by VK_EXT_fragment_density_map
    fragmentDensityProcessExt = 0x00800000
    # Provided by VK_EXT_transform_feedback
    transformFeedbackExt = 0x01000000
    # Provided by VK_KHR_ray_tracing
    accelerationStructureBuildKhr = 0x02000000
    # Provided by VK_AMD_extension_25
    reserved26Khr = 0x04000000
    # Provided by VK_AMD_extension_24
    reserved27Khr = 0x08000000
  PipelineStageFlags* = Flags[PipelineStageFlagBits]
  Queue* = object of Handle
  SubmitInfo* = object
    sType*: StructureType
    pNext*: pointer
    waitSemaphoreCount*: uint32
    pWaitSemaphores*: ptr Semaphore
    pWaitDstStageMask*: ptr PipelineStageFlags
    commandBufferCount*: uint32
    pCommandBuffers*: ptr CommandBuffer
    signalSemaphoreCount*: uint32
    pSignalSemaphores*: ptr Semaphore

  # Memory commands
  # ---------------
  MappedMemoryRange* = object
    sType*: StructureType
    pNext*: pointer
    memory*: DeviceMemory
    offset*: DeviceSize
    size*: DeviceSize
  MemoryAllocateInfo* = object
    sType*: StructureType
    pNext*: pointer
    allocationSize*: DeviceSize
    memoryTypeIndex*: uint32
  MemoryMapFlags* = Flags[distinct UnusedEnum]

  # Memory management API commands
  # ------------------------------
  DeviceMemory* = object of NonDispatchableHandle
  MemoryRequirements* = object
    size*: DeviceSize
    alignment*: DeviceSize
    memoryTypeBits*: uint32

  # Sparse resource memory management API commands
  # ----------------------------------------------
  BindSparseInfo* = object
    sType*: StructureType
    pNext*: pointer
    waitSemaphoreCount*: uint32
    pWaitSemaphores*: ptr Semaphore
    bufferBindCount*: uint32
    pBufferBinds*: ptr SparseBufferMemoryBindInfo
    imageOpaqueBindCount*: uint32
    pImageOpaqueBinds*: ptr SparseImageOpaqueMemoryBindInfo
    imageBindCount*: uint32
    pImageBinds*: ptr SparseImageMemoryBindInfo
    signalSemaphoreCount*: uint32
    pSignalSemaphores*: ptr Semaphore
  ImageAspectFlagBits* {.size: sizeof(int32), pure.} = enum
    color = 0x00000001
    depth = 0x00000002
    stencil = 0x00000004
    metadata = 0x00000008
    # Provided by VK_VERSION_1_1
    plane0 = 0x00000010
    # Provided by VK_VERSION_1_1
    plane1 = 0x00000020
    # Provided by VK_VERSION_1_1
    plane2 = 0x00000040
    # Provided by VK_EXT_image_drm_format_modifier
    memoryPlane0Ext = 0x00000080
    # Provided by VK_EXT_image_drm_format_modifier
    memoryPlane1Ext = 0x00000100
    # Provided by VK_EXT_image_drm_format_modifier
    memoryPlane2Ext = 0x00000200
    # Provided by VK_EXT_image_drm_format_modifier
    memoryPlane3Ext = 0x00000400
  ImageAspectFlags* = Flags[ImageAspectFlagBits]
  ImageSubresource* = object
    aspectMask*: ImageAspectFlags
    mipLevel*: uint32
    arrayLayer*: uint32
  SparseBufferMemoryBindInfo* = object
    buffer*: Buffer
    bindCount*: uint32
    pBinds*: ptr SparseMemoryBind
  SparseImageFormatFlagBits* {.size: sizeof(int32), pure.} = enum
    singleMiptail = 0x00000001 # Image uses a single mip tail region for all array layers
    alignedMipSize = 0x00000002 # Image requires mip level dimensions to be an integer multiple of the sparse image block dimensions for non-tail mip levels.
    nonstandardBlockSize = 0x00000004 # Image uses a non-standard sparse image block dimensions
  SparseImageFormatFlags* = Flags[SparseImageFormatFlagBits]
  SparseImageFormatProperties* = object
    aspectMask*: ImageAspectFlags
    imageGranularity*: Extent3D
    flags*: SparseImageFormatFlags
  SparseImageMemoryBind* = object
    subresource*: ImageSubresource
    offset*: Offset3D
    extent*: Extent3D
    memory*: DeviceMemory
    memoryOffset*: DeviceSize
    flags*: SparseMemoryBindFlags
  SparseImageMemoryBindInfo* = object
    image*: Image
    bindCount*: uint32
    pBinds*: ptr SparseImageMemoryBind
  SparseImageMemoryRequirements* = object
    formatProperties*: SparseImageFormatProperties
    imageMipTailFirstLod*: uint32
    imageMipTailSize*: DeviceSize
    imageMipTailOffset*: DeviceSize
    imageMipTailStride*: DeviceSize
  SparseImageOpaqueMemoryBindInfo* = object
    image*: Image
    bindCount*: uint32
    pBinds*: ptr SparseMemoryBind
  SparseMemoryBind* = object
    resourceOffset*: DeviceSize
    size*: DeviceSize
    memory*: DeviceMemory
    memoryOffset*: DeviceSize
    flags*: SparseMemoryBindFlags
  SparseMemoryBindFlagBits* {.size: sizeof(int32), pure.} = enum
    metadata = 0x00000001 # Operation binds resource metadata to memory
  SparseMemoryBindFlags* = Flags[SparseMemoryBindFlagBits]

  # Fence commands
  # --------------
  Fence* = object of NonDispatchableHandle
  FenceCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    signaled = 0x00000001
  FenceCreateFlags* = Flags[FenceCreateFlagBits]
  FenceCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: FenceCreateFlags

  # Queue semaphore commands
  # ------------------------
  Semaphore* = object of NonDispatchableHandle
  SemaphoreCreateFlags* = Flags[distinct UnusedEnum]
  SemaphoreCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: SemaphoreCreateFlags

  # Event commands
  # --------------
  Event* = object of NonDispatchableHandle
  EventCreateFlags* = Flags[distinct UnusedEnum]
  EventCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: EventCreateFlags

  # Query commands
  # --------------
  QueryPipelineStatisticFlagBits* {.size: sizeof(int32), pure.} = enum
    inputAssemblyVertices = 0x00000001 # Optional
    inputAssemblyPrimitives = 0x00000002 # Optional
    vertexShaderInvocations = 0x00000004 # Optional
    geometryShaderInvocations = 0x00000008 # Optional
    geometryShaderPrimitives = 0x00000010 # Optional
    clippingInvocations = 0x00000020 # Optional
    clippingPrimitives = 0x00000040 # Optional
    fragmentShaderInvocations = 0x00000080 # Optional
    tessellationControlShaderPatches = 0x00000100 # Optional
    tessellationEvaluationShaderInvocations = 0x00000200 # Optional
    computeShaderInvocations = 0x00000400 # Optional
  QueryPipelineStatisticFlags* = Flags[QueryPipelineStatisticFlagBits]
  QueryPool* = object of NonDispatchableHandle
  QueryPoolCreateFlags* = Flags[distinct UnusedEnum]
  QueryPoolCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: QueryPoolCreateFlags
    queryType*: QueryType
    queryCount*: uint32
    pipelineStatistics*: QueryPipelineStatisticFlags
  QueryResultFlagBits* {.size: sizeof(int32), pure.} = enum
    vk64 = 0x00000001 # Results of the queries are written to the destination buffer as 64-bit values
    wait = 0x00000002 # Results of the queries are waited on before proceeding with the result copy
    withAvailability = 0x00000004 # Besides the results of the query, the availability of the results is also written
    partial = 0x00000008 # Copy the partial results of the query even if the final results are not available
  QueryResultFlags* = Flags[QueryResultFlagBits]
  QueryType* {.size: sizeof(int32), pure.} = enum
    occlusion = 0
    pipelineStatistics = 1 # Optional
    timestamp = 2
    # Provided by VK_AMD_extension_24
    reserved8 = 1000023008
    # Provided by VK_AMD_extension_25
    reserved4 = 1000024004
    # Provided by VK_EXT_transform_feedback
    transformFeedbackStreamExt = 1000028004
    # Provided by VK_KHR_performance_query
    performanceQueryKhr = 1000116000
    # Provided by VK_KHR_ray_tracing
    accelerationStructureSerializationSizeKhr = 1000150000
    # Provided by VK_KHR_ray_tracing
    accelerationStructureCompactedSizeKhr = 1000165000
    # Provided by VK_INTEL_performance_query
    performanceQueryIntel = 1000210000

  # Buffer commands
  # ---------------
  Buffer* = object of NonDispatchableHandle
  BufferCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    sparseBinding = 0x00000001 # Buffer should support sparse backing
    sparseResidency = 0x00000002 # Buffer should support sparse backing with partial residency
    sparseAliased = 0x00000004 # Buffer should support constent data access to physical memory ranges mapped into multiple locations of sparse buffers
    # Provided by VK_VERSION_1_1
    protected = 0x00000008 # Buffer requires protected memory
    # Provided by VK_VERSION_1_2
    deviceAddressCaptureReplay = 0x00000010
  BufferCreateFlags* = Flags[BufferCreateFlagBits]
  BufferCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: BufferCreateFlags
    size*: DeviceSize
    usage*: BufferUsageFlags
    sharingMode*: SharingMode
    queueFamilyIndexCount*: uint32
    pQueueFamilyIndices*: ptr uint32
  BufferUsageFlagBits* {.size: sizeof(int32), pure.} = enum
    transferSrc = 0x00000001 # Can be used as a source of transfer operations
    transferDst = 0x00000002 # Can be used as a destination of transfer operations
    uniformTexelBuffer = 0x00000004 # Can be used as TBO
    storageTexelBuffer = 0x00000008 # Can be used as IBO
    uniformBuffer = 0x00000010 # Can be used as UBO
    storageBuffer = 0x00000020 # Can be used as SSBO
    indexBuffer = 0x00000040 # Can be used as source of fixed-function index fetch (index buffer)
    vertexBuffer = 0x00000080 # Can be used as source of fixed-function vertex fetch (VBO)
    indirectBuffer = 0x00000100 # Can be the source of indirect parameters (e.g. indirect buffer, parameter buffer)
    # Provided by VK_EXT_conditional_rendering
    conditionalRenderingExt = 0x00000200 # Specifies the buffer can be used as predicate in conditional rendering
    # Provided by VK_KHR_ray_tracing
    rayTracingKhr = 0x00000400
    # Provided by VK_EXT_transform_feedback
    transformFeedbackBufferExt = 0x00000800
    # Provided by VK_EXT_transform_feedback
    transformFeedbackCounterBufferExt = 0x00001000
    # Provided by VK_AMD_extension_25
    reserved13Khr = 0x00002000
    # Provided by VK_AMD_extension_25
    reserved14Khr = 0x00004000
    # Provided by VK_AMD_extension_24
    reserved15Khr = 0x00008000
    # Provided by VK_AMD_extension_24
    reserved16Khr = 0x00010000
    # Provided by VK_VERSION_1_2
    shaderDeviceAddress = 0x00020000
    # Provided by VK_QCOM_extension_173
    reserved18Qcom = 0x00040000
    # Provided by VK_NV_extension_168
    reserved19Khr = 0x00080000
    # Provided by VK_NV_extension_168
    reserved20Khr = 0x00100000
  BufferUsageFlags* = Flags[BufferUsageFlagBits]
  SharingMode* {.size: sizeof(int32), pure.} = enum
    exclusive = 0
    concurrent = 1

  # Buffer view commands
  # --------------------
  BufferView* = object of NonDispatchableHandle
  BufferViewCreateFlags* = Flags[distinct UnusedEnum]
  BufferViewCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: BufferViewCreateFlags
    buffer*: Buffer
    format*: Format
    offset*: DeviceSize
    range*: DeviceSize

  # Image commands
  # --------------
  Image* = object of NonDispatchableHandle
  ImageCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: ImageCreateFlags
    imageType*: ImageType
    format*: Format
    extent*: Extent3D
    mipLevels*: uint32
    arrayLayers*: uint32
    samples*: SampleCountFlagBits
    tiling*: ImageTiling
    usage*: ImageUsageFlags
    sharingMode*: SharingMode
    queueFamilyIndexCount*: uint32
    pQueueFamilyIndices*: ptr uint32
    initialLayout*: ImageLayout
  ImageLayout* {.size: sizeof(int32), pure.} = enum
    undefined = 0 # Implicit layout an image is when its contents are undefined due to various reasons (e.g. right after creation)
    general = 1 # General layout when image can be used for any kind of access
    colorAttachmentOptimal = 2 # Optimal layout when image is only used for color attachment read/write
    depthStencilAttachmentOptimal = 3 # Optimal layout when image is only used for depth/stencil attachment read/write
    depthStencilReadOnlyOptimal = 4 # Optimal layout when image is used for read only depth/stencil attachment and shader access
    shaderReadOnlyOptimal = 5 # Optimal layout when image is used for read only shader access
    transferSrcOptimal = 6 # Optimal layout when image is used only as source of transfer operations
    transferDstOptimal = 7 # Optimal layout when image is used only as destination of transfer operations
    preinitialized = 8 # Initial layout used when the data is populated by the CPU
    # Provided by VK_KHR_swapchain
    presentSrcKhr = 1000001002
    # Provided by VK_KHR_shared_presentable_image
    sharedPresentKhr = 1000111000
    # Provided by VK_VERSION_1_1
    depthReadOnlyStencilAttachmentOptimal = 1000117000
    # Provided by VK_VERSION_1_1
    depthAttachmentStencilReadOnlyOptimal = 1000117001
    # Provided by VK_NV_shading_rate_image
    shadingRateOptimalNv = 1000164003
    # Provided by VK_EXT_fragment_density_map
    fragmentDensityMapOptimalExt = 1000218000
    # Provided by VK_VERSION_1_2
    depthAttachmentOptimal = 1000241000
    # Provided by VK_VERSION_1_2
    depthReadOnlyOptimal = 1000241001
    # Provided by VK_VERSION_1_2
    stencilAttachmentOptimal = 1000241002
    # Provided by VK_VERSION_1_2
    stencilReadOnlyOptimal = 1000241003
  SubresourceLayout* = object
    offset*: DeviceSize
    size*: DeviceSize
    rowPitch*: DeviceSize
    arrayPitch*: DeviceSize
    depthPitch*: DeviceSize

  # Image view commands
  # -------------------
  ComponentMapping* = object
    r*: ComponentSwizzle
    g*: ComponentSwizzle
    b*: ComponentSwizzle
    a*: ComponentSwizzle
  ComponentSwizzle* {.size: sizeof(int32), pure.} = enum
    identity = 0
    zero = 1
    one = 2
    r = 3
    g = 4
    b = 5
    a = 6
  ImageSubresourceRange* = object
    aspectMask*: ImageAspectFlags
    baseMipLevel*: uint32
    levelCount*: uint32
    baseArrayLayer*: uint32
    layerCount*: uint32
  ImageView* = object of NonDispatchableHandle
  ImageViewCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_EXT_fragment_density_map
    fragmentDensityMapDynamicExt = 0x00000001
    # Provided by VK_EXT_fragment_density_map2
    fragmentDensityMapDeferredExt = 0x00000002
  ImageViewCreateFlags* = Flags[ImageViewCreateFlagBits]
  ImageViewCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: ImageViewCreateFlags
    image*: Image
    viewType*: ImageViewType
    format*: Format
    components*: ComponentMapping
    subresourceRange*: ImageSubresourceRange
  ImageViewType* {.size: sizeof(int32), pure.} = enum
    vk1d = 0
    vk2d = 1
    vk3d = 2
    cube = 3
    vk1dArray = 4
    vk2dArray = 5
    cubeArray = 6

  # Shader commands
  # ---------------
  ShaderModule* = object of NonDispatchableHandle
  ShaderModuleCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_NV_extension_52
    reserved0Nv = 0x00000001
  ShaderModuleCreateFlags* = Flags[ShaderModuleCreateFlagBits]
  ShaderModuleCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: ShaderModuleCreateFlags
    codeSize*: uint
    pCode*: ptr uint32

  # Pipeline Cache commands
  # -----------------------
  PipelineCache* = object of NonDispatchableHandle
  PipelineCacheCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_EXT_pipeline_creation_cache_control
    externallySynchronizedExt = 0x00000001
    # Provided by VK_GOOGLE_extension_196
    reserved1Ext = 0x00000002
  PipelineCacheCreateFlags* = Flags[PipelineCacheCreateFlagBits]
  PipelineCacheCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineCacheCreateFlags
    initialDataSize*: uint
    pInitialData*: pointer

  # Pipeline commands
  # -----------------
  BlendFactor* {.size: sizeof(int32), pure.} = enum
    zero = 0
    one = 1
    srcColor = 2
    oneMinusSrcColor = 3
    dstColor = 4
    oneMinusDstColor = 5
    srcAlpha = 6
    oneMinusSrcAlpha = 7
    dstAlpha = 8
    oneMinusDstAlpha = 9
    constantColor = 10
    oneMinusConstantColor = 11
    constantAlpha = 12
    oneMinusConstantAlpha = 13
    srcAlphaSaturate = 14
    src1Color = 15
    oneMinusSrc1Color = 16
    src1Alpha = 17
    oneMinusSrc1Alpha = 18
  BlendOp* {.size: sizeof(int32), pure.} = enum
    add = 0
    subtract = 1
    reverseSubtract = 2
    min = 3
    max = 4
    # Provided by VK_EXT_blend_operation_advanced
    zeroExt = 1000148000
    # Provided by VK_EXT_blend_operation_advanced
    srcExt = 1000148001
    # Provided by VK_EXT_blend_operation_advanced
    dstExt = 1000148002
    # Provided by VK_EXT_blend_operation_advanced
    srcOverExt = 1000148003
    # Provided by VK_EXT_blend_operation_advanced
    dstOverExt = 1000148004
    # Provided by VK_EXT_blend_operation_advanced
    srcInExt = 1000148005
    # Provided by VK_EXT_blend_operation_advanced
    dstInExt = 1000148006
    # Provided by VK_EXT_blend_operation_advanced
    srcOutExt = 1000148007
    # Provided by VK_EXT_blend_operation_advanced
    dstOutExt = 1000148008
    # Provided by VK_EXT_blend_operation_advanced
    srcAtopExt = 1000148009
    # Provided by VK_EXT_blend_operation_advanced
    dstAtopExt = 1000148010
    # Provided by VK_EXT_blend_operation_advanced
    xorExt = 1000148011
    # Provided by VK_EXT_blend_operation_advanced
    multiplyExt = 1000148012
    # Provided by VK_EXT_blend_operation_advanced
    screenExt = 1000148013
    # Provided by VK_EXT_blend_operation_advanced
    overlayExt = 1000148014
    # Provided by VK_EXT_blend_operation_advanced
    darkenExt = 1000148015
    # Provided by VK_EXT_blend_operation_advanced
    lightenExt = 1000148016
    # Provided by VK_EXT_blend_operation_advanced
    colordodgeExt = 1000148017
    # Provided by VK_EXT_blend_operation_advanced
    colorburnExt = 1000148018
    # Provided by VK_EXT_blend_operation_advanced
    hardlightExt = 1000148019
    # Provided by VK_EXT_blend_operation_advanced
    softlightExt = 1000148020
    # Provided by VK_EXT_blend_operation_advanced
    differenceExt = 1000148021
    # Provided by VK_EXT_blend_operation_advanced
    exclusionExt = 1000148022
    # Provided by VK_EXT_blend_operation_advanced
    invertExt = 1000148023
    # Provided by VK_EXT_blend_operation_advanced
    invertRgbExt = 1000148024
    # Provided by VK_EXT_blend_operation_advanced
    lineardodgeExt = 1000148025
    # Provided by VK_EXT_blend_operation_advanced
    linearburnExt = 1000148026
    # Provided by VK_EXT_blend_operation_advanced
    vividlightExt = 1000148027
    # Provided by VK_EXT_blend_operation_advanced
    linearlightExt = 1000148028
    # Provided by VK_EXT_blend_operation_advanced
    pinlightExt = 1000148029
    # Provided by VK_EXT_blend_operation_advanced
    hardmixExt = 1000148030
    # Provided by VK_EXT_blend_operation_advanced
    hslHueExt = 1000148031
    # Provided by VK_EXT_blend_operation_advanced
    hslSaturationExt = 1000148032
    # Provided by VK_EXT_blend_operation_advanced
    hslColorExt = 1000148033
    # Provided by VK_EXT_blend_operation_advanced
    hslLuminosityExt = 1000148034
    # Provided by VK_EXT_blend_operation_advanced
    plusExt = 1000148035
    # Provided by VK_EXT_blend_operation_advanced
    plusClampedExt = 1000148036
    # Provided by VK_EXT_blend_operation_advanced
    plusClampedAlphaExt = 1000148037
    # Provided by VK_EXT_blend_operation_advanced
    plusDarkerExt = 1000148038
    # Provided by VK_EXT_blend_operation_advanced
    minusExt = 1000148039
    # Provided by VK_EXT_blend_operation_advanced
    minusClampedExt = 1000148040
    # Provided by VK_EXT_blend_operation_advanced
    contrastExt = 1000148041
    # Provided by VK_EXT_blend_operation_advanced
    invertOvgExt = 1000148042
    # Provided by VK_EXT_blend_operation_advanced
    redExt = 1000148043
    # Provided by VK_EXT_blend_operation_advanced
    greenExt = 1000148044
    # Provided by VK_EXT_blend_operation_advanced
    blueExt = 1000148045
  ColorComponentFlagBits* {.size: sizeof(int32), pure.} = enum
    r = 0x00000001
    g = 0x00000002
    b = 0x00000004
    a = 0x00000008
  ColorComponentFlags* = Flags[ColorComponentFlagBits]
  CompareOp* {.size: sizeof(int32), pure.} = enum
    never = 0
    less = 1
    equal = 2
    lessOrEqual = 3
    greater = 4
    notEqual = 5
    greaterOrEqual = 6
    always = 7
  ComputePipelineCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineCreateFlags
    stage*: PipelineShaderStageCreateInfo
    layout*: PipelineLayout
    basePipelineHandle*: Pipeline
    basePipelineIndex*: int32
  CullModeFlagBits* {.size: sizeof(int32), pure.} = enum
    none = 0
    front = 0x00000001
    back = 0x00000002
    frontAndBack = 0x00000003
  CullModeFlags* = Flags[CullModeFlagBits]
  DynamicState* {.size: sizeof(int32), pure.} = enum
    viewport = 0
    scissor = 1
    lineWidth = 2
    depthBias = 3
    blendConstants = 4
    depthBounds = 5
    stencilCompareMask = 6
    stencilWriteMask = 7
    stencilReference = 8
    # Provided by VK_NV_clip_space_w_scaling
    viewportWScalingNv = 1000087000
    # Provided by VK_EXT_discard_rectangles
    discardRectangleExt = 1000099000
    # Provided by VK_EXT_sample_locations
    sampleLocationsExt = 1000143000
    # Provided by VK_NV_shading_rate_image
    viewportShadingRatePaletteNv = 1000164004
    # Provided by VK_NV_shading_rate_image
    viewportCoarseSampleOrderNv = 1000164006
    # Provided by VK_NV_scissor_exclusive
    exclusiveScissorNv = 1000205001
    # Provided by VK_EXT_line_rasterization
    lineStippleExt = 1000259000
    # Provided by VK_EXT_extended_dynamic_state
    cullModeExt = 1000267000
    # Provided by VK_EXT_extended_dynamic_state
    frontFaceExt = 1000267001
    # Provided by VK_EXT_extended_dynamic_state
    primitiveTopologyExt = 1000267002
    # Provided by VK_EXT_extended_dynamic_state
    viewportWithCountExt = 1000267003
    # Provided by VK_EXT_extended_dynamic_state
    scissorWithCountExt = 1000267004
    # Provided by VK_EXT_extended_dynamic_state
    vertexInputBindingStrideExt = 1000267005
    # Provided by VK_EXT_extended_dynamic_state
    depthTestEnableExt = 1000267006
    # Provided by VK_EXT_extended_dynamic_state
    depthWriteEnableExt = 1000267007
    # Provided by VK_EXT_extended_dynamic_state
    depthCompareOpExt = 1000267008
    # Provided by VK_EXT_extended_dynamic_state
    depthBoundsTestEnableExt = 1000267009
    # Provided by VK_EXT_extended_dynamic_state
    stencilTestEnableExt = 1000267010
    # Provided by VK_EXT_extended_dynamic_state
    stencilOpExt = 1000267011
  FrontFace* {.size: sizeof(int32), pure.} = enum
    counterClockwise = 0
    clockwise = 1
  GraphicsPipelineCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineCreateFlags
    stageCount*: uint32
    pStages*: ptr PipelineShaderStageCreateInfo
    pVertexInputState*: ptr PipelineVertexInputStateCreateInfo
    pInputAssemblyState*: ptr PipelineInputAssemblyStateCreateInfo
    pTessellationState*: ptr PipelineTessellationStateCreateInfo
    pViewportState*: ptr PipelineViewportStateCreateInfo
    pRasterizationState*: ptr PipelineRasterizationStateCreateInfo
    pMultisampleState*: ptr PipelineMultisampleStateCreateInfo
    pDepthStencilState*: ptr PipelineDepthStencilStateCreateInfo
    pColorBlendState*: ptr PipelineColorBlendStateCreateInfo
    pDynamicState*: ptr PipelineDynamicStateCreateInfo
    layout*: PipelineLayout
    renderPass*: RenderPass
    subpass*: uint32
    basePipelineHandle*: Pipeline
    basePipelineIndex*: int32
  LogicOp* {.size: sizeof(int32), pure.} = enum
    clear = 0
    `and` = 1
    andReverse = 2
    copy = 3
    andInverted = 4
    noOp = 5
    `xor` = 6
    `or` = 7
    nor = 8
    equivalent = 9
    invert = 10
    orReverse = 11
    copyInverted = 12
    orInverted = 13
    nand = 14
    set = 15
  Pipeline* = object of NonDispatchableHandle
  PipelineColorBlendAttachmentState* = object
    blendEnable*: Bool32
    srcColorBlendFactor*: BlendFactor
    dstColorBlendFactor*: BlendFactor
    colorBlendOp*: BlendOp
    srcAlphaBlendFactor*: BlendFactor
    dstAlphaBlendFactor*: BlendFactor
    alphaBlendOp*: BlendOp
    colorWriteMask*: ColorComponentFlags
  PipelineColorBlendStateCreateFlags* = Flags[distinct UnusedEnum]
  PipelineColorBlendStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineColorBlendStateCreateFlags
    logicOpEnable*: Bool32
    logicOp*: LogicOp
    attachmentCount*: uint32
    pAttachments*: ptr PipelineColorBlendAttachmentState
    blendConstants*: array[4, float32]
  PipelineCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    disableOptimization = 0x00000001
    allowDerivatives = 0x00000002
    derivative = 0x00000004
    # Provided by VK_VERSION_1_1
    viewIndexFromDeviceIndex = 0x00000008
    # Provided by VK_VERSION_1_1
    dispatchBase = 0x00000010
    # Provided by VK_NV_ray_tracing
    deferCompileNv = 0x00000020
    # Provided by VK_KHR_pipeline_executable_properties
    captureStatisticsKhr = 0x00000040
    # Provided by VK_KHR_pipeline_executable_properties
    captureInternalRepresentationsKhr = 0x00000080
    # Provided by VK_EXT_pipeline_creation_cache_control
    failOnPipelineCompileRequiredExt = 0x00000100
    # Provided by VK_EXT_pipeline_creation_cache_control
    earlyReturnOnFailureExt = 0x00000200
    # Provided by VK_KHR_pipeline_library
    libraryKhr = 0x00000800
    # Provided by VK_KHR_ray_tracing
    rayTracingSkipTrianglesKhr = 0x00001000
    # Provided by VK_KHR_ray_tracing
    rayTracingSkipAabbsKhr = 0x00002000
    # Provided by VK_KHR_ray_tracing
    rayTracingNoNullAnyHitShadersKhr = 0x00004000
    # Provided by VK_KHR_ray_tracing
    rayTracingNoNullClosestHitShadersKhr = 0x00008000
    # Provided by VK_KHR_ray_tracing
    rayTracingNoNullMissShadersKhr = 0x00010000
    # Provided by VK_KHR_ray_tracing
    rayTracingNoNullIntersectionShadersKhr = 0x00020000
    # Provided by VK_NV_device_generated_commands
    indirectBindableNv = 0x00040000
    # Provided by VK_NV_extension_168
    reserved19Khr = 0x00080000
  PipelineCreateFlags* = Flags[PipelineCreateFlagBits]
  PipelineDepthStencilStateCreateFlags* = Flags[distinct UnusedEnum]
  PipelineDepthStencilStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineDepthStencilStateCreateFlags
    depthTestEnable*: Bool32
    depthWriteEnable*: Bool32
    depthCompareOp*: CompareOp
    depthBoundsTestEnable*: Bool32
    stencilTestEnable*: Bool32
    front*: StencilOpState
    back*: StencilOpState
    minDepthBounds*: float32
    maxDepthBounds*: float32
  PipelineDynamicStateCreateFlags* = Flags[distinct UnusedEnum]
  PipelineDynamicStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineDynamicStateCreateFlags
    dynamicStateCount*: uint32
    pDynamicStates*: ptr DynamicState
  PipelineInputAssemblyStateCreateFlags* = Flags[distinct UnusedEnum]
  PipelineInputAssemblyStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineInputAssemblyStateCreateFlags
    topology*: PrimitiveTopology
    primitiveRestartEnable*: Bool32
  PipelineLayoutCreateFlags* = Flags[distinct UnusedEnum]
  PipelineMultisampleStateCreateFlags* = Flags[distinct UnusedEnum]
  PipelineMultisampleStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineMultisampleStateCreateFlags
    rasterizationSamples*: SampleCountFlagBits
    sampleShadingEnable*: Bool32
    minSampleShading*: float32
    pSampleMask*: ptr SampleMask
    alphaToCoverageEnable*: Bool32
    alphaToOneEnable*: Bool32
  PipelineRasterizationStateCreateFlags* = Flags[distinct UnusedEnum]
  PipelineRasterizationStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineRasterizationStateCreateFlags
    depthClampEnable*: Bool32
    rasterizerDiscardEnable*: Bool32
    polygonMode*: PolygonMode
    cullMode*: CullModeFlags
    frontFace*: FrontFace
    depthBiasEnable*: Bool32
    depthBiasConstantFactor*: float32
    depthBiasClamp*: float32
    depthBiasSlopeFactor*: float32
    lineWidth*: float32
  PipelineShaderStageCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_EXT_subgroup_size_control
    allowVaryingSubgroupSizeExt = 0x00000001
    # Provided by VK_EXT_subgroup_size_control
    requireFullSubgroupsExt = 0x00000002
    # Provided by VK_NV_extension_52
    reserved2Nv = 0x00000004
    # Provided by VK_KHR_extension_297
    reserved3Khr = 0x00000008
  PipelineShaderStageCreateFlags* = Flags[PipelineShaderStageCreateFlagBits]
  PipelineShaderStageCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineShaderStageCreateFlags
    stage*: ShaderStageFlagBits
    module*: ShaderModule
    pName*: cstring
    pSpecializationInfo*: ptr SpecializationInfo
  PipelineTessellationStateCreateFlags* = Flags[distinct UnusedEnum]
  PipelineTessellationStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineTessellationStateCreateFlags
    patchControlPoints*: uint32
  PipelineVertexInputStateCreateFlags* = Flags[distinct UnusedEnum]
  PipelineVertexInputStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineVertexInputStateCreateFlags
    vertexBindingDescriptionCount*: uint32
    pVertexBindingDescriptions*: ptr VertexInputBindingDescription
    vertexAttributeDescriptionCount*: uint32
    pVertexAttributeDescriptions*: ptr VertexInputAttributeDescription
  PipelineViewportStateCreateFlags* = Flags[distinct UnusedEnum]
  PipelineViewportStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineViewportStateCreateFlags
    viewportCount*: uint32
    pViewports*: ptr Viewport
    scissorCount*: uint32
    pScissors*: ptr Rect2D
  PolygonMode* {.size: sizeof(int32), pure.} = enum
    fill = 0
    line = 1
    point = 2
    # Provided by VK_NV_fill_rectangle
    fillRectangleNv = 1000153000
  PrimitiveTopology* {.size: sizeof(int32), pure.} = enum
    pointList = 0
    lineList = 1
    lineStrip = 2
    triangleList = 3
    triangleStrip = 4
    triangleFan = 5
    lineListWithAdjacency = 6
    lineStripWithAdjacency = 7
    triangleListWithAdjacency = 8
    triangleStripWithAdjacency = 9
    patchList = 10
  ShaderStageFlagBits* {.size: sizeof(int32), pure.} = enum
    vertex = 0x00000001
    tessellationControl = 0x00000002
    tessellationEvaluation = 0x00000004
    geometry = 0x00000008
    fragment = 0x00000010
    allGraphics = 0x0000001F
    compute = 0x00000020
    # Provided by VK_NV_mesh_shader
    taskNv = 0x00000040
    # Provided by VK_NV_mesh_shader
    meshNv = 0x00000080
    # Provided by VK_KHR_ray_tracing
    raygenKhr = 0x00000100
    # Provided by VK_KHR_ray_tracing
    anyHitKhr = 0x00000200
    # Provided by VK_KHR_ray_tracing
    closestHitKhr = 0x00000400
    # Provided by VK_KHR_ray_tracing
    missKhr = 0x00000800
    # Provided by VK_KHR_ray_tracing
    intersectionKhr = 0x00001000
    # Provided by VK_KHR_ray_tracing
    callableKhr = 0x00002000
    all = 0x7FFFFFFF
  ShaderStageFlags* = Flags[ShaderStageFlagBits]
  SpecializationInfo* = object
    mapEntryCount*: uint32
    pMapEntries*: ptr SpecializationMapEntry
    dataSize*: uint
    pData*: pointer
  SpecializationMapEntry* = object
    constantID*: uint32
    offset*: uint32
    size*: uint
  StencilOp* {.size: sizeof(int32), pure.} = enum
    keep = 0
    zero = 1
    replace = 2
    incrementAndClamp = 3
    decrementAndClamp = 4
    invert = 5
    incrementAndWrap = 6
    decrementAndWrap = 7
  StencilOpState* = object
    failOp*: StencilOp
    passOp*: StencilOp
    depthFailOp*: StencilOp
    compareOp*: CompareOp
    compareMask*: uint32
    writeMask*: uint32
    reference*: uint32
  VertexInputAttributeDescription* = object
    location*: uint32
    binding*: uint32
    format*: Format
    offset*: uint32
  VertexInputBindingDescription* = object
    binding*: uint32
    stride*: uint32
    inputRate*: VertexInputRate
  VertexInputRate* {.size: sizeof(int32), pure.} = enum
    vertex = 0
    instance = 1
  Viewport* = object
    x*: float32
    y*: float32
    width*: float32
    height*: float32
    minDepth*: float32
    maxDepth*: float32

  # Pipeline layout commands
  # ------------------------
  PipelineLayout* = object of NonDispatchableHandle
  PipelineLayoutCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineLayoutCreateFlags
    setLayoutCount*: uint32
    pSetLayouts*: ptr DescriptorSetLayout
    pushConstantRangeCount*: uint32
    pPushConstantRanges*: ptr PushConstantRange
  PushConstantRange* = object
    stageFlags*: ShaderStageFlags
    offset*: uint32
    size*: uint32

  # Sampler commands
  # ----------------
  BorderColor* {.size: sizeof(int32), pure.} = enum
    floatTransparentBlack = 0
    intTransparentBlack = 1
    floatOpaqueBlack = 2
    intOpaqueBlack = 3
    floatOpaqueWhite = 4
    intOpaqueWhite = 5
    # Provided by VK_EXT_custom_border_color
    floatCustomExt = 1000287003
    # Provided by VK_EXT_custom_border_color
    intCustomExt = 1000287004
  Filter* {.size: sizeof(int32), pure.} = enum
    nearest = 0
    linear = 1
    # Provided by VK_IMG_filter_cubic
    cubicImg = 1000015000
  Sampler* = object of NonDispatchableHandle
  SamplerAddressMode* {.size: sizeof(int32), pure.} = enum
    repeat = 0
    mirroredRepeat = 1
    clampToEdge = 2
    clampToBorder = 3
    # Provided by VK_VERSION_1_2
    mirrorClampToEdge = 4 # No need to add an extnumber attribute, since this uses a core enum value
  SamplerCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_EXT_fragment_density_map
    subsampledExt = 0x00000001
    # Provided by VK_EXT_fragment_density_map
    subsampledCoarseReconstructionExt = 0x00000002
  SamplerCreateFlags* = Flags[SamplerCreateFlagBits]
  SamplerCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: SamplerCreateFlags
    magFilter*: Filter
    minFilter*: Filter
    mipmapMode*: SamplerMipmapMode
    addressModeU*: SamplerAddressMode
    addressModeV*: SamplerAddressMode
    addressModeW*: SamplerAddressMode
    mipLodBias*: float32
    anisotropyEnable*: Bool32
    maxAnisotropy*: float32
    compareEnable*: Bool32
    compareOp*: CompareOp
    minLod*: float32
    maxLod*: float32
    borderColor*: BorderColor
    unnormalizedCoordinates*: Bool32
  SamplerMipmapMode* {.size: sizeof(int32), pure.} = enum
    nearest = 0 # Choose nearest mip level
    linear = 1 # Linear filter between mip levels

  # Descriptor set commands
  # -----------------------
  CopyDescriptorSet* = object
    sType*: StructureType
    pNext*: pointer
    srcSet*: DescriptorSet
    srcBinding*: uint32
    srcArrayElement*: uint32
    dstSet*: DescriptorSet
    dstBinding*: uint32
    dstArrayElement*: uint32
    descriptorCount*: uint32
  DescriptorBufferInfo* = object
    buffer*: Buffer
    offset*: DeviceSize
    range*: DeviceSize
  DescriptorImageInfo* = object
    sampler*: Sampler
    imageView*: ImageView
    imageLayout*: ImageLayout
  DescriptorPool* = object of NonDispatchableHandle
  DescriptorPoolCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    freeDescriptorSet = 0x00000001 # Descriptor sets may be freed individually
    # Provided by VK_VERSION_1_2
    updateAfterBind = 0x00000002
  DescriptorPoolCreateFlags* = Flags[DescriptorPoolCreateFlagBits]
  DescriptorPoolCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DescriptorPoolCreateFlags
    maxSets*: uint32
    poolSizeCount*: uint32
    pPoolSizes*: ptr DescriptorPoolSize
  DescriptorPoolResetFlags* = Flags[distinct UnusedEnum]
  DescriptorPoolSize* = object
    theType*: DescriptorType
    descriptorCount*: uint32
  DescriptorSet* = object of NonDispatchableHandle
  DescriptorSetAllocateInfo* = object
    sType*: StructureType
    pNext*: pointer
    descriptorPool*: DescriptorPool
    descriptorSetCount*: uint32
    pSetLayouts*: ptr DescriptorSetLayout
  DescriptorSetLayout* = object of NonDispatchableHandle
  DescriptorSetLayoutBinding* = object
    binding*: uint32
    descriptorType*: DescriptorType
    descriptorCount*: uint32
    stageFlags*: ShaderStageFlags
    pImmutableSamplers*: ptr Sampler
  DescriptorSetLayoutCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_KHR_push_descriptor
    pushDescriptorKhr = 0x00000001 # Descriptors are pushed via flink:vkCmdPushDescriptorSetKHR
    # Provided by VK_VERSION_1_2
    updateAfterBindPool = 0x00000002
  DescriptorSetLayoutCreateFlags* = Flags[DescriptorSetLayoutCreateFlagBits]
  DescriptorSetLayoutCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DescriptorSetLayoutCreateFlags
    bindingCount*: uint32
    pBindings*: ptr DescriptorSetLayoutBinding
  DescriptorType* {.size: sizeof(int32), pure.} = enum
    sampler = 0
    combinedImageSampler = 1
    sampledImage = 2
    storageImage = 3
    uniformTexelBuffer = 4
    storageTexelBuffer = 5
    uniformBuffer = 6
    storageBuffer = 7
    uniformBufferDynamic = 8
    storageBufferDynamic = 9
    inputAttachment = 10
    # Provided by VK_EXT_inline_uniform_block
    inlineUniformBlockExt = 1000138000
    # Provided by VK_KHR_ray_tracing
    accelerationStructureKhr = 1000165000
  WriteDescriptorSet* = object
    sType*: StructureType
    pNext*: pointer
    dstSet*: DescriptorSet
    dstBinding*: uint32
    dstArrayElement*: uint32
    descriptorCount*: uint32
    descriptorType*: DescriptorType
    pImageInfo*: ptr DescriptorImageInfo
    pBufferInfo*: ptr DescriptorBufferInfo
    pTexelBufferView*: ptr BufferView

  # Pass commands
  # -------------
  AccessFlagBits* {.size: sizeof(int32), pure.} = enum
    indirectCommandRead = 0x00000001 # Controls coherency of indirect command reads
    indexRead = 0x00000002 # Controls coherency of index reads
    vertexAttributeRead = 0x00000004 # Controls coherency of vertex attribute reads
    uniformRead = 0x00000008 # Controls coherency of uniform buffer reads
    inputAttachmentRead = 0x00000010 # Controls coherency of input attachment reads
    shaderRead = 0x00000020 # Controls coherency of shader reads
    shaderWrite = 0x00000040 # Controls coherency of shader writes
    colorAttachmentRead = 0x00000080 # Controls coherency of color attachment reads
    colorAttachmentWrite = 0x00000100 # Controls coherency of color attachment writes
    depthStencilAttachmentRead = 0x00000200 # Controls coherency of depth/stencil attachment reads
    depthStencilAttachmentWrite = 0x00000400 # Controls coherency of depth/stencil attachment writes
    transferRead = 0x00000800 # Controls coherency of transfer reads
    transferWrite = 0x00001000 # Controls coherency of transfer writes
    hostRead = 0x00002000 # Controls coherency of host reads
    hostWrite = 0x00004000 # Controls coherency of host writes
    memoryRead = 0x00008000 # Controls coherency of memory reads
    memoryWrite = 0x00010000 # Controls coherency of memory writes
    # Provided by VK_NV_device_generated_commands
    commandPreprocessReadNv = 0x00020000
    # Provided by VK_NV_device_generated_commands
    commandPreprocessWriteNv = 0x00040000
    # Provided by VK_EXT_blend_operation_advanced
    colorAttachmentReadNoncoherentExt = 0x00080000
    # Provided by VK_EXT_conditional_rendering
    conditionalRenderingReadExt = 0x00100000 # read access flag for reading conditional rendering predicate
    # Provided by VK_KHR_ray_tracing
    accelerationStructureReadKhr = 0x00200000
    # Provided by VK_KHR_ray_tracing
    accelerationStructureWriteKhr = 0x00400000
    # Provided by VK_NV_shading_rate_image
    shadingRateImageReadNv = 0x00800000
    # Provided by VK_EXT_fragment_density_map
    fragmentDensityMapReadExt = 0x01000000
    # Provided by VK_EXT_transform_feedback
    transformFeedbackWriteExt = 0x02000000
    # Provided by VK_EXT_transform_feedback
    transformFeedbackCounterReadExt = 0x04000000
    # Provided by VK_EXT_transform_feedback
    transformFeedbackCounterWriteExt = 0x08000000
    # Provided by VK_AMD_extension_25
    reserved28Khr = 0x10000000
    # Provided by VK_AMD_extension_25
    reserved29Khr = 0x20000000
    # Provided by VK_AMD_extension_24
    reserved30Khr = 0x40000000
  AccessFlags* = Flags[AccessFlagBits]
  AttachmentDescription* = object
    flags*: AttachmentDescriptionFlags
    format*: Format
    samples*: SampleCountFlagBits
    loadOp*: AttachmentLoadOp
    storeOp*: AttachmentStoreOp
    stencilLoadOp*: AttachmentLoadOp
    stencilStoreOp*: AttachmentStoreOp
    initialLayout*: ImageLayout
    finalLayout*: ImageLayout
  AttachmentDescriptionFlagBits* {.size: sizeof(int32), pure.} = enum
    mayAlias = 0x00000001 # The attachment may alias physical memory of another attachment in the same render pass
  AttachmentDescriptionFlags* = Flags[AttachmentDescriptionFlagBits]
  AttachmentLoadOp* {.size: sizeof(int32), pure.} = enum
    load = 0
    clear = 1
    dontCare = 2
  AttachmentReference* = object
    attachment*: uint32
    layout*: ImageLayout
  AttachmentStoreOp* {.size: sizeof(int32), pure.} = enum
    store = 0
    dontCare = 1
    # Provided by VK_QCOM_render_pass_store_ops
    noneQcom = 1000301000
  DependencyFlagBits* {.size: sizeof(int32), pure.} = enum
    byRegion = 0x00000001 # Dependency is per pixel region
    # Provided by VK_VERSION_1_1
    viewLocal = 0x00000002
    # Provided by VK_VERSION_1_1
    deviceGroup = 0x00000004 # Dependency is across devices
  DependencyFlags* = Flags[DependencyFlagBits]
  Framebuffer* = object of NonDispatchableHandle
  FramebufferCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_VERSION_1_2
    imageless = 0x00000001
  FramebufferCreateFlags* = Flags[FramebufferCreateFlagBits]
  FramebufferCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: FramebufferCreateFlags
    renderPass*: RenderPass
    attachmentCount*: uint32
    pAttachments*: ptr ImageView
    width*: uint32
    height*: uint32
    layers*: uint32
  PipelineBindPoint* {.size: sizeof(int32), pure.} = enum
    graphics = 0
    compute = 1
    # Provided by VK_KHR_ray_tracing
    rayTracingKhr = 1000165000
  RenderPass* = object of NonDispatchableHandle
  RenderPassCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_KHR_extension_221
    reserved0Khr = 0x00000001
    # Provided by VK_QCOM_render_pass_transform
    transformQcom = 0x00000002
  RenderPassCreateFlags* = Flags[RenderPassCreateFlagBits]
  RenderPassCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: RenderPassCreateFlags
    attachmentCount*: uint32
    pAttachments*: ptr AttachmentDescription
    subpassCount*: uint32
    pSubpasses*: ptr SubpassDescription
    dependencyCount*: uint32
    pDependencies*: ptr SubpassDependency
  SubpassDependency* = object
    srcSubpass*: uint32
    dstSubpass*: uint32
    srcStageMask*: PipelineStageFlags
    dstStageMask*: PipelineStageFlags
    srcAccessMask*: AccessFlags
    dstAccessMask*: AccessFlags
    dependencyFlags*: DependencyFlags
  SubpassDescription* = object
    flags*: SubpassDescriptionFlags
    pipelineBindPoint*: PipelineBindPoint
    inputAttachmentCount*: uint32
    pInputAttachments*: ptr AttachmentReference
    colorAttachmentCount*: uint32
    pColorAttachments*: ptr AttachmentReference
    pResolveAttachments*: ptr AttachmentReference
    pDepthStencilAttachment*: ptr AttachmentReference
    preserveAttachmentCount*: uint32
    pPreserveAttachments*: ptr uint32
  SubpassDescriptionFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_NVX_multiview_per_view_attributes
    perViewAttributesNvx = 0x00000001
    # Provided by VK_NVX_multiview_per_view_attributes
    perViewPositionXOnlyNvx = 0x00000002
    # Provided by VK_QCOM_render_pass_shader_resolve
    fragmentRegionQcom = 0x00000004
    # Provided by VK_QCOM_render_pass_shader_resolve
    shaderResolveQcom = 0x00000008
  SubpassDescriptionFlags* = Flags[SubpassDescriptionFlagBits]

  # Command pool commands
  # ---------------------
  CommandPool* = object of NonDispatchableHandle
  CommandPoolCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    transient = 0x00000001 # Command buffers have a short lifetime
    resetCommandBuffer = 0x00000002 # Command buffers may release their memory individually
    # Provided by VK_VERSION_1_1
    protected = 0x00000004 # Command buffers allocated from pool are protected command buffers
  CommandPoolCreateFlags* = Flags[CommandPoolCreateFlagBits]
  CommandPoolCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: CommandPoolCreateFlags
    queueFamilyIndex*: uint32
  CommandPoolResetFlagBits* {.size: sizeof(int32), pure.} = enum
    releaseResources = 0x00000001 # Release resources owned by the pool
  CommandPoolResetFlags* = Flags[CommandPoolResetFlagBits]

  # Command buffer commands
  # -----------------------
  CommandBuffer* = object of Handle
  CommandBufferAllocateInfo* = object
    sType*: StructureType
    pNext*: pointer
    commandPool*: CommandPool
    level*: CommandBufferLevel
    commandBufferCount*: uint32
  CommandBufferBeginInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: CommandBufferUsageFlags
    pInheritanceInfo*: ptr CommandBufferInheritanceInfo
  CommandBufferInheritanceInfo* = object
    sType*: StructureType
    pNext*: pointer
    renderPass*: RenderPass
    subpass*: uint32
    framebuffer*: Framebuffer
    occlusionQueryEnable*: Bool32
    queryFlags*: QueryControlFlags
    pipelineStatistics*: QueryPipelineStatisticFlags
  CommandBufferLevel* {.size: sizeof(int32), pure.} = enum
    primary = 0
    secondary = 1
  CommandBufferResetFlagBits* {.size: sizeof(int32), pure.} = enum
    releaseResources = 0x00000001 # Release resources owned by the buffer
  CommandBufferResetFlags* = Flags[CommandBufferResetFlagBits]
  CommandBufferUsageFlagBits* {.size: sizeof(int32), pure.} = enum
    oneTimeSubmit = 0x00000001
    renderPassContinue = 0x00000002
    simultaneousUse = 0x00000004 # Command buffer may be submitted/executed more than once simultaneously
  CommandBufferUsageFlags* = Flags[CommandBufferUsageFlagBits]
  QueryControlFlagBits* {.size: sizeof(int32), pure.} = enum
    precise = 0x00000001 # Require precise results to be collected by the query
  QueryControlFlags* = Flags[QueryControlFlagBits]

  # Command buffer building commands
  # --------------------------------
  BufferCopy* = object
    srcOffset*: DeviceSize
    dstOffset*: DeviceSize
    size*: DeviceSize
  BufferImageCopy* = object
    bufferOffset*: DeviceSize
    bufferRowLength*: uint32
    bufferImageHeight*: uint32
    imageSubresource*: ImageSubresourceLayers
    imageOffset*: Offset3D
    imageExtent*: Extent3D
  ClearAttachment* = object
    aspectMask*: ImageAspectFlags
    colorAttachment*: uint32
    clearValue*: ClearValue
  # Union allowing specification of floating point, integer, or unsigned integer color data. Actual value selected is based on image/attachment being cleared.
  ClearColorValue* {.union.} = object
    float32*: array[4, float32]
    int32*: array[4, int32]
    uint32*: array[4, uint32]
  ClearDepthStencilValue* = object
    depth*: float32
    stencil*: uint32
  ClearRect* = object
    rect*: Rect2D
    baseArrayLayer*: uint32
    layerCount*: uint32
  # Union allowing specification of color or depth and stencil values. Actual value selected is based on attachment being cleared.
  ClearValue* {.union.} = object
    color*: ClearColorValue
    depthStencil*: ClearDepthStencilValue
  ImageBlit* = object
    srcSubresource*: ImageSubresourceLayers
    srcOffsets*: array[2, Offset3D]
    dstSubresource*: ImageSubresourceLayers
    dstOffsets*: array[2, Offset3D]
  ImageCopy* = object
    srcSubresource*: ImageSubresourceLayers
    srcOffset*: Offset3D
    dstSubresource*: ImageSubresourceLayers
    dstOffset*: Offset3D
    extent*: Extent3D
  ImageResolve* = object
    srcSubresource*: ImageSubresourceLayers
    srcOffset*: Offset3D
    dstSubresource*: ImageSubresourceLayers
    dstOffset*: Offset3D
    extent*: Extent3D
  ImageSubresourceLayers* = object
    aspectMask*: ImageAspectFlags
    mipLevel*: uint32
    baseArrayLayer*: uint32
    layerCount*: uint32
  IndexType* {.size: sizeof(int32), pure.} = enum
    uint16 = 0
    uint32 = 1
    # Provided by VK_KHR_ray_tracing
    noneKhr = 1000165000
    # Provided by VK_EXT_index_type_uint8
    uint8Ext = 1000265000
  RenderPassBeginInfo* = object
    sType*: StructureType
    pNext*: pointer
    renderPass*: RenderPass
    framebuffer*: Framebuffer
    renderArea*: Rect2D
    clearValueCount*: uint32
    pClearValues*: ptr ClearValue
  StencilFaceFlagBits* {.size: sizeof(int32), pure.} = enum
    front = 0x00000001 # Front face
    back = 0x00000002 # Back face
    frontAndBack = 0x00000003 # Front and back faces
  StencilFaceFlags* = Flags[StencilFaceFlagBits]
  SubpassContents* {.size: sizeof(int32), pure.} = enum
    inline = 0
    secondaryCommandBuffers = 1

# Header boilerplate
# ------------------
template defineHandle*(ObjectName: untyped) =
  type ObjectName* = distinct Handle
template defineNonDispatchableHandle*(ObjectName: untyped) =
  type ObjectName* = distinct NonDispatchableHandle


# Fundamental types used by many commands and structures
# ------------------------------------------------------


# These types are part of the API, though not directly used in API commands or data structures
# --------------------------------------------------------------------------------------------


# API version macros
# ------------------
template apiVersion*(): untyped = makeVersion(1, 0, 0)
template apiVersion10*(): untyped = makeVersion(1, 0, 0)
template headerVersion*(): untyped = 152
template headerVersionComplete*(): untyped =
  makeVersion(1, 2, headerVersion)
template makeVersion*(major, minor, patch: uint32): untyped =
  ( (major shl 22) or (minor shl 12) or patch )
template versionMajor*(major: uint32): untyped = ( major shl 22 )
template versionMajor*(minor: uint32): untyped = ( minor shl 12 )
template versionPatch*(patch: uint32): untyped = ( patch )


# API constants
# -------------
template nullHandle*(): untyped = ( cast[pointer](0) )


# Device initialization
# ---------------------
var # commands
  createInstanceCage: proc(pCreateInfo: ptr InstanceCreateInfo; pAllocator: ptr AllocationCallbacks; pInstance: ptr Instance;): Result {.cdecl.}
  destroyInstanceCage: proc(instance: Instance; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  enumeratePhysicalDevicesCage: proc(instance: Instance; pPhysicalDeviceCount: ptr uint32; pPhysicalDevices: ptr PhysicalDevice;): Result {.cdecl.}
  getPhysicalDeviceFeaturesCage: proc(physicalDevice: PhysicalDevice; pFeatures: ptr PhysicalDeviceFeatures;): void {.cdecl.}
  getPhysicalDeviceFormatPropertiesCage: proc(physicalDevice: PhysicalDevice; format: Format; pFormatProperties: ptr FormatProperties;): void {.cdecl.}
  getPhysicalDeviceImageFormatPropertiesCage: proc(physicalDevice: PhysicalDevice; format: Format; theType: ImageType; tiling: ImageTiling; usage: ImageUsageFlags; flags: ImageCreateFlags; pImageFormatProperties: ptr ImageFormatProperties;): Result {.cdecl.}
  getPhysicalDevicePropertiesCage: proc(physicalDevice: PhysicalDevice; pProperties: ptr PhysicalDeviceProperties;): void {.cdecl.}
  getPhysicalDeviceQueueFamilyPropertiesCage: proc(physicalDevice: PhysicalDevice; pQueueFamilyPropertyCount: ptr uint32; pQueueFamilyProperties: ptr QueueFamilyProperties;): void {.cdecl.}
  getPhysicalDeviceMemoryPropertiesCage: proc(physicalDevice: PhysicalDevice; pMemoryProperties: ptr PhysicalDeviceMemoryProperties;): void {.cdecl.}
  getInstanceProcAddrCage: proc(instance: Instance; pName: cstring;): VoidFunction {.cdecl.}
  getDeviceProcAddrCage: proc(device: Device; pName: cstring;): VoidFunction {.cdecl.}
proc createInstance*(
      pCreateInfo: ptr InstanceCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pInstance: ptr Instance;
    ): Result {.cdecl, discardable.} =
  createInstanceCage(pCreateInfo,pAllocator,pInstance)
proc destroyInstance*(
      instance: Instance;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyInstanceCage(instance,pAllocator)
proc enumeratePhysicalDevices*(
      instance: Instance;
      pPhysicalDeviceCount: ptr uint32;
      pPhysicalDevices: ptr PhysicalDevice;
    ): Result {.cdecl, discardable.} =
  enumeratePhysicalDevicesCage(instance,pPhysicalDeviceCount,pPhysicalDevices)
proc getPhysicalDeviceFeatures*(
      physicalDevice: PhysicalDevice;
      pFeatures: ptr PhysicalDeviceFeatures;
    ): void {.cdecl.} =
  getPhysicalDeviceFeaturesCage(physicalDevice,pFeatures)
proc getPhysicalDeviceFormatProperties*(
      physicalDevice: PhysicalDevice;
      format: Format;
      pFormatProperties: ptr FormatProperties;
    ): void {.cdecl.} =
  getPhysicalDeviceFormatPropertiesCage(physicalDevice,format,pFormatProperties)
proc getPhysicalDeviceImageFormatProperties*(
      physicalDevice: PhysicalDevice;
      format: Format;
      theType: ImageType;
      tiling: ImageTiling;
      usage: ImageUsageFlags;
      flags: ImageCreateFlags;
      pImageFormatProperties: ptr ImageFormatProperties;
    ): Result {.cdecl, discardable.} =
  getPhysicalDeviceImageFormatPropertiesCage(physicalDevice,format,theType,tiling,usage,flags,pImageFormatProperties)
proc getPhysicalDeviceProperties*(
      physicalDevice: PhysicalDevice;
      pProperties: ptr PhysicalDeviceProperties;
    ): void {.cdecl.} =
  getPhysicalDevicePropertiesCage(physicalDevice,pProperties)
proc getPhysicalDeviceQueueFamilyProperties*(
      physicalDevice: PhysicalDevice;
      pQueueFamilyPropertyCount: ptr uint32;
      pQueueFamilyProperties: ptr QueueFamilyProperties;
    ): void {.cdecl.} =
  getPhysicalDeviceQueueFamilyPropertiesCage(physicalDevice,pQueueFamilyPropertyCount,pQueueFamilyProperties)
proc getPhysicalDeviceMemoryProperties*(
      physicalDevice: PhysicalDevice;
      pMemoryProperties: ptr PhysicalDeviceMemoryProperties;
    ): void {.cdecl.} =
  getPhysicalDeviceMemoryPropertiesCage(physicalDevice,pMemoryProperties)
proc getInstanceProcAddr*(
      instance: Instance;
      pName: cstring;
    ): VoidFunction {.cdecl.} =
  getInstanceProcAddrCage(instance,pName)
proc getDeviceProcAddr*(
      device: Device;
      pName: cstring;
    ): VoidFunction {.cdecl.} =
  getDeviceProcAddrCage(device,pName)


# Device commands
# ---------------
var # commands
  createDeviceCage: proc(physicalDevice: PhysicalDevice; pCreateInfo: ptr DeviceCreateInfo; pAllocator: ptr AllocationCallbacks; pDevice: ptr Device;): Result {.cdecl.}
  destroyDeviceCage: proc(device: Device; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
proc createDevice*(
      physicalDevice: PhysicalDevice;
      pCreateInfo: ptr DeviceCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pDevice: ptr Device;
    ): Result {.cdecl, discardable.} =
  createDeviceCage(physicalDevice,pCreateInfo,pAllocator,pDevice)
proc destroyDevice*(
      device: Device;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyDeviceCage(device,pAllocator)


# Extension discovery commands
# ----------------------------
var # commands
  enumerateInstanceExtensionPropertiesCage: proc(pLayerName: cstring; pPropertyCount: ptr uint32; pProperties: ptr ExtensionProperties;): Result {.cdecl.}
  enumerateDeviceExtensionPropertiesCage: proc(physicalDevice: PhysicalDevice; pLayerName: cstring; pPropertyCount: ptr uint32; pProperties: ptr ExtensionProperties;): Result {.cdecl.}
proc enumerateInstanceExtensionProperties*(
      pLayerName: cstring;
      pPropertyCount: ptr uint32;
      pProperties: ptr ExtensionProperties;
    ): Result {.cdecl, discardable.} =
  enumerateInstanceExtensionPropertiesCage(pLayerName,pPropertyCount,pProperties)
proc enumerateDeviceExtensionProperties*(
      physicalDevice: PhysicalDevice;
      pLayerName: cstring;
      pPropertyCount: ptr uint32;
      pProperties: ptr ExtensionProperties;
    ): Result {.cdecl, discardable.} =
  enumerateDeviceExtensionPropertiesCage(physicalDevice,pLayerName,pPropertyCount,pProperties)


# Layer discovery commands
# ------------------------
var # commands
  enumerateInstanceLayerPropertiesCage: proc(pPropertyCount: ptr uint32; pProperties: ptr LayerProperties;): Result {.cdecl.}
  enumerateDeviceLayerPropertiesCage: proc(physicalDevice: PhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr LayerProperties;): Result {.cdecl.}
proc enumerateInstanceLayerProperties*(
      pPropertyCount: ptr uint32;
      pProperties: ptr LayerProperties;
    ): Result {.cdecl, discardable.} =
  enumerateInstanceLayerPropertiesCage(pPropertyCount,pProperties)
proc enumerateDeviceLayerProperties*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties: ptr LayerProperties;
    ): Result {.cdecl, discardable.} =
  enumerateDeviceLayerPropertiesCage(physicalDevice,pPropertyCount,pProperties)


# Queue commands
# --------------
var # commands
  getDeviceQueueCage: proc(device: Device; queueFamilyIndex: uint32; queueIndex: uint32; pQueue: ptr Queue;): void {.cdecl.}
  queueSubmitCage: proc(queue: Queue; submitCount: uint32; pSubmits: ptr SubmitInfo; fence: Fence;): Result {.cdecl.}
  queueWaitIdleCage: proc(queue: Queue;): Result {.cdecl.}
  deviceWaitIdleCage: proc(device: Device;): Result {.cdecl.}
proc getDeviceQueue*(
      device: Device;
      queueFamilyIndex: uint32;
      queueIndex: uint32;
      pQueue: ptr Queue;
    ): void {.cdecl.} =
  getDeviceQueueCage(device,queueFamilyIndex,queueIndex,pQueue)
proc queueSubmit*(
      queue: Queue;
      submitCount: uint32;
      pSubmits: ptr SubmitInfo;
      fence: Fence;
    ): Result {.cdecl, discardable.} =
  queueSubmitCage(queue,submitCount,pSubmits,fence)
proc queueWaitIdle*(
      queue: Queue;
    ): Result {.cdecl, discardable.} =
  queueWaitIdleCage(queue)
proc deviceWaitIdle*(
      device: Device;
    ): Result {.cdecl, discardable.} =
  deviceWaitIdleCage(device)


# Memory commands
# ---------------
var # commands
  allocateMemoryCage: proc(device: Device; pAllocateInfo: ptr MemoryAllocateInfo; pAllocator: ptr AllocationCallbacks; pMemory: ptr DeviceMemory;): Result {.cdecl.}
  freeMemoryCage: proc(device: Device; memory: DeviceMemory; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  mapMemoryCage: proc(device: Device; memory: DeviceMemory; offset: DeviceSize; size: DeviceSize; flags: MemoryMapFlags; ppData: ptr pointer;): Result {.cdecl.}
  unmapMemoryCage: proc(device: Device; memory: DeviceMemory;): void {.cdecl.}
  flushMappedMemoryRangesCage: proc(device: Device; memoryRangeCount: uint32; pMemoryRanges: ptr MappedMemoryRange;): Result {.cdecl.}
  invalidateMappedMemoryRangesCage: proc(device: Device; memoryRangeCount: uint32; pMemoryRanges: ptr MappedMemoryRange;): Result {.cdecl.}
  getDeviceMemoryCommitmentCage: proc(device: Device; memory: DeviceMemory; pCommittedMemoryInBytes: ptr DeviceSize;): void {.cdecl.}
proc allocateMemory*(
      device: Device;
      pAllocateInfo: ptr MemoryAllocateInfo;
      pAllocator: ptr AllocationCallbacks;
      pMemory: ptr DeviceMemory;
    ): Result {.cdecl, discardable.} =
  allocateMemoryCage(device,pAllocateInfo,pAllocator,pMemory)
proc freeMemory*(
      device: Device;
      memory: DeviceMemory;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  freeMemoryCage(device,memory,pAllocator)
proc mapMemory*(
      device: Device;
      memory: DeviceMemory;
      offset: DeviceSize;
      size: DeviceSize;
      flags: MemoryMapFlags;
      ppData: ptr pointer;
    ): Result {.cdecl, discardable.} =
  mapMemoryCage(device,memory,offset,size,flags,ppData)
proc unmapMemory*(
      device: Device;
      memory: DeviceMemory;
    ): void {.cdecl.} =
  unmapMemoryCage(device,memory)
proc flushMappedMemoryRanges*(
      device: Device;
      memoryRangeCount: uint32;
      pMemoryRanges: ptr MappedMemoryRange;
    ): Result {.cdecl, discardable.} =
  flushMappedMemoryRangesCage(device,memoryRangeCount,pMemoryRanges)
proc invalidateMappedMemoryRanges*(
      device: Device;
      memoryRangeCount: uint32;
      pMemoryRanges: ptr MappedMemoryRange;
    ): Result {.cdecl, discardable.} =
  invalidateMappedMemoryRangesCage(device,memoryRangeCount,pMemoryRanges)
proc getDeviceMemoryCommitment*(
      device: Device;
      memory: DeviceMemory;
      pCommittedMemoryInBytes: ptr DeviceSize;
    ): void {.cdecl.} =
  getDeviceMemoryCommitmentCage(device,memory,pCommittedMemoryInBytes)


# Memory management API commands
# ------------------------------
var # commands
  bindBufferMemoryCage: proc(device: Device; buffer: Buffer; memory: DeviceMemory; memoryOffset: DeviceSize;): Result {.cdecl.}
  bindImageMemoryCage: proc(device: Device; image: Image; memory: DeviceMemory; memoryOffset: DeviceSize;): Result {.cdecl.}
  getBufferMemoryRequirementsCage: proc(device: Device; buffer: Buffer; pMemoryRequirements: ptr MemoryRequirements;): void {.cdecl.}
  getImageMemoryRequirementsCage: proc(device: Device; image: Image; pMemoryRequirements: ptr MemoryRequirements;): void {.cdecl.}
proc bindBufferMemory*(
      device: Device;
      buffer: Buffer;
      memory: DeviceMemory;
      memoryOffset: DeviceSize;
    ): Result {.cdecl, discardable.} =
  bindBufferMemoryCage(device,buffer,memory,memoryOffset)
proc bindImageMemory*(
      device: Device;
      image: Image;
      memory: DeviceMemory;
      memoryOffset: DeviceSize;
    ): Result {.cdecl, discardable.} =
  bindImageMemoryCage(device,image,memory,memoryOffset)
proc getBufferMemoryRequirements*(
      device: Device;
      buffer: Buffer;
      pMemoryRequirements: ptr MemoryRequirements;
    ): void {.cdecl.} =
  getBufferMemoryRequirementsCage(device,buffer,pMemoryRequirements)
proc getImageMemoryRequirements*(
      device: Device;
      image: Image;
      pMemoryRequirements: ptr MemoryRequirements;
    ): void {.cdecl.} =
  getImageMemoryRequirementsCage(device,image,pMemoryRequirements)


# Sparse resource memory management API commands
# ----------------------------------------------
var # commands
  getImageSparseMemoryRequirementsCage: proc(device: Device; image: Image; pSparseMemoryRequirementCount: ptr uint32; pSparseMemoryRequirements: ptr SparseImageMemoryRequirements;): void {.cdecl.}
  getPhysicalDeviceSparseImageFormatPropertiesCage: proc(physicalDevice: PhysicalDevice; format: Format; theType: ImageType; samples: SampleCountFlagBits; usage: ImageUsageFlags; tiling: ImageTiling; pPropertyCount: ptr uint32; pProperties: ptr SparseImageFormatProperties;): void {.cdecl.}
  queueBindSparseCage: proc(queue: Queue; bindInfoCount: uint32; pBindInfo: ptr BindSparseInfo; fence: Fence;): Result {.cdecl.}
proc getImageSparseMemoryRequirements*(
      device: Device;
      image: Image;
      pSparseMemoryRequirementCount: ptr uint32;
      pSparseMemoryRequirements: ptr SparseImageMemoryRequirements;
    ): void {.cdecl.} =
  getImageSparseMemoryRequirementsCage(device,image,pSparseMemoryRequirementCount,pSparseMemoryRequirements)
proc getPhysicalDeviceSparseImageFormatProperties*(
      physicalDevice: PhysicalDevice;
      format: Format;
      theType: ImageType;
      samples: SampleCountFlagBits;
      usage: ImageUsageFlags;
      tiling: ImageTiling;
      pPropertyCount: ptr uint32;
      pProperties: ptr SparseImageFormatProperties;
    ): void {.cdecl.} =
  getPhysicalDeviceSparseImageFormatPropertiesCage(physicalDevice,format,theType,samples,usage,tiling,pPropertyCount,pProperties)
proc queueBindSparse*(
      queue: Queue;
      bindInfoCount: uint32;
      pBindInfo: ptr BindSparseInfo;
      fence: Fence;
    ): Result {.cdecl, discardable.} =
  queueBindSparseCage(queue,bindInfoCount,pBindInfo,fence)


# Fence commands
# --------------
var # commands
  createFenceCage: proc(device: Device; pCreateInfo: ptr FenceCreateInfo; pAllocator: ptr AllocationCallbacks; pFence: ptr Fence;): Result {.cdecl.}
  destroyFenceCage: proc(device: Device; fence: Fence; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  resetFencesCage: proc(device: Device; fenceCount: uint32; pFences: ptr Fence;): Result {.cdecl.}
  getFenceStatusCage: proc(device: Device; fence: Fence;): Result {.cdecl.}
  waitForFencesCage: proc(device: Device; fenceCount: uint32; pFences: ptr Fence; waitAll: Bool32; timeout: uint64;): Result {.cdecl.}
proc createFence*(
      device: Device;
      pCreateInfo: ptr FenceCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pFence: ptr Fence;
    ): Result {.cdecl, discardable.} =
  createFenceCage(device,pCreateInfo,pAllocator,pFence)
proc destroyFence*(
      device: Device;
      fence: Fence;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyFenceCage(device,fence,pAllocator)
proc resetFences*(
      device: Device;
      fenceCount: uint32;
      pFences: ptr Fence;
    ): Result {.cdecl, discardable.} =
  resetFencesCage(device,fenceCount,pFences)
proc getFenceStatus*(
      device: Device;
      fence: Fence;
    ): Result {.cdecl, discardable.} =
  getFenceStatusCage(device,fence)
proc waitForFences*(
      device: Device;
      fenceCount: uint32;
      pFences: ptr Fence;
      waitAll: Bool32;
      timeout: uint64;
    ): Result {.cdecl, discardable.} =
  waitForFencesCage(device,fenceCount,pFences,waitAll,timeout)


# Queue semaphore commands
# ------------------------
var # commands
  createSemaphoreCage: proc(device: Device; pCreateInfo: ptr SemaphoreCreateInfo; pAllocator: ptr AllocationCallbacks; pSemaphore: ptr Semaphore;): Result {.cdecl.}
  destroySemaphoreCage: proc(device: Device; semaphore: Semaphore; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
proc createSemaphore*(
      device: Device;
      pCreateInfo: ptr SemaphoreCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pSemaphore: ptr Semaphore;
    ): Result {.cdecl, discardable.} =
  createSemaphoreCage(device,pCreateInfo,pAllocator,pSemaphore)
proc destroySemaphore*(
      device: Device;
      semaphore: Semaphore;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroySemaphoreCage(device,semaphore,pAllocator)


# Event commands
# --------------
var # commands
  createEventCage: proc(device: Device; pCreateInfo: ptr EventCreateInfo; pAllocator: ptr AllocationCallbacks; pEvent: ptr Event;): Result {.cdecl.}
  destroyEventCage: proc(device: Device; event: Event; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  getEventStatusCage: proc(device: Device; event: Event;): Result {.cdecl.}
  setEventCage: proc(device: Device; event: Event;): Result {.cdecl.}
  resetEventCage: proc(device: Device; event: Event;): Result {.cdecl.}
proc createEvent*(
      device: Device;
      pCreateInfo: ptr EventCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pEvent: ptr Event;
    ): Result {.cdecl, discardable.} =
  createEventCage(device,pCreateInfo,pAllocator,pEvent)
proc destroyEvent*(
      device: Device;
      event: Event;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyEventCage(device,event,pAllocator)
proc getEventStatus*(
      device: Device;
      event: Event;
    ): Result {.cdecl, discardable.} =
  getEventStatusCage(device,event)
proc setEvent*(
      device: Device;
      event: Event;
    ): Result {.cdecl, discardable.} =
  setEventCage(device,event)
proc resetEvent*(
      device: Device;
      event: Event;
    ): Result {.cdecl, discardable.} =
  resetEventCage(device,event)


# Query commands
# --------------
var # commands
  createQueryPoolCage: proc(device: Device; pCreateInfo: ptr QueryPoolCreateInfo; pAllocator: ptr AllocationCallbacks; pQueryPool: ptr QueryPool;): Result {.cdecl.}
  destroyQueryPoolCage: proc(device: Device; queryPool: QueryPool; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  getQueryPoolResultsCage: proc(device: Device; queryPool: QueryPool; firstQuery: uint32; queryCount: uint32; dataSize: uint; pData: pointer; stride: DeviceSize; flags: QueryResultFlags;): Result {.cdecl.}
proc createQueryPool*(
      device: Device;
      pCreateInfo: ptr QueryPoolCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pQueryPool: ptr QueryPool;
    ): Result {.cdecl, discardable.} =
  createQueryPoolCage(device,pCreateInfo,pAllocator,pQueryPool)
proc destroyQueryPool*(
      device: Device;
      queryPool: QueryPool;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyQueryPoolCage(device,queryPool,pAllocator)
proc getQueryPoolResults*(
      device: Device;
      queryPool: QueryPool;
      firstQuery: uint32;
      queryCount: uint32;
      dataSize: uint;
      pData: pointer;
      stride: DeviceSize;
      flags: QueryResultFlags;
    ): Result {.cdecl, discardable.} =
  getQueryPoolResultsCage(device,queryPool,firstQuery,queryCount,dataSize,pData,stride,flags)


# Buffer commands
# ---------------
var # commands
  createBufferCage: proc(device: Device; pCreateInfo: ptr BufferCreateInfo; pAllocator: ptr AllocationCallbacks; pBuffer: ptr Buffer;): Result {.cdecl.}
  destroyBufferCage: proc(device: Device; buffer: Buffer; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
proc createBuffer*(
      device: Device;
      pCreateInfo: ptr BufferCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pBuffer: ptr Buffer;
    ): Result {.cdecl, discardable.} =
  createBufferCage(device,pCreateInfo,pAllocator,pBuffer)
proc destroyBuffer*(
      device: Device;
      buffer: Buffer;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyBufferCage(device,buffer,pAllocator)


# Buffer view commands
# --------------------
var # commands
  createBufferViewCage: proc(device: Device; pCreateInfo: ptr BufferViewCreateInfo; pAllocator: ptr AllocationCallbacks; pView: ptr BufferView;): Result {.cdecl.}
  destroyBufferViewCage: proc(device: Device; bufferView: BufferView; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
proc createBufferView*(
      device: Device;
      pCreateInfo: ptr BufferViewCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pView: ptr BufferView;
    ): Result {.cdecl, discardable.} =
  createBufferViewCage(device,pCreateInfo,pAllocator,pView)
proc destroyBufferView*(
      device: Device;
      bufferView: BufferView;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyBufferViewCage(device,bufferView,pAllocator)


# Image commands
# --------------
var # commands
  createImageCage: proc(device: Device; pCreateInfo: ptr ImageCreateInfo; pAllocator: ptr AllocationCallbacks; pImage: ptr Image;): Result {.cdecl.}
  destroyImageCage: proc(device: Device; image: Image; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  getImageSubresourceLayoutCage: proc(device: Device; image: Image; pSubresource: ptr ImageSubresource; pLayout: ptr SubresourceLayout;): void {.cdecl.}
proc createImage*(
      device: Device;
      pCreateInfo: ptr ImageCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pImage: ptr Image;
    ): Result {.cdecl, discardable.} =
  createImageCage(device,pCreateInfo,pAllocator,pImage)
proc destroyImage*(
      device: Device;
      image: Image;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyImageCage(device,image,pAllocator)
proc getImageSubresourceLayout*(
      device: Device;
      image: Image;
      pSubresource: ptr ImageSubresource;
      pLayout: ptr SubresourceLayout;
    ): void {.cdecl.} =
  getImageSubresourceLayoutCage(device,image,pSubresource,pLayout)


# Image view commands
# -------------------
var # commands
  createImageViewCage: proc(device: Device; pCreateInfo: ptr ImageViewCreateInfo; pAllocator: ptr AllocationCallbacks; pView: ptr ImageView;): Result {.cdecl.}
  destroyImageViewCage: proc(device: Device; imageView: ImageView; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
proc createImageView*(
      device: Device;
      pCreateInfo: ptr ImageViewCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pView: ptr ImageView;
    ): Result {.cdecl, discardable.} =
  createImageViewCage(device,pCreateInfo,pAllocator,pView)
proc destroyImageView*(
      device: Device;
      imageView: ImageView;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyImageViewCage(device,imageView,pAllocator)


# Shader commands
# ---------------
var # commands
  createShaderModuleCage: proc(device: Device; pCreateInfo: ptr ShaderModuleCreateInfo; pAllocator: ptr AllocationCallbacks; pShaderModule: ptr ShaderModule;): Result {.cdecl.}
  destroyShaderModuleCage: proc(device: Device; shaderModule: ShaderModule; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
proc createShaderModule*(
      device: Device;
      pCreateInfo: ptr ShaderModuleCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pShaderModule: ptr ShaderModule;
    ): Result {.cdecl, discardable.} =
  createShaderModuleCage(device,pCreateInfo,pAllocator,pShaderModule)
proc destroyShaderModule*(
      device: Device;
      shaderModule: ShaderModule;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyShaderModuleCage(device,shaderModule,pAllocator)


# Pipeline Cache commands
# -----------------------
var # commands
  createPipelineCacheCage: proc(device: Device; pCreateInfo: ptr PipelineCacheCreateInfo; pAllocator: ptr AllocationCallbacks; pPipelineCache: ptr PipelineCache;): Result {.cdecl.}
  destroyPipelineCacheCage: proc(device: Device; pipelineCache: PipelineCache; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  getPipelineCacheDataCage: proc(device: Device; pipelineCache: PipelineCache; pDataSize: ptr uint; pData: pointer;): Result {.cdecl.}
  mergePipelineCachesCage: proc(device: Device; dstCache: PipelineCache; srcCacheCount: uint32; pSrcCaches: ptr PipelineCache;): Result {.cdecl.}
proc createPipelineCache*(
      device: Device;
      pCreateInfo: ptr PipelineCacheCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pPipelineCache: ptr PipelineCache;
    ): Result {.cdecl, discardable.} =
  createPipelineCacheCage(device,pCreateInfo,pAllocator,pPipelineCache)
proc destroyPipelineCache*(
      device: Device;
      pipelineCache: PipelineCache;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyPipelineCacheCage(device,pipelineCache,pAllocator)
proc getPipelineCacheData*(
      device: Device;
      pipelineCache: PipelineCache;
      pDataSize: ptr uint;
      pData: pointer;
    ): Result {.cdecl, discardable.} =
  getPipelineCacheDataCage(device,pipelineCache,pDataSize,pData)
proc mergePipelineCaches*(
      device: Device;
      dstCache: PipelineCache;
      srcCacheCount: uint32;
      pSrcCaches: ptr PipelineCache;
    ): Result {.cdecl, discardable.} =
  mergePipelineCachesCage(device,dstCache,srcCacheCount,pSrcCaches)


# Pipeline commands
# -----------------
var # commands
  createGraphicsPipelinesCage: proc(device: Device; pipelineCache: PipelineCache; createInfoCount: uint32; pCreateInfos: ptr GraphicsPipelineCreateInfo; pAllocator: ptr AllocationCallbacks; pPipelines: ptr Pipeline;): Result {.cdecl.}
  createComputePipelinesCage: proc(device: Device; pipelineCache: PipelineCache; createInfoCount: uint32; pCreateInfos: ptr ComputePipelineCreateInfo; pAllocator: ptr AllocationCallbacks; pPipelines: ptr Pipeline;): Result {.cdecl.}
  destroyPipelineCage: proc(device: Device; pipeline: Pipeline; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
proc createGraphicsPipelines*(
      device: Device;
      pipelineCache: PipelineCache;
      createInfoCount: uint32;
      pCreateInfos: ptr GraphicsPipelineCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pPipelines: ptr Pipeline;
    ): Result {.cdecl, discardable.} =
  createGraphicsPipelinesCage(device,pipelineCache,createInfoCount,pCreateInfos,pAllocator,pPipelines)
proc createComputePipelines*(
      device: Device;
      pipelineCache: PipelineCache;
      createInfoCount: uint32;
      pCreateInfos: ptr ComputePipelineCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pPipelines: ptr Pipeline;
    ): Result {.cdecl, discardable.} =
  createComputePipelinesCage(device,pipelineCache,createInfoCount,pCreateInfos,pAllocator,pPipelines)
proc destroyPipeline*(
      device: Device;
      pipeline: Pipeline;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyPipelineCage(device,pipeline,pAllocator)


# Pipeline layout commands
# ------------------------
var # commands
  createPipelineLayoutCage: proc(device: Device; pCreateInfo: ptr PipelineLayoutCreateInfo; pAllocator: ptr AllocationCallbacks; pPipelineLayout: ptr PipelineLayout;): Result {.cdecl.}
  destroyPipelineLayoutCage: proc(device: Device; pipelineLayout: PipelineLayout; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
proc createPipelineLayout*(
      device: Device;
      pCreateInfo: ptr PipelineLayoutCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pPipelineLayout: ptr PipelineLayout;
    ): Result {.cdecl, discardable.} =
  createPipelineLayoutCage(device,pCreateInfo,pAllocator,pPipelineLayout)
proc destroyPipelineLayout*(
      device: Device;
      pipelineLayout: PipelineLayout;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyPipelineLayoutCage(device,pipelineLayout,pAllocator)


# Sampler commands
# ----------------
var # commands
  createSamplerCage: proc(device: Device; pCreateInfo: ptr SamplerCreateInfo; pAllocator: ptr AllocationCallbacks; pSampler: ptr Sampler;): Result {.cdecl.}
  destroySamplerCage: proc(device: Device; sampler: Sampler; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
proc createSampler*(
      device: Device;
      pCreateInfo: ptr SamplerCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pSampler: ptr Sampler;
    ): Result {.cdecl, discardable.} =
  createSamplerCage(device,pCreateInfo,pAllocator,pSampler)
proc destroySampler*(
      device: Device;
      sampler: Sampler;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroySamplerCage(device,sampler,pAllocator)


# Descriptor set commands
# -----------------------
var # commands
  createDescriptorSetLayoutCage: proc(device: Device; pCreateInfo: ptr DescriptorSetLayoutCreateInfo; pAllocator: ptr AllocationCallbacks; pSetLayout: ptr DescriptorSetLayout;): Result {.cdecl.}
  destroyDescriptorSetLayoutCage: proc(device: Device; descriptorSetLayout: DescriptorSetLayout; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  createDescriptorPoolCage: proc(device: Device; pCreateInfo: ptr DescriptorPoolCreateInfo; pAllocator: ptr AllocationCallbacks; pDescriptorPool: ptr DescriptorPool;): Result {.cdecl.}
  destroyDescriptorPoolCage: proc(device: Device; descriptorPool: DescriptorPool; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  resetDescriptorPoolCage: proc(device: Device; descriptorPool: DescriptorPool; flags: DescriptorPoolResetFlags;): Result {.cdecl.}
  allocateDescriptorSetsCage: proc(device: Device; pAllocateInfo: ptr DescriptorSetAllocateInfo; pDescriptorSets: ptr DescriptorSet;): Result {.cdecl.}
  freeDescriptorSetsCage: proc(device: Device; descriptorPool: DescriptorPool; descriptorSetCount: uint32; pDescriptorSets: ptr DescriptorSet;): Result {.cdecl.}
  updateDescriptorSetsCage: proc(device: Device; descriptorWriteCount: uint32; pDescriptorWrites: ptr WriteDescriptorSet; descriptorCopyCount: uint32; pDescriptorCopies: ptr CopyDescriptorSet;): void {.cdecl.}
proc createDescriptorSetLayout*(
      device: Device;
      pCreateInfo: ptr DescriptorSetLayoutCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pSetLayout: ptr DescriptorSetLayout;
    ): Result {.cdecl, discardable.} =
  createDescriptorSetLayoutCage(device,pCreateInfo,pAllocator,pSetLayout)
proc destroyDescriptorSetLayout*(
      device: Device;
      descriptorSetLayout: DescriptorSetLayout;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyDescriptorSetLayoutCage(device,descriptorSetLayout,pAllocator)
proc createDescriptorPool*(
      device: Device;
      pCreateInfo: ptr DescriptorPoolCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pDescriptorPool: ptr DescriptorPool;
    ): Result {.cdecl, discardable.} =
  createDescriptorPoolCage(device,pCreateInfo,pAllocator,pDescriptorPool)
proc destroyDescriptorPool*(
      device: Device;
      descriptorPool: DescriptorPool;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyDescriptorPoolCage(device,descriptorPool,pAllocator)
proc resetDescriptorPool*(
      device: Device;
      descriptorPool: DescriptorPool;
      flags: DescriptorPoolResetFlags;
    ): Result {.cdecl, discardable.} =
  resetDescriptorPoolCage(device,descriptorPool,flags)
proc allocateDescriptorSets*(
      device: Device;
      pAllocateInfo: ptr DescriptorSetAllocateInfo;
      pDescriptorSets: ptr DescriptorSet;
    ): Result {.cdecl, discardable.} =
  allocateDescriptorSetsCage(device,pAllocateInfo,pDescriptorSets)
proc freeDescriptorSets*(
      device: Device;
      descriptorPool: DescriptorPool;
      descriptorSetCount: uint32;
      pDescriptorSets: ptr DescriptorSet;
    ): Result {.cdecl, discardable.} =
  freeDescriptorSetsCage(device,descriptorPool,descriptorSetCount,pDescriptorSets)
proc updateDescriptorSets*(
      device: Device;
      descriptorWriteCount: uint32;
      pDescriptorWrites: ptr WriteDescriptorSet;
      descriptorCopyCount: uint32;
      pDescriptorCopies: ptr CopyDescriptorSet;
    ): void {.cdecl.} =
  updateDescriptorSetsCage(device,descriptorWriteCount,pDescriptorWrites,descriptorCopyCount,pDescriptorCopies)


# Pass commands
# -------------
var # commands
  createFramebufferCage: proc(device: Device; pCreateInfo: ptr FramebufferCreateInfo; pAllocator: ptr AllocationCallbacks; pFramebuffer: ptr Framebuffer;): Result {.cdecl.}
  destroyFramebufferCage: proc(device: Device; framebuffer: Framebuffer; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  createRenderPassCage: proc(device: Device; pCreateInfo: ptr RenderPassCreateInfo; pAllocator: ptr AllocationCallbacks; pRenderPass: ptr RenderPass;): Result {.cdecl.}
  destroyRenderPassCage: proc(device: Device; renderPass: RenderPass; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  getRenderAreaGranularityCage: proc(device: Device; renderPass: RenderPass; pGranularity: ptr Extent2D;): void {.cdecl.}
proc createFramebuffer*(
      device: Device;
      pCreateInfo: ptr FramebufferCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pFramebuffer: ptr Framebuffer;
    ): Result {.cdecl, discardable.} =
  createFramebufferCage(device,pCreateInfo,pAllocator,pFramebuffer)
proc destroyFramebuffer*(
      device: Device;
      framebuffer: Framebuffer;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyFramebufferCage(device,framebuffer,pAllocator)
proc createRenderPass*(
      device: Device;
      pCreateInfo: ptr RenderPassCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pRenderPass: ptr RenderPass;
    ): Result {.cdecl, discardable.} =
  createRenderPassCage(device,pCreateInfo,pAllocator,pRenderPass)
proc destroyRenderPass*(
      device: Device;
      renderPass: RenderPass;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyRenderPassCage(device,renderPass,pAllocator)
proc getRenderAreaGranularity*(
      device: Device;
      renderPass: RenderPass;
      pGranularity: ptr Extent2D;
    ): void {.cdecl.} =
  getRenderAreaGranularityCage(device,renderPass,pGranularity)


# Command pool commands
# ---------------------
var # commands
  createCommandPoolCage: proc(device: Device; pCreateInfo: ptr CommandPoolCreateInfo; pAllocator: ptr AllocationCallbacks; pCommandPool: ptr CommandPool;): Result {.cdecl.}
  destroyCommandPoolCage: proc(device: Device; commandPool: CommandPool; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  resetCommandPoolCage: proc(device: Device; commandPool: CommandPool; flags: CommandPoolResetFlags;): Result {.cdecl.}
proc createCommandPool*(
      device: Device;
      pCreateInfo: ptr CommandPoolCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pCommandPool: ptr CommandPool;
    ): Result {.cdecl, discardable.} =
  createCommandPoolCage(device,pCreateInfo,pAllocator,pCommandPool)
proc destroyCommandPool*(
      device: Device;
      commandPool: CommandPool;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyCommandPoolCage(device,commandPool,pAllocator)
proc resetCommandPool*(
      device: Device;
      commandPool: CommandPool;
      flags: CommandPoolResetFlags;
    ): Result {.cdecl, discardable.} =
  resetCommandPoolCage(device,commandPool,flags)


# Command buffer commands
# -----------------------
var # commands
  allocateCommandBuffersCage: proc(device: Device; pAllocateInfo: ptr CommandBufferAllocateInfo; pCommandBuffers: ptr CommandBuffer;): Result {.cdecl.}
  freeCommandBuffersCage: proc(device: Device; commandPool: CommandPool; commandBufferCount: uint32; pCommandBuffers: ptr CommandBuffer;): void {.cdecl.}
  beginCommandBufferCage: proc(commandBuffer: CommandBuffer; pBeginInfo: ptr CommandBufferBeginInfo;): Result {.cdecl.}
  endCommandBufferCage: proc(commandBuffer: CommandBuffer;): Result {.cdecl.}
  resetCommandBufferCage: proc(commandBuffer: CommandBuffer; flags: CommandBufferResetFlags;): Result {.cdecl.}
proc allocateCommandBuffers*(
      device: Device;
      pAllocateInfo: ptr CommandBufferAllocateInfo;
      pCommandBuffers: ptr CommandBuffer;
    ): Result {.cdecl, discardable.} =
  allocateCommandBuffersCage(device,pAllocateInfo,pCommandBuffers)
proc freeCommandBuffers*(
      device: Device;
      commandPool: CommandPool;
      commandBufferCount: uint32;
      pCommandBuffers: ptr CommandBuffer;
    ): void {.cdecl.} =
  freeCommandBuffersCage(device,commandPool,commandBufferCount,pCommandBuffers)
proc beginCommandBuffer*(
      commandBuffer: CommandBuffer;
      pBeginInfo: ptr CommandBufferBeginInfo;
    ): Result {.cdecl, discardable.} =
  beginCommandBufferCage(commandBuffer,pBeginInfo)
proc endCommandBuffer*(
      commandBuffer: CommandBuffer;
    ): Result {.cdecl, discardable.} =
  endCommandBufferCage(commandBuffer)
proc resetCommandBuffer*(
      commandBuffer: CommandBuffer;
      flags: CommandBufferResetFlags;
    ): Result {.cdecl, discardable.} =
  resetCommandBufferCage(commandBuffer,flags)


# Command buffer building commands
# --------------------------------
StencilFaceFlagBits.defineAliases:
  frontAndBack as stencilFrontAndBack # Alias for backwards compatibility

var # commands
  cmdBindPipelineCage: proc(commandBuffer: CommandBuffer; pipelineBindPoint: PipelineBindPoint; pipeline: Pipeline;): void {.cdecl.}
  cmdSetViewportCage: proc(commandBuffer: CommandBuffer; firstViewport: uint32; viewportCount: uint32; pViewports: ptr Viewport;): void {.cdecl.}
  cmdSetScissorCage: proc(commandBuffer: CommandBuffer; firstScissor: uint32; scissorCount: uint32; pScissors: ptr Rect2D;): void {.cdecl.}
  cmdSetLineWidthCage: proc(commandBuffer: CommandBuffer; lineWidth: float32;): void {.cdecl.}
  cmdSetDepthBiasCage: proc(commandBuffer: CommandBuffer; depthBiasConstantFactor: float32; depthBiasClamp: float32; depthBiasSlopeFactor: float32;): void {.cdecl.}
  cmdSetBlendConstantsCage: proc(commandBuffer: CommandBuffer; blendConstants: float32;): void {.cdecl.}
  cmdSetDepthBoundsCage: proc(commandBuffer: CommandBuffer; minDepthBounds: float32; maxDepthBounds: float32;): void {.cdecl.}
  cmdSetStencilCompareMaskCage: proc(commandBuffer: CommandBuffer; faceMask: StencilFaceFlags; compareMask: uint32;): void {.cdecl.}
  cmdSetStencilWriteMaskCage: proc(commandBuffer: CommandBuffer; faceMask: StencilFaceFlags; writeMask: uint32;): void {.cdecl.}
  cmdSetStencilReferenceCage: proc(commandBuffer: CommandBuffer; faceMask: StencilFaceFlags; reference: uint32;): void {.cdecl.}
  cmdBindDescriptorSetsCage: proc(commandBuffer: CommandBuffer; pipelineBindPoint: PipelineBindPoint; layout: PipelineLayout; firstSet: uint32; descriptorSetCount: uint32; pDescriptorSets: ptr DescriptorSet; dynamicOffsetCount: uint32; pDynamicOffsets: ptr uint32;): void {.cdecl.}
  cmdBindIndexBufferCage: proc(commandBuffer: CommandBuffer; buffer: Buffer; offset: DeviceSize; indexType: IndexType;): void {.cdecl.}
  cmdBindVertexBuffersCage: proc(commandBuffer: CommandBuffer; firstBinding: uint32; bindingCount: uint32; pBuffers: ptr Buffer; pOffsets: ptr DeviceSize;): void {.cdecl.}
  cmdDrawCage: proc(commandBuffer: CommandBuffer; vertexCount: uint32; instanceCount: uint32; firstVertex: uint32; firstInstance: uint32;): void {.cdecl.}
  cmdDrawIndexedCage: proc(commandBuffer: CommandBuffer; indexCount: uint32; instanceCount: uint32; firstIndex: uint32; vertexOffset: int32; firstInstance: uint32;): void {.cdecl.}
  cmdDrawIndirectCage: proc(commandBuffer: CommandBuffer; buffer: Buffer; offset: DeviceSize; drawCount: uint32; stride: uint32;): void {.cdecl.}
  cmdDrawIndexedIndirectCage: proc(commandBuffer: CommandBuffer; buffer: Buffer; offset: DeviceSize; drawCount: uint32; stride: uint32;): void {.cdecl.}
  cmdDispatchCage: proc(commandBuffer: CommandBuffer; groupCountX: uint32; groupCountY: uint32; groupCountZ: uint32;): void {.cdecl.}
  cmdDispatchIndirectCage: proc(commandBuffer: CommandBuffer; buffer: Buffer; offset: DeviceSize;): void {.cdecl.}
  cmdCopyBufferCage: proc(commandBuffer: CommandBuffer; srcBuffer: Buffer; dstBuffer: Buffer; regionCount: uint32; pRegions: ptr BufferCopy;): void {.cdecl.}
  cmdCopyImageCage: proc(commandBuffer: CommandBuffer; srcImage: Image; srcImageLayout: ImageLayout; dstImage: Image; dstImageLayout: ImageLayout; regionCount: uint32; pRegions: ptr ImageCopy;): void {.cdecl.}
  cmdBlitImageCage: proc(commandBuffer: CommandBuffer; srcImage: Image; srcImageLayout: ImageLayout; dstImage: Image; dstImageLayout: ImageLayout; regionCount: uint32; pRegions: ptr ImageBlit; filter: Filter;): void {.cdecl.}
  cmdCopyBufferToImageCage: proc(commandBuffer: CommandBuffer; srcBuffer: Buffer; dstImage: Image; dstImageLayout: ImageLayout; regionCount: uint32; pRegions: ptr BufferImageCopy;): void {.cdecl.}
  cmdCopyImageToBufferCage: proc(commandBuffer: CommandBuffer; srcImage: Image; srcImageLayout: ImageLayout; dstBuffer: Buffer; regionCount: uint32; pRegions: ptr BufferImageCopy;): void {.cdecl.}
  cmdUpdateBufferCage: proc(commandBuffer: CommandBuffer; dstBuffer: Buffer; dstOffset: DeviceSize; dataSize: DeviceSize; pData: pointer;): void {.cdecl.}
  cmdFillBufferCage: proc(commandBuffer: CommandBuffer; dstBuffer: Buffer; dstOffset: DeviceSize; size: DeviceSize; data: uint32;): void {.cdecl.}
  cmdClearColorImageCage: proc(commandBuffer: CommandBuffer; image: Image; imageLayout: ImageLayout; pColor: ptr ClearColorValue; rangeCount: uint32; pRanges: ptr ImageSubresourceRange;): void {.cdecl.}
  cmdClearDepthStencilImageCage: proc(commandBuffer: CommandBuffer; image: Image; imageLayout: ImageLayout; pDepthStencil: ptr ClearDepthStencilValue; rangeCount: uint32; pRanges: ptr ImageSubresourceRange;): void {.cdecl.}
  cmdClearAttachmentsCage: proc(commandBuffer: CommandBuffer; attachmentCount: uint32; pAttachments: ptr ClearAttachment; rectCount: uint32; pRects: ptr ClearRect;): void {.cdecl.}
  cmdResolveImageCage: proc(commandBuffer: CommandBuffer; srcImage: Image; srcImageLayout: ImageLayout; dstImage: Image; dstImageLayout: ImageLayout; regionCount: uint32; pRegions: ptr ImageResolve;): void {.cdecl.}
  cmdSetEventCage: proc(commandBuffer: CommandBuffer; event: Event; stageMask: PipelineStageFlags;): void {.cdecl.}
  cmdResetEventCage: proc(commandBuffer: CommandBuffer; event: Event; stageMask: PipelineStageFlags;): void {.cdecl.}
  cmdWaitEventsCage: proc(commandBuffer: CommandBuffer; eventCount: uint32; pEvents: ptr Event; srcStageMask: PipelineStageFlags; dstStageMask: PipelineStageFlags; memoryBarrierCount: uint32; pMemoryBarriers: ptr MemoryBarrier; bufferMemoryBarrierCount: uint32; pBufferMemoryBarriers: ptr BufferMemoryBarrier; imageMemoryBarrierCount: uint32; pImageMemoryBarriers: ptr ImageMemoryBarrier;): void {.cdecl.}
  cmdPipelineBarrierCage: proc(commandBuffer: CommandBuffer; srcStageMask: PipelineStageFlags; dstStageMask: PipelineStageFlags; dependencyFlags: DependencyFlags; memoryBarrierCount: uint32; pMemoryBarriers: ptr MemoryBarrier; bufferMemoryBarrierCount: uint32; pBufferMemoryBarriers: ptr BufferMemoryBarrier; imageMemoryBarrierCount: uint32; pImageMemoryBarriers: ptr ImageMemoryBarrier;): void {.cdecl.}
  cmdBeginQueryCage: proc(commandBuffer: CommandBuffer; queryPool: QueryPool; query: uint32; flags: QueryControlFlags;): void {.cdecl.}
  cmdEndQueryCage: proc(commandBuffer: CommandBuffer; queryPool: QueryPool; query: uint32;): void {.cdecl.}
  cmdResetQueryPoolCage: proc(commandBuffer: CommandBuffer; queryPool: QueryPool; firstQuery: uint32; queryCount: uint32;): void {.cdecl.}
  cmdWriteTimestampCage: proc(commandBuffer: CommandBuffer; pipelineStage: PipelineStageFlagBits; queryPool: QueryPool; query: uint32;): void {.cdecl.}
  cmdCopyQueryPoolResultsCage: proc(commandBuffer: CommandBuffer; queryPool: QueryPool; firstQuery: uint32; queryCount: uint32; dstBuffer: Buffer; dstOffset: DeviceSize; stride: DeviceSize; flags: QueryResultFlags;): void {.cdecl.}
  cmdPushConstantsCage: proc(commandBuffer: CommandBuffer; layout: PipelineLayout; stageFlags: ShaderStageFlags; offset: uint32; size: uint32; pValues: pointer;): void {.cdecl.}
  cmdBeginRenderPassCage: proc(commandBuffer: CommandBuffer; pRenderPassBegin: ptr RenderPassBeginInfo; contents: SubpassContents;): void {.cdecl.}
  cmdNextSubpassCage: proc(commandBuffer: CommandBuffer; contents: SubpassContents;): void {.cdecl.}
  cmdEndRenderPassCage: proc(commandBuffer: CommandBuffer;): void {.cdecl.}
  cmdExecuteCommandsCage: proc(commandBuffer: CommandBuffer; commandBufferCount: uint32; pCommandBuffers: ptr CommandBuffer;): void {.cdecl.}
proc cmdBindPipeline*(
      commandBuffer: CommandBuffer;
      pipelineBindPoint: PipelineBindPoint;
      pipeline: Pipeline;
    ): void {.cdecl.} =
  cmdBindPipelineCage(commandBuffer,pipelineBindPoint,pipeline)
proc cmdSetViewport*(
      commandBuffer: CommandBuffer;
      firstViewport: uint32;
      viewportCount: uint32;
      pViewports: ptr Viewport;
    ): void {.cdecl.} =
  cmdSetViewportCage(commandBuffer,firstViewport,viewportCount,pViewports)
proc cmdSetScissor*(
      commandBuffer: CommandBuffer;
      firstScissor: uint32;
      scissorCount: uint32;
      pScissors: ptr Rect2D;
    ): void {.cdecl.} =
  cmdSetScissorCage(commandBuffer,firstScissor,scissorCount,pScissors)
proc cmdSetLineWidth*(
      commandBuffer: CommandBuffer;
      lineWidth: float32;
    ): void {.cdecl.} =
  cmdSetLineWidthCage(commandBuffer,lineWidth)
proc cmdSetDepthBias*(
      commandBuffer: CommandBuffer;
      depthBiasConstantFactor: float32;
      depthBiasClamp: float32;
      depthBiasSlopeFactor: float32;
    ): void {.cdecl.} =
  cmdSetDepthBiasCage(commandBuffer,depthBiasConstantFactor,depthBiasClamp,depthBiasSlopeFactor)
proc cmdSetBlendConstants*(
      commandBuffer: CommandBuffer;
      blendConstants: float32;
    ): void {.cdecl.} =
  cmdSetBlendConstantsCage(commandBuffer,blendConstants)
proc cmdSetDepthBounds*(
      commandBuffer: CommandBuffer;
      minDepthBounds: float32;
      maxDepthBounds: float32;
    ): void {.cdecl.} =
  cmdSetDepthBoundsCage(commandBuffer,minDepthBounds,maxDepthBounds)
proc cmdSetStencilCompareMask*(
      commandBuffer: CommandBuffer;
      faceMask: StencilFaceFlags;
      compareMask: uint32;
    ): void {.cdecl.} =
  cmdSetStencilCompareMaskCage(commandBuffer,faceMask,compareMask)
proc cmdSetStencilWriteMask*(
      commandBuffer: CommandBuffer;
      faceMask: StencilFaceFlags;
      writeMask: uint32;
    ): void {.cdecl.} =
  cmdSetStencilWriteMaskCage(commandBuffer,faceMask,writeMask)
proc cmdSetStencilReference*(
      commandBuffer: CommandBuffer;
      faceMask: StencilFaceFlags;
      reference: uint32;
    ): void {.cdecl.} =
  cmdSetStencilReferenceCage(commandBuffer,faceMask,reference)
proc cmdBindDescriptorSets*(
      commandBuffer: CommandBuffer;
      pipelineBindPoint: PipelineBindPoint;
      layout: PipelineLayout;
      firstSet: uint32;
      descriptorSetCount: uint32;
      pDescriptorSets: ptr DescriptorSet;
      dynamicOffsetCount: uint32;
      pDynamicOffsets: ptr uint32;
    ): void {.cdecl.} =
  cmdBindDescriptorSetsCage(commandBuffer,pipelineBindPoint,layout,firstSet,descriptorSetCount,pDescriptorSets,dynamicOffsetCount,pDynamicOffsets)
proc cmdBindIndexBuffer*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      indexType: IndexType;
    ): void {.cdecl.} =
  cmdBindIndexBufferCage(commandBuffer,buffer,offset,indexType)
proc cmdBindVertexBuffers*(
      commandBuffer: CommandBuffer;
      firstBinding: uint32;
      bindingCount: uint32;
      pBuffers: ptr Buffer;
      pOffsets: ptr DeviceSize;
    ): void {.cdecl.} =
  cmdBindVertexBuffersCage(commandBuffer,firstBinding,bindingCount,pBuffers,pOffsets)
proc cmdDraw*(
      commandBuffer: CommandBuffer;
      vertexCount: uint32;
      instanceCount: uint32;
      firstVertex: uint32;
      firstInstance: uint32;
    ): void {.cdecl.} =
  cmdDrawCage(commandBuffer,vertexCount,instanceCount,firstVertex,firstInstance)
proc cmdDrawIndexed*(
      commandBuffer: CommandBuffer;
      indexCount: uint32;
      instanceCount: uint32;
      firstIndex: uint32;
      vertexOffset: int32;
      firstInstance: uint32;
    ): void {.cdecl.} =
  cmdDrawIndexedCage(commandBuffer,indexCount,instanceCount,firstIndex,vertexOffset,firstInstance)
proc cmdDrawIndirect*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      drawCount: uint32;
      stride: uint32;
    ): void {.cdecl.} =
  cmdDrawIndirectCage(commandBuffer,buffer,offset,drawCount,stride)
proc cmdDrawIndexedIndirect*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      drawCount: uint32;
      stride: uint32;
    ): void {.cdecl.} =
  cmdDrawIndexedIndirectCage(commandBuffer,buffer,offset,drawCount,stride)
proc cmdDispatch*(
      commandBuffer: CommandBuffer;
      groupCountX: uint32;
      groupCountY: uint32;
      groupCountZ: uint32;
    ): void {.cdecl.} =
  cmdDispatchCage(commandBuffer,groupCountX,groupCountY,groupCountZ)
proc cmdDispatchIndirect*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
    ): void {.cdecl.} =
  cmdDispatchIndirectCage(commandBuffer,buffer,offset)
proc cmdCopyBuffer*(
      commandBuffer: CommandBuffer;
      srcBuffer: Buffer;
      dstBuffer: Buffer;
      regionCount: uint32;
      pRegions: ptr BufferCopy;
    ): void {.cdecl.} =
  cmdCopyBufferCage(commandBuffer,srcBuffer,dstBuffer,regionCount,pRegions)
proc cmdCopyImage*(
      commandBuffer: CommandBuffer;
      srcImage: Image;
      srcImageLayout: ImageLayout;
      dstImage: Image;
      dstImageLayout: ImageLayout;
      regionCount: uint32;
      pRegions: ptr ImageCopy;
    ): void {.cdecl.} =
  cmdCopyImageCage(commandBuffer,srcImage,srcImageLayout,dstImage,dstImageLayout,regionCount,pRegions)
proc cmdBlitImage*(
      commandBuffer: CommandBuffer;
      srcImage: Image;
      srcImageLayout: ImageLayout;
      dstImage: Image;
      dstImageLayout: ImageLayout;
      regionCount: uint32;
      pRegions: ptr ImageBlit;
      filter: Filter;
    ): void {.cdecl.} =
  cmdBlitImageCage(commandBuffer,srcImage,srcImageLayout,dstImage,dstImageLayout,regionCount,pRegions,filter)
proc cmdCopyBufferToImage*(
      commandBuffer: CommandBuffer;
      srcBuffer: Buffer;
      dstImage: Image;
      dstImageLayout: ImageLayout;
      regionCount: uint32;
      pRegions: ptr BufferImageCopy;
    ): void {.cdecl.} =
  cmdCopyBufferToImageCage(commandBuffer,srcBuffer,dstImage,dstImageLayout,regionCount,pRegions)
proc cmdCopyImageToBuffer*(
      commandBuffer: CommandBuffer;
      srcImage: Image;
      srcImageLayout: ImageLayout;
      dstBuffer: Buffer;
      regionCount: uint32;
      pRegions: ptr BufferImageCopy;
    ): void {.cdecl.} =
  cmdCopyImageToBufferCage(commandBuffer,srcImage,srcImageLayout,dstBuffer,regionCount,pRegions)
proc cmdUpdateBuffer*(
      commandBuffer: CommandBuffer;
      dstBuffer: Buffer;
      dstOffset: DeviceSize;
      dataSize: DeviceSize;
      pData: pointer;
    ): void {.cdecl.} =
  cmdUpdateBufferCage(commandBuffer,dstBuffer,dstOffset,dataSize,pData)
proc cmdFillBuffer*(
      commandBuffer: CommandBuffer;
      dstBuffer: Buffer;
      dstOffset: DeviceSize;
      size: DeviceSize;
      data: uint32;
    ): void {.cdecl.} =
  cmdFillBufferCage(commandBuffer,dstBuffer,dstOffset,size,data)
proc cmdClearColorImage*(
      commandBuffer: CommandBuffer;
      image: Image;
      imageLayout: ImageLayout;
      pColor: ptr ClearColorValue;
      rangeCount: uint32;
      pRanges: ptr ImageSubresourceRange;
    ): void {.cdecl.} =
  cmdClearColorImageCage(commandBuffer,image,imageLayout,pColor,rangeCount,pRanges)
proc cmdClearDepthStencilImage*(
      commandBuffer: CommandBuffer;
      image: Image;
      imageLayout: ImageLayout;
      pDepthStencil: ptr ClearDepthStencilValue;
      rangeCount: uint32;
      pRanges: ptr ImageSubresourceRange;
    ): void {.cdecl.} =
  cmdClearDepthStencilImageCage(commandBuffer,image,imageLayout,pDepthStencil,rangeCount,pRanges)
proc cmdClearAttachments*(
      commandBuffer: CommandBuffer;
      attachmentCount: uint32;
      pAttachments: ptr ClearAttachment;
      rectCount: uint32;
      pRects: ptr ClearRect;
    ): void {.cdecl.} =
  cmdClearAttachmentsCage(commandBuffer,attachmentCount,pAttachments,rectCount,pRects)
proc cmdResolveImage*(
      commandBuffer: CommandBuffer;
      srcImage: Image;
      srcImageLayout: ImageLayout;
      dstImage: Image;
      dstImageLayout: ImageLayout;
      regionCount: uint32;
      pRegions: ptr ImageResolve;
    ): void {.cdecl.} =
  cmdResolveImageCage(commandBuffer,srcImage,srcImageLayout,dstImage,dstImageLayout,regionCount,pRegions)
proc cmdSetEvent*(
      commandBuffer: CommandBuffer;
      event: Event;
      stageMask: PipelineStageFlags;
    ): void {.cdecl.} =
  cmdSetEventCage(commandBuffer,event,stageMask)
proc cmdResetEvent*(
      commandBuffer: CommandBuffer;
      event: Event;
      stageMask: PipelineStageFlags;
    ): void {.cdecl.} =
  cmdResetEventCage(commandBuffer,event,stageMask)
proc cmdWaitEvents*(
      commandBuffer: CommandBuffer;
      eventCount: uint32;
      pEvents: ptr Event;
      srcStageMask: PipelineStageFlags;
      dstStageMask: PipelineStageFlags;
      memoryBarrierCount: uint32;
      pMemoryBarriers: ptr MemoryBarrier;
      bufferMemoryBarrierCount: uint32;
      pBufferMemoryBarriers: ptr BufferMemoryBarrier;
      imageMemoryBarrierCount: uint32;
      pImageMemoryBarriers: ptr ImageMemoryBarrier;
    ): void {.cdecl.} =
  cmdWaitEventsCage(commandBuffer,eventCount,pEvents,srcStageMask,dstStageMask,memoryBarrierCount,pMemoryBarriers,bufferMemoryBarrierCount,pBufferMemoryBarriers,imageMemoryBarrierCount,pImageMemoryBarriers)
proc cmdPipelineBarrier*(
      commandBuffer: CommandBuffer;
      srcStageMask: PipelineStageFlags;
      dstStageMask: PipelineStageFlags;
      dependencyFlags: DependencyFlags;
      memoryBarrierCount: uint32;
      pMemoryBarriers: ptr MemoryBarrier;
      bufferMemoryBarrierCount: uint32;
      pBufferMemoryBarriers: ptr BufferMemoryBarrier;
      imageMemoryBarrierCount: uint32;
      pImageMemoryBarriers: ptr ImageMemoryBarrier;
    ): void {.cdecl.} =
  cmdPipelineBarrierCage(commandBuffer,srcStageMask,dstStageMask,dependencyFlags,memoryBarrierCount,pMemoryBarriers,bufferMemoryBarrierCount,pBufferMemoryBarriers,imageMemoryBarrierCount,pImageMemoryBarriers)
proc cmdBeginQuery*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      query: uint32;
      flags: QueryControlFlags;
    ): void {.cdecl.} =
  cmdBeginQueryCage(commandBuffer,queryPool,query,flags)
proc cmdEndQuery*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      query: uint32;
    ): void {.cdecl.} =
  cmdEndQueryCage(commandBuffer,queryPool,query)
proc cmdResetQueryPool*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      firstQuery: uint32;
      queryCount: uint32;
    ): void {.cdecl.} =
  cmdResetQueryPoolCage(commandBuffer,queryPool,firstQuery,queryCount)
proc cmdWriteTimestamp*(
      commandBuffer: CommandBuffer;
      pipelineStage: PipelineStageFlagBits;
      queryPool: QueryPool;
      query: uint32;
    ): void {.cdecl.} =
  cmdWriteTimestampCage(commandBuffer,pipelineStage,queryPool,query)
proc cmdCopyQueryPoolResults*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      firstQuery: uint32;
      queryCount: uint32;
      dstBuffer: Buffer;
      dstOffset: DeviceSize;
      stride: DeviceSize;
      flags: QueryResultFlags;
    ): void {.cdecl.} =
  cmdCopyQueryPoolResultsCage(commandBuffer,queryPool,firstQuery,queryCount,dstBuffer,dstOffset,stride,flags)
proc cmdPushConstants*(
      commandBuffer: CommandBuffer;
      layout: PipelineLayout;
      stageFlags: ShaderStageFlags;
      offset: uint32;
      size: uint32;
      pValues: pointer;
    ): void {.cdecl.} =
  cmdPushConstantsCage(commandBuffer,layout,stageFlags,offset,size,pValues)
proc cmdBeginRenderPass*(
      commandBuffer: CommandBuffer;
      pRenderPassBegin: ptr RenderPassBeginInfo;
      contents: SubpassContents;
    ): void {.cdecl.} =
  cmdBeginRenderPassCage(commandBuffer,pRenderPassBegin,contents)
proc cmdNextSubpass*(
      commandBuffer: CommandBuffer;
      contents: SubpassContents;
    ): void {.cdecl.} =
  cmdNextSubpassCage(commandBuffer,contents)
proc cmdEndRenderPass*(
      commandBuffer: CommandBuffer;
    ): void {.cdecl.} =
  cmdEndRenderPassCage(commandBuffer)
proc cmdExecuteCommands*(
      commandBuffer: CommandBuffer;
      commandBufferCount: uint32;
      pCommandBuffers: ptr CommandBuffer;
    ): void {.cdecl.} =
  cmdExecuteCommandsCage(commandBuffer,commandBufferCount,pCommandBuffers)
proc loadInstanceProcs*() =
  Handle().defineLoader(`<<`)
  getInstanceProcAddrCage << "vkGetInstanceAddr"
  enumerateInstanceExtensionPropertiesCage << "vkEnumerateInstanceExtensionProperties"
  enumerateInstanceLayerPropertiesCage << "vkEnumerateInstanceLayerProperties"
  createInstanceCage << "vkCreateInstance"

proc loadVk10*(instance: Instance) =
  instance.defineLoader(`<<`)

  # Device initialization
  createInstanceCage << "vkCreateInstance"
  destroyInstanceCage << "vkDestroyInstance"
  enumeratePhysicalDevicesCage << "vkEnumeratePhysicalDevices"
  getPhysicalDeviceFeaturesCage << "vkGetPhysicalDeviceFeatures"
  getPhysicalDeviceFormatPropertiesCage << "vkGetPhysicalDeviceFormatProperties"
  getPhysicalDeviceImageFormatPropertiesCage << "vkGetPhysicalDeviceImageFormatProperties"
  getPhysicalDevicePropertiesCage << "vkGetPhysicalDeviceProperties"
  getPhysicalDeviceQueueFamilyPropertiesCage << "vkGetPhysicalDeviceQueueFamilyProperties"
  getPhysicalDeviceMemoryPropertiesCage << "vkGetPhysicalDeviceMemoryProperties"
  getInstanceProcAddrCage << "vkGetInstanceProcAddr"
  getDeviceProcAddrCage << "vkGetDeviceProcAddr"

  # Device commands
  createDeviceCage << "vkCreateDevice"
  destroyDeviceCage << "vkDestroyDevice"

  # Extension discovery commands
  enumerateInstanceExtensionPropertiesCage << "vkEnumerateInstanceExtensionProperties"
  enumerateDeviceExtensionPropertiesCage << "vkEnumerateDeviceExtensionProperties"

  # Layer discovery commands
  enumerateInstanceLayerPropertiesCage << "vkEnumerateInstanceLayerProperties"
  enumerateDeviceLayerPropertiesCage << "vkEnumerateDeviceLayerProperties"

  # Queue commands
  getDeviceQueueCage << "vkGetDeviceQueue"
  queueSubmitCage << "vkQueueSubmit"
  queueWaitIdleCage << "vkQueueWaitIdle"
  deviceWaitIdleCage << "vkDeviceWaitIdle"

  # Memory commands
  allocateMemoryCage << "vkAllocateMemory"
  freeMemoryCage << "vkFreeMemory"
  mapMemoryCage << "vkMapMemory"
  unmapMemoryCage << "vkUnmapMemory"
  flushMappedMemoryRangesCage << "vkFlushMappedMemoryRanges"
  invalidateMappedMemoryRangesCage << "vkInvalidateMappedMemoryRanges"
  getDeviceMemoryCommitmentCage << "vkGetDeviceMemoryCommitment"

  # Memory management API commands
  bindBufferMemoryCage << "vkBindBufferMemory"
  bindImageMemoryCage << "vkBindImageMemory"
  getBufferMemoryRequirementsCage << "vkGetBufferMemoryRequirements"
  getImageMemoryRequirementsCage << "vkGetImageMemoryRequirements"

  # Sparse resource memory management API commands
  getImageSparseMemoryRequirementsCage << "vkGetImageSparseMemoryRequirements"
  getPhysicalDeviceSparseImageFormatPropertiesCage << "vkGetPhysicalDeviceSparseImageFormatProperties"
  queueBindSparseCage << "vkQueueBindSparse"

  # Fence commands
  createFenceCage << "vkCreateFence"
  destroyFenceCage << "vkDestroyFence"
  resetFencesCage << "vkResetFences"
  getFenceStatusCage << "vkGetFenceStatus"
  waitForFencesCage << "vkWaitForFences"

  # Queue semaphore commands
  createSemaphoreCage << "vkCreateSemaphore"
  destroySemaphoreCage << "vkDestroySemaphore"

  # Event commands
  createEventCage << "vkCreateEvent"
  destroyEventCage << "vkDestroyEvent"
  getEventStatusCage << "vkGetEventStatus"
  setEventCage << "vkSetEvent"
  resetEventCage << "vkResetEvent"

  # Query commands
  createQueryPoolCage << "vkCreateQueryPool"
  destroyQueryPoolCage << "vkDestroyQueryPool"
  getQueryPoolResultsCage << "vkGetQueryPoolResults"

  # Buffer commands
  createBufferCage << "vkCreateBuffer"
  destroyBufferCage << "vkDestroyBuffer"

  # Buffer view commands
  createBufferViewCage << "vkCreateBufferView"
  destroyBufferViewCage << "vkDestroyBufferView"

  # Image commands
  createImageCage << "vkCreateImage"
  destroyImageCage << "vkDestroyImage"
  getImageSubresourceLayoutCage << "vkGetImageSubresourceLayout"

  # Image view commands
  createImageViewCage << "vkCreateImageView"
  destroyImageViewCage << "vkDestroyImageView"

  # Shader commands
  createShaderModuleCage << "vkCreateShaderModule"
  destroyShaderModuleCage << "vkDestroyShaderModule"

  # Pipeline Cache commands
  createPipelineCacheCage << "vkCreatePipelineCache"
  destroyPipelineCacheCage << "vkDestroyPipelineCache"
  getPipelineCacheDataCage << "vkGetPipelineCacheData"
  mergePipelineCachesCage << "vkMergePipelineCaches"

  # Pipeline commands
  createGraphicsPipelinesCage << "vkCreateGraphicsPipelines"
  createComputePipelinesCage << "vkCreateComputePipelines"
  destroyPipelineCage << "vkDestroyPipeline"

  # Pipeline layout commands
  createPipelineLayoutCage << "vkCreatePipelineLayout"
  destroyPipelineLayoutCage << "vkDestroyPipelineLayout"

  # Sampler commands
  createSamplerCage << "vkCreateSampler"
  destroySamplerCage << "vkDestroySampler"

  # Descriptor set commands
  createDescriptorSetLayoutCage << "vkCreateDescriptorSetLayout"
  destroyDescriptorSetLayoutCage << "vkDestroyDescriptorSetLayout"
  createDescriptorPoolCage << "vkCreateDescriptorPool"
  destroyDescriptorPoolCage << "vkDestroyDescriptorPool"
  resetDescriptorPoolCage << "vkResetDescriptorPool"
  allocateDescriptorSetsCage << "vkAllocateDescriptorSets"
  freeDescriptorSetsCage << "vkFreeDescriptorSets"
  updateDescriptorSetsCage << "vkUpdateDescriptorSets"

  # Pass commands
  createFramebufferCage << "vkCreateFramebuffer"
  destroyFramebufferCage << "vkDestroyFramebuffer"
  createRenderPassCage << "vkCreateRenderPass"
  destroyRenderPassCage << "vkDestroyRenderPass"
  getRenderAreaGranularityCage << "vkGetRenderAreaGranularity"

  # Command pool commands
  createCommandPoolCage << "vkCreateCommandPool"
  destroyCommandPoolCage << "vkDestroyCommandPool"
  resetCommandPoolCage << "vkResetCommandPool"

  # Command buffer commands
  allocateCommandBuffersCage << "vkAllocateCommandBuffers"
  freeCommandBuffersCage << "vkFreeCommandBuffers"
  beginCommandBufferCage << "vkBeginCommandBuffer"
  endCommandBufferCage << "vkEndCommandBuffer"
  resetCommandBufferCage << "vkResetCommandBuffer"

  # Command buffer building commands
  cmdBindPipelineCage << "vkCmdBindPipeline"
  cmdSetViewportCage << "vkCmdSetViewport"
  cmdSetScissorCage << "vkCmdSetScissor"
  cmdSetLineWidthCage << "vkCmdSetLineWidth"
  cmdSetDepthBiasCage << "vkCmdSetDepthBias"
  cmdSetBlendConstantsCage << "vkCmdSetBlendConstants"
  cmdSetDepthBoundsCage << "vkCmdSetDepthBounds"
  cmdSetStencilCompareMaskCage << "vkCmdSetStencilCompareMask"
  cmdSetStencilWriteMaskCage << "vkCmdSetStencilWriteMask"
  cmdSetStencilReferenceCage << "vkCmdSetStencilReference"
  cmdBindDescriptorSetsCage << "vkCmdBindDescriptorSets"
  cmdBindIndexBufferCage << "vkCmdBindIndexBuffer"
  cmdBindVertexBuffersCage << "vkCmdBindVertexBuffers"
  cmdDrawCage << "vkCmdDraw"
  cmdDrawIndexedCage << "vkCmdDrawIndexed"
  cmdDrawIndirectCage << "vkCmdDrawIndirect"
  cmdDrawIndexedIndirectCage << "vkCmdDrawIndexedIndirect"
  cmdDispatchCage << "vkCmdDispatch"
  cmdDispatchIndirectCage << "vkCmdDispatchIndirect"
  cmdCopyBufferCage << "vkCmdCopyBuffer"
  cmdCopyImageCage << "vkCmdCopyImage"
  cmdBlitImageCage << "vkCmdBlitImage"
  cmdCopyBufferToImageCage << "vkCmdCopyBufferToImage"
  cmdCopyImageToBufferCage << "vkCmdCopyImageToBuffer"
  cmdUpdateBufferCage << "vkCmdUpdateBuffer"
  cmdFillBufferCage << "vkCmdFillBuffer"
  cmdClearColorImageCage << "vkCmdClearColorImage"
  cmdClearDepthStencilImageCage << "vkCmdClearDepthStencilImage"
  cmdClearAttachmentsCage << "vkCmdClearAttachments"
  cmdResolveImageCage << "vkCmdResolveImage"
  cmdSetEventCage << "vkCmdSetEvent"
  cmdResetEventCage << "vkCmdResetEvent"
  cmdWaitEventsCage << "vkCmdWaitEvents"
  cmdPipelineBarrierCage << "vkCmdPipelineBarrier"
  cmdBeginQueryCage << "vkCmdBeginQuery"
  cmdEndQueryCage << "vkCmdEndQuery"
  cmdResetQueryPoolCage << "vkCmdResetQueryPool"
  cmdWriteTimestampCage << "vkCmdWriteTimestamp"
  cmdCopyQueryPoolResultsCage << "vkCmdCopyQueryPoolResults"
  cmdPushConstantsCage << "vkCmdPushConstants"
  cmdBeginRenderPassCage << "vkCmdBeginRenderPass"
  cmdNextSubpassCage << "vkCmdNextSubpass"
  cmdEndRenderPassCage << "vkCmdEndRenderPass"
  cmdExecuteCommandsCage << "vkCmdExecuteCommands"

# Bitmask operations
# Utility for bitmask operation added independently
# =================================================

import macros
import strformat
import strutils
import sets

proc `==`*[Flagbits: enum](a, b: Flags[Flagbits]): bool =
  a.uint32 == b.uint32

macro `toFlagSets`*[Flagbits: enum](Type: typedesc[Flagbits]; bits: varargs[untyped]): HashSet[Flagbits] =
  if (repr Type).find("FlagBits") == -1:
    macros.error("Expect the enum that has the suffix Flagbits, got " & repr Type)
  # var resultStr = "{DebugUtilsMessageSeverityFlagBitsEXT.VerboseBitExt}"
  var resultStr = "toHashSet(["
  for bit in bits: resultStr.add "{repr Type}.{bit},".fmt
  resultStr.add "])"
  return resultStr.parseStmt
template `{}`*[Flagbits: enum](Type: typedesc[Flagbits]; bits: varargs[untyped]): HashSet[Flagbits] =
  Type.toFlagSets(bits)

proc `toFlagSets`*[Flagbits: enum](flags: Flags[Flagbits]): HashSet[Flagbits] =
  var val = 1.uint32
  let flags = flags.uint32
  while val <= flags:
    if (val and flags) != 0:
      result.incl Flagbits(val)
    val = val shl 1
template `{}`*[Flagbits: enum](flags: Flags[Flagbits]): HashSet[Flagbits] =
  flags.toFlagSets

proc `toFlags`*[Flagbits: enum](flagsets: HashSet[Flagbits]): Flags[Flagbits] =
  for flagset in flagsets:
    result = result or flagset
proc `<+>`*[Flagbits: enum](flagsets: HashSet[Flagbits]): Flags[Flagbits] =
  flagsets.toFlags

proc `toFlags`*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  Flags[Flagbits](flagbits)
proc `<+>`*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  flagbits.toFlags

proc `all`*[Flagbits: enum](Type: typedesc[Flags[Flagbits]]): Flags[Flagbits] =
  Flags[Flagbits](Flagbits.high.ord.shl(1) - 1)
proc `all`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] = flags.typeof.all
proc `all`*[Flagbits: enum](Type: typedesc[HashSet[Flagbits]]): HashSet[Flagbits] = Flags[Flagbits].all.toFlagSets
proc `all`*[Flagbits: enum](flagsets: HashSet[Flagbits]): HashSet[Flagbits] = flagsets.typeof.all

proc `none`*[Flagbits: enum](Type: typedesc[HashSet[Flagbits]]): HashSet[Flagbits] = return
proc `none`*[Flagbits: enum](flagsets: HashSet[Flagbits]): HashSet[Flagbits] = flagsets.typeof.none
proc `none`*[Flagbits: enum](Type: typedesc[Flags[Flagbits]]): Flags[Flagbits] = return
proc `none`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] = flags.typeof.none

proc `and`*[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] =
  Flags[Flagbits]((a.uint32 and b.uint32) and Flags[Flagbits].all.uint32)
proc `and`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a and <+>b
proc `and`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = b and a
proc `and`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = <+>a and <+>b

proc `or`*[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] =
  Flags[Flagbits]((a.uint32 or b.uint32) and Flags[Flagbits].all.uint32)
proc `or`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a or <+>b
proc `or`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = b or a
proc `or`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = <+>a or <+>b

proc `xor`*[Flagbits: enum](a, b: Flags[Flagbits]): Flags[Flagbits] =
  # if Flags.all is 00011111:
  # 00011100 xor 00011000 = 00000100
  # 00011100 xor 10000000 = 00011100
  #              ^ overflowed value must be ignored.
  not (a and b) and (a or b)
proc `xor`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a xor <+>b
proc `xor`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = b xor a
proc `xor`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = <+>a xor <+>b

proc `not`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] =
  Flags[Flagbits](flags.all.uint32 and not flags.uint32)

proc `not`*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  not flagbits.toFlags

proc `not`*[Flagbits: enum](flagsets: HashSet[Flagbits]): HashSet[Flagbits] =
  (not flagsets.toFlags).toFlagSets

proc `*`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a and b
proc `*`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a and b
proc `*`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a and b
proc `*`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a and b

proc `+`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a or b
proc `+`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a or b
proc `+`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a or b
proc `+`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a or b

proc `-+-`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a xor b
proc `-+-`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a xor b
proc `-+-`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a xor b
proc `-+-`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a xor b

proc `-`*[Flagbits: enum](a, b: Flagbits):                  Flags[Flagbits] = a and not b
proc `-`*[Flagbits: enum](a: Flags[Flagbits]; b: Flagbits): Flags[Flagbits] = a and not b
proc `-`*[Flagbits: enum](a: Flagbits; b: Flags[Flagbits]): Flags[Flagbits] = a and not b
proc `-`*[Flagbits: enum](a, b: Flags[Flagbits]):           Flags[Flagbits] = a and not b

proc contains*[Flagbits: enum](flags: Flags[Flagbits]; flagbits: Flagbits): bool =
  (flags and flagbits) != flags.none

proc toString*[Flagbits: enum](flags: Flags[Flagbits]): string =
  $flags.toFlagSets
proc `$`*[Flagbits: enum](flags: Flags[Flagbits]): string =
  flags.toString

import tables
var flagbitsCache = newTable[string, uint32]()

proc `carefulAll`*[Flagbits: enum](Type: typedesc[Flags[Flagbits]]): Flags[Flagbits] =
  ## Mainly used for flags with non-contiguous bits, such as the DebugUtilsMessageSeverity flag.
  try:
    return Flags[Flagbits](flagbitsCache[$Type])
  except KeyError:
    var x = Flagbits.low.ord
    while x <= Flagbits.high.ord:
      let bit = Flagbits(x)
      if not ($bit)[0].isDigit:
        result = result or bit
      x = x shl 1
    flagbitsCache[$Type] = result.uint32

proc `carefulNot`*[Flagbits: enum](flags: Flags[Flagbits]): Flags[Flagbits] =
  ## Mainly used for flags with non-contiguous bits, such as the DebugUtilsMessageSeverity flag.
  Flags[Flagbits](flags.typeof.carefulAll.uint32 and not flags.uint32)
proc `carefulNot`*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
  ## Mainly used for flags with non-contiguous bits, such as the DebugUtilsMessageSeverity flag.
  carefulNot flagbits.toFlags