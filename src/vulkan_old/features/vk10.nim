# Generated at 2021-12-22T16:09:29Z
# vk10
# Vulkan core API interface definitions
# =====================================

import ../platform

prepareVulkanLibDef()

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

type # enums and bitmasks
  # Fundamental types used by many commands and structures
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
    errorNativeWindowInUseKhr = 1000000001
    # Provided by VK_KHR_swapchain
    suboptimalKhr = 1000001003
    errorOutOfDateKhr = 1000001004
    # Provided by VK_KHR_display_swapchain
    errorIncompatibleDisplayKhr = 1000003001
    # Provided by VK_EXT_debug_report
    errorValidationFailedExt = 1000011001
    # Provided by VK_NV_glsl_shader
    errorInvalidShaderNv = 1000012000
    # Provided by VK_VERSION_1_1
    errorOutOfPoolMemory = 1000069000
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
    threadDoneKhr = 1000268001
    operationDeferredKhr = 1000268002
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
    physicalDeviceVulkan11Properties = 50
    physicalDeviceVulkan12Features = 51
    physicalDeviceVulkan12Properties = 52
    # Provided by VK_KHR_swapchain
    swapchainCreateInfoKhr = 1000001000
    presentInfoKhr = 1000001001
    # Provided by VK_KHR_display
    displayModeCreateInfoKhr = 1000002000
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
    swapchainImageCreateInfoAndroid = 1000010001
    physicalDevicePresentationPropertiesAndroid = 1000010002
    # Provided by VK_EXT_debug_report
    debugReportCallbackCreateInfoExt = 1000011000
    # Provided by VK_AMD_rasterization_order
    pipelineRasterizationStateRasterizationOrderAmd = 1000018000
    # Provided by VK_EXT_debug_marker
    debugMarkerObjectNameInfoExt = 1000022000
    debugMarkerObjectTagInfoExt = 1000022001
    debugMarkerMarkerInfoExt = 1000022002
    # Provided by VK_NV_dedicated_allocation
    dedicatedAllocationImageCreateInfoNv = 1000026000
    dedicatedAllocationBufferCreateInfoNv = 1000026001
    dedicatedAllocationMemoryAllocateInfoNv = 1000026002
    # Provided by VK_EXT_transform_feedback
    physicalDeviceTransformFeedbackFeaturesExt = 1000028000
    physicalDeviceTransformFeedbackPropertiesExt = 1000028001
    pipelineRasterizationStateStreamCreateInfoExt = 1000028002
    # Provided by VK_NVX_image_view_handle
    imageViewHandleInfoNvx = 1000030000
    imageViewAddressPropertiesNvx = 1000030001
    # Provided by VK_AMD_texture_gather_bias_lod
    textureLodGatherFormatPropertiesAmd = 1000041000
    # Provided by VK_GGP_stream_descriptor_surface
    streamDescriptorSurfaceCreateInfoGgp = 1000049000
    # Provided by VK_NV_corner_sampled_image
    physicalDeviceCornerSampledImageFeaturesNv = 1000050000
    # Provided by VK_VERSION_1_1
    renderPassMultiviewCreateInfo = 1000053000
    physicalDeviceMultiviewFeatures = 1000053001
    physicalDeviceMultiviewProperties = 1000053002
    # Provided by VK_NV_external_memory
    externalMemoryImageCreateInfoNv = 1000056000
    exportMemoryAllocateInfoNv = 1000056001
    # Provided by VK_NV_external_memory_win32
    importMemoryWin32HandleInfoNv = 1000057000
    exportMemoryWin32HandleInfoNv = 1000057001
    # Provided by VK_NV_win32_keyed_mutex
    win32KeyedMutexAcquireReleaseInfoNv = 1000058000
    # Provided by VK_VERSION_1_1
    physicalDeviceFeatures2 = 1000059000
    physicalDeviceProperties2 = 1000059001
    formatProperties2 = 1000059002
    imageFormatProperties2 = 1000059003
    physicalDeviceImageFormatInfo2 = 1000059004
    queueFamilyProperties2 = 1000059005
    physicalDeviceMemoryProperties2 = 1000059006
    sparseImageFormatProperties2 = 1000059007
    physicalDeviceSparseImageFormatInfo2 = 1000059008
    memoryAllocateFlagsInfo = 1000060000
    deviceGroupRenderPassBeginInfo = 1000060003
    deviceGroupCommandBufferBeginInfo = 1000060004
    deviceGroupSubmitInfo = 1000060005
    deviceGroupBindSparseInfo = 1000060006
    # Provided by VK_KHR_swapchain
    deviceGroupPresentCapabilitiesKhr = 1000060007
    imageSwapchainCreateInfoKhr = 1000060008
    bindImageMemorySwapchainInfoKhr = 1000060009
    acquireNextImageInfoKhr = 1000060010
    deviceGroupPresentInfoKhr = 1000060011
    deviceGroupSwapchainCreateInfoKhr = 1000060012
    # Provided by VK_VERSION_1_1
    bindBufferMemoryDeviceGroupInfo = 1000060013
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
    physicalDeviceAstcDecodeFeaturesExt = 1000067001
    # Provided by VK_VERSION_1_1
    physicalDeviceGroupProperties = 1000070000
    deviceGroupDeviceCreateInfo = 1000070001
    physicalDeviceExternalImageFormatInfo = 1000071000
    externalImageFormatProperties = 1000071001
    physicalDeviceExternalBufferInfo = 1000071002
    externalBufferProperties = 1000071003
    physicalDeviceIdProperties = 1000071004
    externalMemoryBufferCreateInfo = 1000072000
    externalMemoryImageCreateInfo = 1000072001
    exportMemoryAllocateInfo = 1000072002
    # Provided by VK_KHR_external_memory_win32
    importMemoryWin32HandleInfoKhr = 1000073000
    exportMemoryWin32HandleInfoKhr = 1000073001
    memoryWin32HandlePropertiesKhr = 1000073002
    memoryGetWin32HandleInfoKhr = 1000073003
    # Provided by VK_KHR_external_memory_fd
    importMemoryFdInfoKhr = 1000074000
    memoryFdPropertiesKhr = 1000074001
    memoryGetFdInfoKhr = 1000074002
    # Provided by VK_KHR_win32_keyed_mutex
    win32KeyedMutexAcquireReleaseInfoKhr = 1000075000
    # Provided by VK_VERSION_1_1
    physicalDeviceExternalSemaphoreInfo = 1000076000
    externalSemaphoreProperties = 1000076001
    exportSemaphoreCreateInfo = 1000077000
    # Provided by VK_KHR_external_semaphore_win32
    importSemaphoreWin32HandleInfoKhr = 1000078000
    exportSemaphoreWin32HandleInfoKhr = 1000078001
    d3d12FenceSubmitInfoKhr = 1000078002
    semaphoreGetWin32HandleInfoKhr = 1000078003
    # Provided by VK_KHR_external_semaphore_fd
    importSemaphoreFdInfoKhr = 1000079000
    semaphoreGetFdInfoKhr = 1000079001
    # Provided by VK_KHR_push_descriptor
    physicalDevicePushDescriptorPropertiesKhr = 1000080000
    # Provided by VK_EXT_conditional_rendering
    commandBufferInheritanceConditionalRenderingInfoExt = 1000081000
    physicalDeviceConditionalRenderingFeaturesExt = 1000081001
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
    deviceEventInfoExt = 1000091001
    displayEventInfoExt = 1000091002
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
    pipelineDiscardRectangleStateCreateInfoExt = 1000099001
    # Provided by VK_EXT_conservative_rasterization
    physicalDeviceConservativeRasterizationPropertiesExt = 1000101000
    pipelineRasterizationConservativeStateCreateInfoExt = 1000101001
    # Provided by VK_EXT_depth_clip_enable
    physicalDeviceDepthClipEnableFeaturesExt = 1000102000
    pipelineRasterizationDepthClipStateCreateInfoExt = 1000102001
    # Provided by VK_EXT_hdr_metadata
    hdrMetadataExt = 1000105000
    # Provided by VK_VERSION_1_2
    physicalDeviceImagelessFramebufferFeatures = 1000108000
    framebufferAttachmentsCreateInfo = 1000108001
    framebufferAttachmentImageInfo = 1000108002
    renderPassAttachmentBeginInfo = 1000108003
    attachmentDescription2 = 1000109000
    attachmentReference2 = 1000109001
    subpassDescription2 = 1000109002
    subpassDependency2 = 1000109003
    renderPassCreateInfo2 = 1000109004
    subpassBeginInfo = 1000109005
    subpassEndInfo = 1000109006
    # Provided by VK_KHR_shared_presentable_image
    sharedPresentSurfaceCapabilitiesKhr = 1000111000
    # Provided by VK_VERSION_1_1
    physicalDeviceExternalFenceInfo = 1000112000
    externalFenceProperties = 1000112001
    exportFenceCreateInfo = 1000113000
    # Provided by VK_KHR_external_fence_win32
    importFenceWin32HandleInfoKhr = 1000114000
    exportFenceWin32HandleInfoKhr = 1000114001
    fenceGetWin32HandleInfoKhr = 1000114002
    # Provided by VK_KHR_external_fence_fd
    importFenceFdInfoKhr = 1000115000
    fenceGetFdInfoKhr = 1000115001
    # Provided by VK_KHR_performance_query
    physicalDevicePerformanceQueryFeaturesKhr = 1000116000
    physicalDevicePerformanceQueryPropertiesKhr = 1000116001
    queryPoolPerformanceCreateInfoKhr = 1000116002
    performanceQuerySubmitInfoKhr = 1000116003
    acquireProfilingLockInfoKhr = 1000116004
    performanceCounterKhr = 1000116005
    performanceCounterDescriptionKhr = 1000116006
    # Provided by VK_VERSION_1_1
    physicalDevicePointClippingProperties = 1000117000
    renderPassInputAttachmentAspectCreateInfo = 1000117001
    imageViewUsageCreateInfo = 1000117002
    pipelineTessellationDomainOriginStateCreateInfo = 1000117003
    # Provided by VK_KHR_get_surface_capabilities2
    physicalDeviceSurfaceInfo2Khr = 1000119000
    surfaceCapabilities2Khr = 1000119001
    surfaceFormat2Khr = 1000119002
    # Provided by VK_VERSION_1_1
    physicalDeviceVariablePointersFeatures = 1000120000
    # Provided by VK_KHR_get_display_properties2
    displayProperties2Khr = 1000121000
    displayPlaneProperties2Khr = 1000121001
    displayModeProperties2Khr = 1000121002
    displayPlaneInfo2Khr = 1000121003
    displayPlaneCapabilities2Khr = 1000121004
    # Provided by VK_MVK_ios_surface
    iosSurfaceCreateInfoM = 1000122000
    # Provided by VK_MVK_macos_surface
    macosSurfaceCreateInfoM = 1000123000
    # Provided by VK_VERSION_1_1
    memoryDedicatedRequirements = 1000127000
    memoryDedicatedAllocateInfo = 1000127001
    # Provided by VK_EXT_debug_utils
    debugUtilsObjectNameInfoExt = 1000128000
    debugUtilsObjectTagInfoExt = 1000128001
    debugUtilsLabelExt = 1000128002
    debugUtilsMessengerCallbackDataExt = 1000128003
    debugUtilsMessengerCreateInfoExt = 1000128004
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    androidHardwareBufferUsageAndroid = 1000129000
    androidHardwareBufferPropertiesAndroid = 1000129001
    androidHardwareBufferFormatPropertiesAndroid = 1000129002
    importAndroidHardwareBufferInfoAndroid = 1000129003
    memoryGetAndroidHardwareBufferInfoAndroid = 1000129004
    externalFormatAndroid = 1000129005
    # Provided by VK_VERSION_1_2
    physicalDeviceSamplerFilterMinmaxProperties = 1000130000
    samplerReductionModeCreateInfo = 1000130001
    # Provided by VK_EXT_inline_uniform_block
    physicalDeviceInlineUniformBlockFeaturesExt = 1000138000
    physicalDeviceInlineUniformBlockPropertiesExt = 1000138001
    writeDescriptorSetInlineUniformBlockExt = 1000138002
    descriptorPoolInlineUniformBlockCreateInfoExt = 1000138003
    # Provided by VK_EXT_sample_locations
    sampleLocationsInfoExt = 1000143000
    renderPassSampleLocationsBeginInfoExt = 1000143001
    pipelineSampleLocationsStateCreateInfoExt = 1000143002
    physicalDeviceSampleLocationsPropertiesExt = 1000143003
    multisamplePropertiesExt = 1000143004
    # Provided by VK_VERSION_1_1
    protectedSubmitInfo = 1000145000
    physicalDeviceProtectedMemoryFeatures = 1000145001
    physicalDeviceProtectedMemoryProperties = 1000145002
    deviceQueueInfo2 = 1000145003
    bufferMemoryRequirementsInfo2 = 1000146000
    imageMemoryRequirementsInfo2 = 1000146001
    imageSparseMemoryRequirementsInfo2 = 1000146002
    memoryRequirements2 = 1000146003
    sparseImageMemoryRequirements2 = 1000146004
    # Provided by VK_VERSION_1_2
    imageFormatListCreateInfo = 1000147000
    # Provided by VK_EXT_blend_operation_advanced
    physicalDeviceBlendOperationAdvancedFeaturesExt = 1000148000
    physicalDeviceBlendOperationAdvancedPropertiesExt = 1000148001
    pipelineColorBlendAdvancedStateCreateInfoExt = 1000148002
    # Provided by VK_NV_fragment_coverage_to_color
    pipelineCoverageToColorStateCreateInfoNv = 1000149000
    # Provided by VK_KHR_ray_tracing
    accelerationStructureBuildGeometryInfoKhr = 1000150000
    accelerationStructureCreateGeometryTypeInfoKhr = 1000150001
    accelerationStructureDeviceAddressInfoKhr = 1000150002
    accelerationStructureGeometryAabbsDataKhr = 1000150003
    accelerationStructureGeometryInstancesDataKhr = 1000150004
    accelerationStructureGeometryTrianglesDataKhr = 1000150005
    accelerationStructureGeometryKhr = 1000150006
    accelerationStructureMemoryRequirementsInfoKhr = 1000150008
    accelerationStructureVersionKhr = 1000150009
    copyAccelerationStructureInfoKhr = 1000150010
    copyAccelerationStructureToMemoryInfoKhr = 1000150011
    copyMemoryToAccelerationStructureInfoKhr = 1000150012
    physicalDeviceRayTracingFeaturesKhr = 1000150013
    physicalDeviceRayTracingPropertiesKhr = 1000150014
    rayTracingPipelineCreateInfoKhr = 1000150015
    rayTracingShaderGroupCreateInfoKhr = 1000150016
    accelerationStructureCreateInfoKhr = 1000150017
    rayTracingPipelineInterfaceCreateInfoKhr = 1000150018
    # Provided by VK_NV_framebuffer_mixed_samples
    pipelineCoverageModulationStateCreateInfoNv = 1000152000
    # Provided by VK_NV_shader_sm_builtins
    physicalDeviceShaderSmBuiltinsFeaturesNv = 1000154000
    physicalDeviceShaderSmBuiltinsPropertiesNv = 1000154001
    # Provided by VK_VERSION_1_1
    samplerYcbcrConversionCreateInfo = 1000156000
    samplerYcbcrConversionInfo = 1000156001
    bindImagePlaneMemoryInfo = 1000156002
    imagePlaneMemoryRequirementsInfo = 1000156003
    physicalDeviceSamplerYcbcrConversionFeatures = 1000156004
    samplerYcbcrConversionImageFormatProperties = 1000156005
    bindBufferMemoryInfo = 1000157000
    bindImageMemoryInfo = 1000157001
    # Provided by VK_EXT_image_drm_format_modifier
    drmFormatModifierPropertiesListExt = 1000158000
    drmFormatModifierPropertiesExt = 1000158001
    physicalDeviceImageDrmFormatModifierInfoExt = 1000158002
    imageDrmFormatModifierListCreateInfoExt = 1000158003
    imageDrmFormatModifierExplicitCreateInfoExt = 1000158004
    imageDrmFormatModifierPropertiesExt = 1000158005
    # Provided by VK_EXT_validation_cache
    validationCacheCreateInfoExt = 1000160000
    shaderModuleValidationCacheCreateInfoExt = 1000160001
    # Provided by VK_VERSION_1_2
    descriptorSetLayoutBindingFlagsCreateInfo = 1000161000
    physicalDeviceDescriptorIndexingFeatures = 1000161001
    physicalDeviceDescriptorIndexingProperties = 1000161002
    descriptorSetVariableDescriptorCountAllocateInfo = 1000161003
    descriptorSetVariableDescriptorCountLayoutSupport = 1000161004
    # Provided by VK_NV_shading_rate_image
    pipelineViewportShadingRateImageStateCreateInfoNv = 1000164000
    physicalDeviceShadingRateImageFeaturesNv = 1000164001
    physicalDeviceShadingRateImagePropertiesNv = 1000164002
    pipelineViewportCoarseSampleOrderStateCreateInfoNv = 1000164005
    # Provided by VK_NV_ray_tracing
    rayTracingPipelineCreateInfoNv = 1000165000
    accelerationStructureCreateInfoNv = 1000165001
    geometryNv = 1000165003
    geometryTrianglesNv = 1000165004
    geometryAabbNv = 1000165005
    # Provided by VK_KHR_ray_tracing
    bindAccelerationStructureMemoryInfoKhr = 1000165006
    writeDescriptorSetAccelerationStructureKhr = 1000165007
    # Provided by VK_NV_ray_tracing
    accelerationStructureMemoryRequirementsInfoNv = 1000165008
    physicalDeviceRayTracingPropertiesNv = 1000165009
    rayTracingShaderGroupCreateInfoNv = 1000165011
    accelerationStructureInfoNv = 1000165012
    # Provided by VK_NV_representative_fragment_test
    physicalDeviceRepresentativeFragmentTestFeaturesNv = 1000166000
    pipelineRepresentativeFragmentTestStateCreateInfoNv = 1000166001
    # Provided by VK_VERSION_1_1
    physicalDeviceMaintenance3Properties = 1000168000
    descriptorSetLayoutSupport = 1000168001
    # Provided by VK_EXT_filter_cubic
    physicalDeviceImageViewImageFormatInfoExt = 1000170000
    filterCubicImageViewImageFormatPropertiesExt = 1000170001
    # Provided by VK_EXT_global_priority
    deviceQueueGlobalPriorityCreateInfoExt = 1000174000
    # Provided by VK_VERSION_1_2
    physicalDeviceShaderSubgroupExtendedTypesFeatures = 1000175000
    physicalDevice8bitStorageFeatures = 1000177000
    # Provided by VK_EXT_external_memory_host
    importMemoryHostPointerInfoExt = 1000178000
    memoryHostPointerPropertiesExt = 1000178001
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
    pipelineVertexInputDivisorStateCreateInfoExt = 1000190001
    physicalDeviceVertexAttributeDivisorFeaturesExt = 1000190002
    # Provided by VK_GGP_frame_token
    presentFrameTokenGgp = 1000191000
    # Provided by VK_EXT_pipeline_creation_feedback
    pipelineCreationFeedbackCreateInfoExt = 1000192000
    # Provided by VK_VERSION_1_2
    physicalDeviceDriverProperties = 1000196000
    physicalDeviceFloatControlsProperties = 1000197000
    physicalDeviceDepthStencilResolveProperties = 1000199000
    subpassDescriptionDepthStencilResolve = 1000199001
    # Provided by VK_NV_compute_shader_derivatives
    physicalDeviceComputeShaderDerivativesFeaturesNv = 1000201000
    # Provided by VK_NV_mesh_shader
    physicalDeviceMeshShaderFeaturesNv = 1000202000
    physicalDeviceMeshShaderPropertiesNv = 1000202001
    # Provided by VK_NV_fragment_shader_barycentric
    physicalDeviceFragmentShaderBarycentricFeaturesNv = 1000203000
    # Provided by VK_NV_shader_image_footprint
    physicalDeviceShaderImageFootprintFeaturesNv = 1000204000
    # Provided by VK_NV_scissor_exclusive
    pipelineViewportExclusiveScissorStateCreateInfoNv = 1000205000
    physicalDeviceExclusiveScissorFeaturesNv = 1000205002
    # Provided by VK_NV_device_diagnostic_checkpoints
    checkpointDataNv = 1000206000
    queueFamilyCheckpointPropertiesNv = 1000206001
    # Provided by VK_VERSION_1_2
    physicalDeviceTimelineSemaphoreFeatures = 1000207000
    physicalDeviceTimelineSemaphoreProperties = 1000207001
    semaphoreTypeCreateInfo = 1000207002
    timelineSemaphoreSubmitInfo = 1000207003
    semaphoreWaitInfo = 1000207004
    semaphoreSignalInfo = 1000207005
    # Provided by VK_INTEL_shader_integer_functions2
    physicalDeviceShaderIntegerFunctions2FeaturesIntel = 1000209000
    # Provided by VK_INTEL_performance_query
    queryPoolPerformanceQueryCreateInfoIntel = 1000210000
    initializePerformanceApiInfoIntel = 1000210001
    performanceMarkerInfoIntel = 1000210002
    performanceStreamMarkerInfoIntel = 1000210003
    performanceOverrideInfoIntel = 1000210004
    performanceConfigurationAcquireInfoIntel = 1000210005
    # Provided by VK_VERSION_1_2
    physicalDeviceVulkanMemoryModelFeatures = 1000211000
    # Provided by VK_EXT_pci_bus_info
    physicalDevicePciBusInfoPropertiesExt = 1000212000
    # Provided by VK_AMD_display_native_hdr
    displayNativeHdrSurfaceCapabilitiesAmd = 1000213000
    swapchainDisplayNativeHdrCreateInfoAmd = 1000213001
    # Provided by VK_FUCHSIA_imagepipe_surface
    imagepipeSurfaceCreateInfoFuchsia = 1000214000
    # Provided by VK_EXT_metal_surface
    metalSurfaceCreateInfoExt = 1000217000
    # Provided by VK_EXT_fragment_density_map
    physicalDeviceFragmentDensityMapFeaturesExt = 1000218000
    physicalDeviceFragmentDensityMapPropertiesExt = 1000218001
    renderPassFragmentDensityMapCreateInfoExt = 1000218002
    # Provided by VK_VERSION_1_2
    physicalDeviceScalarBlockLayoutFeatures = 1000221000
    # Provided by VK_EXT_subgroup_size_control
    physicalDeviceSubgroupSizeControlPropertiesExt = 1000225000
    pipelineShaderStageRequiredSubgroupSizeCreateInfoExt = 1000225001
    physicalDeviceSubgroupSizeControlFeaturesExt = 1000225002
    # Provided by VK_AMD_shader_core_properties2
    physicalDeviceShaderCoreProperties2Amd = 1000227000
    # Provided by VK_AMD_device_coherent_memory
    physicalDeviceCoherentMemoryFeaturesAmd = 1000229000
    # Provided by VK_EXT_memory_budget
    physicalDeviceMemoryBudgetPropertiesExt = 1000237000
    # Provided by VK_EXT_memory_priority
    physicalDeviceMemoryPriorityFeaturesExt = 1000238000
    memoryPriorityAllocateInfoExt = 1000238001
    # Provided by VK_KHR_surface_protected_capabilities
    surfaceProtectedCapabilitiesKhr = 1000239000
    # Provided by VK_NV_dedicated_allocation_image_aliasing
    physicalDeviceDedicatedAllocationImageAliasingFeaturesNv = 1000240000
    # Provided by VK_VERSION_1_2
    physicalDeviceSeparateDepthStencilLayoutsFeatures = 1000241000
    attachmentReferenceStencilLayout = 1000241001
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
    cooperativeMatrixPropertiesNv = 1000249001
    physicalDeviceCooperativeMatrixPropertiesNv = 1000249002
    # Provided by VK_NV_coverage_reduction_mode
    physicalDeviceCoverageReductionModeFeaturesNv = 1000250000
    pipelineCoverageReductionStateCreateInfoNv = 1000250001
    framebufferMixedSamplesCombinationNv = 1000250002
    # Provided by VK_EXT_fragment_shader_interlock
    physicalDeviceFragmentShaderInterlockFeaturesExt = 1000251000
    # Provided by VK_EXT_ycbcr_image_arrays
    physicalDeviceYcbcrImageArraysFeaturesExt = 1000252000
    # Provided by VK_VERSION_1_2
    physicalDeviceUniformBufferStandardLayoutFeatures = 1000253000
    # Provided by VK_EXT_full_screen_exclusive
    surfaceFullScreenExclusiveInfoExt = 1000255000
    surfaceFullScreenExclusiveWin32InfoExt = 1000255001
    surfaceCapabilitiesFullScreenExclusiveExt = 1000255002
    # Provided by VK_EXT_headless_surface
    headlessSurfaceCreateInfoExt = 1000256000
    # Provided by VK_VERSION_1_2
    physicalDeviceBufferDeviceAddressFeatures = 1000257000
    bufferOpaqueCaptureAddressCreateInfo = 1000257002
    memoryOpaqueCaptureAddressAllocateInfo = 1000257003
    deviceMemoryOpaqueCaptureAddressInfo = 1000257004
    # Provided by VK_EXT_line_rasterization
    physicalDeviceLineRasterizationFeaturesExt = 1000259000
    pipelineRasterizationLineStateCreateInfoExt = 1000259001
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
    pipelineInfoKhr = 1000269001
    pipelineExecutablePropertiesKhr = 1000269002
    pipelineExecutableInfoKhr = 1000269003
    pipelineExecutableStatisticKhr = 1000269004
    pipelineExecutableInternalRepresentationKhr = 1000269005
    # Provided by VK_EXT_shader_demote_to_helper_invocation
    physicalDeviceShaderDemoteToHelperInvocationFeaturesExt = 1000276000
    # Provided by VK_NV_device_generated_commands
    physicalDeviceDeviceGeneratedCommandsPropertiesNv = 1000277000
    graphicsShaderGroupCreateInfoNv = 1000277001
    graphicsPipelineShaderGroupsCreateInfoNv = 1000277002
    indirectCommandsLayoutTokenNv = 1000277003
    indirectCommandsLayoutCreateInfoNv = 1000277004
    generatedCommandsInfoNv = 1000277005
    generatedCommandsMemoryRequirementsInfoNv = 1000277006
    physicalDeviceDeviceGeneratedCommandsFeaturesNv = 1000277007
    # Provided by VK_EXT_texel_buffer_alignment
    physicalDeviceTexelBufferAlignmentFeaturesExt = 1000281000
    physicalDeviceTexelBufferAlignmentPropertiesExt = 1000281001
    # Provided by VK_QCOM_render_pass_transform
    commandBufferInheritanceRenderPassTransformInfoQcom = 1000282000
    renderPassTransformBeginInfoQcom = 1000282001
    # Provided by VK_EXT_robustness2
    physicalDeviceRobustness2FeaturesExt = 1000286000
    physicalDeviceRobustness2PropertiesExt = 1000286001
    # Provided by VK_EXT_custom_border_color
    samplerCustomBorderColorCreateInfoExt = 1000287000
    physicalDeviceCustomBorderColorPropertiesExt = 1000287001
    physicalDeviceCustomBorderColorFeaturesExt = 1000287002
    # Provided by VK_KHR_pipeline_library
    pipelineLibraryCreateInfoKhr = 1000290000
    # Provided by VK_EXT_private_data
    physicalDevicePrivateDataFeaturesExt = 1000295000
    devicePrivateDataCreateInfoExt = 1000295001
    privateDataSlotCreateInfoExt = 1000295002
    # Provided by VK_EXT_pipeline_creation_cache_control
    physicalDevicePipelineCreationCacheControlFeaturesExt = 1000297000
    # Provided by VK_NV_device_diagnostics_config
    physicalDeviceDiagnosticsConfigFeaturesNv = 1000300000
    deviceDiagnosticsConfigCreateInfoNv = 1000300001
    # Provided by VK_QCOM_extension_310
    reservedQcom = 1000309000
    # Provided by VK_EXT_fragment_density_map2
    physicalDeviceFragmentDensityMap2FeaturesExt = 1000332000
    physicalDeviceFragmentDensityMap2PropertiesExt = 1000332001
    # Provided by VK_EXT_image_robustness
    physicalDeviceImageRobustnessFeaturesExt = 1000335000
    # Provided by VK_EXT_4444_formats
    physicalDevice4444FormatsFeaturesExt = 1000340000
    # Provided by VK_EXT_directfb_surface
    directfbSurfaceCreateInfoExt = 1000346000

  # These types are part of the API, though not directly used in API commands or data structures
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
  PipelineCacheHeaderVersion* {.size: sizeof(int32), pure.} = enum
    one = 1

  # Device initialization
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
    pvrtc14bppUnormBlockImg = 1000054001
    pvrtc22bppUnormBlockImg = 1000054002
    pvrtc24bppUnormBlockImg = 1000054003
    pvrtc12bppSrgbBlockImg = 1000054004
    pvrtc14bppSrgbBlockImg = 1000054005
    pvrtc22bppSrgbBlockImg = 1000054006
    pvrtc24bppSrgbBlockImg = 1000054007
    # Provided by VK_EXT_texture_compression_astc_hdr
    astc4x4SfloatBlockExt = 1000066000
    astc5x4SfloatBlockExt = 1000066001
    astc5x5SfloatBlockExt = 1000066002
    astc6x5SfloatBlockExt = 1000066003
    astc6x6SfloatBlockExt = 1000066004
    astc8x5SfloatBlockExt = 1000066005
    astc8x6SfloatBlockExt = 1000066006
    astc8x8SfloatBlockExt = 1000066007
    astc10x5SfloatBlockExt = 1000066008
    astc10x6SfloatBlockExt = 1000066009
    astc10x8SfloatBlockExt = 1000066010
    astc10x10SfloatBlockExt = 1000066011
    astc12x10SfloatBlockExt = 1000066012
    astc12x12SfloatBlockExt = 1000066013
    # Provided by VK_VERSION_1_1
    g8b8g8r8422Unorm = 1000156000
    b8g8r8g8422Unorm = 1000156001
    g8B8R83plane420Unorm = 1000156002
    g8B8r82plane420Unorm = 1000156003
    g8B8R83plane422Unorm = 1000156004
    g8B8r82plane422Unorm = 1000156005
    g8B8R83plane444Unorm = 1000156006
    r10x6UnormPack16 = 1000156007
    r10x6g10x6Unorm2pack16 = 1000156008
    r10x6g10x6b10x6a10x6Unorm4pack16 = 1000156009
    g10x6b10x6g10x6r10x6422Unorm4pack16 = 1000156010
    b10x6g10x6r10x6g10x6422Unorm4pack16 = 1000156011
    g10x6B10x6R10x63plane420Unorm3pack16 = 1000156012
    g10x6B10x6r10x62plane420Unorm3pack16 = 1000156013
    g10x6B10x6R10x63plane422Unorm3pack16 = 1000156014
    g10x6B10x6r10x62plane422Unorm3pack16 = 1000156015
    g10x6B10x6R10x63plane444Unorm3pack16 = 1000156016
    r12x4UnormPack16 = 1000156017
    r12x4g12x4Unorm2pack16 = 1000156018
    r12x4g12x4b12x4a12x4Unorm4pack16 = 1000156019
    g12x4b12x4g12x4r12x4422Unorm4pack16 = 1000156020
    b12x4g12x4r12x4g12x4422Unorm4pack16 = 1000156021
    g12x4B12x4R12x43plane420Unorm3pack16 = 1000156022
    g12x4B12x4r12x42plane420Unorm3pack16 = 1000156023
    g12x4B12x4R12x43plane422Unorm3pack16 = 1000156024
    g12x4B12x4r12x42plane422Unorm3pack16 = 1000156025
    g12x4B12x4R12x43plane444Unorm3pack16 = 1000156026
    g16b16g16r16422Unorm = 1000156027
    b16g16r16g16422Unorm = 1000156028
    g16B16R163plane420Unorm = 1000156029
    g16B16r162plane420Unorm = 1000156030
    g16B16R163plane422Unorm = 1000156031
    g16B16r162plane422Unorm = 1000156032
    g16B16R163plane444Unorm = 1000156033
    # Provided by VK_EXT_extension_289
    astc3x3x3UnormBlockExt = 1000288000
    astc3x3x3SrgbBlockExt = 1000288001
    astc3x3x3SfloatBlockExt = 1000288002
    astc4x3x3UnormBlockExt = 1000288003
    astc4x3x3SrgbBlockExt = 1000288004
    astc4x3x3SfloatBlockExt = 1000288005
    astc4x4x3UnormBlockExt = 1000288006
    astc4x4x3SrgbBlockExt = 1000288007
    astc4x4x3SfloatBlockExt = 1000288008
    astc4x4x4UnormBlockExt = 1000288009
    astc4x4x4SrgbBlockExt = 1000288010
    astc4x4x4SfloatBlockExt = 1000288011
    astc5x4x4UnormBlockExt = 1000288012
    astc5x4x4SrgbBlockExt = 1000288013
    astc5x4x4SfloatBlockExt = 1000288014
    astc5x5x4UnormBlockExt = 1000288015
    astc5x5x4SrgbBlockExt = 1000288016
    astc5x5x4SfloatBlockExt = 1000288017
    astc5x5x5UnormBlockExt = 1000288018
    astc5x5x5SrgbBlockExt = 1000288019
    astc5x5x5SfloatBlockExt = 1000288020
    astc6x5x5UnormBlockExt = 1000288021
    astc6x5x5SrgbBlockExt = 1000288022
    astc6x5x5SfloatBlockExt = 1000288023
    astc6x6x5UnormBlockExt = 1000288024
    astc6x6x5SrgbBlockExt = 1000288025
    astc6x6x5SfloatBlockExt = 1000288026
    astc6x6x6UnormBlockExt = 1000288027
    astc6x6x6SrgbBlockExt = 1000288028
    astc6x6x6SfloatBlockExt = 1000288029
    # Provided by VK_EXT_4444_formats
    a4r4g4b4UnormPack16Ext = 1000340000
    a4b4g4r4UnormPack16Ext = 1000340001
  FormatFeatureFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
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
    transferDst = 0x00008000 # Format can be used as the destination image of image transfer commands
    # Provided by VK_VERSION_1_2
    sampledImageFilterMinmax = 0x00010000 # Format can be used with min/max reduction filtering
    # Provided by VK_VERSION_1_1
    midpointChromaSamples = 0x00020000 # Format can have midpoint rather than cosited chroma samples
    sampledImageYcbcrConversionLinearFilter = 0x00040000 # Format can be used with linear filtering whilst color conversion is enabled
    sampledImageYcbcrConversionSeparateReconstructionFilter = 0x00080000 # Format can have different chroma, min and mag filters
    sampledImageYcbcrConversionChromaReconstructionExplicit = 0x00100000
    sampledImageYcbcrConversionChromaReconstructionExplicitForceable = 0x00200000
    disjoint = 0x00400000 # Format supports disjoint planes
    cositedChromaSamples = 0x00800000 # Format can have cosited rather than midpoint chroma samples
    # Provided by VK_EXT_fragment_density_map
    fragmentDensityMapExt = 0x01000000
    # Provided by VK_AMD_extension_25
    reserved25Khr = 0x02000000
    reserved26Khr = 0x04000000
    # Provided by VK_AMD_extension_24
    reserved27Khr = 0x08000000
    reserved28Khr = 0x10000000
    # Provided by VK_KHR_ray_tracing
    accelerationStructureVertexBufferKhr = 0x20000000
    # Provided by VK_AMD_extension_227
    amdReserved30 = 0x40000000
  FormatFeatureFlags* = Flags[FormatFeatureFlagBits]
  ImageCreateFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    sparseBinding = 0x00000001 # Image should support sparse backing
    sparseResidency = 0x00000002 # Image should support sparse backing with partial residency
    sparseAliased = 0x00000004 # Image should support constent data access to physical memory ranges mapped into multiple locations of sparse images
    mutableFormat = 0x00000008 # Allows image views to have different format than the base image
    cubeCompatible = 0x00000010 # Allows creating image views with cube type from the created image
    # Provided by VK_VERSION_1_1
    e2dArrayCompatible = 0x00000020 # The 3D image can be viewed as a 2D or 2D array image
    splitInstanceBindRegions = 0x00000040 # Allows using VkBindImageMemoryDeviceGroupInfo::pSplitInstanceBindRegions when binding memory to the image
    blockTexelViewCompatible = 0x00000080
    extendedUsage = 0x00000100
    disjoint = 0x00000200
    alias = 0x00000400
    protected = 0x00000800 # Image requires protected memory
    # Provided by VK_EXT_sample_locations
    sampleLocationsCompatibleDepthExt = 0x00001000
    # Provided by VK_NV_corner_sampled_image
    cornerSampledNv = 0x00002000
    # Provided by VK_EXT_fragment_density_map
    subsampledExt = 0x00004000
  ImageCreateFlags* = Flags[ImageCreateFlagBits]
  ImageTiling* {.size: sizeof(int32), pure.} = enum
    optimal = 0
    linear = 1
    # Provided by VK_EXT_image_drm_format_modifier
    drmFormatModifierExt = 1000158000
  ImageType* {.size: sizeof(int32), pure.} = enum
    e1d = 0
    e2d = 1
    e3d = 2
  ImageUsageFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
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
    reserved11Khr = 0x00000800
    reserved12Khr = 0x00001000
    # Provided by VK_AMD_extension_24
    reserved13Khr = 0x00002000
    reserved14Khr = 0x00004000
    reserved15Khr = 0x00008000
    # Provided by VK_QCOM_extension_173
    reserved16Qcom = 0x00010000
    reserved17Qcom = 0x00020000
  ImageUsageFlags* = Flags[ImageUsageFlagBits]
  InstanceCreateFlags* = Flags[distinct UnusedEnum]
  InternalAllocationType* {.size: sizeof(int32), pure.} = enum
    executable = 0
  MemoryHeapFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    deviceLocal = 0x00000001 # If set, heap represents device memory
    # Provided by VK_VERSION_1_1
    multiInstance = 0x00000002 # If set, heap allocations allocate multiple instances by default
    # Provided by VK_KHR_extension_309
    reserved2Khr = 0x00000004
  MemoryHeapFlags* = Flags[MemoryHeapFlagBits]
  MemoryPropertyFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    deviceLocal = 0x00000001 # If otherwise stated, then allocate memory on device
    hostVisible = 0x00000002 # Memory is mappable by host
    hostCoherent = 0x00000004 # Memory will have i/o coherency. If not set, application may need to use vkFlushMappedMemoryRanges and vkInvalidateMappedMemoryRanges to flush/invalidate host cache
    hostCached = 0x00000008 # Memory will be cached by the host
    lazilyAllocated = 0x00000010 # Memory may be allocated by the driver when it is required
    # Provided by VK_VERSION_1_1
    protected = 0x00000020 # Memory is protected
    # Provided by VK_AMD_device_coherent_memory
    deviceCoherentAmd = 0x00000040
    deviceUncachedAmd = 0x00000080
  MemoryPropertyFlags* = Flags[MemoryPropertyFlagBits]
  PhysicalDeviceType* {.size: sizeof(int32), pure.} = enum
    other = 0
    integratedGpu = 1
    discreteGpu = 2
    virtualGpu = 3
    cpu = 4
  QueueFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
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
  SampleCountFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    e1 = 0x00000001 # Sample count 1 supported
    e2 = 0x00000002 # Sample count 2 supported
    e4 = 0x00000004 # Sample count 4 supported
    e8 = 0x00000008 # Sample count 8 supported
    e16 = 0x00000010 # Sample count 16 supported
    e32 = 0x00000020 # Sample count 32 supported
    e64 = 0x00000040 # Sample count 64 supported
  SampleCountFlags* = Flags[SampleCountFlagBits]
  SystemAllocationScope* {.size: sizeof(int32), pure.} = enum
    command = 0
    `object` = 1
    cache = 2
    device = 3
    instance = 4

  # Device commands
  DeviceCreateFlags* = Flags[distinct UnusedEnum]
  DeviceQueueCreateFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    # Provided by VK_VERSION_1_1
    protected = 0x00000001 # Queue is a protected-capable device queue
  DeviceQueueCreateFlags* = Flags[DeviceQueueCreateFlagBits]

  # Queue commands
  PipelineStageFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
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

  # Memory commands
  MemoryMapFlags* = Flags[distinct UnusedEnum]

  # Sparse resource memory management API commands
  ImageAspectFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    color = 0x00000001
    depth = 0x00000002
    stencil = 0x00000004
    metadata = 0x00000008
    # Provided by VK_VERSION_1_1
    plane0 = 0x00000010
    plane1 = 0x00000020
    plane2 = 0x00000040
    # Provided by VK_EXT_image_drm_format_modifier
    memoryPlane0Ext = 0x00000080
    memoryPlane1Ext = 0x00000100
    memoryPlane2Ext = 0x00000200
    memoryPlane3Ext = 0x00000400
  ImageAspectFlags* = Flags[ImageAspectFlagBits]
  SparseImageFormatFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    singleMiptail = 0x00000001 # Image uses a single mip tail region for all array layers
    alignedMipSize = 0x00000002 # Image requires mip level dimensions to be an integer multiple of the sparse image block dimensions for non-tail mip levels.
    nonstandardBlockSize = 0x00000004 # Image uses a non-standard sparse image block dimensions
  SparseImageFormatFlags* = Flags[SparseImageFormatFlagBits]
  SparseMemoryBindFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    metadata = 0x00000001 # Operation binds resource metadata to memory
  SparseMemoryBindFlags* = Flags[SparseMemoryBindFlagBits]

  # Fence commands
  FenceCreateFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    signaled = 0x00000001
  FenceCreateFlags* = Flags[FenceCreateFlagBits]

  # Queue semaphore commands
  SemaphoreCreateFlags* = Flags[distinct UnusedEnum]

  # Event commands
  EventCreateFlags* = Flags[distinct UnusedEnum]

  # Query commands
  QueryPipelineStatisticFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
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
  QueryPoolCreateFlags* = Flags[distinct UnusedEnum]
  QueryResultFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    e64 = 0x00000001 # Results of the queries are written to the destination buffer as 64-bit values
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
    accelerationStructureCompactedSizeKhr = 1000165000
    # Provided by VK_INTEL_performance_query
    performanceQueryIntel = 1000210000

  # Buffer commands
  BufferCreateFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    sparseBinding = 0x00000001 # Buffer should support sparse backing
    sparseResidency = 0x00000002 # Buffer should support sparse backing with partial residency
    sparseAliased = 0x00000004 # Buffer should support constent data access to physical memory ranges mapped into multiple locations of sparse buffers
    # Provided by VK_VERSION_1_1
    protected = 0x00000008 # Buffer requires protected memory
    # Provided by VK_VERSION_1_2
    deviceAddressCaptureReplay = 0x00000010
  BufferCreateFlags* = Flags[BufferCreateFlagBits]
  BufferUsageFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
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
    transformFeedbackCounterBufferExt = 0x00001000
    # Provided by VK_AMD_extension_25
    reserved13Khr = 0x00002000
    reserved14Khr = 0x00004000
    # Provided by VK_AMD_extension_24
    reserved15Khr = 0x00008000
    reserved16Khr = 0x00010000
    # Provided by VK_VERSION_1_2
    shaderDeviceAddress = 0x00020000
    # Provided by VK_QCOM_extension_173
    reserved18Qcom = 0x00040000
    # Provided by VK_NV_extension_168
    reserved19Khr = 0x00080000
    reserved20Khr = 0x00100000
  BufferUsageFlags* = Flags[BufferUsageFlagBits]
  SharingMode* {.size: sizeof(int32), pure.} = enum
    exclusive = 0
    concurrent = 1

  # Buffer view commands
  BufferViewCreateFlags* = Flags[distinct UnusedEnum]

  # Image commands
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
    depthAttachmentStencilReadOnlyOptimal = 1000117001
    # Provided by VK_NV_shading_rate_image
    shadingRateOptimalNv = 1000164003
    # Provided by VK_EXT_fragment_density_map
    fragmentDensityMapOptimalExt = 1000218000
    # Provided by VK_VERSION_1_2
    depthAttachmentOptimal = 1000241000
    depthReadOnlyOptimal = 1000241001
    stencilAttachmentOptimal = 1000241002
    stencilReadOnlyOptimal = 1000241003

  # Image view commands
  ComponentSwizzle* {.size: sizeof(int32), pure.} = enum
    identity = 0
    zero = 1
    one = 2
    r = 3
    g = 4
    b = 5
    a = 6
  ImageViewCreateFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    # Provided by VK_EXT_fragment_density_map
    fragmentDensityMapDynamicExt = 0x00000001
    # Provided by VK_EXT_fragment_density_map2
    fragmentDensityMapDeferredExt = 0x00000002
  ImageViewCreateFlags* = Flags[ImageViewCreateFlagBits]
  ImageViewType* {.size: sizeof(int32), pure.} = enum
    e1d = 0
    e2d = 1
    e3d = 2
    cube = 3
    e1dArray = 4
    e2dArray = 5
    cubeArray = 6

  # Shader commands
  ShaderModuleCreateFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    # Provided by VK_NV_extension_52
    reserved0Nv = 0x00000001
  ShaderModuleCreateFlags* = Flags[ShaderModuleCreateFlagBits]

  # Pipeline Cache commands
  PipelineCacheCreateFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    # Provided by VK_EXT_pipeline_creation_cache_control
    externallySynchronizedExt = 0x00000001
    # Provided by VK_GOOGLE_extension_196
    reserved1Ext = 0x00000002
  PipelineCacheCreateFlags* = Flags[PipelineCacheCreateFlagBits]

  # Pipeline commands
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
    srcExt = 1000148001
    dstExt = 1000148002
    srcOverExt = 1000148003
    dstOverExt = 1000148004
    srcInExt = 1000148005
    dstInExt = 1000148006
    srcOutExt = 1000148007
    dstOutExt = 1000148008
    srcAtopExt = 1000148009
    dstAtopExt = 1000148010
    xorExt = 1000148011
    multiplyExt = 1000148012
    screenExt = 1000148013
    overlayExt = 1000148014
    darkenExt = 1000148015
    lightenExt = 1000148016
    colordodgeExt = 1000148017
    colorburnExt = 1000148018
    hardlightExt = 1000148019
    softlightExt = 1000148020
    differenceExt = 1000148021
    exclusionExt = 1000148022
    invertExt = 1000148023
    invertRgbExt = 1000148024
    lineardodgeExt = 1000148025
    linearburnExt = 1000148026
    vividlightExt = 1000148027
    linearlightExt = 1000148028
    pinlightExt = 1000148029
    hardmixExt = 1000148030
    hslHueExt = 1000148031
    hslSaturationExt = 1000148032
    hslColorExt = 1000148033
    hslLuminosityExt = 1000148034
    plusExt = 1000148035
    plusClampedExt = 1000148036
    plusClampedAlphaExt = 1000148037
    plusDarkerExt = 1000148038
    minusExt = 1000148039
    minusClampedExt = 1000148040
    contrastExt = 1000148041
    invertOvgExt = 1000148042
    redExt = 1000148043
    greenExt = 1000148044
    blueExt = 1000148045
  ColorComponentFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
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
  CullModeFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
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
    viewportCoarseSampleOrderNv = 1000164006
    # Provided by VK_NV_scissor_exclusive
    exclusiveScissorNv = 1000205001
    # Provided by VK_EXT_line_rasterization
    lineStippleExt = 1000259000
    # Provided by VK_EXT_extended_dynamic_state
    cullModeExt = 1000267000
    frontFaceExt = 1000267001
    primitiveTopologyExt = 1000267002
    viewportWithCountExt = 1000267003
    scissorWithCountExt = 1000267004
    vertexInputBindingStrideExt = 1000267005
    depthTestEnableExt = 1000267006
    depthWriteEnableExt = 1000267007
    depthCompareOpExt = 1000267008
    depthBoundsTestEnableExt = 1000267009
    stencilTestEnableExt = 1000267010
    stencilOpExt = 1000267011
  FrontFace* {.size: sizeof(int32), pure.} = enum
    counterClockwise = 0
    clockwise = 1
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
  PipelineColorBlendStateCreateFlags* = Flags[distinct UnusedEnum]
  PipelineCreateFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    disableOptimization = 0x00000001
    allowDerivatives = 0x00000002
    derivative = 0x00000004
    # Provided by VK_VERSION_1_1
    viewIndexFromDeviceIndex = 0x00000008
    dispatchBase = 0x00000010
    # Provided by VK_NV_ray_tracing
    deferCompileNv = 0x00000020
    # Provided by VK_KHR_pipeline_executable_properties
    captureStatisticsKhr = 0x00000040
    captureInternalRepresentationsKhr = 0x00000080
    # Provided by VK_EXT_pipeline_creation_cache_control
    failOnPipelineCompileRequiredExt = 0x00000100
    earlyReturnOnFailureExt = 0x00000200
    # Provided by VK_KHR_pipeline_library
    libraryKhr = 0x00000800
    # Provided by VK_KHR_ray_tracing
    rayTracingSkipTrianglesKhr = 0x00001000
    rayTracingSkipAabbsKhr = 0x00002000
    rayTracingNoNullAnyHitShadersKhr = 0x00004000
    rayTracingNoNullClosestHitShadersKhr = 0x00008000
    rayTracingNoNullMissShadersKhr = 0x00010000
    rayTracingNoNullIntersectionShadersKhr = 0x00020000
    # Provided by VK_NV_device_generated_commands
    indirectBindableNv = 0x00040000
    # Provided by VK_NV_extension_168
    reserved19Khr = 0x00080000
  PipelineCreateFlags* = Flags[PipelineCreateFlagBits]
  PipelineDepthStencilStateCreateFlags* = Flags[distinct UnusedEnum]
  PipelineDynamicStateCreateFlags* = Flags[distinct UnusedEnum]
  PipelineInputAssemblyStateCreateFlags* = Flags[distinct UnusedEnum]
  PipelineLayoutCreateFlags* = Flags[distinct UnusedEnum]
  PipelineMultisampleStateCreateFlags* = Flags[distinct UnusedEnum]
  PipelineRasterizationStateCreateFlags* = Flags[distinct UnusedEnum]
  PipelineShaderStageCreateFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    # Provided by VK_EXT_subgroup_size_control
    allowVaryingSubgroupSizeExt = 0x00000001
    requireFullSubgroupsExt = 0x00000002
    # Provided by VK_NV_extension_52
    reserved2Nv = 0x00000004
    # Provided by VK_KHR_extension_297
    reserved3Khr = 0x00000008
  PipelineShaderStageCreateFlags* = Flags[PipelineShaderStageCreateFlagBits]
  PipelineTessellationStateCreateFlags* = Flags[distinct UnusedEnum]
  PipelineVertexInputStateCreateFlags* = Flags[distinct UnusedEnum]
  PipelineViewportStateCreateFlags* = Flags[distinct UnusedEnum]
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
  ShaderStageFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    vertex = 0x00000001
    tessellationControl = 0x00000002
    tessellationEvaluation = 0x00000004
    geometry = 0x00000008
    fragment = 0x00000010
    allGraphics = 0x0000001F
    compute = 0x00000020
    # Provided by VK_NV_mesh_shader
    taskNv = 0x00000040
    meshNv = 0x00000080
    # Provided by VK_KHR_ray_tracing
    raygenKhr = 0x00000100
    anyHitKhr = 0x00000200
    closestHitKhr = 0x00000400
    missKhr = 0x00000800
    intersectionKhr = 0x00001000
    callableKhr = 0x00002000
    all = 0x7FFFFFFF
  ShaderStageFlags* = Flags[ShaderStageFlagBits]
  StencilOp* {.size: sizeof(int32), pure.} = enum
    keep = 0
    zero = 1
    replace = 2
    incrementAndClamp = 3
    decrementAndClamp = 4
    invert = 5
    incrementAndWrap = 6
    decrementAndWrap = 7
  VertexInputRate* {.size: sizeof(int32), pure.} = enum
    vertex = 0
    instance = 1

  # Sampler commands
  BorderColor* {.size: sizeof(int32), pure.} = enum
    floatTransparentBlack = 0
    intTransparentBlack = 1
    floatOpaqueBlack = 2
    intOpaqueBlack = 3
    floatOpaqueWhite = 4
    intOpaqueWhite = 5
    # Provided by VK_EXT_custom_border_color
    floatCustomExt = 1000287003
    intCustomExt = 1000287004
  Filter* {.size: sizeof(int32), pure.} = enum
    nearest = 0
    linear = 1
    # Provided by VK_IMG_filter_cubic
    cubicImg = 1000015000
  SamplerAddressMode* {.size: sizeof(int32), pure.} = enum
    repeat = 0
    mirroredRepeat = 1
    clampToEdge = 2
    clampToBorder = 3
    # Provided by VK_VERSION_1_2
    mirrorClampToEdge = 4 # No need to add an extnumber attribute, since this uses a core enum value
  SamplerCreateFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    # Provided by VK_EXT_fragment_density_map
    subsampledExt = 0x00000001
    subsampledCoarseReconstructionExt = 0x00000002
  SamplerCreateFlags* = Flags[SamplerCreateFlagBits]
  SamplerMipmapMode* {.size: sizeof(int32), pure.} = enum
    nearest = 0 # Choose nearest mip level
    linear = 1 # Linear filter between mip levels

  # Descriptor set commands
  DescriptorPoolCreateFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    freeDescriptorSet = 0x00000001 # Descriptor sets may be freed individually
    # Provided by VK_VERSION_1_2
    updateAfterBind = 0x00000002
  DescriptorPoolCreateFlags* = Flags[DescriptorPoolCreateFlagBits]
  DescriptorPoolResetFlags* = Flags[distinct UnusedEnum]
  DescriptorSetLayoutCreateFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    # Provided by VK_KHR_push_descriptor
    pushDescriptorKhr = 0x00000001 # Descriptors are pushed via flink:vkCmdPushDescriptorSetKHR
    # Provided by VK_VERSION_1_2
    updateAfterBindPool = 0x00000002
  DescriptorSetLayoutCreateFlags* = Flags[DescriptorSetLayoutCreateFlagBits]
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

  # Pass commands
  AccessFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
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
    commandPreprocessWriteNv = 0x00040000
    # Provided by VK_EXT_blend_operation_advanced
    colorAttachmentReadNoncoherentExt = 0x00080000
    # Provided by VK_EXT_conditional_rendering
    conditionalRenderingReadExt = 0x00100000 # read access flag for reading conditional rendering predicate
    # Provided by VK_KHR_ray_tracing
    accelerationStructureReadKhr = 0x00200000
    accelerationStructureWriteKhr = 0x00400000
    # Provided by VK_NV_shading_rate_image
    shadingRateImageReadNv = 0x00800000
    # Provided by VK_EXT_fragment_density_map
    fragmentDensityMapReadExt = 0x01000000
    # Provided by VK_EXT_transform_feedback
    transformFeedbackWriteExt = 0x02000000
    transformFeedbackCounterReadExt = 0x04000000
    transformFeedbackCounterWriteExt = 0x08000000
    # Provided by VK_AMD_extension_25
    reserved28Khr = 0x10000000
    reserved29Khr = 0x20000000
    # Provided by VK_AMD_extension_24
    reserved30Khr = 0x40000000
  AccessFlags* = Flags[AccessFlagBits]
  AttachmentDescriptionFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    mayAlias = 0x00000001 # The attachment may alias physical memory of another attachment in the same render pass
  AttachmentDescriptionFlags* = Flags[AttachmentDescriptionFlagBits]
  AttachmentLoadOp* {.size: sizeof(int32), pure.} = enum
    load = 0
    clear = 1
    dontCare = 2
  AttachmentStoreOp* {.size: sizeof(int32), pure.} = enum
    store = 0
    dontCare = 1
    # Provided by VK_QCOM_render_pass_store_ops
    noneQcom = 1000301000
  DependencyFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    byRegion = 0x00000001 # Dependency is per pixel region
    # Provided by VK_VERSION_1_1
    viewLocal = 0x00000002
    deviceGroup = 0x00000004 # Dependency is across devices
  DependencyFlags* = Flags[DependencyFlagBits]
  FramebufferCreateFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    # Provided by VK_VERSION_1_2
    imageless = 0x00000001
  FramebufferCreateFlags* = Flags[FramebufferCreateFlagBits]
  PipelineBindPoint* {.size: sizeof(int32), pure.} = enum
    graphics = 0
    compute = 1
    # Provided by VK_KHR_ray_tracing
    rayTracingKhr = 1000165000
  RenderPassCreateFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    # Provided by VK_KHR_extension_221
    reserved0Khr = 0x00000001
    # Provided by VK_QCOM_render_pass_transform
    transformQcom = 0x00000002
  RenderPassCreateFlags* = Flags[RenderPassCreateFlagBits]
  SubpassDescriptionFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    # Provided by VK_NVX_multiview_per_view_attributes
    perViewAttributesNvx = 0x00000001
    perViewPositionXOnlyNvx = 0x00000002
    # Provided by VK_QCOM_render_pass_shader_resolve
    fragmentRegionQcom = 0x00000004
    shaderResolveQcom = 0x00000008
  SubpassDescriptionFlags* = Flags[SubpassDescriptionFlagBits]

  # Command pool commands
  CommandPoolCreateFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    transient = 0x00000001 # Command buffers have a short lifetime
    resetCommandBuffer = 0x00000002 # Command buffers may release their memory individually
    # Provided by VK_VERSION_1_1
    protected = 0x00000004 # Command buffers allocated from pool are protected command buffers
  CommandPoolCreateFlags* = Flags[CommandPoolCreateFlagBits]
  CommandPoolResetFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    releaseResources = 0x00000001 # Release resources owned by the pool
  CommandPoolResetFlags* = Flags[CommandPoolResetFlagBits]

  # Command buffer commands
  CommandBufferLevel* {.size: sizeof(int32), pure.} = enum
    primary = 0
    secondary = 1
  CommandBufferResetFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    releaseResources = 0x00000001 # Release resources owned by the buffer
  CommandBufferResetFlags* = Flags[CommandBufferResetFlagBits]
  CommandBufferUsageFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    oneTimeSubmit = 0x00000001
    renderPassContinue = 0x00000002
    simultaneousUse = 0x00000004 # Command buffer may be submitted/executed more than once simultaneously
  CommandBufferUsageFlags* = Flags[CommandBufferUsageFlagBits]
  QueryControlFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    precise = 0x00000001 # Require precise results to be collected by the query
  QueryControlFlags* = Flags[QueryControlFlagBits]

  # Command buffer building commands
  IndexType* {.size: sizeof(int32), pure.} = enum
    uint16 = 0
    uint32 = 1
    # Provided by VK_KHR_ray_tracing
    noneKhr = 1000165000
    # Provided by VK_EXT_index_type_uint8
    uint8Ext = 1000265000
  StencilFaceFlagBits* {.size: sizeof(int32), pure, flagbits.} = enum
    front = 0x00000001 # Front face
    back = 0x00000002 # Back face
    frontAndBack = 0x00000003 # Front and back faces
  StencilFaceFlags* = Flags[StencilFaceFlagBits]
  SubpassContents* {.size: sizeof(int32), pure.} = enum
    inline = 0
    secondaryCommandBuffers = 1

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

  # These types are part of the API, though not directly used in API commands or data structures
  # --------------------------------------------------------------------------------------------
  BaseInStructure* = object
    sType*: StructureType
    pNext* {.optional.}: ptr BaseInStructure
  BaseOutStructure* = object
    sType*: StructureType
    pNext* {.optional.}: ptr BaseOutStructure
  BufferMemoryBarrier* = object
    sType* {.constant: (StructureType.bufferMemoryBarrier).}: StructureType
    pNext* {.optional.}: pointer
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
    sType* {.constant: (StructureType.imageMemoryBarrier).}: StructureType
    pNext* {.optional.}: pointer
    srcAccessMask*: AccessFlags
    dstAccessMask*: AccessFlags
    oldLayout*: ImageLayout
    newLayout*: ImageLayout
    srcQueueFamilyIndex*: uint32
    dstQueueFamilyIndex*: uint32
    image*: Image
    subresourceRange*: ImageSubresourceRange
  MemoryBarrier* = object
    sType* {.constant: (StructureType.memoryBarrier).}: StructureType
    pNext* {.optional.}: pointer
    srcAccessMask* {.optional.}: AccessFlags
    dstAccessMask* {.optional.}: AccessFlags

  # Device initialization
  # ---------------------
  PFN_AllocationFunction* = proc(
      pUserData: pointer;
      size: uint;
      alignment: uint;
      allocationScope: SystemAllocationScope;
    ): pointer {.cdecl.}
  PFN_FreeFunction* = proc(
      pUserData: pointer;
      pMemory: pointer;
    ): void {.cdecl.}
  PFN_InternalAllocationNotification* = proc(
      pUserData: pointer;
      size: uint;
      allocationType: InternalAllocationType;
      allocationScope: SystemAllocationScope;
    ): void {.cdecl.}
  PFN_InternalFreeNotification* = proc(
      pUserData: pointer;
      size: uint;
      allocationType: InternalAllocationType;
      allocationScope: SystemAllocationScope;
    ): void {.cdecl.}
  PFN_ReallocationFunction* = proc(
      pUserData: pointer;
      pOriginal: pointer;
      size: uint;
      alignment: uint;
      allocationScope: SystemAllocationScope;
    ): pointer {.cdecl.}
  PFN_VoidFunction* = proc(): void {.cdecl.}
  AllocationCallbacks* = object
    pUserData* {.optional.}: pointer
    pfnAllocation*: PFN_AllocationFunction
    pfnReallocation*: PFN_ReallocationFunction
    pfnFree*: PFN_FreeFunction
    pfnInternalAllocation* {.optional.}: PFN_InternalAllocationNotification
    pfnInternalFree* {.optional.}: PFN_InternalFreeNotification
  ApplicationInfo* = object
    sType* {.constant: (StructureType.applicationInfo).}: StructureType
    pNext* {.optional.}: pointer
    pApplicationName* {.optional.}: cstring
    applicationVersion*: uint32
    pEngineName* {.optional.}: cstring
    engineVersion*: uint32
    apiVersion*: uint32
  FormatProperties* = object
    linearTilingFeatures* {.optional.}: FormatFeatureFlags
    optimalTilingFeatures* {.optional.}: FormatFeatureFlags
    bufferFeatures* {.optional.}: FormatFeatureFlags
  ImageFormatProperties* = object
    maxExtent*: Extent3D
    maxMipLevels*: uint32
    maxArrayLayers*: uint32
    sampleCounts* {.optional.}: SampleCountFlags
    maxResourceSize*: DeviceSize
  HtInstance* = object of HandleType
  Instance* = Handle[HtInstance]
  InstanceCreateInfo* = object
    sType* {.constant: (StructureType.instanceCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: InstanceCreateFlags
    pApplicationInfo* {.optional.}: ptr ApplicationInfo
    enabledLayerCount* {.optional.}: uint32
    ppEnabledLayerNames* {.length: enabledLayerCount.}: cstringArray
    enabledExtensionCount* {.optional.}: uint32
    ppEnabledExtensionNames* {.length: enabledExtensionCount.}: cstringArray
  MemoryHeap* = object
    size*: DeviceSize
    flags* {.optional.}: MemoryHeapFlags
  MemoryType* = object
    propertyFlags* {.optional.}: MemoryPropertyFlags
    heapIndex*: uint32
  HtPhysicalDevice* = object of HandleType
  PhysicalDevice* = Handle[HtPhysicalDevice]
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
    framebufferColorSampleCounts* {.optional.}: SampleCountFlags
    framebufferDepthSampleCounts* {.optional.}: SampleCountFlags
    framebufferStencilSampleCounts* {.optional.}: SampleCountFlags
    framebufferNoAttachmentsSampleCounts* {.optional.}: SampleCountFlags
    maxColorAttachments*: uint32
    sampledImageColorSampleCounts* {.optional.}: SampleCountFlags
    sampledImageIntegerSampleCounts* {.optional.}: SampleCountFlags
    sampledImageDepthSampleCounts* {.optional.}: SampleCountFlags
    sampledImageStencilSampleCounts* {.optional.}: SampleCountFlags
    storageImageSampleCounts* {.optional.}: SampleCountFlags
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
  QueueFamilyProperties* = object
    queueFlags* {.optional.}: QueueFlags
    queueCount*: uint32
    timestampValidBits*: uint32
    minImageTransferGranularity*: Extent3D

  # Device commands
  # ---------------
  HtDevice* = object of HandleType
  Device* = Handle[HtDevice]
  DeviceCreateInfo* = object
    sType* {.constant: (StructureType.deviceCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DeviceCreateFlags
    queueCreateInfoCount*: uint32
    pQueueCreateInfos* {.length: queueCreateInfoCount.}: arrPtr[DeviceQueueCreateInfo]
    enabledLayerCount* {.optional.}: uint32
    ppEnabledLayerNames* {.length: enabledLayerCount.}: cstringArray
    enabledExtensionCount* {.optional.}: uint32
    ppEnabledExtensionNames* {.length: enabledExtensionCount.}: cstringArray
    pEnabledFeatures* {.optional.}: ptr PhysicalDeviceFeatures
  DeviceQueueCreateInfo* = object
    sType* {.constant: (StructureType.deviceQueueCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DeviceQueueCreateFlags
    queueFamilyIndex*: uint32
    queueCount*: uint32
    pQueuePriorities* {.length: queueCount.}: arrPtr[float32]

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
  HtQueue* = object of HandleType
  Queue* = Handle[HtQueue]
  SubmitInfo* = object
    sType* {.constant: (StructureType.submitInfo).}: StructureType
    pNext* {.optional.}: pointer
    waitSemaphoreCount* {.optional.}: uint32
    pWaitSemaphores* {.length: waitSemaphoreCount.}: arrPtr[Semaphore]
    pWaitDstStageMask* {.length: waitSemaphoreCount.}: arrPtr[PipelineStageFlags]
    commandBufferCount* {.optional.}: uint32
    pCommandBuffers* {.length: commandBufferCount.}: arrPtr[CommandBuffer]
    signalSemaphoreCount* {.optional.}: uint32
    pSignalSemaphores* {.length: signalSemaphoreCount.}: arrPtr[Semaphore]

  # Memory commands
  # ---------------
  MappedMemoryRange* = object
    sType* {.constant: (StructureType.mappedMemoryRange).}: StructureType
    pNext* {.optional.}: pointer
    memory*: DeviceMemory
    offset*: DeviceSize
    size*: DeviceSize
  MemoryAllocateInfo* = object
    sType* {.constant: (StructureType.memoryAllocateInfo).}: StructureType
    pNext* {.optional.}: pointer
    allocationSize*: DeviceSize
    memoryTypeIndex*: uint32

  # Memory management API commands
  # ------------------------------
  HtDeviceMemory* = object of HandleType
  DeviceMemory* = NonDispatchableHandle[HtDeviceMemory]
  MemoryRequirements* = object
    size*: DeviceSize
    alignment*: DeviceSize
    memoryTypeBits*: uint32

  # Sparse resource memory management API commands
  # ----------------------------------------------
  BindSparseInfo* = object
    sType* {.constant: (StructureType.bindSparseInfo).}: StructureType
    pNext* {.optional.}: pointer
    waitSemaphoreCount* {.optional.}: uint32
    pWaitSemaphores* {.length: waitSemaphoreCount.}: arrPtr[Semaphore]
    bufferBindCount* {.optional.}: uint32
    pBufferBinds* {.length: bufferBindCount.}: arrPtr[SparseBufferMemoryBindInfo]
    imageOpaqueBindCount* {.optional.}: uint32
    pImageOpaqueBinds* {.length: imageOpaqueBindCount.}: arrPtr[SparseImageOpaqueMemoryBindInfo]
    imageBindCount* {.optional.}: uint32
    pImageBinds* {.length: imageBindCount.}: arrPtr[SparseImageMemoryBindInfo]
    signalSemaphoreCount* {.optional.}: uint32
    pSignalSemaphores* {.length: signalSemaphoreCount.}: arrPtr[Semaphore]
  ImageSubresource* = object
    aspectMask*: ImageAspectFlags
    mipLevel*: uint32
    arrayLayer*: uint32
  SparseBufferMemoryBindInfo* = object
    buffer*: Buffer
    bindCount*: uint32
    pBinds* {.length: bindCount.}: arrPtr[SparseMemoryBind]
  SparseImageFormatProperties* = object
    aspectMask* {.optional.}: ImageAspectFlags
    imageGranularity*: Extent3D
    flags* {.optional.}: SparseImageFormatFlags
  SparseImageMemoryBind* = object
    subresource*: ImageSubresource
    offset*: Offset3D
    extent*: Extent3D
    memory* {.optional.}: DeviceMemory
    memoryOffset*: DeviceSize
    flags* {.optional.}: SparseMemoryBindFlags
  SparseImageMemoryBindInfo* = object
    image*: Image
    bindCount*: uint32
    pBinds* {.length: bindCount.}: arrPtr[SparseImageMemoryBind]
  SparseImageMemoryRequirements* = object
    formatProperties*: SparseImageFormatProperties
    imageMipTailFirstLod*: uint32
    imageMipTailSize*: DeviceSize
    imageMipTailOffset*: DeviceSize
    imageMipTailStride*: DeviceSize
  SparseImageOpaqueMemoryBindInfo* = object
    image*: Image
    bindCount*: uint32
    pBinds* {.length: bindCount.}: arrPtr[SparseMemoryBind]
  SparseMemoryBind* = object
    resourceOffset*: DeviceSize
    size*: DeviceSize
    memory* {.optional.}: DeviceMemory
    memoryOffset*: DeviceSize
    flags* {.optional.}: SparseMemoryBindFlags

  # Fence commands
  # --------------
  HtFence* = object of HandleType
  Fence* = NonDispatchableHandle[HtFence]
  FenceCreateInfo* = object
    sType* {.constant: (StructureType.fenceCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: FenceCreateFlags

  # Queue semaphore commands
  # ------------------------
  HtSemaphore* = object of HandleType
  Semaphore* = NonDispatchableHandle[HtSemaphore]
  SemaphoreCreateInfo* = object
    sType* {.constant: (StructureType.semaphoreCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: SemaphoreCreateFlags

  # Event commands
  # --------------
  HtEvent* = object of HandleType
  Event* = NonDispatchableHandle[HtEvent]
  EventCreateInfo* = object
    sType* {.constant: (StructureType.eventCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: EventCreateFlags

  # Query commands
  # --------------
  HtQueryPool* = object of HandleType
  QueryPool* = NonDispatchableHandle[HtQueryPool]
  QueryPoolCreateInfo* = object
    sType* {.constant: (StructureType.queryPoolCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: QueryPoolCreateFlags
    queryType*: QueryType
    queryCount*: uint32
    pipelineStatistics* {.optional.}: QueryPipelineStatisticFlags

  # Buffer commands
  # ---------------
  HtBuffer* = object of HandleType
  Buffer* = NonDispatchableHandle[HtBuffer]
  BufferCreateInfo* = object
    sType* {.constant: (StructureType.bufferCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: BufferCreateFlags
    size*: DeviceSize
    usage*: BufferUsageFlags
    sharingMode*: SharingMode
    queueFamilyIndexCount* {.optional.}: uint32
    pQueueFamilyIndices* {.length: queueFamilyIndexCount.}: arrPtr[uint32]

  # Buffer view commands
  # --------------------
  HtBufferView* = object of HandleType
  BufferView* = NonDispatchableHandle[HtBufferView]
  BufferViewCreateInfo* = object
    sType* {.constant: (StructureType.bufferViewCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: BufferViewCreateFlags
    buffer*: Buffer
    format*: Format
    offset*: DeviceSize
    range*: DeviceSize

  # Image commands
  # --------------
  HtImage* = object of HandleType
  Image* = NonDispatchableHandle[HtImage]
  ImageCreateInfo* = object
    sType* {.constant: (StructureType.imageCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: ImageCreateFlags
    imageType*: ImageType
    format*: Format
    extent*: Extent3D
    mipLevels*: uint32
    arrayLayers*: uint32
    samples*: SampleCountFlagBits
    tiling*: ImageTiling
    usage*: ImageUsageFlags
    sharingMode*: SharingMode
    queueFamilyIndexCount* {.optional.}: uint32
    pQueueFamilyIndices* {.length: queueFamilyIndexCount.}: arrPtr[uint32]
    initialLayout*: ImageLayout
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
  ImageSubresourceRange* = object
    aspectMask*: ImageAspectFlags
    baseMipLevel*: uint32
    levelCount*: uint32
    baseArrayLayer*: uint32
    layerCount*: uint32
  HtImageView* = object of HandleType
  ImageView* = NonDispatchableHandle[HtImageView]
  ImageViewCreateInfo* = object
    sType* {.constant: (StructureType.imageViewCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: ImageViewCreateFlags
    image*: Image
    viewType*: ImageViewType
    format*: Format
    components*: ComponentMapping
    subresourceRange*: ImageSubresourceRange

  # Shader commands
  # ---------------
  HtShaderModule* = object of HandleType
  ShaderModule* = NonDispatchableHandle[HtShaderModule]
  ShaderModuleCreateInfo* = object
    sType* {.constant: (StructureType.shaderModuleCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: ShaderModuleCreateFlags
    codeSize*: uint
    pCode* {.length: codeSize / 4.}: arrPtr[uint32]

  # Pipeline Cache commands
  # -----------------------
  HtPipelineCache* = object of HandleType
  PipelineCache* = NonDispatchableHandle[HtPipelineCache]
  PipelineCacheCreateInfo* = object
    sType* {.constant: (StructureType.pipelineCacheCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineCacheCreateFlags
    initialDataSize* {.optional.}: uint
    pInitialData* {.length: initialDataSize.}: pointer

  # Pipeline commands
  # -----------------
  ComputePipelineCreateInfo* = object
    sType* {.constant: (StructureType.computePipelineCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineCreateFlags
    stage*: PipelineShaderStageCreateInfo
    layout*: PipelineLayout
    basePipelineHandle* {.optional.}: Pipeline
    basePipelineIndex*: int32
  GraphicsPipelineCreateInfo* = object
    sType* {.constant: (StructureType.graphicsPipelineCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineCreateFlags
    stageCount*: uint32
    pStages* {.length: stageCount.}: arrPtr[PipelineShaderStageCreateInfo]
    pVertexInputState* {.optional.}: ptr PipelineVertexInputStateCreateInfo
    pInputAssemblyState* {.optional.}: ptr PipelineInputAssemblyStateCreateInfo
    pTessellationState* {.optional.}: ptr PipelineTessellationStateCreateInfo
    pViewportState* {.optional.}: ptr PipelineViewportStateCreateInfo
    pRasterizationState*: ptr PipelineRasterizationStateCreateInfo
    pMultisampleState* {.optional.}: ptr PipelineMultisampleStateCreateInfo
    pDepthStencilState* {.optional.}: ptr PipelineDepthStencilStateCreateInfo
    pColorBlendState* {.optional.}: ptr PipelineColorBlendStateCreateInfo
    pDynamicState* {.optional.}: ptr PipelineDynamicStateCreateInfo
    layout*: PipelineLayout
    renderPass*: RenderPass
    subpass*: uint32
    basePipelineHandle* {.optional.}: Pipeline
    basePipelineIndex*: int32
  HtPipeline* = object of HandleType
  Pipeline* = NonDispatchableHandle[HtPipeline]
  PipelineColorBlendAttachmentState* = object
    blendEnable*: Bool32
    srcColorBlendFactor*: BlendFactor
    dstColorBlendFactor*: BlendFactor
    colorBlendOp*: BlendOp
    srcAlphaBlendFactor*: BlendFactor
    dstAlphaBlendFactor*: BlendFactor
    alphaBlendOp*: BlendOp
    colorWriteMask* {.optional.}: ColorComponentFlags
  PipelineColorBlendStateCreateInfo* = object
    sType* {.constant: (StructureType.pipelineColorBlendStateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineColorBlendStateCreateFlags
    logicOpEnable*: Bool32
    logicOp*: LogicOp
    attachmentCount* {.optional.}: uint32
    pAttachments* {.length: attachmentCount.}: arrPtr[PipelineColorBlendAttachmentState]
    blendConstants*: array[4, float32]
  PipelineDepthStencilStateCreateInfo* = object
    sType* {.constant: (StructureType.pipelineDepthStencilStateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineDepthStencilStateCreateFlags
    depthTestEnable*: Bool32
    depthWriteEnable*: Bool32
    depthCompareOp*: CompareOp
    depthBoundsTestEnable*: Bool32
    stencilTestEnable*: Bool32
    front*: StencilOpState
    back*: StencilOpState
    minDepthBounds*: float32
    maxDepthBounds*: float32
  PipelineDynamicStateCreateInfo* = object
    sType* {.constant: (StructureType.pipelineDynamicStateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineDynamicStateCreateFlags
    dynamicStateCount* {.optional.}: uint32
    pDynamicStates* {.length: dynamicStateCount.}: arrPtr[DynamicState]
  PipelineInputAssemblyStateCreateInfo* = object
    sType* {.constant: (StructureType.pipelineInputAssemblyStateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineInputAssemblyStateCreateFlags
    topology*: PrimitiveTopology
    primitiveRestartEnable*: Bool32
  PipelineMultisampleStateCreateInfo* = object
    sType* {.constant: (StructureType.pipelineMultisampleStateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineMultisampleStateCreateFlags
    rasterizationSamples*: SampleCountFlagBits
    sampleShadingEnable*: Bool32
    minSampleShading*: float32
    pSampleMask* {.optional, length: (rasterizationSamples + 31) / 32.}: arrPtr[SampleMask]
    alphaToCoverageEnable*: Bool32
    alphaToOneEnable*: Bool32
  PipelineRasterizationStateCreateInfo* = object
    sType* {.constant: (StructureType.pipelineRasterizationStateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineRasterizationStateCreateFlags
    depthClampEnable*: Bool32
    rasterizerDiscardEnable*: Bool32
    polygonMode*: PolygonMode
    cullMode* {.optional.}: CullModeFlags
    frontFace*: FrontFace
    depthBiasEnable*: Bool32
    depthBiasConstantFactor*: float32
    depthBiasClamp*: float32
    depthBiasSlopeFactor*: float32
    lineWidth*: float32
  PipelineShaderStageCreateInfo* = object
    sType* {.constant: (StructureType.pipelineShaderStageCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineShaderStageCreateFlags
    stage*: ShaderStageFlagBits
    module*: ShaderModule
    pName*: cstring
    pSpecializationInfo* {.optional.}: ptr SpecializationInfo
  PipelineTessellationStateCreateInfo* = object
    sType* {.constant: (StructureType.pipelineTessellationStateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineTessellationStateCreateFlags
    patchControlPoints*: uint32
  PipelineVertexInputStateCreateInfo* = object
    sType* {.constant: (StructureType.pipelineVertexInputStateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineVertexInputStateCreateFlags
    vertexBindingDescriptionCount* {.optional.}: uint32
    pVertexBindingDescriptions* {.length: vertexBindingDescriptionCount.}: arrPtr[VertexInputBindingDescription]
    vertexAttributeDescriptionCount* {.optional.}: uint32
    pVertexAttributeDescriptions* {.length: vertexAttributeDescriptionCount.}: arrPtr[VertexInputAttributeDescription]
  PipelineViewportStateCreateInfo* = object
    sType* {.constant: (StructureType.pipelineViewportStateCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineViewportStateCreateFlags
    viewportCount* {.optional.}: uint32
    pViewports* {.optional, length: viewportCount.}: arrPtr[Viewport]
    scissorCount* {.optional.}: uint32
    pScissors* {.optional, length: scissorCount.}: arrPtr[Rect2D]
  SpecializationInfo* = object
    mapEntryCount* {.optional.}: uint32
    pMapEntries* {.length: mapEntryCount.}: arrPtr[SpecializationMapEntry]
    dataSize* {.optional.}: uint
    pData* {.length: dataSize.}: pointer
  SpecializationMapEntry* = object
    constantID*: uint32
    offset*: uint32
    size*: uint
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
  Viewport* = object
    x*: float32
    y*: float32
    width*: float32
    height*: float32
    minDepth*: float32
    maxDepth*: float32

  # Pipeline layout commands
  # ------------------------
  HtPipelineLayout* = object of HandleType
  PipelineLayout* = NonDispatchableHandle[HtPipelineLayout]
  PipelineLayoutCreateInfo* = object
    sType* {.constant: (StructureType.pipelineLayoutCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: PipelineLayoutCreateFlags
    setLayoutCount* {.optional.}: uint32
    pSetLayouts* {.length: setLayoutCount.}: arrPtr[DescriptorSetLayout]
    pushConstantRangeCount* {.optional.}: uint32
    pPushConstantRanges* {.length: pushConstantRangeCount.}: arrPtr[PushConstantRange]
  PushConstantRange* = object
    stageFlags*: ShaderStageFlags
    offset*: uint32
    size*: uint32

  # Sampler commands
  # ----------------
  HtSampler* = object of HandleType
  Sampler* = NonDispatchableHandle[HtSampler]
  SamplerCreateInfo* = object
    sType* {.constant: (StructureType.samplerCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: SamplerCreateFlags
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

  # Descriptor set commands
  # -----------------------
  CopyDescriptorSet* = object
    sType* {.constant: (StructureType.copyDescriptorSet).}: StructureType
    pNext* {.optional.}: pointer
    srcSet*: DescriptorSet
    srcBinding*: uint32
    srcArrayElement*: uint32
    dstSet*: DescriptorSet
    dstBinding*: uint32
    dstArrayElement*: uint32
    descriptorCount*: uint32
  DescriptorBufferInfo* = object
    buffer* {.optional.}: Buffer
    offset*: DeviceSize
    range*: DeviceSize
  DescriptorImageInfo* = object
    sampler*: Sampler
    imageView*: ImageView
    imageLayout*: ImageLayout
  HtDescriptorPool* = object of HandleType
  DescriptorPool* = NonDispatchableHandle[HtDescriptorPool]
  DescriptorPoolCreateInfo* = object
    sType* {.constant: (StructureType.descriptorPoolCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DescriptorPoolCreateFlags
    maxSets*: uint32
    poolSizeCount*: uint32
    pPoolSizes* {.length: poolSizeCount.}: arrPtr[DescriptorPoolSize]
  DescriptorPoolSize* = object
    theType*: DescriptorType
    descriptorCount*: uint32
  HtDescriptorSet* = object of HandleType
  DescriptorSet* = NonDispatchableHandle[HtDescriptorSet]
  DescriptorSetAllocateInfo* = object
    sType* {.constant: (StructureType.descriptorSetAllocateInfo).}: StructureType
    pNext* {.optional.}: pointer
    descriptorPool*: DescriptorPool
    descriptorSetCount*: uint32
    pSetLayouts* {.length: descriptorSetCount.}: arrPtr[DescriptorSetLayout]
  HtDescriptorSetLayout* = object of HandleType
  DescriptorSetLayout* = NonDispatchableHandle[HtDescriptorSetLayout]
  DescriptorSetLayoutBinding* = object
    binding*: uint32
    descriptorType*: DescriptorType
    descriptorCount* {.optional.}: uint32
    stageFlags*: ShaderStageFlags
    pImmutableSamplers* {.optional, length: descriptorCount.}: arrPtr[Sampler]
  DescriptorSetLayoutCreateInfo* = object
    sType* {.constant: (StructureType.descriptorSetLayoutCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: DescriptorSetLayoutCreateFlags
    bindingCount* {.optional.}: uint32
    pBindings* {.length: bindingCount.}: arrPtr[DescriptorSetLayoutBinding]
  WriteDescriptorSet* = object
    sType* {.constant: (StructureType.writeDescriptorSet).}: StructureType
    pNext* {.optional.}: pointer
    dstSet*: DescriptorSet
    dstBinding*: uint32
    dstArrayElement*: uint32
    descriptorCount*: uint32
    descriptorType*: DescriptorType
    pImageInfo* {.length: descriptorCount.}: arrPtr[DescriptorImageInfo]
    pBufferInfo* {.length: descriptorCount.}: arrPtr[DescriptorBufferInfo]
    pTexelBufferView* {.length: descriptorCount.}: arrPtr[BufferView]

  # Pass commands
  # -------------
  AttachmentDescription* = object
    flags* {.optional.}: AttachmentDescriptionFlags
    format*: Format
    samples*: SampleCountFlagBits
    loadOp*: AttachmentLoadOp
    storeOp*: AttachmentStoreOp
    stencilLoadOp*: AttachmentLoadOp
    stencilStoreOp*: AttachmentStoreOp
    initialLayout*: ImageLayout
    finalLayout*: ImageLayout
  AttachmentReference* = object
    attachment*: uint32
    layout*: ImageLayout
  HtFramebuffer* = object of HandleType
  Framebuffer* = NonDispatchableHandle[HtFramebuffer]
  FramebufferCreateInfo* = object
    sType* {.constant: (StructureType.framebufferCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: FramebufferCreateFlags
    renderPass*: RenderPass
    attachmentCount* {.optional.}: uint32
    pAttachments* {.length: attachmentCount.}: arrPtr[ImageView]
    width*: uint32
    height*: uint32
    layers*: uint32
  HtRenderPass* = object of HandleType
  RenderPass* = NonDispatchableHandle[HtRenderPass]
  RenderPassCreateInfo* = object
    sType* {.constant: (StructureType.renderPassCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: RenderPassCreateFlags
    attachmentCount* {.optional.}: uint32
    pAttachments* {.length: attachmentCount.}: arrPtr[AttachmentDescription]
    subpassCount*: uint32
    pSubpasses* {.length: subpassCount.}: arrPtr[SubpassDescription]
    dependencyCount* {.optional.}: uint32
    pDependencies* {.length: dependencyCount.}: arrPtr[SubpassDependency]
  SubpassDependency* = object
    srcSubpass*: uint32
    dstSubpass*: uint32
    srcStageMask*: PipelineStageFlags
    dstStageMask*: PipelineStageFlags
    srcAccessMask* {.optional.}: AccessFlags
    dstAccessMask* {.optional.}: AccessFlags
    dependencyFlags* {.optional.}: DependencyFlags
  SubpassDescription* = object
    flags* {.optional.}: SubpassDescriptionFlags
    pipelineBindPoint*: PipelineBindPoint
    inputAttachmentCount* {.optional.}: uint32
    pInputAttachments* {.length: inputAttachmentCount.}: arrPtr[AttachmentReference]
    colorAttachmentCount* {.optional.}: uint32
    pColorAttachments* {.length: colorAttachmentCount.}: arrPtr[AttachmentReference]
    pResolveAttachments* {.optional, length: colorAttachmentCount.}: arrPtr[AttachmentReference]
    pDepthStencilAttachment* {.optional.}: ptr AttachmentReference
    preserveAttachmentCount* {.optional.}: uint32
    pPreserveAttachments* {.length: preserveAttachmentCount.}: arrPtr[uint32]

  # Command pool commands
  # ---------------------
  HtCommandPool* = object of HandleType
  CommandPool* = NonDispatchableHandle[HtCommandPool]
  CommandPoolCreateInfo* = object
    sType* {.constant: (StructureType.commandPoolCreateInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: CommandPoolCreateFlags
    queueFamilyIndex*: uint32

  # Command buffer commands
  # -----------------------
  HtCommandBuffer* = object of HandleType
  CommandBuffer* = Handle[HtCommandBuffer]
  CommandBufferAllocateInfo* = object
    sType* {.constant: (StructureType.commandBufferAllocateInfo).}: StructureType
    pNext* {.optional.}: pointer
    commandPool*: CommandPool
    level*: CommandBufferLevel
    commandBufferCount*: uint32
  CommandBufferBeginInfo* = object
    sType* {.constant: (StructureType.commandBufferBeginInfo).}: StructureType
    pNext* {.optional.}: pointer
    flags* {.optional.}: CommandBufferUsageFlags
    pInheritanceInfo* {.optional.}: ptr CommandBufferInheritanceInfo
  CommandBufferInheritanceInfo* = object
    sType* {.constant: (StructureType.commandBufferInheritanceInfo).}: StructureType
    pNext* {.optional.}: pointer
    renderPass* {.optional.}: RenderPass
    subpass*: uint32
    framebuffer* {.optional.}: Framebuffer
    occlusionQueryEnable*: Bool32
    queryFlags* {.optional.}: QueryControlFlags
    pipelineStatistics* {.optional.}: QueryPipelineStatisticFlags

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
  RenderPassBeginInfo* = object
    sType* {.constant: (StructureType.renderPassBeginInfo).}: StructureType
    pNext* {.optional.}: pointer
    renderPass*: RenderPass
    framebuffer*: Framebuffer
    renderArea*: Rect2D
    clearValueCount* {.optional.}: uint32
    pClearValues* {.length: clearValueCount.}: arrPtr[ClearValue]

# Header boilerplate
# ------------------
template defineHandle*(ObjectName: untyped) =
  type HtObjectName* = object of HandleType
  type ObjectName* = Handle[Ht`ObjectName`]
template defineNonDispatchableHandle*(ObjectName: untyped) =
  type HtObjectName* = object of HandleType
  type ObjectName* = NonDispatchableHandle[Ht`ObjectName`]


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
template nullHandle*(): untyped = ( cast[NullHandle](0) )


# Device initialization
# ---------------------
proc createInstance*(
      pCreateInfo: ptr InstanceCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pInstance: ptr Instance;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInitializationFailed, errorLayerNotPresent, errorExtensionNotPresent, errorIncompatibleDriver),
      preload("vkCreateInstance").}
proc destroyInstance*(
      instance = default(Instance);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyInstance").}
proc enumeratePhysicalDevices*(
      instance: Instance;
      pPhysicalDeviceCount: ptr uint32;
      pPhysicalDevices {.length: pPhysicalDeviceCount.} = default(arrPtr[PhysicalDevice]);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInitializationFailed),
      preload("vkEnumeratePhysicalDevices").}
proc getPhysicalDeviceFeatures*(
      physicalDevice: PhysicalDevice;
      pFeatures: ptr PhysicalDeviceFeatures;
    ): void {.cdecl, preload("vkGetPhysicalDeviceFeatures").}
proc getPhysicalDeviceFormatProperties*(
      physicalDevice: PhysicalDevice;
      format: Format;
      pFormatProperties: ptr FormatProperties;
    ): void {.cdecl, preload("vkGetPhysicalDeviceFormatProperties").}
proc getPhysicalDeviceImageFormatProperties*(
      physicalDevice: PhysicalDevice;
      format: Format;
      theType: ImageType;
      tiling: ImageTiling;
      usage: ImageUsageFlags;
      flags = default(ImageCreateFlags);
      pImageFormatProperties: ptr ImageFormatProperties;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorFormatNotSupported),
      preload("vkGetPhysicalDeviceImageFormatProperties").}
proc getPhysicalDeviceProperties*(
      physicalDevice: PhysicalDevice;
      pProperties: ptr PhysicalDeviceProperties;
    ): void {.cdecl, preload("vkGetPhysicalDeviceProperties").}
proc getPhysicalDeviceQueueFamilyProperties*(
      physicalDevice: PhysicalDevice;
      pQueueFamilyPropertyCount: ptr uint32;
      pQueueFamilyProperties {.length: pQueueFamilyPropertyCount.} = default(arrPtr[QueueFamilyProperties]);
    ): void {.cdecl, preload("vkGetPhysicalDeviceQueueFamilyProperties").}
proc getPhysicalDeviceMemoryProperties*(
      physicalDevice: PhysicalDevice;
      pMemoryProperties: ptr PhysicalDeviceMemoryProperties;
    ): void {.cdecl, preload("vkGetPhysicalDeviceMemoryProperties").}
proc getInstanceProcAddr*(
      instance = default(Instance);
      pName: cstring;
    ): PFN_VoidFunction {.cdecl, preload("vkGetInstanceProcAddr").}
proc getDeviceProcAddr*(
      device: Device;
      pName: cstring;
    ): PFN_VoidFunction {.cdecl, preload("vkGetDeviceProcAddr").}


# Device commands
# ---------------
proc createDevice*(
      physicalDevice: PhysicalDevice;
      pCreateInfo: ptr DeviceCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pDevice: ptr Device;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInitializationFailed, errorExtensionNotPresent, errorFeatureNotPresent, errorTooManyObjects, errorDeviceLost),
      preload("vkCreateDevice").}
proc destroyDevice*(
      device = default(Device);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyDevice").}


# Extension discovery commands
# ----------------------------
proc enumerateInstanceExtensionProperties*(
      pLayerName = default(cstring);
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[ExtensionProperties]);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorLayerNotPresent),
      preload("vkEnumerateInstanceExtensionProperties").}
proc enumerateDeviceExtensionProperties*(
      physicalDevice: PhysicalDevice;
      pLayerName = default(cstring);
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[ExtensionProperties]);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorLayerNotPresent),
      preload("vkEnumerateDeviceExtensionProperties").}


# Layer discovery commands
# ------------------------
proc enumerateInstanceLayerProperties*(
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[LayerProperties]);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkEnumerateInstanceLayerProperties").}
proc enumerateDeviceLayerProperties*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[LayerProperties]);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkEnumerateDeviceLayerProperties").}


# Queue commands
# --------------
proc getDeviceQueue*(
      device: Device;
      queueFamilyIndex: uint32;
      queueIndex: uint32;
      pQueue: ptr Queue;
    ): void {.cdecl, preload("vkGetDeviceQueue").}
proc queueSubmit*(
      queue: Queue;
      submitCount = default(uint32);
      pSubmits {.length: submitCount.}: arrPtr[SubmitInfo];
      fence = default(Fence);
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorDeviceLost),
      preload("vkQueueSubmit").}
proc queueWaitIdle*(
      queue: Queue;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorDeviceLost),
      preload("vkQueueWaitIdle").}
proc deviceWaitIdle*(
      device: Device;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorDeviceLost),
      preload("vkDeviceWaitIdle").}


# Memory commands
# ---------------
proc allocateMemory*(
      device: Device;
      pAllocateInfo: ptr MemoryAllocateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pMemory: ptr DeviceMemory;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInvalidExternalHandle, errorInvalidOpaqueCaptureAddressKhr),
      preload("vkAllocateMemory").}
proc freeMemory*(
      device: Device;
      memory = default(DeviceMemory);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkFreeMemory").}
proc mapMemory*(
      device: Device;
      memory: DeviceMemory;
      offset: DeviceSize;
      size: DeviceSize;
      flags = default(MemoryMapFlags);
      ppData: ptr pointer;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorMemoryMapFailed),
      preload("vkMapMemory").}
proc unmapMemory*(
      device: Device;
      memory: DeviceMemory;
    ): void {.cdecl, preload("vkUnmapMemory").}
proc flushMappedMemoryRanges*(
      device: Device;
      memoryRangeCount: uint32;
      pMemoryRanges {.length: memoryRangeCount.}: arrPtr[MappedMemoryRange];
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkFlushMappedMemoryRanges").}
proc invalidateMappedMemoryRanges*(
      device: Device;
      memoryRangeCount: uint32;
      pMemoryRanges {.length: memoryRangeCount.}: arrPtr[MappedMemoryRange];
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkInvalidateMappedMemoryRanges").}
proc getDeviceMemoryCommitment*(
      device: Device;
      memory: DeviceMemory;
      pCommittedMemoryInBytes: ptr DeviceSize;
    ): void {.cdecl, preload("vkGetDeviceMemoryCommitment").}


# Memory management API commands
# ------------------------------
proc bindBufferMemory*(
      device: Device;
      buffer: Buffer;
      memory: DeviceMemory;
      memoryOffset: DeviceSize;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInvalidOpaqueCaptureAddressKhr),
      preload("vkBindBufferMemory").}
proc bindImageMemory*(
      device: Device;
      image: Image;
      memory: DeviceMemory;
      memoryOffset: DeviceSize;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkBindImageMemory").}
proc getBufferMemoryRequirements*(
      device: Device;
      buffer: Buffer;
      pMemoryRequirements: ptr MemoryRequirements;
    ): void {.cdecl, preload("vkGetBufferMemoryRequirements").}
proc getImageMemoryRequirements*(
      device: Device;
      image: Image;
      pMemoryRequirements: ptr MemoryRequirements;
    ): void {.cdecl, preload("vkGetImageMemoryRequirements").}


# Sparse resource memory management API commands
# ----------------------------------------------
proc getImageSparseMemoryRequirements*(
      device: Device;
      image: Image;
      pSparseMemoryRequirementCount: ptr uint32;
      pSparseMemoryRequirements {.length: pSparseMemoryRequirementCount.} = default(arrPtr[SparseImageMemoryRequirements]);
    ): void {.cdecl, preload("vkGetImageSparseMemoryRequirements").}
proc getPhysicalDeviceSparseImageFormatProperties*(
      physicalDevice: PhysicalDevice;
      format: Format;
      theType: ImageType;
      samples: SampleCountFlagBits;
      usage: ImageUsageFlags;
      tiling: ImageTiling;
      pPropertyCount: ptr uint32;
      pProperties {.length: pPropertyCount.} = default(arrPtr[SparseImageFormatProperties]);
    ): void {.cdecl, preload("vkGetPhysicalDeviceSparseImageFormatProperties").}
proc queueBindSparse*(
      queue: Queue;
      bindInfoCount = default(uint32);
      pBindInfo {.length: bindInfoCount.}: arrPtr[BindSparseInfo];
      fence = default(Fence);
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorDeviceLost),
      preload("vkQueueBindSparse").}


# Fence commands
# --------------
proc createFence*(
      device: Device;
      pCreateInfo: ptr FenceCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pFence: ptr Fence;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateFence").}
proc destroyFence*(
      device: Device;
      fence = default(Fence);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyFence").}
proc resetFences*(
      device: Device;
      fenceCount: uint32;
      pFences {.length: fenceCount.}: arrPtr[Fence];
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfDeviceMemory),
      preload("vkResetFences").}
proc getFenceStatus*(
      device: Device;
      fence: Fence;
    ): Result {.cdecl,
      successCodes(success, notReady),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorDeviceLost),
      preload("vkGetFenceStatus").}
proc waitForFences*(
      device: Device;
      fenceCount: uint32;
      pFences {.length: fenceCount.}: arrPtr[Fence];
      waitAll: Bool32;
      timeout: uint64;
    ): Result {.cdecl,
      successCodes(success, timeout),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorDeviceLost),
      preload("vkWaitForFences").}


# Queue semaphore commands
# ------------------------
proc createSemaphore*(
      device: Device;
      pCreateInfo: ptr SemaphoreCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pSemaphore: ptr Semaphore;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateSemaphore").}
proc destroySemaphore*(
      device: Device;
      semaphore = default(Semaphore);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroySemaphore").}


# Event commands
# --------------
proc createEvent*(
      device: Device;
      pCreateInfo: ptr EventCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pEvent: ptr Event;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateEvent").}
proc destroyEvent*(
      device: Device;
      event = default(Event);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyEvent").}
proc getEventStatus*(
      device: Device;
      event: Event;
    ): Result {.cdecl,
      successCodes(eventSet, eventReset),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorDeviceLost),
      preload("vkGetEventStatus").}
proc setEvent*(
      device: Device;
      event: Event;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkSetEvent").}
proc resetEvent*(
      device: Device;
      event: Event;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfDeviceMemory),
      preload("vkResetEvent").}


# Query commands
# --------------
proc createQueryPool*(
      device: Device;
      pCreateInfo: ptr QueryPoolCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pQueryPool: ptr QueryPool;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateQueryPool").}
proc destroyQueryPool*(
      device: Device;
      queryPool = default(QueryPool);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyQueryPool").}
proc getQueryPoolResults*(
      device: Device;
      queryPool: QueryPool;
      firstQuery: uint32;
      queryCount: uint32;
      dataSize: uint;
      pData {.length: dataSize.}: pointer;
      stride: DeviceSize;
      flags = default(QueryResultFlags);
    ): Result {.cdecl,
      successCodes(success, notReady),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorDeviceLost),
      preload("vkGetQueryPoolResults").}


# Buffer commands
# ---------------
proc createBuffer*(
      device: Device;
      pCreateInfo: ptr BufferCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pBuffer: ptr Buffer;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInvalidOpaqueCaptureAddressKhr),
      preload("vkCreateBuffer").}
proc destroyBuffer*(
      device: Device;
      buffer = default(Buffer);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyBuffer").}


# Buffer view commands
# --------------------
proc createBufferView*(
      device: Device;
      pCreateInfo: ptr BufferViewCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pView: ptr BufferView;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateBufferView").}
proc destroyBufferView*(
      device: Device;
      bufferView = default(BufferView);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyBufferView").}


# Image commands
# --------------
proc createImage*(
      device: Device;
      pCreateInfo: ptr ImageCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pImage: ptr Image;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateImage").}
proc destroyImage*(
      device: Device;
      image = default(Image);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyImage").}
proc getImageSubresourceLayout*(
      device: Device;
      image: Image;
      pSubresource: ptr ImageSubresource;
      pLayout: ptr SubresourceLayout;
    ): void {.cdecl, preload("vkGetImageSubresourceLayout").}


# Image view commands
# -------------------
proc createImageView*(
      device: Device;
      pCreateInfo: ptr ImageViewCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pView: ptr ImageView;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateImageView").}
proc destroyImageView*(
      device: Device;
      imageView = default(ImageView);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyImageView").}


# Shader commands
# ---------------
proc createShaderModule*(
      device: Device;
      pCreateInfo: ptr ShaderModuleCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pShaderModule: ptr ShaderModule;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInvalidShaderNv),
      preload("vkCreateShaderModule").}
proc destroyShaderModule*(
      device: Device;
      shaderModule = default(ShaderModule);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyShaderModule").}


# Pipeline Cache commands
# -----------------------
proc createPipelineCache*(
      device: Device;
      pCreateInfo: ptr PipelineCacheCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pPipelineCache: ptr PipelineCache;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreatePipelineCache").}
proc destroyPipelineCache*(
      device: Device;
      pipelineCache = default(PipelineCache);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyPipelineCache").}
proc getPipelineCacheData*(
      device: Device;
      pipelineCache: PipelineCache;
      pDataSize: ptr uint;
      pData {.length: pDataSize.} = default(pointer);
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkGetPipelineCacheData").}
proc mergePipelineCaches*(
      device: Device;
      dstCache: PipelineCache;
      srcCacheCount: uint32;
      pSrcCaches {.length: srcCacheCount.}: arrPtr[PipelineCache];
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkMergePipelineCaches").}


# Pipeline commands
# -----------------
proc createGraphicsPipelines*(
      device: Device;
      pipelineCache = default(PipelineCache);
      createInfoCount: uint32;
      pCreateInfos {.length: createInfoCount.}: arrPtr[GraphicsPipelineCreateInfo];
      pAllocator = default(ptr AllocationCallbacks);
      pPipelines {.length: createInfoCount.}: arrPtr[Pipeline];
    ): Result {.cdecl,
      successCodes(success, pipelineCompileRequiredExt),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInvalidShaderNv),
      preload("vkCreateGraphicsPipelines").}
proc createComputePipelines*(
      device: Device;
      pipelineCache = default(PipelineCache);
      createInfoCount: uint32;
      pCreateInfos {.length: createInfoCount.}: arrPtr[ComputePipelineCreateInfo];
      pAllocator = default(ptr AllocationCallbacks);
      pPipelines {.length: createInfoCount.}: arrPtr[Pipeline];
    ): Result {.cdecl,
      successCodes(success, pipelineCompileRequiredExt),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorInvalidShaderNv),
      preload("vkCreateComputePipelines").}
proc destroyPipeline*(
      device: Device;
      pipeline = default(Pipeline);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyPipeline").}


# Pipeline layout commands
# ------------------------
proc createPipelineLayout*(
      device: Device;
      pCreateInfo: ptr PipelineLayoutCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pPipelineLayout: ptr PipelineLayout;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreatePipelineLayout").}
proc destroyPipelineLayout*(
      device: Device;
      pipelineLayout = default(PipelineLayout);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyPipelineLayout").}


# Sampler commands
# ----------------
proc createSampler*(
      device: Device;
      pCreateInfo: ptr SamplerCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pSampler: ptr Sampler;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateSampler").}
proc destroySampler*(
      device: Device;
      sampler = default(Sampler);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroySampler").}


# Descriptor set commands
# -----------------------
proc createDescriptorSetLayout*(
      device: Device;
      pCreateInfo: ptr DescriptorSetLayoutCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pSetLayout: ptr DescriptorSetLayout;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateDescriptorSetLayout").}
proc destroyDescriptorSetLayout*(
      device: Device;
      descriptorSetLayout = default(DescriptorSetLayout);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyDescriptorSetLayout").}
proc createDescriptorPool*(
      device: Device;
      pCreateInfo: ptr DescriptorPoolCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pDescriptorPool: ptr DescriptorPool;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorFragmentationExt),
      preload("vkCreateDescriptorPool").}
proc destroyDescriptorPool*(
      device: Device;
      descriptorPool = default(DescriptorPool);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyDescriptorPool").}
proc resetDescriptorPool*(
      device: Device;
      descriptorPool: DescriptorPool;
      flags = default(DescriptorPoolResetFlags);
    ): Result {.cdecl,
      successCodes(success),
      preload("vkResetDescriptorPool").}
proc allocateDescriptorSets*(
      device: Device;
      pAllocateInfo: ptr DescriptorSetAllocateInfo;
      pDescriptorSets {.length: pAllocateInfo.descriptorSetCount.}: arrPtr[DescriptorSet];
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorFragmentedPool, errorOutOfPoolMemory),
      preload("vkAllocateDescriptorSets").}
proc freeDescriptorSets*(
      device: Device;
      descriptorPool: DescriptorPool;
      descriptorSetCount: uint32;
      pDescriptorSets {.length: descriptorSetCount.}: arrPtr[DescriptorSet];
    ): Result {.cdecl,
      successCodes(success),
      preload("vkFreeDescriptorSets").}
proc updateDescriptorSets*(
      device: Device;
      descriptorWriteCount = default(uint32);
      pDescriptorWrites {.length: descriptorWriteCount.}: arrPtr[WriteDescriptorSet];
      descriptorCopyCount = default(uint32);
      pDescriptorCopies {.length: descriptorCopyCount.}: arrPtr[CopyDescriptorSet];
    ): void {.cdecl, preload("vkUpdateDescriptorSets").}


# Pass commands
# -------------
proc createFramebuffer*(
      device: Device;
      pCreateInfo: ptr FramebufferCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pFramebuffer: ptr Framebuffer;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateFramebuffer").}
proc destroyFramebuffer*(
      device: Device;
      framebuffer = default(Framebuffer);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyFramebuffer").}
proc createRenderPass*(
      device: Device;
      pCreateInfo: ptr RenderPassCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pRenderPass: ptr RenderPass;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateRenderPass").}
proc destroyRenderPass*(
      device: Device;
      renderPass = default(RenderPass);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyRenderPass").}
proc getRenderAreaGranularity*(
      device: Device;
      renderPass: RenderPass;
      pGranularity: ptr Extent2D;
    ): void {.cdecl, preload("vkGetRenderAreaGranularity").}


# Command pool commands
# ---------------------
proc createCommandPool*(
      device: Device;
      pCreateInfo: ptr CommandPoolCreateInfo;
      pAllocator = default(ptr AllocationCallbacks);
      pCommandPool: ptr CommandPool;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkCreateCommandPool").}
proc destroyCommandPool*(
      device: Device;
      commandPool = default(CommandPool);
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, preload("vkDestroyCommandPool").}
proc resetCommandPool*(
      device: Device;
      commandPool: CommandPool;
      flags = default(CommandPoolResetFlags);
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfDeviceMemory),
      preload("vkResetCommandPool").}


# Command buffer commands
# -----------------------
proc allocateCommandBuffers*(
      device: Device;
      pAllocateInfo: ptr CommandBufferAllocateInfo;
      pCommandBuffers {.length: pAllocateInfo.commandBufferCount.}: arrPtr[CommandBuffer];
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkAllocateCommandBuffers").}
proc freeCommandBuffers*(
      device: Device;
      commandPool: CommandPool;
      commandBufferCount: uint32;
      pCommandBuffers {.length: commandBufferCount.}: arrPtr[CommandBuffer];
    ): void {.cdecl, preload("vkFreeCommandBuffers").}
proc beginCommandBuffer*(
      commandBuffer: CommandBuffer;
      pBeginInfo: ptr CommandBufferBeginInfo;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkBeginCommandBuffer").}
proc endCommandBuffer*(
      commandBuffer: CommandBuffer;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory),
      preload("vkEndCommandBuffer").}
proc resetCommandBuffer*(
      commandBuffer: CommandBuffer;
      flags = default(CommandBufferResetFlags);
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfDeviceMemory),
      preload("vkResetCommandBuffer").}


# Command buffer building commands
# --------------------------------
StencilFaceFlagBits.defineAliases:
  frontAndBack as stencilFrontAndBack # Alias for backwards compatibility

proc cmdBindPipeline*(
      commandBuffer: CommandBuffer;
      pipelineBindPoint: PipelineBindPoint;
      pipeline: Pipeline;
    ): void {.cdecl, preload("vkCmdBindPipeline").}
proc cmdSetViewport*(
      commandBuffer: CommandBuffer;
      firstViewport: uint32;
      viewportCount: uint32;
      pViewports {.length: viewportCount.}: arrPtr[Viewport];
    ): void {.cdecl, preload("vkCmdSetViewport").}
proc cmdSetScissor*(
      commandBuffer: CommandBuffer;
      firstScissor: uint32;
      scissorCount: uint32;
      pScissors {.length: scissorCount.}: arrPtr[Rect2D];
    ): void {.cdecl, preload("vkCmdSetScissor").}
proc cmdSetLineWidth*(
      commandBuffer: CommandBuffer;
      lineWidth: float32;
    ): void {.cdecl, preload("vkCmdSetLineWidth").}
proc cmdSetDepthBias*(
      commandBuffer: CommandBuffer;
      depthBiasConstantFactor: float32;
      depthBiasClamp: float32;
      depthBiasSlopeFactor: float32;
    ): void {.cdecl, preload("vkCmdSetDepthBias").}
proc cmdSetBlendConstants*(
      commandBuffer: CommandBuffer;
      blendConstants: float32;
    ): void {.cdecl, preload("vkCmdSetBlendConstants").}
proc cmdSetDepthBounds*(
      commandBuffer: CommandBuffer;
      minDepthBounds: float32;
      maxDepthBounds: float32;
    ): void {.cdecl, preload("vkCmdSetDepthBounds").}
proc cmdSetStencilCompareMask*(
      commandBuffer: CommandBuffer;
      faceMask: StencilFaceFlags;
      compareMask: uint32;
    ): void {.cdecl, preload("vkCmdSetStencilCompareMask").}
proc cmdSetStencilWriteMask*(
      commandBuffer: CommandBuffer;
      faceMask: StencilFaceFlags;
      writeMask: uint32;
    ): void {.cdecl, preload("vkCmdSetStencilWriteMask").}
proc cmdSetStencilReference*(
      commandBuffer: CommandBuffer;
      faceMask: StencilFaceFlags;
      reference: uint32;
    ): void {.cdecl, preload("vkCmdSetStencilReference").}
proc cmdBindDescriptorSets*(
      commandBuffer: CommandBuffer;
      pipelineBindPoint: PipelineBindPoint;
      layout: PipelineLayout;
      firstSet: uint32;
      descriptorSetCount: uint32;
      pDescriptorSets {.length: descriptorSetCount.}: arrPtr[DescriptorSet];
      dynamicOffsetCount = default(uint32);
      pDynamicOffsets {.length: dynamicOffsetCount.}: arrPtr[uint32];
    ): void {.cdecl, preload("vkCmdBindDescriptorSets").}
proc cmdBindIndexBuffer*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      indexType: IndexType;
    ): void {.cdecl, preload("vkCmdBindIndexBuffer").}
proc cmdBindVertexBuffers*(
      commandBuffer: CommandBuffer;
      firstBinding: uint32;
      bindingCount: uint32;
      pBuffers {.length: bindingCount.}: arrPtr[Buffer];
      pOffsets {.length: bindingCount.}: arrPtr[DeviceSize];
    ): void {.cdecl, preload("vkCmdBindVertexBuffers").}
proc cmdDraw*(
      commandBuffer: CommandBuffer;
      vertexCount: uint32;
      instanceCount: uint32;
      firstVertex: uint32;
      firstInstance: uint32;
    ): void {.cdecl, preload("vkCmdDraw").}
proc cmdDrawIndexed*(
      commandBuffer: CommandBuffer;
      indexCount: uint32;
      instanceCount: uint32;
      firstIndex: uint32;
      vertexOffset: int32;
      firstInstance: uint32;
    ): void {.cdecl, preload("vkCmdDrawIndexed").}
proc cmdDrawIndirect*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      drawCount: uint32;
      stride: uint32;
    ): void {.cdecl, preload("vkCmdDrawIndirect").}
proc cmdDrawIndexedIndirect*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      drawCount: uint32;
      stride: uint32;
    ): void {.cdecl, preload("vkCmdDrawIndexedIndirect").}
proc cmdDispatch*(
      commandBuffer: CommandBuffer;
      groupCountX: uint32;
      groupCountY: uint32;
      groupCountZ: uint32;
    ): void {.cdecl, preload("vkCmdDispatch").}
proc cmdDispatchIndirect*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
    ): void {.cdecl, preload("vkCmdDispatchIndirect").}
proc cmdCopyBuffer*(
      commandBuffer: CommandBuffer;
      srcBuffer: Buffer;
      dstBuffer: Buffer;
      regionCount: uint32;
      pRegions {.length: regionCount.}: arrPtr[BufferCopy];
    ): void {.cdecl, preload("vkCmdCopyBuffer").}
proc cmdCopyImage*(
      commandBuffer: CommandBuffer;
      srcImage: Image;
      srcImageLayout: ImageLayout;
      dstImage: Image;
      dstImageLayout: ImageLayout;
      regionCount: uint32;
      pRegions {.length: regionCount.}: arrPtr[ImageCopy];
    ): void {.cdecl, preload("vkCmdCopyImage").}
proc cmdBlitImage*(
      commandBuffer: CommandBuffer;
      srcImage: Image;
      srcImageLayout: ImageLayout;
      dstImage: Image;
      dstImageLayout: ImageLayout;
      regionCount: uint32;
      pRegions {.length: regionCount.}: arrPtr[ImageBlit];
      filter: Filter;
    ): void {.cdecl, preload("vkCmdBlitImage").}
proc cmdCopyBufferToImage*(
      commandBuffer: CommandBuffer;
      srcBuffer: Buffer;
      dstImage: Image;
      dstImageLayout: ImageLayout;
      regionCount: uint32;
      pRegions {.length: regionCount.}: arrPtr[BufferImageCopy];
    ): void {.cdecl, preload("vkCmdCopyBufferToImage").}
proc cmdCopyImageToBuffer*(
      commandBuffer: CommandBuffer;
      srcImage: Image;
      srcImageLayout: ImageLayout;
      dstBuffer: Buffer;
      regionCount: uint32;
      pRegions {.length: regionCount.}: arrPtr[BufferImageCopy];
    ): void {.cdecl, preload("vkCmdCopyImageToBuffer").}
proc cmdUpdateBuffer*(
      commandBuffer: CommandBuffer;
      dstBuffer: Buffer;
      dstOffset: DeviceSize;
      dataSize: DeviceSize;
      pData {.length: dataSize.}: pointer;
    ): void {.cdecl, preload("vkCmdUpdateBuffer").}
proc cmdFillBuffer*(
      commandBuffer: CommandBuffer;
      dstBuffer: Buffer;
      dstOffset: DeviceSize;
      size: DeviceSize;
      data: uint32;
    ): void {.cdecl, preload("vkCmdFillBuffer").}
proc cmdClearColorImage*(
      commandBuffer: CommandBuffer;
      image: Image;
      imageLayout: ImageLayout;
      pColor: ptr ClearColorValue;
      rangeCount: uint32;
      pRanges {.length: rangeCount.}: arrPtr[ImageSubresourceRange];
    ): void {.cdecl, preload("vkCmdClearColorImage").}
proc cmdClearDepthStencilImage*(
      commandBuffer: CommandBuffer;
      image: Image;
      imageLayout: ImageLayout;
      pDepthStencil: ptr ClearDepthStencilValue;
      rangeCount: uint32;
      pRanges {.length: rangeCount.}: arrPtr[ImageSubresourceRange];
    ): void {.cdecl, preload("vkCmdClearDepthStencilImage").}
proc cmdClearAttachments*(
      commandBuffer: CommandBuffer;
      attachmentCount: uint32;
      pAttachments {.length: attachmentCount.}: arrPtr[ClearAttachment];
      rectCount: uint32;
      pRects {.length: rectCount.}: arrPtr[ClearRect];
    ): void {.cdecl, preload("vkCmdClearAttachments").}
proc cmdResolveImage*(
      commandBuffer: CommandBuffer;
      srcImage: Image;
      srcImageLayout: ImageLayout;
      dstImage: Image;
      dstImageLayout: ImageLayout;
      regionCount: uint32;
      pRegions {.length: regionCount.}: arrPtr[ImageResolve];
    ): void {.cdecl, preload("vkCmdResolveImage").}
proc cmdSetEvent*(
      commandBuffer: CommandBuffer;
      event: Event;
      stageMask: PipelineStageFlags;
    ): void {.cdecl, preload("vkCmdSetEvent").}
proc cmdResetEvent*(
      commandBuffer: CommandBuffer;
      event: Event;
      stageMask: PipelineStageFlags;
    ): void {.cdecl, preload("vkCmdResetEvent").}
proc cmdWaitEvents*(
      commandBuffer: CommandBuffer;
      eventCount: uint32;
      pEvents {.length: eventCount.}: arrPtr[Event];
      srcStageMask: PipelineStageFlags;
      dstStageMask: PipelineStageFlags;
      memoryBarrierCount = default(uint32);
      pMemoryBarriers {.length: memoryBarrierCount.}: arrPtr[MemoryBarrier];
      bufferMemoryBarrierCount = default(uint32);
      pBufferMemoryBarriers {.length: bufferMemoryBarrierCount.}: arrPtr[BufferMemoryBarrier];
      imageMemoryBarrierCount = default(uint32);
      pImageMemoryBarriers {.length: imageMemoryBarrierCount.}: arrPtr[ImageMemoryBarrier];
    ): void {.cdecl, preload("vkCmdWaitEvents").}
proc cmdPipelineBarrier*(
      commandBuffer: CommandBuffer;
      srcStageMask: PipelineStageFlags;
      dstStageMask: PipelineStageFlags;
      dependencyFlags = default(DependencyFlags);
      memoryBarrierCount = default(uint32);
      pMemoryBarriers {.length: memoryBarrierCount.}: arrPtr[MemoryBarrier];
      bufferMemoryBarrierCount = default(uint32);
      pBufferMemoryBarriers {.length: bufferMemoryBarrierCount.}: arrPtr[BufferMemoryBarrier];
      imageMemoryBarrierCount = default(uint32);
      pImageMemoryBarriers {.length: imageMemoryBarrierCount.}: arrPtr[ImageMemoryBarrier];
    ): void {.cdecl, preload("vkCmdPipelineBarrier").}
proc cmdBeginQuery*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      query: uint32;
      flags = default(QueryControlFlags);
    ): void {.cdecl, preload("vkCmdBeginQuery").}
proc cmdEndQuery*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      query: uint32;
    ): void {.cdecl, preload("vkCmdEndQuery").}
proc cmdResetQueryPool*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      firstQuery: uint32;
      queryCount: uint32;
    ): void {.cdecl, preload("vkCmdResetQueryPool").}
proc cmdWriteTimestamp*(
      commandBuffer: CommandBuffer;
      pipelineStage: PipelineStageFlagBits;
      queryPool: QueryPool;
      query: uint32;
    ): void {.cdecl, preload("vkCmdWriteTimestamp").}
proc cmdCopyQueryPoolResults*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      firstQuery: uint32;
      queryCount: uint32;
      dstBuffer: Buffer;
      dstOffset: DeviceSize;
      stride: DeviceSize;
      flags = default(QueryResultFlags);
    ): void {.cdecl, preload("vkCmdCopyQueryPoolResults").}
proc cmdPushConstants*(
      commandBuffer: CommandBuffer;
      layout: PipelineLayout;
      stageFlags: ShaderStageFlags;
      offset: uint32;
      size: uint32;
      pValues {.length: size.}: pointer;
    ): void {.cdecl, preload("vkCmdPushConstants").}
proc cmdBeginRenderPass*(
      commandBuffer: CommandBuffer;
      pRenderPassBegin: ptr RenderPassBeginInfo;
      contents: SubpassContents;
    ): void {.cdecl, preload("vkCmdBeginRenderPass").}
proc cmdNextSubpass*(
      commandBuffer: CommandBuffer;
      contents: SubpassContents;
    ): void {.cdecl, preload("vkCmdNextSubpass").}
proc cmdEndRenderPass*(
      commandBuffer: CommandBuffer;
    ): void {.cdecl, preload("vkCmdEndRenderPass").}
proc cmdExecuteCommands*(
      commandBuffer: CommandBuffer;
      commandBufferCount: uint32;
      pCommandBuffers {.length: commandBufferCount.}: arrPtr[CommandBuffer];
    ): void {.cdecl, preload("vkCmdExecuteCommands").}


# ========================= #
#      LOADER TEMPLATE      #
# ========================= #

# You can use these templates to load Vulkan proc dynamically and individually.
import macros {.all.}
import sequtils

macro loadCommand*[T: proc](handle: Instance or Device; procType: typedesc[T]): T =
  let (loadFrom, loadWith) = block:
    let procTypeDef =
      if procType.kind == nnkSym and procType.symKind == nskType:
        procType.getImpl[2]
      elif procType.kind == nnkTypeOfExpr:
        procType.getTypeImpl[1].getTypeImpl
      else:
        procType

    if procTypeDef.kind != nnkProcTy: error "unexpected"

    let procPragmas = procTypeDef.pragma

    var loadablePragma: NimNode
    for pragma in procPragmas:
      case pragma.kind
      of nnkCall, nnkExprColonExpr:
        if pragma[0].kind == nnkSym and
            pragma[0].symkind == nskTemplate and
            $pragma[0] == "loadable":
          loadablePragma = pragma
          break
      else: continue
    if loadablePragma == nil:
      error "The loadable pragma must be set for the proc type.", procType

    (
      loadFrom: loadablePragma[1],
      loadWith: loadablePragma[2][0..^1].mapIt(LoadWith(it.intVal))
    )

  case handle.getTypeInst.repr
  of Instance.getTypeInst.repr:
    if LoadWith.Instance in loadWith:
      return quote do:
        cast[`procType`](`handle`.getInstanceProcAddr(`loadFrom`))
    else:
      error "Not available to load with instance.", handle

  of Device.getTypeInst.repr:
    if LoadWith.Device in loadWith:
      return quote do:
        cast[`procType`](`handle`.getDeviceProcAddr(`loadFrom`))
    else:
      error "Not available to load with device.", handle

  else: error "Type of the handle must be Instance or Device", procType

macro loadCommand*[T: proc](handle: Instance or Device; procAccessor: T) =
  let cageName = procAccessor.customPragmaNode()
    .findChild(it.len > 0 and it[0].repr == "loadinto")[0][1]
  quote do:
    `cageName` = option `handle`.loadCommand(`cageName`.unsafeGet.typeof)

template withLoad*[T: proc](procAccessor: T; handle: Instance or Device): T =
  procAccessor.load(handle)
  procAccessor


# ========================= #
#      LOADER TEMPLATE      #
# ========================= #




# Bitmask operations
# Utility for bitmask operation added independently
# =================================================

import strutils
import sets
import sugar

proc `==`*[Flagbits: enum](a, b: Flags[Flagbits]): bool =
  a.uint32 == b.uint32

macro `toFlagSets`*[Flagbits: enum](Type: typedesc[Flagbits]; bits: varargs[untyped]): HashSet[Flagbits] =
  if Type.customPragmaNode().findChild(it.repr == "flagbits") == nil:
    error("Expect the enum that has Flagbits pragma", Type)

  result = quote do:
    toHashSet []

  result[1].expectKind nnkBracket
  result[1].add do:
    bits.mapIt:
      quote do: `Type`.`it`

template `{}`*[Flagbits: enum](Type: typedesc[Flagbits]; bits: varargs[untyped]): HashSet[Flagbits] =
  Type.toFlagSets(bits)

converter toFlagSets*[Flagbits: enum](flags: Flags[Flagbits]): HashSet[Flagbits] =
  var val = 1.uint32
  let flags = flags.uint32
  while val <= flags:
    if (val and flags) != 0:
      result.incl Flagbits(val)
    val = val shl 1
proc `{}`*[Flagbits: enum](flags: Flags[Flagbits]): HashSet[Flagbits] =
  flags.toFlagSets

converter toFlags*[Flagbits: enum](flagsets: HashSet[Flagbits]): Flags[Flagbits] =
  for flagset in flagsets:
    result = result or flagset
proc `<+>`*[Flagbits: enum](flagsets: HashSet[Flagbits]): Flags[Flagbits] =
  flagsets.toFlags

converter toFlags*[Flagbits: enum](flagbits: Flagbits): Flags[Flagbits] =
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

proc isSome*[Flagbits: enum](flags: Flags[Flagbits]): bool = flags != Flags[Flagbits].none
proc isSome*[Flagbits: enum](flagsets: HashSet[Flagbits]): bool = flagsets.len != 0

proc isNone*[Flagbits: enum](flags: Flags[Flagbits]): bool = flags == Flags[Flagbits].none
proc isNone*[Flagbits: enum](flagsets: HashSet[Flagbits]): bool = flagsets.len == 0

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

proc `*=`*[Flagbits: enum](a: var Flagbits; b: Flagbits) =               a = a * b
proc `*=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flagbits) =        a = a * b
proc `*=`*[Flagbits: enum](a: var Flagbits; b: Flags[Flagbits]) =        a = a * b
proc `*=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flags[Flagbits]) = a = a * b

proc `+=`*[Flagbits: enum](a: var Flagbits; b: Flagbits) =               a = a + b
proc `+=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flagbits) =        a = a + b
proc `+=`*[Flagbits: enum](a: var Flagbits; b: Flags[Flagbits]) =        a = a + b
proc `+=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flags[Flagbits]) = a = a + b

proc `-+-=`*[Flagbits: enum](a: var Flagbits; b: Flagbits) =               a = a -+- b
proc `-+-=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flagbits) =        a = a -+- b
proc `-+-=`*[Flagbits: enum](a: var Flagbits; b: Flags[Flagbits]) =        a = a -+- b
proc `-+-=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flags[Flagbits]) = a = a -+- b

proc `-=`*[Flagbits: enum](a: var Flagbits; b: Flagbits) =               a = a - b
proc `-=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flagbits) =        a = a - b
proc `-=`*[Flagbits: enum](a: var Flagbits; b: Flags[Flagbits]) =        a = a - b
proc `-=`*[Flagbits: enum](a: var Flags[Flagbits]; b: Flags[Flagbits]) = a = a - b

proc contains*[Flagbits: enum](flags: Flags[Flagbits]; flagbits: Flagbits): bool =
  (flags and flagbits) != flags.none

converter toString*[Flagbits: enum](flags: Flags[Flagbits]): string =
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


# Handle operations
# Utility for handle operation added independently
# ================================================

proc `==`*[T](a, b: Handle[T]): bool = a.uint64 == b.uint64
proc `==`*[T](a: Handle[T]; b: Handle[HandleType]): bool = a.uint64 == b.uint64
template `==`*[T](a: Handle[HandleType]; b: Handle[T]): bool = b == a
proc `==`*(a, b: Handle[HandleType]): bool = a.uint64 == b.uint64

proc `==`*[T](a, b: NonDispatchableHandle[T]): bool = a.uint64 == b.uint64
proc `==`*[T](a: NonDispatchableHandle[T]; b: NonDispatchableHandle[HandleType]): bool = a.uint64 == b.uint64
template `==`*[T](a: NonDispatchableHandle[HandleType]; b: NonDispatchableHandle[T]): bool = b == a
proc `==`*(a, b: NonDispatchableHandle[HandleType]): bool = a.uint64 == b.uint64

proc isValid*[T](h: Handle[T]): bool = a.uint64 != 0
proc isValid*[T](h: NonDispatchableHandle[T]): bool = a.uint64 != 0

proc nullHandle*[T](H: typedesc[Handle[T]]): Handle[T] = H(0)
proc nullHandle*[T](H: typedesc[NonDispatchableHandle[T]]): NonDispatchableHandle[T] = H(0)

# Bool32 operations
# =================

converter toString*(b: Bool32): string = (if b.uint32 == 1: "VkTrue" else: "VkFalse")
proc `$`*(b: Bool32): string = b.toString

converter toBool*(b: Bool32): bool = bool(b)
converter toBool32*(b: bool): Bool32 = Bool32(b)

# Array pointer converters
# ========================
converter toArrPtr*[T](x: var seq[T]): arrPtr[T] =
  if x.len == 0: nil
  else: addr x[0]
converter toArrPtr*[I, T](x: var array[I, T]): arrPtr[T] =
  when x.len == 0: nil
  else: addr x[0]


# Struct Constructor
# It makes it easier to understand what is optional, what is
# implicitly determined, and what needs to be explicitly set
# for many items in the vulkan structure. It also makes it
# easier to write the creation of structures.
# ==========================================================

macro `{}`*[T: object](Struct: typedesc[T]; args: varargs[untyped]): T =
  let structMemDefs = Struct.getImpl[2][2][0..^1]
  type StructArg = object
    name: NimNode
    kind: NimNode
    isOptional: bool
    constant: Option[NimNode]
    length: Option[NimNode]

  let structArgs = structMemDefs.map proc(it: NimNode): StructArg =
    result.name = it[0]
    result.kind = it[1]
    var pragma: Option[NimNode]
    if it[0].kind == nnkPragmaExpr:
      result.name = it[0][0]
      pragma = some it[0][1]
    var exportIt: bool
    if result.name.kind == nnkPostfix and result.name[0].eqIdent "*":
      exportIt = true
      result.name = result.name[1]
    if pragma.isSome:
      for p in pragma.get:
        if p.kind == nnkSym and $p == "optional":
          result.isOptional = true
        if p.kind == nnkExprColonExpr:
          if p[0].kind == nnkSym and $p[0] == "constant":
            result.constant = some p[1]
          if p[0].kind == nnkSym and $p[0] == "length":
            result.length = some p[1]
  let argsCanNotFill = structArgs.filterIt: it.constant.isSome
  let argsOptional = structArgs.filterIt: it.isOptional
  let argsFilledOptional = args
    .mapIt(argsOptional.filter(x => eqIdent(x.name, it[0]) and x.isOptional))
    .filterIt(it.len != 0)
    .mapIt(it[0])
  let argsBlankOptional = argsOptional.filter(x => not argsFilledOptional.anyIt(it == x))
  var argsNeedFill = structArgs.filterIt: not it.isOptional and it.constant.isNone
  # Mark param with the "length" pragma that point to other optional param as optional.
  for i in countdown(argsNeedFill.high, argsNeedFill.low):
    if argsNeedFill[i].length.isNone: continue
    if argsBlankOptional
        .anyIt(eqIdent(it.name, argsneedFill[i].length.get)):
      argsNeedFill.delete i

  block errorCheck:
    for arg in args:
      if argsCanNotFill.anyIt(eqIdent(it.name, arg[0])):
        error "\"" & $arg[0] & "\" is marked as constant so cannot fill it manuary", arg
    for argneed in argsNeedFill:
      if not args.anyIt(eqIdent(it[0], argneed.name)):
        error "\"" & argneed.name.repr & ": " & argneed.kind.repr & "\" is not optional. must be filled", Struct

  newNimNode(nnkObjConstr)
    .add(Struct)
    .add(structArgs
      .filterIt(it.constant.isSome)
      .mapIt(newNimNode(nnkExprColonExpr).add(it.name, it.constant.get)))
    .add(args[0..^1])