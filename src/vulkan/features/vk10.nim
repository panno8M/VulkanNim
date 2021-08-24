# Generated at 2021-08-24T20:18:44+09:00
# vulkan 1.0
# Vulkan core API interface definitions
# ======================================

import ../platform


type
  # Header boilerplate
  # ------------------
  # TODO: [Unsupported Type]
  # (name: "vk_platform", kind: nkrType)

  # Fundamental types used by many commands and structures
  # ------------------------------------------------------
  Bool32* = distinct uint32
  Flags* = distinct uint32
  Rect2D* = object
    offset*: Offset2D
    extent*: Extent2D
  # API result codes
  Result* {.size: sizeof(int32), pure.} = enum
    ErrorUnknown = -13 # An unknown error has occurred, due to an implementation or application bug
    ErrorFragmentedPool = -12 # A requested pool allocation has failed due to fragmentation of the pool's memory
    ErrorFormatNotSupported = -11 # Requested format is not supported on this device
    ErrorTooManyObjects = -10 # Too many objects of the type have already been created
    ErrorIncompatibleDriver = -9 # Unable to find a Vulkan driver
    ErrorFeatureNotPresent = -8 # Requested feature is not available on this device
    ErrorExtensionNotPresent = -7 # Extension specified does not exist
    ErrorLayerNotPresent = -6 # Layer specified does not exist
    ErrorMemoryMapFailed = -5 # Mapping of a memory object has failed
    ErrorDeviceLost = -4 # The logical device has been lost. See <<devsandqueues-lost-device>>
    ErrorInitializationFailed = -3 # Initialization of a object has failed
    ErrorOutOfDeviceMemory = -2 # A device memory allocation has failed
    ErrorOutOfHostMemory = -1 # A host memory allocation has failed
    Success = 0 # Command completed successfully
    NotReady = 1 # A fence or query has not yet completed
    Timeout = 2 # A wait operation has not completed in the specified time
    EventSet = 3 # An event is signaled
    EventReset = 4 # An event is unsignaled
    Incomplete = 5 # A return array was too small for the result
    # Provided by VK_KHR_surface
    ErrorSurfaceLost = 100000000000
    # Provided by VK_KHR_surface
    ErrorNativeWindowInUse = 100000000001
    # Provided by VK_KHR_swapchain
    Suboptimal = 100000010003
    # Provided by VK_KHR_swapchain
    ErrorOutOfDate = 100000010004
    # Provided by VK_KHR_display_swapchain
    ErrorIncompatibleDisplay = 100000030001
    # Provided by VK_EXT_debug_report
    ErrorValidationFailed = 100000110001
    # Provided by VK_NV_glsl_shader
    ErrorInvalidShader = 100000120000
    # Provided by VK_VERSION_1_1
    ErrorOutOfPoolMemory = 100000690000
    # Provided by VK_VERSION_1_1
    ErrorInvalidExternalHandle = 100000720003
    # Provided by VK_KHR_ray_tracing
    ErrorIncompatibleVersion = 100001500000
    # Provided by VK_EXT_image_drm_format_modifier
    ErrorInvalidDrmFormatModifierPlaneLayout = 100001580000
    # Provided by VK_VERSION_1_2
    ErrorFragmentation = 100001610000
    # Provided by VK_EXT_global_priority
    ErrorNotPermitted = 100001740001
    # Provided by VK_EXT_full_screen_exclusive
    ErrorFullScreenExclusiveModeLost = 100002550000
    # Provided by VK_VERSION_1_2
    ErrorInvalidOpaqueCaptureAddress = 100002570000
    # Provided by VK_KHR_deferred_host_operations
    ThreadIdle = 100002680000
    # Provided by VK_KHR_deferred_host_operations
    ThreadDone = 100002680001
    # Provided by VK_KHR_deferred_host_operations
    OperationDeferred = 100002680002
    # Provided by VK_KHR_deferred_host_operations
    OperationNotDeferred = 100002680003
    # Provided by VK_EXT_pipeline_creation_cache_control
    PipelineCompileRequired = 100002970000
  Offset2D* = object
    x*: int32
    y*: int32
  Offset3D* = object
    x*: int32
    y*: int32
    z*: int32
  # Structure type enumerant
  StructureType* {.size: sizeof(int32), pure.} = enum
    ApplicationInfo = 0
    InstanceCreateInfo = 1
    DeviceQueueCreateInfo = 2
    DeviceCreateInfo = 3
    SubmitInfo = 4
    MemoryAllocateInfo = 5
    MappedMemoryRange = 6
    BindSparseInfo = 7
    FenceCreateInfo = 8
    SemaphoreCreateInfo = 9
    EventCreateInfo = 10
    QueryPoolCreateInfo = 11
    BufferCreateInfo = 12
    BufferViewCreateInfo = 13
    ImageCreateInfo = 14
    ImageViewCreateInfo = 15
    ShaderModuleCreateInfo = 16
    PipelineCacheCreateInfo = 17
    PipelineShaderStageCreateInfo = 18
    PipelineVertexInputStateCreateInfo = 19
    PipelineInputAssemblyStateCreateInfo = 20
    PipelineTessellationStateCreateInfo = 21
    PipelineViewportStateCreateInfo = 22
    PipelineRasterizationStateCreateInfo = 23
    PipelineMultisampleStateCreateInfo = 24
    PipelineDepthStencilStateCreateInfo = 25
    PipelineColorBlendStateCreateInfo = 26
    PipelineDynamicStateCreateInfo = 27
    GraphicsPipelineCreateInfo = 28
    ComputePipelineCreateInfo = 29
    PipelineLayoutCreateInfo = 30
    SamplerCreateInfo = 31
    DescriptorSetLayoutCreateInfo = 32
    DescriptorPoolCreateInfo = 33
    DescriptorSetAllocateInfo = 34
    WriteDescriptorSet = 35
    CopyDescriptorSet = 36
    FramebufferCreateInfo = 37
    RenderPassCreateInfo = 38
    CommandPoolCreateInfo = 39
    CommandBufferAllocateInfo = 40
    CommandBufferInheritanceInfo = 41
    CommandBufferBeginInfo = 42
    RenderPassBeginInfo = 43
    BufferMemoryBarrier = 44
    ImageMemoryBarrier = 45
    MemoryBarrier = 46
    LoaderInstanceCreateInfo = 47 # Reserved for internal use by the loader, layers, and ICDs
    LoaderDeviceCreateInfo = 48 # Reserved for internal use by the loader, layers, and ICDs
    # Provided by VK_KHR_swapchain
    SwapchainCreateInfo = 100000010000
    # Provided by VK_KHR_swapchain
    PresentInfo = 100000010001
    # Provided by VK_KHR_swapchain
    DeviceGroupPresentCapabilities = 100000010007
    # Provided by VK_KHR_swapchain
    ImageSwapchainCreateInfo = 100000010008
    # Provided by VK_KHR_swapchain
    BindImageMemorySwapchainInfo = 100000010009
    # Provided by VK_KHR_swapchain
    AcquireNextImageInfo = 100000010010
    # Provided by VK_KHR_swapchain
    DeviceGroupPresentInfo = 100000010011
    # Provided by VK_KHR_swapchain
    DeviceGroupSwapchainCreateInfo = 100000010012
    # Provided by VK_KHR_display
    DisplayModeCreateInfo = 100000020000
    # Provided by VK_KHR_display
    DisplaySurfaceCreateInfo = 100000020001
    # Provided by VK_KHR_display_swapchain
    DisplayPresentInfo = 100000030000
    # Provided by VK_KHR_xlib_surface
    XlibSurfaceCreateInfo = 100000040000
    # Provided by VK_KHR_xcb_surface
    XcbSurfaceCreateInfo = 100000050000
    # Provided by VK_KHR_wayland_surface
    WaylandSurfaceCreateInfo = 100000060000
    # Provided by VK_KHR_android_surface
    AndroidSurfaceCreateInfo = 100000080000
    # Provided by VK_KHR_win32_surface
    Win32SurfaceCreateInfo = 100000090000
    # Provided by VK_ANDROID_native_buffer
    NativeBuffer = 100000100000
    # Provided by VK_ANDROID_native_buffer
    SwapchainImageCreateInfo = 100000100001
    # Provided by VK_ANDROID_native_buffer
    PhysicalDevicePresentationProperties = 100000100002
    # Provided by VK_EXT_debug_report
    DebugReportCallbackCreateInfo = 100000110000
    # Provided by VK_AMD_rasterization_order
    PipelineRasterizationStateRasterizationOrder = 100000180000
    # Provided by VK_EXT_debug_marker
    DebugMarkerObjectNameInfo = 100000220000
    # Provided by VK_EXT_debug_marker
    DebugMarkerObjectTagInfo = 100000220001
    # Provided by VK_EXT_debug_marker
    DebugMarkerMarkerInfo = 100000220002
    # Provided by VK_NV_dedicated_allocation
    DedicatedAllocationImageCreateInfo = 100000260000
    # Provided by VK_NV_dedicated_allocation
    DedicatedAllocationBufferCreateInfo = 100000260001
    # Provided by VK_NV_dedicated_allocation
    DedicatedAllocationMemoryAllocateInfo = 100000260002
    # Provided by VK_EXT_transform_feedback
    PhysicalDeviceTransformFeedbackFeatures = 100000280000
    # Provided by VK_EXT_transform_feedback
    PhysicalDeviceTransformFeedbackProperties = 100000280001
    # Provided by VK_EXT_transform_feedback
    PipelineRasterizationStateStreamCreateInfo = 100000280002
    # Provided by VK_NVX_image_view_handle
    ImageViewHandleInfo = 100000300000
    # Provided by VK_NVX_image_view_handle
    ImageViewAddressProperties = 100000300001
    # Provided by VK_AMD_texture_gather_bias_lod
    TextureLodGatherFormatProperties = 100000410000
    # Provided by VK_GGP_stream_descriptor_surface
    StreamDescriptorSurfaceCreateInfo = 100000490000
    # Provided by VK_NV_corner_sampled_image
    PhysicalDeviceCornerSampledImageFeatures = 100000500000
    # Provided by VK_VERSION_1_1
    RenderPassMultiviewCreateInfo = 100000530000
    # Provided by VK_VERSION_1_1
    PhysicalDeviceMultiviewFeatures = 100000530001
    # Provided by VK_VERSION_1_1
    PhysicalDeviceMultiviewProperties = 100000530002
    # Provided by VK_NV_external_memory_win32
    ImportMemoryWin32HandleInfo = 100000570000
    # Provided by VK_NV_external_memory_win32
    ExportMemoryWin32HandleInfo = 100000570001
    # Provided by VK_NV_win32_keyed_mutex
    Win32KeyedMutexAcquireReleaseInfo = 100000580000
    # Provided by VK_VERSION_1_1
    PhysicalDeviceFeatures2 = 100000590000
    # Provided by VK_VERSION_1_1
    PhysicalDeviceProperties2 = 100000590001
    # Provided by VK_VERSION_1_1
    FormatProperties2 = 100000590002
    # Provided by VK_VERSION_1_1
    ImageFormatProperties2 = 100000590003
    # Provided by VK_VERSION_1_1
    PhysicalDeviceImageFormatInfo2 = 100000590004
    # Provided by VK_VERSION_1_1
    QueueFamilyProperties2 = 100000590005
    # Provided by VK_VERSION_1_1
    PhysicalDeviceMemoryProperties2 = 100000590006
    # Provided by VK_VERSION_1_1
    SparseImageFormatProperties2 = 100000590007
    # Provided by VK_VERSION_1_1
    PhysicalDeviceSparseImageFormatInfo2 = 100000590008
    # Provided by VK_VERSION_1_1
    MemoryAllocateFlagsInfo = 100000600000
    # Provided by VK_VERSION_1_1
    DeviceGroupRenderPassBeginInfo = 100000600003
    # Provided by VK_VERSION_1_1
    DeviceGroupCommandBufferBeginInfo = 100000600004
    # Provided by VK_VERSION_1_1
    DeviceGroupSubmitInfo = 100000600005
    # Provided by VK_VERSION_1_1
    DeviceGroupBindSparseInfo = 100000600006
    # Provided by VK_VERSION_1_1
    BindBufferMemoryDeviceGroupInfo = 100000600013
    # Provided by VK_VERSION_1_1
    BindImageMemoryDeviceGroupInfo = 100000600014
    # Provided by VK_EXT_validation_flags
    ValidationFlags = 100000610000
    # Provided by VK_NN_vi_surface
    ViSurfaceCreateInfo = 100000620000
    # Provided by VK_VERSION_1_1
    PhysicalDeviceShaderDrawParametersFeatures = 100000630000
    # Provided by VK_EXT_texture_compression_astc_hdr
    PhysicalDeviceTextureCompressionAstcHdrFeatures = 100000660000
    # Provided by VK_EXT_astc_decode_mode
    ImageViewAstcDecodeMode = 100000670000
    # Provided by VK_EXT_astc_decode_mode
    PhysicalDeviceAstcDecodeFeatures = 100000670001
    # Provided by VK_VERSION_1_1
    PhysicalDeviceGroupProperties = 100000700000
    # Provided by VK_VERSION_1_1
    DeviceGroupDeviceCreateInfo = 100000700001
    # Provided by VK_VERSION_1_1
    PhysicalDeviceExternalImageFormatInfo = 100000710000
    # Provided by VK_VERSION_1_1
    ExternalImageFormatProperties = 100000710001
    # Provided by VK_VERSION_1_1
    PhysicalDeviceExternalBufferInfo = 100000710002
    # Provided by VK_VERSION_1_1
    ExternalBufferProperties = 100000710003
    # Provided by VK_VERSION_1_1
    PhysicalDeviceIdProperties = 100000710004
    # Provided by VK_VERSION_1_1
    ExternalMemoryBufferCreateInfo = 100000720000
    # Provided by VK_VERSION_1_1
    ExternalMemoryImageCreateInfo = 100000720001
    # Provided by VK_VERSION_1_1
    ExportMemoryAllocateInfo = 100000720002
    # Provided by VK_KHR_external_memory_win32
    MemoryWin32HandleProperties = 100000730002
    # Provided by VK_KHR_external_memory_win32
    MemoryGetWin32HandleInfo = 100000730003
    # Provided by VK_KHR_external_memory_fd
    ImportMemoryFdInfo = 100000740000
    # Provided by VK_KHR_external_memory_fd
    MemoryFdProperties = 100000740001
    # Provided by VK_KHR_external_memory_fd
    MemoryGetFdInfo = 100000740002
    # Provided by VK_VERSION_1_1
    PhysicalDeviceExternalSemaphoreInfo = 100000760000
    # Provided by VK_VERSION_1_1
    ExternalSemaphoreProperties = 100000760001
    # Provided by VK_VERSION_1_1
    ExportSemaphoreCreateInfo = 100000770000
    # Provided by VK_KHR_external_semaphore_win32
    ImportSemaphoreWin32HandleInfo = 100000780000
    # Provided by VK_KHR_external_semaphore_win32
    ExportSemaphoreWin32HandleInfo = 100000780001
    # Provided by VK_KHR_external_semaphore_win32
    D3d12FenceSubmitInfo = 100000780002
    # Provided by VK_KHR_external_semaphore_win32
    SemaphoreGetWin32HandleInfo = 100000780003
    # Provided by VK_KHR_external_semaphore_fd
    ImportSemaphoreFdInfo = 100000790000
    # Provided by VK_KHR_external_semaphore_fd
    SemaphoreGetFdInfo = 100000790001
    # Provided by VK_KHR_push_descriptor
    PhysicalDevicePushDescriptorProperties = 100000800000
    # Provided by VK_EXT_conditional_rendering
    CommandBufferInheritanceConditionalRenderingInfo = 100000810000
    # Provided by VK_EXT_conditional_rendering
    PhysicalDeviceConditionalRenderingFeatures = 100000810001
    # Provided by VK_EXT_conditional_rendering
    ConditionalRenderingBeginInfo = 100000810002
    # Provided by VK_VERSION_1_2
    PhysicalDeviceShaderFloat16Int8Features = 100000820000
    # Provided by VK_VERSION_1_1
    PhysicalDevice16bitStorageFeatures = 100000830000
    # Provided by VK_KHR_incremental_present
    PresentRegions = 100000840000
    # Provided by VK_VERSION_1_1
    DescriptorUpdateTemplateCreateInfo = 100000850000
    # Provided by VK_NV_clip_space_w_scaling
    PipelineViewportWScalingStateCreateInfo = 100000870000
    # Provided by VK_EXT_display_surface_counter
    SurfaceCapabilities2 = 100000900000
    # Provided by VK_EXT_display_control
    DisplayPowerInfo = 100000910000
    # Provided by VK_EXT_display_control
    DeviceEventInfo = 100000910001
    # Provided by VK_EXT_display_control
    DisplayEventInfo = 100000910002
    # Provided by VK_EXT_display_control
    SwapchainCounterCreateInfo = 100000910003
    # Provided by VK_GOOGLE_display_timing
    PresentTimesInfo = 100000920000
    # Provided by VK_VERSION_1_1
    PhysicalDeviceSubgroupProperties = 100000940000
    # Provided by VK_NVX_multiview_per_view_attributes
    PhysicalDeviceMultiviewPerViewAttributesProperties = 100000970000
    # Provided by VK_NV_viewport_swizzle
    PipelineViewportSwizzleStateCreateInfo = 100000980000
    # Provided by VK_EXT_discard_rectangles
    PhysicalDeviceDiscardRectangleProperties = 100000990000
    # Provided by VK_EXT_discard_rectangles
    PipelineDiscardRectangleStateCreateInfo = 100000990001
    # Provided by VK_EXT_conservative_rasterization
    PhysicalDeviceConservativeRasterizationProperties = 100001010000
    # Provided by VK_EXT_conservative_rasterization
    PipelineRasterizationConservativeStateCreateInfo = 100001010001
    # Provided by VK_EXT_depth_clip_enable
    PhysicalDeviceDepthClipEnableFeatures = 100001020000
    # Provided by VK_EXT_depth_clip_enable
    PipelineRasterizationDepthClipStateCreateInfo = 100001020001
    # Provided by VK_EXT_hdr_metadata
    HdrMetadata = 100001050000
    # Provided by VK_VERSION_1_2
    PhysicalDeviceImagelessFramebufferFeatures = 100001080000
    # Provided by VK_VERSION_1_2
    FramebufferAttachmentsCreateInfo = 100001080001
    # Provided by VK_VERSION_1_2
    FramebufferAttachmentImageInfo = 100001080002
    # Provided by VK_VERSION_1_2
    RenderPassAttachmentBeginInfo = 100001080003
    # Provided by VK_VERSION_1_2
    AttachmentDescription2 = 100001090000
    # Provided by VK_VERSION_1_2
    AttachmentReference2 = 100001090001
    # Provided by VK_VERSION_1_2
    SubpassDescription2 = 100001090002
    # Provided by VK_VERSION_1_2
    SubpassDependency2 = 100001090003
    # Provided by VK_VERSION_1_2
    RenderPassCreateInfo2 = 100001090004
    # Provided by VK_VERSION_1_2
    SubpassBeginInfo = 100001090005
    # Provided by VK_VERSION_1_2
    SubpassEndInfo = 100001090006
    # Provided by VK_KHR_shared_presentable_image
    SharedPresentSurfaceCapabilities = 100001110000
    # Provided by VK_VERSION_1_1
    PhysicalDeviceExternalFenceInfo = 100001120000
    # Provided by VK_VERSION_1_1
    ExternalFenceProperties = 100001120001
    # Provided by VK_VERSION_1_1
    ExportFenceCreateInfo = 100001130000
    # Provided by VK_KHR_external_fence_win32
    ImportFenceWin32HandleInfo = 100001140000
    # Provided by VK_KHR_external_fence_win32
    ExportFenceWin32HandleInfo = 100001140001
    # Provided by VK_KHR_external_fence_win32
    FenceGetWin32HandleInfo = 100001140002
    # Provided by VK_KHR_external_fence_fd
    ImportFenceFdInfo = 100001150000
    # Provided by VK_KHR_external_fence_fd
    FenceGetFdInfo = 100001150001
    # Provided by VK_KHR_performance_query
    PhysicalDevicePerformanceQueryFeatures = 100001160000
    # Provided by VK_KHR_performance_query
    PhysicalDevicePerformanceQueryProperties = 100001160001
    # Provided by VK_KHR_performance_query
    QueryPoolPerformanceCreateInfo = 100001160002
    # Provided by VK_KHR_performance_query
    PerformanceQuerySubmitInfo = 100001160003
    # Provided by VK_KHR_performance_query
    AcquireProfilingLockInfo = 100001160004
    # Provided by VK_KHR_performance_query
    PerformanceCounter = 100001160005
    # Provided by VK_KHR_performance_query
    PerformanceCounterDescription = 100001160006
    # Provided by VK_VERSION_1_1
    PhysicalDevicePointClippingProperties = 100001170000
    # Provided by VK_VERSION_1_1
    RenderPassInputAttachmentAspectCreateInfo = 100001170001
    # Provided by VK_VERSION_1_1
    ImageViewUsageCreateInfo = 100001170002
    # Provided by VK_VERSION_1_1
    PipelineTessellationDomainOriginStateCreateInfo = 100001170003
    # Provided by VK_KHR_get_surface_capabilities2
    PhysicalDeviceSurfaceInfo2 = 100001190000
    # Provided by VK_KHR_get_surface_capabilities2
    SurfaceFormat2 = 100001190002
    # Provided by VK_VERSION_1_1
    PhysicalDeviceVariablePointersFeatures = 100001200000
    # Provided by VK_KHR_get_display_properties2
    DisplayProperties2 = 100001210000
    # Provided by VK_KHR_get_display_properties2
    DisplayPlaneProperties2 = 100001210001
    # Provided by VK_KHR_get_display_properties2
    DisplayModeProperties2 = 100001210002
    # Provided by VK_KHR_get_display_properties2
    DisplayPlaneInfo2 = 100001210003
    # Provided by VK_KHR_get_display_properties2
    DisplayPlaneCapabilities2 = 100001210004
    # Provided by VK_MVK_ios_surface
    IosSurfaceCreateInfoM = 100001220000
    # Provided by VK_MVK_macos_surface
    MacosSurfaceCreateInfoM = 100001230000
    # Provided by VK_VERSION_1_1
    MemoryDedicatedRequirements = 100001270000
    # Provided by VK_VERSION_1_1
    MemoryDedicatedAllocateInfo = 100001270001
    # Provided by VK_EXT_debug_utils
    DebugUtilsObjectNameInfo = 100001280000
    # Provided by VK_EXT_debug_utils
    DebugUtilsObjectTagInfo = 100001280001
    # Provided by VK_EXT_debug_utils
    DebugUtilsLabel = 100001280002
    # Provided by VK_EXT_debug_utils
    DebugUtilsMessengerCallbackData = 100001280003
    # Provided by VK_EXT_debug_utils
    DebugUtilsMessengerCreateInfo = 100001280004
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    AndroidHardwareBufferUsage = 100001290000
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    AndroidHardwareBufferProperties = 100001290001
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    AndroidHardwareBufferFormatProperties = 100001290002
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    ImportAndroidHardwareBufferInfo = 100001290003
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    MemoryGetAndroidHardwareBufferInfo = 100001290004
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    ExternalFormat = 100001290005
    # Provided by VK_VERSION_1_2
    PhysicalDeviceSamplerFilterMinmaxProperties = 100001300000
    # Provided by VK_VERSION_1_2
    SamplerReductionModeCreateInfo = 100001300001
    # Provided by VK_EXT_inline_uniform_block
    PhysicalDeviceInlineUniformBlockFeatures = 100001380000
    # Provided by VK_EXT_inline_uniform_block
    PhysicalDeviceInlineUniformBlockProperties = 100001380001
    # Provided by VK_EXT_inline_uniform_block
    WriteDescriptorSetInlineUniformBlock = 100001380002
    # Provided by VK_EXT_inline_uniform_block
    DescriptorPoolInlineUniformBlockCreateInfo = 100001380003
    # Provided by VK_EXT_sample_locations
    SampleLocationsInfo = 100001430000
    # Provided by VK_EXT_sample_locations
    RenderPassSampleLocationsBeginInfo = 100001430001
    # Provided by VK_EXT_sample_locations
    PipelineSampleLocationsStateCreateInfo = 100001430002
    # Provided by VK_EXT_sample_locations
    PhysicalDeviceSampleLocationsProperties = 100001430003
    # Provided by VK_EXT_sample_locations
    MultisampleProperties = 100001430004
    # Provided by VK_VERSION_1_1
    ProtectedSubmitInfo = 100001450000
    # Provided by VK_VERSION_1_1
    PhysicalDeviceProtectedMemoryFeatures = 100001450001
    # Provided by VK_VERSION_1_1
    PhysicalDeviceProtectedMemoryProperties = 100001450002
    # Provided by VK_VERSION_1_1
    DeviceQueueInfo2 = 100001450003
    # Provided by VK_VERSION_1_1
    BufferMemoryRequirementsInfo2 = 100001460000
    # Provided by VK_VERSION_1_1
    ImageMemoryRequirementsInfo2 = 100001460001
    # Provided by VK_VERSION_1_1
    ImageSparseMemoryRequirementsInfo2 = 100001460002
    # Provided by VK_VERSION_1_1
    MemoryRequirements2 = 100001460003
    # Provided by VK_VERSION_1_1
    SparseImageMemoryRequirements2 = 100001460004
    # Provided by VK_VERSION_1_2
    ImageFormatListCreateInfo = 100001470000
    # Provided by VK_EXT_blend_operation_advanced
    PhysicalDeviceBlendOperationAdvancedFeatures = 100001480000
    # Provided by VK_EXT_blend_operation_advanced
    PhysicalDeviceBlendOperationAdvancedProperties = 100001480001
    # Provided by VK_EXT_blend_operation_advanced
    PipelineColorBlendAdvancedStateCreateInfo = 100001480002
    # Provided by VK_NV_fragment_coverage_to_color
    PipelineCoverageToColorStateCreateInfo = 100001490000
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureBuildGeometryInfo = 100001500000
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureCreateGeometryTypeInfo = 100001500001
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureDeviceAddressInfo = 100001500002
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureGeometryAabbsData = 100001500003
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureGeometryInstancesData = 100001500004
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureGeometryTrianglesData = 100001500005
    # Provided by VK_KHR_ray_tracing
    BindAccelerationStructureMemoryInfo = 100001500006
    # Provided by VK_KHR_ray_tracing
    WriteDescriptorSetAccelerationStructure = 100001500007
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureMemoryRequirementsInfo = 100001500008
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureVersion = 100001500009
    # Provided by VK_KHR_ray_tracing
    CopyAccelerationStructureInfo = 100001500010
    # Provided by VK_KHR_ray_tracing
    CopyAccelerationStructureToMemoryInfo = 100001500011
    # Provided by VK_KHR_ray_tracing
    CopyMemoryToAccelerationStructureInfo = 100001500012
    # Provided by VK_KHR_ray_tracing
    PhysicalDeviceRayTracingFeatures = 100001500013
    # Provided by VK_KHR_ray_tracing
    PhysicalDeviceRayTracingProperties = 100001500014
    # Provided by VK_KHR_ray_tracing
    RayTracingPipelineCreateInfo = 100001500015
    # Provided by VK_KHR_ray_tracing
    RayTracingShaderGroupCreateInfo = 100001500016
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureCreateInfo = 100001500017
    # Provided by VK_KHR_ray_tracing
    RayTracingPipelineInterfaceCreateInfo = 100001500018
    # Provided by VK_NV_framebuffer_mixed_samples
    PipelineCoverageModulationStateCreateInfo = 100001520000
    # Provided by VK_NV_shader_sm_builtins
    PhysicalDeviceShaderSmBuiltinsFeatures = 100001540000
    # Provided by VK_NV_shader_sm_builtins
    PhysicalDeviceShaderSmBuiltinsProperties = 100001540001
    # Provided by VK_VERSION_1_1
    SamplerYcbcrConversionCreateInfo = 100001560000
    # Provided by VK_VERSION_1_1
    SamplerYcbcrConversionInfo = 100001560001
    # Provided by VK_VERSION_1_1
    BindImagePlaneMemoryInfo = 100001560002
    # Provided by VK_VERSION_1_1
    ImagePlaneMemoryRequirementsInfo = 100001560003
    # Provided by VK_VERSION_1_1
    PhysicalDeviceSamplerYcbcrConversionFeatures = 100001560004
    # Provided by VK_VERSION_1_1
    SamplerYcbcrConversionImageFormatProperties = 100001560005
    # Provided by VK_VERSION_1_1
    BindBufferMemoryInfo = 100001570000
    # Provided by VK_VERSION_1_1
    BindImageMemoryInfo = 100001570001
    # Provided by VK_EXT_image_drm_format_modifier
    DrmFormatModifierPropertiesList = 100001580000
    # Provided by VK_EXT_image_drm_format_modifier
    DrmFormatModifierProperties = 100001580001
    # Provided by VK_EXT_image_drm_format_modifier
    PhysicalDeviceImageDrmFormatModifierInfo = 100001580002
    # Provided by VK_EXT_image_drm_format_modifier
    ImageDrmFormatModifierListCreateInfo = 100001580003
    # Provided by VK_EXT_image_drm_format_modifier
    ImageDrmFormatModifierExplicitCreateInfo = 100001580004
    # Provided by VK_EXT_image_drm_format_modifier
    ImageDrmFormatModifierProperties = 100001580005
    # Provided by VK_EXT_validation_cache
    ValidationCacheCreateInfo = 100001600000
    # Provided by VK_EXT_validation_cache
    ShaderModuleValidationCacheCreateInfo = 100001600001
    # Provided by VK_VERSION_1_2
    DescriptorSetLayoutBindingFlagsCreateInfo = 100001610000
    # Provided by VK_VERSION_1_2
    PhysicalDeviceDescriptorIndexingFeatures = 100001610001
    # Provided by VK_VERSION_1_2
    PhysicalDeviceDescriptorIndexingProperties = 100001610002
    # Provided by VK_VERSION_1_2
    DescriptorSetVariableDescriptorCountAllocateInfo = 100001610003
    # Provided by VK_VERSION_1_2
    DescriptorSetVariableDescriptorCountLayoutSupport = 100001610004
    # Provided by VK_NV_shading_rate_image
    PipelineViewportShadingRateImageStateCreateInfo = 100001640000
    # Provided by VK_NV_shading_rate_image
    PhysicalDeviceShadingRateImageFeatures = 100001640001
    # Provided by VK_NV_shading_rate_image
    PhysicalDeviceShadingRateImageProperties = 100001640002
    # Provided by VK_NV_shading_rate_image
    PipelineViewportCoarseSampleOrderStateCreateInfo = 100001640005
    # Provided by VK_NV_ray_tracing
    Geometry = 100001650003
    # Provided by VK_NV_ray_tracing
    GeometryTriangles = 100001650004
    # Provided by VK_NV_ray_tracing
    GeometryAabb = 100001650005
    # Provided by VK_NV_ray_tracing
    AccelerationStructureInfo = 100001650012
    # Provided by VK_NV_representative_fragment_test
    PhysicalDeviceRepresentativeFragmentTestFeatures = 100001660000
    # Provided by VK_NV_representative_fragment_test
    PipelineRepresentativeFragmentTestStateCreateInfo = 100001660001
    # Provided by VK_VERSION_1_1
    PhysicalDeviceMaintenance3Properties = 100001680000
    # Provided by VK_VERSION_1_1
    DescriptorSetLayoutSupport = 100001680001
    # Provided by VK_EXT_filter_cubic
    PhysicalDeviceImageViewImageFormatInfo = 100001700000
    # Provided by VK_EXT_filter_cubic
    FilterCubicImageViewImageFormatProperties = 100001700001
    # Provided by VK_EXT_global_priority
    DeviceQueueGlobalPriorityCreateInfo = 100001740000
    # Provided by VK_VERSION_1_2
    PhysicalDeviceShaderSubgroupExtendedTypesFeatures = 100001750000
    # Provided by VK_VERSION_1_2
    PhysicalDevice8bitStorageFeatures = 100001770000
    # Provided by VK_EXT_external_memory_host
    ImportMemoryHostPointerInfo = 100001780000
    # Provided by VK_EXT_external_memory_host
    MemoryHostPointerProperties = 100001780001
    # Provided by VK_EXT_external_memory_host
    PhysicalDeviceExternalMemoryHostProperties = 100001780002
    # Provided by VK_VERSION_1_2
    PhysicalDeviceShaderAtomicInt64Features = 100001800000
    # Provided by VK_KHR_shader_clock
    PhysicalDeviceShaderClockFeatures = 100001810000
    # Provided by VK_AMD_pipeline_compiler_control
    PipelineCompilerControlCreateInfo = 100001830000
    # Provided by VK_EXT_calibrated_timestamps
    CalibratedTimestampInfo = 100001840000
    # Provided by VK_AMD_shader_core_properties
    PhysicalDeviceShaderCoreProperties = 100001850000
    # Provided by VK_AMD_memory_overallocation_behavior
    DeviceMemoryOverallocationCreateInfo = 100001890000
    # Provided by VK_EXT_vertex_attribute_divisor
    PhysicalDeviceVertexAttributeDivisorProperties = 100001900000
    # Provided by VK_EXT_vertex_attribute_divisor
    PipelineVertexInputDivisorStateCreateInfo = 100001900001
    # Provided by VK_EXT_vertex_attribute_divisor
    PhysicalDeviceVertexAttributeDivisorFeatures = 100001900002
    # Provided by VK_GGP_frame_token
    PresentFrameToken = 100001910000
    # Provided by VK_EXT_pipeline_creation_feedback
    PipelineCreationFeedbackCreateInfo = 100001920000
    # Provided by VK_VERSION_1_2
    PhysicalDeviceDriverProperties = 100001960000
    # Provided by VK_VERSION_1_2
    PhysicalDeviceFloatControlsProperties = 100001970000
    # Provided by VK_VERSION_1_2
    PhysicalDeviceDepthStencilResolveProperties = 100001990000
    # Provided by VK_VERSION_1_2
    SubpassDescriptionDepthStencilResolve = 100001990001
    # Provided by VK_NV_compute_shader_derivatives
    PhysicalDeviceComputeShaderDerivativesFeatures = 100002010000
    # Provided by VK_NV_mesh_shader
    PhysicalDeviceMeshShaderFeatures = 100002020000
    # Provided by VK_NV_mesh_shader
    PhysicalDeviceMeshShaderProperties = 100002020001
    # Provided by VK_NV_fragment_shader_barycentric
    PhysicalDeviceFragmentShaderBarycentricFeatures = 100002030000
    # Provided by VK_NV_shader_image_footprint
    PhysicalDeviceShaderImageFootprintFeatures = 100002040000
    # Provided by VK_NV_scissor_exclusive
    PipelineViewportExclusiveScissorStateCreateInfo = 100002050000
    # Provided by VK_NV_scissor_exclusive
    PhysicalDeviceExclusiveScissorFeatures = 100002050002
    # Provided by VK_NV_device_diagnostic_checkpoints
    CheckpointData = 100002060000
    # Provided by VK_NV_device_diagnostic_checkpoints
    QueueFamilyCheckpointProperties = 100002060001
    # Provided by VK_VERSION_1_2
    PhysicalDeviceTimelineSemaphoreFeatures = 100002070000
    # Provided by VK_VERSION_1_2
    PhysicalDeviceTimelineSemaphoreProperties = 100002070001
    # Provided by VK_VERSION_1_2
    SemaphoreTypeCreateInfo = 100002070002
    # Provided by VK_VERSION_1_2
    TimelineSemaphoreSubmitInfo = 100002070003
    # Provided by VK_VERSION_1_2
    SemaphoreWaitInfo = 100002070004
    # Provided by VK_VERSION_1_2
    SemaphoreSignalInfo = 100002070005
    # Provided by VK_INTEL_shader_integer_functions2
    PhysicalDeviceShaderIntegerFunctions2Features = 100002090000
    # Provided by VK_INTEL_performance_query
    QueryPoolPerformanceQueryCreateInfo = 100002100000
    # Provided by VK_INTEL_performance_query
    InitializePerformanceApiInfo = 100002100001
    # Provided by VK_INTEL_performance_query
    PerformanceMarkerInfo = 100002100002
    # Provided by VK_INTEL_performance_query
    PerformanceStreamMarkerInfo = 100002100003
    # Provided by VK_INTEL_performance_query
    PerformanceOverrideInfo = 100002100004
    # Provided by VK_INTEL_performance_query
    PerformanceConfigurationAcquireInfo = 100002100005
    # Provided by VK_VERSION_1_2
    PhysicalDeviceVulkanMemoryModelFeatures = 100002110000
    # Provided by VK_EXT_pci_bus_info
    PhysicalDevicePciBusInfoProperties = 100002120000
    # Provided by VK_AMD_display_native_hdr
    DisplayNativeHdrSurfaceCapabilities = 100002130000
    # Provided by VK_AMD_display_native_hdr
    SwapchainDisplayNativeHdrCreateInfo = 100002130001
    # Provided by VK_FUCHSIA_imagepipe_surface
    ImagepipeSurfaceCreateInfo = 100002140000
    # Provided by VK_EXT_metal_surface
    MetalSurfaceCreateInfo = 100002170000
    # Provided by VK_EXT_fragment_density_map
    PhysicalDeviceFragmentDensityMapFeatures = 100002180000
    # Provided by VK_EXT_fragment_density_map
    PhysicalDeviceFragmentDensityMapProperties = 100002180001
    # Provided by VK_EXT_fragment_density_map
    RenderPassFragmentDensityMapCreateInfo = 100002180002
    # Provided by VK_VERSION_1_2
    PhysicalDeviceScalarBlockLayoutFeatures = 100002210000
    # Provided by VK_EXT_subgroup_size_control
    PhysicalDeviceSubgroupSizeControlProperties = 100002250000
    # Provided by VK_EXT_subgroup_size_control
    PipelineShaderStageRequiredSubgroupSizeCreateInfo = 100002250001
    # Provided by VK_EXT_subgroup_size_control
    PhysicalDeviceSubgroupSizeControlFeatures = 100002250002
    # Provided by VK_AMD_shader_core_properties2
    PhysicalDeviceShaderCoreProperties2 = 100002270000
    # Provided by VK_AMD_device_coherent_memory
    PhysicalDeviceCoherentMemoryFeatures = 100002290000
    # Provided by VK_EXT_memory_budget
    PhysicalDeviceMemoryBudgetProperties = 100002370000
    # Provided by VK_EXT_memory_priority
    PhysicalDeviceMemoryPriorityFeatures = 100002380000
    # Provided by VK_EXT_memory_priority
    MemoryPriorityAllocateInfo = 100002380001
    # Provided by VK_KHR_surface_protected_capabilities
    SurfaceProtectedCapabilities = 100002390000
    # Provided by VK_NV_dedicated_allocation_image_aliasing
    PhysicalDeviceDedicatedAllocationImageAliasingFeatures = 100002400000
    # Provided by VK_VERSION_1_2
    PhysicalDeviceSeparateDepthStencilLayoutsFeatures = 100002410000
    # Provided by VK_VERSION_1_2
    AttachmentReferenceStencilLayout = 100002410001
    # Provided by VK_VERSION_1_2
    AttachmentDescriptionStencilLayout = 100002410002
    # Provided by VK_VERSION_1_2
    BufferDeviceAddressInfo = 100002440001
    # Provided by VK_EXT_buffer_device_address
    BufferDeviceAddressCreateInfo = 100002440002
    # Provided by VK_EXT_tooling_info
    PhysicalDeviceToolProperties = 100002450000
    # Provided by VK_VERSION_1_2
    ImageStencilUsageCreateInfo = 100002460000
    # Provided by VK_EXT_validation_features
    ValidationFeatures = 100002470000
    # Provided by VK_NV_cooperative_matrix
    PhysicalDeviceCooperativeMatrixFeatures = 100002490000
    # Provided by VK_NV_cooperative_matrix
    CooperativeMatrixProperties = 100002490001
    # Provided by VK_NV_cooperative_matrix
    PhysicalDeviceCooperativeMatrixProperties = 100002490002
    # Provided by VK_NV_coverage_reduction_mode
    PhysicalDeviceCoverageReductionModeFeatures = 100002500000
    # Provided by VK_NV_coverage_reduction_mode
    PipelineCoverageReductionStateCreateInfo = 100002500001
    # Provided by VK_NV_coverage_reduction_mode
    FramebufferMixedSamplesCombination = 100002500002
    # Provided by VK_EXT_fragment_shader_interlock
    PhysicalDeviceFragmentShaderInterlockFeatures = 100002510000
    # Provided by VK_EXT_ycbcr_image_arrays
    PhysicalDeviceYcbcrImageArraysFeatures = 100002520000
    # Provided by VK_VERSION_1_2
    PhysicalDeviceUniformBufferStandardLayoutFeatures = 100002530000
    # Provided by VK_EXT_full_screen_exclusive
    SurfaceFullScreenExclusiveInfo = 100002550000
    # Provided by VK_EXT_full_screen_exclusive
    SurfaceFullScreenExclusiveWin32Info = 100002550001
    # Provided by VK_EXT_full_screen_exclusive
    SurfaceCapabilitiesFullScreenExclusive = 100002550002
    # Provided by VK_EXT_headless_surface
    HeadlessSurfaceCreateInfo = 100002560000
    # Provided by VK_VERSION_1_2
    PhysicalDeviceBufferDeviceAddressFeatures = 100002570000
    # Provided by VK_VERSION_1_2
    BufferOpaqueCaptureAddressCreateInfo = 100002570002
    # Provided by VK_VERSION_1_2
    MemoryOpaqueCaptureAddressAllocateInfo = 100002570003
    # Provided by VK_VERSION_1_2
    DeviceMemoryOpaqueCaptureAddressInfo = 100002570004
    # Provided by VK_EXT_line_rasterization
    PhysicalDeviceLineRasterizationFeatures = 100002590000
    # Provided by VK_EXT_line_rasterization
    PipelineRasterizationLineStateCreateInfo = 100002590001
    # Provided by VK_EXT_line_rasterization
    PhysicalDeviceLineRasterizationProperties = 100002590002
    # Provided by VK_EXT_shader_atomic_float
    PhysicalDeviceShaderAtomicFloatFeatures = 100002600000
    # Provided by VK_VERSION_1_2
    PhysicalDeviceHostQueryResetFeatures = 100002610000
    # Provided by VK_EXT_index_type_uint8
    PhysicalDeviceIndexTypeUint8Features = 100002650000
    # Provided by VK_EXT_extended_dynamic_state
    PhysicalDeviceExtendedDynamicStateFeatures = 100002670000
    # Provided by VK_KHR_deferred_host_operations
    DeferredOperationInfo = 100002680000
    # Provided by VK_KHR_pipeline_executable_properties
    PhysicalDevicePipelineExecutablePropertiesFeatures = 100002690000
    # Provided by VK_KHR_pipeline_executable_properties
    PipelineInfo = 100002690001
    # Provided by VK_KHR_pipeline_executable_properties
    PipelineExecutableProperties = 100002690002
    # Provided by VK_KHR_pipeline_executable_properties
    PipelineExecutableInfo = 100002690003
    # Provided by VK_KHR_pipeline_executable_properties
    PipelineExecutableStatistic = 100002690004
    # Provided by VK_KHR_pipeline_executable_properties
    PipelineExecutableInternalRepresentation = 100002690005
    # Provided by VK_EXT_shader_demote_to_helper_invocation
    PhysicalDeviceShaderDemoteToHelperInvocationFeatures = 100002760000
    # Provided by VK_NV_device_generated_commands
    PhysicalDeviceDeviceGeneratedCommandsProperties = 100002770000
    # Provided by VK_NV_device_generated_commands
    GraphicsShaderGroupCreateInfo = 100002770001
    # Provided by VK_NV_device_generated_commands
    GraphicsPipelineShaderGroupsCreateInfo = 100002770002
    # Provided by VK_NV_device_generated_commands
    IndirectCommandsLayoutToken = 100002770003
    # Provided by VK_NV_device_generated_commands
    IndirectCommandsLayoutCreateInfo = 100002770004
    # Provided by VK_NV_device_generated_commands
    GeneratedCommandsInfo = 100002770005
    # Provided by VK_NV_device_generated_commands
    GeneratedCommandsMemoryRequirementsInfo = 100002770006
    # Provided by VK_NV_device_generated_commands
    PhysicalDeviceDeviceGeneratedCommandsFeatures = 100002770007
    # Provided by VK_EXT_texel_buffer_alignment
    PhysicalDeviceTexelBufferAlignmentFeatures = 100002810000
    # Provided by VK_EXT_texel_buffer_alignment
    PhysicalDeviceTexelBufferAlignmentProperties = 100002810001
    # Provided by VK_QCOM_render_pass_transform
    CommandBufferInheritanceRenderPassTransformInfo = 100002820000
    # Provided by VK_QCOM_render_pass_transform
    RenderPassTransformBeginInfo = 100002820001
    # Provided by VK_EXT_robustness2
    PhysicalDeviceRobustness2Features = 100002860000
    # Provided by VK_EXT_robustness2
    PhysicalDeviceRobustness2Properties = 100002860001
    # Provided by VK_EXT_custom_border_color
    SamplerCustomBorderColorCreateInfo = 100002870000
    # Provided by VK_EXT_custom_border_color
    PhysicalDeviceCustomBorderColorProperties = 100002870001
    # Provided by VK_EXT_custom_border_color
    PhysicalDeviceCustomBorderColorFeatures = 100002870002
    # Provided by VK_KHR_pipeline_library
    PipelineLibraryCreateInfo = 100002900000
    # Provided by VK_EXT_private_data
    PhysicalDevicePrivateDataFeatures = 100002950000
    # Provided by VK_EXT_private_data
    DevicePrivateDataCreateInfo = 100002950001
    # Provided by VK_EXT_private_data
    PrivateDataSlotCreateInfo = 100002950002
    # Provided by VK_EXT_pipeline_creation_cache_control
    PhysicalDevicePipelineCreationCacheControlFeatures = 100002970000
    # Provided by VK_NV_device_diagnostics_config
    PhysicalDeviceDiagnosticsConfigFeatures = 100003000000
    # Provided by VK_NV_device_diagnostics_config
    DeviceDiagnosticsConfigCreateInfo = 100003000001
    # Provided by VK_QCOM_extension_310
    Reserved = 100003090000
    # Provided by VK_EXT_fragment_density_map2
    PhysicalDeviceFragmentDensityMap2Features = 100003320000
    # Provided by VK_EXT_fragment_density_map2
    PhysicalDeviceFragmentDensityMap2Properties = 100003320001
    # Provided by VK_EXT_image_robustness
    PhysicalDeviceImageRobustnessFeatures = 100003350000
    # Provided by VK_EXT_4444_formats
    PhysicalDevice4444FormatsFeatures = 100003400000
    # Provided by VK_EXT_directfb_surface
    DirectfbSurfaceCreateInfo = 100003460000
  Extent3D* = object
    width*: uint32
    height*: uint32
    depth*: uint32
  Extent2D* = object
    width*: uint32
    height*: uint32
  DeviceAddress* = distinct uint64
  DeviceSize* = distinct uint64

  # These types are part of the API, though not directly used in API commands or data structures
  # --------------------------------------------------------------------------------------------
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
  BaseInStructure* = object
    sType*: StructureType
    pNext*: ptr BaseInStructure
  # Enums to track objects of various types
  ObjectType* {.size: sizeof(int32), pure.} = enum
    Unknown = 0
    Instance = 1 # VkInstance
    PhysicalDevice = 2 # VkPhysicalDevice
    Device = 3 # VkDevice
    Queue = 4 # VkQueue
    Semaphore = 5 # VkSemaphore
    CommandBuffer = 6 # VkCommandBuffer
    Fence = 7 # VkFence
    DeviceMemory = 8 # VkDeviceMemory
    Buffer = 9 # VkBuffer
    Image = 10 # VkImage
    Event = 11 # VkEvent
    QueryPool = 12 # VkQueryPool
    BufferView = 13 # VkBufferView
    ImageView = 14 # VkImageView
    ShaderModule = 15 # VkShaderModule
    PipelineCache = 16 # VkPipelineCache
    PipelineLayout = 17 # VkPipelineLayout
    RenderPass = 18 # VkRenderPass
    Pipeline = 19 # VkPipeline
    DescriptorSetLayout = 20 # VkDescriptorSetLayout
    Sampler = 21 # VkSampler
    DescriptorPool = 22 # VkDescriptorPool
    DescriptorSet = 23 # VkDescriptorSet
    Framebuffer = 24 # VkFramebuffer
    CommandPool = 25 # VkCommandPool
    # Provided by VK_KHR_surface
    Surface = 100000000000 # VkSurfaceKHR
    # Provided by VK_KHR_swapchain
    Swapchain = 100000010000 # VkSwapchainKHR
    # Provided by VK_KHR_display
    Display = 100000020000 # VkDisplayKHR
    # Provided by VK_KHR_display
    DisplayMode = 100000020001 # VkDisplayModeKHR
    # Provided by VK_EXT_debug_report
    DebugReportCallback = 100000110000 # VkDebugReportCallbackEXT
    # Provided by VK_VERSION_1_1
    DescriptorUpdateTemplate = 100000850000
    # Provided by VK_EXT_debug_utils
    DebugUtilsMessenger = 100001280000 # VkDebugUtilsMessengerEXT
    # Provided by VK_VERSION_1_1
    SamplerYcbcrConversion = 100001560000
    # Provided by VK_EXT_validation_cache
    ValidationCache = 100001600000 # VkValidationCacheEXT
    # Provided by VK_INTEL_performance_query
    PerformanceConfiguration = 100002100000
    # Provided by VK_KHR_deferred_host_operations
    DeferredOperation = 100002680000
    # Provided by VK_NV_device_generated_commands
    IndirectCommandsLayout = 100002770000 # VkIndirectCommandsLayoutNV
    # Provided by VK_EXT_private_data
    PrivateDataSlot = 100002950000
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
  VendorId* {.size: sizeof(int32), pure.} = enum
    Viv = 0x00010001 # Vivante vendor ID
    Vsi = 0x00010002 # VeriSilicon vendor ID
    Kazan = 0x00010003 # Kazan Software Renderer
    Codeplay = 0x00010004 # Codeplay Software Ltd. vendor ID
    Mesa = 0x00010005 # Mesa vendor ID
  DispatchIndirectCommand* = object
    x*: uint32
    y*: uint32
    z*: uint32
  BaseOutStructure* = object
    sType*: StructureType
    pNext*: ptr BaseOutStructure
  MemoryBarrier* = object
    sType*: StructureType
    pNext*: pointer
    srcAccessMask*: AccessFlags
    dstAccessMask*: AccessFlags
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

  # API constants
  # -------------
  PipelineCacheHeaderVersion* {.size: sizeof(int32), pure.} = enum
    One = 1

  # Device initialization
  # ---------------------
  InstanceCreateFlags* = distinct Flags
  MemoryHeap* = object
    size*: DeviceSize
    flags*: MemoryHeapFlags
  SampleCountFlagBits* {.size: sizeof(int32), pure.} = enum
    Vk1 = 0x00000001 # Sample count 1 supported
    Vk2 = 0x00000002 # Sample count 2 supported
    Vk4 = 0x00000004 # Sample count 4 supported
    Vk8 = 0x00000008 # Sample count 8 supported
    Vk16 = 0x00000010 # Sample count 16 supported
    Vk32 = 0x00000020 # Sample count 32 supported
    Vk64 = 0x00000040 # Sample count 64 supported
  MemoryPropertyFlags* = distinct Flags
  ImageUsageFlags* = distinct Flags
  VoidFunction* = proc(): void {.cdecl.}
  FormatFeatureFlags* = distinct Flags
  InternalFreeNotification* = proc(
      pUserData: pointer;
      size: uint;
      allocationType: InternalAllocationType;
      allocationScope: SystemAllocationScope;
    ): void {.cdecl.}
  ApplicationInfo* = object
    sType*: StructureType
    pNext*: pointer
    pApplicationName*: cstring
    applicationVersion*: uint32
    pEngineName*: cstring
    engineVersion*: uint32
    apiVersion*: uint32
  ImageCreateFlags* = distinct Flags
  MemoryType* = object
    propertyFlags*: MemoryPropertyFlags
    heapIndex*: uint32
  ImageUsageFlagBits* {.size: sizeof(int32), pure.} = enum
    TransferSrc = 0x00000001 # Can be used as a source of transfer operations
    TransferDst = 0x00000002 # Can be used as a destination of transfer operations
    Sampled = 0x00000004 # Can be sampled from (SAMPLED_IMAGE and COMBINED_IMAGE_SAMPLER descriptor types)
    Storage = 0x00000008 # Can be used as storage image (STORAGE_IMAGE descriptor type)
    ColorAttachment = 0x00000010 # Can be used as framebuffer color attachment
    DepthStencilAttachment = 0x00000020 # Can be used as framebuffer depth/stencil attachment
    TransientAttachment = 0x00000040 # Image data not needed outside of rendering
    InputAttachment = 0x00000080 # Can be used as framebuffer input attachment
    # Provided by VK_NV_shading_rate_image
    ShadingRateImage = 0x00000100
    # Provided by VK_AMD_extension_25
    Reserved10 = 0x00000400
    # Provided by VK_AMD_extension_25
    Reserved11 = 0x00000800
    # Provided by VK_AMD_extension_25
    Reserved12 = 0x00001000
    # Provided by VK_AMD_extension_24
    Reserved13 = 0x00002000
    # Provided by VK_AMD_extension_24
    Reserved14 = 0x00004000
    # Provided by VK_QCOM_extension_173
    Reserved17 = 0x00020000
  ImageType* {.size: sizeof(int32), pure.} = enum
    Vk1d = 0
    Vk2d = 1
    Vk3d = 2
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
  QueueFamilyProperties* = object
    queueFlags*: QueueFlags
    queueCount*: uint32
    timestampValidBits*: uint32
    minImageTransferGranularity*: Extent3D
  FreeFunction* = proc(
      pUserData: pointer;
      pMemory: pointer;
    ): void {.cdecl.}
  PhysicalDeviceMemoryProperties* = object
    memoryTypeCount*: uint32
    memoryTypes*: MemoryType
    memoryHeapCount*: uint32
    memoryHeaps*: MemoryHeap
  ImageTiling* {.size: sizeof(int32), pure.} = enum
    Optimal = 0
    Linear = 1
    # Provided by VK_EXT_image_drm_format_modifier
    DrmFormatModifier = 100001580000
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
  # Vulkan format definitions
  Format* {.size: sizeof(int32), pure.} = enum
    Undefined = 0
    R4g4UnormPack8 = 1
    R4g4b4a4UnormPack16 = 2
    B4g4r4a4UnormPack16 = 3
    R5g6b5UnormPack16 = 4
    B5g6r5UnormPack16 = 5
    R5g5b5a1UnormPack16 = 6
    B5g5r5a1UnormPack16 = 7
    A1r5g5b5UnormPack16 = 8
    R8Unorm = 9
    R8Snorm = 10
    R8Uscaled = 11
    R8Sscaled = 12
    R8Uint = 13
    R8Sint = 14
    R8Srgb = 15
    R8g8Unorm = 16
    R8g8Snorm = 17
    R8g8Uscaled = 18
    R8g8Sscaled = 19
    R8g8Uint = 20
    R8g8Sint = 21
    R8g8Srgb = 22
    R8g8b8Unorm = 23
    R8g8b8Snorm = 24
    R8g8b8Uscaled = 25
    R8g8b8Sscaled = 26
    R8g8b8Uint = 27
    R8g8b8Sint = 28
    R8g8b8Srgb = 29
    B8g8r8Unorm = 30
    B8g8r8Snorm = 31
    B8g8r8Uscaled = 32
    B8g8r8Sscaled = 33
    B8g8r8Uint = 34
    B8g8r8Sint = 35
    B8g8r8Srgb = 36
    R8g8b8a8Unorm = 37
    R8g8b8a8Snorm = 38
    R8g8b8a8Uscaled = 39
    R8g8b8a8Sscaled = 40
    R8g8b8a8Uint = 41
    R8g8b8a8Sint = 42
    R8g8b8a8Srgb = 43
    B8g8r8a8Unorm = 44
    B8g8r8a8Snorm = 45
    B8g8r8a8Uscaled = 46
    B8g8r8a8Sscaled = 47
    B8g8r8a8Uint = 48
    B8g8r8a8Sint = 49
    B8g8r8a8Srgb = 50
    A8b8g8r8UnormPack32 = 51
    A8b8g8r8SnormPack32 = 52
    A8b8g8r8UscaledPack32 = 53
    A8b8g8r8SscaledPack32 = 54
    A8b8g8r8UintPack32 = 55
    A8b8g8r8SintPack32 = 56
    A8b8g8r8SrgbPack32 = 57
    A2r10g10b10UnormPack32 = 58
    A2r10g10b10SnormPack32 = 59
    A2r10g10b10UscaledPack32 = 60
    A2r10g10b10SscaledPack32 = 61
    A2r10g10b10UintPack32 = 62
    A2r10g10b10SintPack32 = 63
    A2b10g10r10UnormPack32 = 64
    A2b10g10r10SnormPack32 = 65
    A2b10g10r10UscaledPack32 = 66
    A2b10g10r10SscaledPack32 = 67
    A2b10g10r10UintPack32 = 68
    A2b10g10r10SintPack32 = 69
    R16Unorm = 70
    R16Snorm = 71
    R16Uscaled = 72
    R16Sscaled = 73
    R16Uint = 74
    R16Sint = 75
    R16Sfloat = 76
    R16g16Unorm = 77
    R16g16Snorm = 78
    R16g16Uscaled = 79
    R16g16Sscaled = 80
    R16g16Uint = 81
    R16g16Sint = 82
    R16g16Sfloat = 83
    R16g16b16Unorm = 84
    R16g16b16Snorm = 85
    R16g16b16Uscaled = 86
    R16g16b16Sscaled = 87
    R16g16b16Uint = 88
    R16g16b16Sint = 89
    R16g16b16Sfloat = 90
    R16g16b16a16Unorm = 91
    R16g16b16a16Snorm = 92
    R16g16b16a16Uscaled = 93
    R16g16b16a16Sscaled = 94
    R16g16b16a16Uint = 95
    R16g16b16a16Sint = 96
    R16g16b16a16Sfloat = 97
    R32Uint = 98
    R32Sint = 99
    R32Sfloat = 100
    R32g32Uint = 101
    R32g32Sint = 102
    R32g32Sfloat = 103
    R32g32b32Uint = 104
    R32g32b32Sint = 105
    R32g32b32Sfloat = 106
    R32g32b32a32Uint = 107
    R32g32b32a32Sint = 108
    R32g32b32a32Sfloat = 109
    R64Uint = 110
    R64Sint = 111
    R64Sfloat = 112
    R64g64Uint = 113
    R64g64Sint = 114
    R64g64Sfloat = 115
    R64g64b64Uint = 116
    R64g64b64Sint = 117
    R64g64b64Sfloat = 118
    R64g64b64a64Uint = 119
    R64g64b64a64Sint = 120
    R64g64b64a64Sfloat = 121
    B10g11r11UfloatPack32 = 122
    E5b9g9r9UfloatPack32 = 123
    D16Unorm = 124
    X8D24UnormPack32 = 125
    D32Sfloat = 126
    S8Uint = 127
    D16UnormS8Uint = 128
    D24UnormS8Uint = 129
    D32SfloatS8Uint = 130
    Bc1RgbUnormBlock = 131
    Bc1RgbSrgbBlock = 132
    Bc1RgbaUnormBlock = 133
    Bc1RgbaSrgbBlock = 134
    Bc2UnormBlock = 135
    Bc2SrgbBlock = 136
    Bc3UnormBlock = 137
    Bc3SrgbBlock = 138
    Bc4UnormBlock = 139
    Bc4SnormBlock = 140
    Bc5UnormBlock = 141
    Bc5SnormBlock = 142
    Bc6hUfloatBlock = 143
    Bc6hSfloatBlock = 144
    Bc7UnormBlock = 145
    Bc7SrgbBlock = 146
    Etc2R8g8b8UnormBlock = 147
    Etc2R8g8b8SrgbBlock = 148
    Etc2R8g8b8a1UnormBlock = 149
    Etc2R8g8b8a1SrgbBlock = 150
    Etc2R8g8b8a8UnormBlock = 151
    Etc2R8g8b8a8SrgbBlock = 152
    EacR11UnormBlock = 153
    EacR11SnormBlock = 154
    EacR11g11UnormBlock = 155
    EacR11g11SnormBlock = 156
    Astc4x4UnormBlock = 157
    Astc4x4SrgbBlock = 158
    Astc5x4UnormBlock = 159
    Astc5x4SrgbBlock = 160
    Astc5x5UnormBlock = 161
    Astc5x5SrgbBlock = 162
    Astc6x5UnormBlock = 163
    Astc6x5SrgbBlock = 164
    Astc6x6UnormBlock = 165
    Astc6x6SrgbBlock = 166
    Astc8x5UnormBlock = 167
    Astc8x5SrgbBlock = 168
    Astc8x6UnormBlock = 169
    Astc8x6SrgbBlock = 170
    Astc8x8UnormBlock = 171
    Astc8x8SrgbBlock = 172
    Astc10x5UnormBlock = 173
    Astc10x5SrgbBlock = 174
    Astc10x6UnormBlock = 175
    Astc10x6SrgbBlock = 176
    Astc10x8UnormBlock = 177
    Astc10x8SrgbBlock = 178
    Astc10x10UnormBlock = 179
    Astc10x10SrgbBlock = 180
    Astc12x10UnormBlock = 181
    Astc12x10SrgbBlock = 182
    Astc12x12UnormBlock = 183
    Astc12x12SrgbBlock = 184
    # Provided by VK_IMG_format_pvrtc
    Pvrtc12bppUnormBlock = 100000540000
    # Provided by VK_IMG_format_pvrtc
    Pvrtc14bppUnormBlock = 100000540001
    # Provided by VK_IMG_format_pvrtc
    Pvrtc22bppUnormBlock = 100000540002
    # Provided by VK_IMG_format_pvrtc
    Pvrtc24bppUnormBlock = 100000540003
    # Provided by VK_IMG_format_pvrtc
    Pvrtc12bppSrgbBlock = 100000540004
    # Provided by VK_IMG_format_pvrtc
    Pvrtc14bppSrgbBlock = 100000540005
    # Provided by VK_IMG_format_pvrtc
    Pvrtc22bppSrgbBlock = 100000540006
    # Provided by VK_IMG_format_pvrtc
    Pvrtc24bppSrgbBlock = 100000540007
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc4x4SfloatBlock = 100000660000
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc5x4SfloatBlock = 100000660001
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc5x5SfloatBlock = 100000660002
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc6x5SfloatBlock = 100000660003
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc6x6SfloatBlock = 100000660004
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc8x5SfloatBlock = 100000660005
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc8x6SfloatBlock = 100000660006
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc8x8SfloatBlock = 100000660007
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc10x5SfloatBlock = 100000660008
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc10x6SfloatBlock = 100000660009
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc10x8SfloatBlock = 100000660010
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc10x10SfloatBlock = 100000660011
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc12x10SfloatBlock = 100000660012
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc12x12SfloatBlock = 100000660013
    # Provided by VK_VERSION_1_1
    G8b8g8r8422Unorm = 100001560000
    # Provided by VK_VERSION_1_1
    B8g8r8g8422Unorm = 100001560001
    # Provided by VK_VERSION_1_1
    G8B8R83plane420Unorm = 100001560002
    # Provided by VK_VERSION_1_1
    G8B8r82plane420Unorm = 100001560003
    # Provided by VK_VERSION_1_1
    G8B8R83plane422Unorm = 100001560004
    # Provided by VK_VERSION_1_1
    G8B8r82plane422Unorm = 100001560005
    # Provided by VK_VERSION_1_1
    G8B8R83plane444Unorm = 100001560006
    # Provided by VK_VERSION_1_1
    R10x6UnormPack16 = 100001560007
    # Provided by VK_VERSION_1_1
    R10x6g10x6Unorm2pack16 = 100001560008
    # Provided by VK_VERSION_1_1
    R10x6g10x6b10x6a10x6Unorm4pack16 = 100001560009
    # Provided by VK_VERSION_1_1
    G10x6b10x6g10x6r10x6422Unorm4pack16 = 100001560010
    # Provided by VK_VERSION_1_1
    B10x6g10x6r10x6g10x6422Unorm4pack16 = 100001560011
    # Provided by VK_VERSION_1_1
    G10x6B10x6R10x63plane420Unorm3pack16 = 100001560012
    # Provided by VK_VERSION_1_1
    G10x6B10x6r10x62plane420Unorm3pack16 = 100001560013
    # Provided by VK_VERSION_1_1
    G10x6B10x6R10x63plane422Unorm3pack16 = 100001560014
    # Provided by VK_VERSION_1_1
    G10x6B10x6r10x62plane422Unorm3pack16 = 100001560015
    # Provided by VK_VERSION_1_1
    G10x6B10x6R10x63plane444Unorm3pack16 = 100001560016
    # Provided by VK_VERSION_1_1
    R12x4UnormPack16 = 100001560017
    # Provided by VK_VERSION_1_1
    R12x4g12x4Unorm2pack16 = 100001560018
    # Provided by VK_VERSION_1_1
    R12x4g12x4b12x4a12x4Unorm4pack16 = 100001560019
    # Provided by VK_VERSION_1_1
    G12x4b12x4g12x4r12x4422Unorm4pack16 = 100001560020
    # Provided by VK_VERSION_1_1
    B12x4g12x4r12x4g12x4422Unorm4pack16 = 100001560021
    # Provided by VK_VERSION_1_1
    G12x4B12x4R12x43plane420Unorm3pack16 = 100001560022
    # Provided by VK_VERSION_1_1
    G12x4B12x4r12x42plane420Unorm3pack16 = 100001560023
    # Provided by VK_VERSION_1_1
    G12x4B12x4R12x43plane422Unorm3pack16 = 100001560024
    # Provided by VK_VERSION_1_1
    G12x4B12x4r12x42plane422Unorm3pack16 = 100001560025
    # Provided by VK_VERSION_1_1
    G12x4B12x4R12x43plane444Unorm3pack16 = 100001560026
    # Provided by VK_VERSION_1_1
    G16b16g16r16422Unorm = 100001560027
    # Provided by VK_VERSION_1_1
    B16g16r16g16422Unorm = 100001560028
    # Provided by VK_VERSION_1_1
    G16B16R163plane420Unorm = 100001560029
    # Provided by VK_VERSION_1_1
    G16B16r162plane420Unorm = 100001560030
    # Provided by VK_VERSION_1_1
    G16B16R163plane422Unorm = 100001560031
    # Provided by VK_VERSION_1_1
    G16B16r162plane422Unorm = 100001560032
    # Provided by VK_VERSION_1_1
    G16B16R163plane444Unorm = 100001560033
    # Provided by VK_EXT_extension_289
    Astc3x3x3UnormBlock = 100002880000
    # Provided by VK_EXT_extension_289
    Astc3x3x3SrgbBlock = 100002880001
    # Provided by VK_EXT_extension_289
    Astc3x3x3SfloatBlock = 100002880002
    # Provided by VK_EXT_extension_289
    Astc4x3x3UnormBlock = 100002880003
    # Provided by VK_EXT_extension_289
    Astc4x3x3SrgbBlock = 100002880004
    # Provided by VK_EXT_extension_289
    Astc4x3x3SfloatBlock = 100002880005
    # Provided by VK_EXT_extension_289
    Astc4x4x3UnormBlock = 100002880006
    # Provided by VK_EXT_extension_289
    Astc4x4x3SrgbBlock = 100002880007
    # Provided by VK_EXT_extension_289
    Astc4x4x3SfloatBlock = 100002880008
    # Provided by VK_EXT_extension_289
    Astc4x4x4UnormBlock = 100002880009
    # Provided by VK_EXT_extension_289
    Astc4x4x4SrgbBlock = 100002880010
    # Provided by VK_EXT_extension_289
    Astc4x4x4SfloatBlock = 100002880011
    # Provided by VK_EXT_extension_289
    Astc5x4x4UnormBlock = 100002880012
    # Provided by VK_EXT_extension_289
    Astc5x4x4SrgbBlock = 100002880013
    # Provided by VK_EXT_extension_289
    Astc5x4x4SfloatBlock = 100002880014
    # Provided by VK_EXT_extension_289
    Astc5x5x4UnormBlock = 100002880015
    # Provided by VK_EXT_extension_289
    Astc5x5x4SrgbBlock = 100002880016
    # Provided by VK_EXT_extension_289
    Astc5x5x4SfloatBlock = 100002880017
    # Provided by VK_EXT_extension_289
    Astc5x5x5UnormBlock = 100002880018
    # Provided by VK_EXT_extension_289
    Astc5x5x5SrgbBlock = 100002880019
    # Provided by VK_EXT_extension_289
    Astc5x5x5SfloatBlock = 100002880020
    # Provided by VK_EXT_extension_289
    Astc6x5x5UnormBlock = 100002880021
    # Provided by VK_EXT_extension_289
    Astc6x5x5SrgbBlock = 100002880022
    # Provided by VK_EXT_extension_289
    Astc6x5x5SfloatBlock = 100002880023
    # Provided by VK_EXT_extension_289
    Astc6x6x5UnormBlock = 100002880024
    # Provided by VK_EXT_extension_289
    Astc6x6x5SrgbBlock = 100002880025
    # Provided by VK_EXT_extension_289
    Astc6x6x5SfloatBlock = 100002880026
    # Provided by VK_EXT_extension_289
    Astc6x6x6UnormBlock = 100002880027
    # Provided by VK_EXT_extension_289
    Astc6x6x6SrgbBlock = 100002880028
    # Provided by VK_EXT_extension_289
    Astc6x6x6SfloatBlock = 100002880029
    # Provided by VK_EXT_4444_formats
    A4r4g4b4UnormPack16 = 100003400000
    # Provided by VK_EXT_4444_formats
    A4b4g4r4UnormPack16 = 100003400001
  FormatFeatureFlagBits* {.size: sizeof(int32), pure.} = enum
    SampledImage = 0x00000001 # Format can be used for sampled images (SAMPLED_IMAGE and COMBINED_IMAGE_SAMPLER descriptor types)
    StorageImage = 0x00000002 # Format can be used for storage images (STORAGE_IMAGE descriptor type)
    StorageImageAtomic = 0x00000004 # Format supports atomic operations in case it is used for storage images
    UniformTexelBuffer = 0x00000008 # Format can be used for uniform texel buffers (TBOs)
    StorageTexelBuffer = 0x00000010 # Format can be used for storage texel buffers (IBOs)
    StorageTexelBufferAtomic = 0x00000020 # Format supports atomic operations in case it is used for storage texel buffers
    VertexBuffer = 0x00000040 # Format can be used for vertex buffers (VBOs)
    ColorAttachment = 0x00000080 # Format can be used for color attachment images
    ColorAttachmentBlend = 0x00000100 # Format supports blending in case it is used for color attachment images
    DepthStencilAttachment = 0x00000200 # Format can be used for depth/stencil attachment images
    BlitSrc = 0x00000400 # Format can be used as the source image of blits with vkCmdBlitImage
    BlitDst = 0x00000800 # Format can be used as the destination image of blits with vkCmdBlitImage
    SampledImageFilterLinear = 0x00001000 # Format can be filtered with VK_FILTER_LINEAR when being sampled
    # Provided by VK_IMG_filter_cubic
    SampledImageFilterCubic = 0x00002000 # Format can be filtered with VK_FILTER_CUBIC_IMG when being sampled
    # Provided by VK_VERSION_1_1
    TransferSrc = 0x00004000 # Format can be used as the source image of image transfer commands
    # Provided by VK_VERSION_1_1
    TransferDst = 0x00008000 # Format can be used as the destination image of image transfer commands
    # Provided by VK_VERSION_1_2
    SampledImageFilterMinmax = 0x00010000 # Format can be used with min/max reduction filtering
    # Provided by VK_VERSION_1_1
    MidpointChromaSamples = 0x00020000 # Format can have midpoint rather than cosited chroma samples
    # Provided by VK_VERSION_1_1
    SampledImageYcbcrConversionLinearFilter = 0x00040000 # Format can be used with linear filtering whilst color conversion is enabled
    # Provided by VK_VERSION_1_1
    SampledImageYcbcrConversionSeparateReconstructionFilter = 0x00080000 # Format can have different chroma, min and mag filters
    # Provided by VK_VERSION_1_1
    SampledImageYcbcrConversionChromaReconstructionExplicit = 0x00100000
    # Provided by VK_VERSION_1_1
    SampledImageYcbcrConversionChromaReconstructionExplicitForceable = 0x00200000
    # Provided by VK_VERSION_1_1
    CositedChromaSamples = 0x00800000 # Format can have cosited rather than midpoint chroma samples
    # Provided by VK_EXT_fragment_density_map
    FragmentDensityMap = 0x01000000
    # Provided by VK_AMD_extension_25
    Reserved25 = 0x02000000
    # Provided by VK_AMD_extension_24
    Reserved28 = 0x10000000
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureVertexBuffer = 0x20000000
    # Provided by VK_AMD_extension_227
    AmdReserved30 = 0x40000000
  SampleCountFlags* = distinct Flags
  AllocationCallbacks* = object
    pUserData*: pointer
    pfnAllocation*: AllocationFunction
    pfnReallocation*: ReallocationFunction
    pfnFree*: FreeFunction
    pfnInternalAllocation*: InternalAllocationNotification
    pfnInternalFree*: InternalFreeNotification
  ImageFormatProperties* = object
    maxExtent*: Extent3D
    maxMipLevels*: uint32
    maxArrayLayers*: uint32
    sampleCounts*: SampleCountFlags
    maxResourceSize*: DeviceSize
  SystemAllocationScope* {.size: sizeof(int32), pure.} = enum
    Command = 0
    Object = 1
    Cache = 2
    Device = 3
    Instance = 4
  PhysicalDeviceProperties* = object
    apiVersion*: uint32
    driverVersion*: uint32
    vendorID*: uint32
    deviceID*: uint32
    deviceType*: PhysicalDeviceType
    deviceName*: char
    pipelineCacheUUID*: uint8
    limits*: PhysicalDeviceLimits
    sparseProperties*: PhysicalDeviceSparseProperties
  MemoryHeapFlags* = distinct Flags
  Instance* = distinct Handle
  PhysicalDeviceSparseProperties* = object
    residencyStandard2DBlockShape*: Bool32
    residencyStandard2DMultisampleBlockShape*: Bool32
    residencyStandard3DBlockShape*: Bool32
    residencyAlignedMipSize*: Bool32
    residencyNonResidentStrict*: Bool32
  PhysicalDevice* = distinct Handle
  QueueFlagBits* {.size: sizeof(int32), pure.} = enum
    Graphics = 0x00000001 # Queue supports graphics operations
    Compute = 0x00000002 # Queue supports compute operations
    Transfer = 0x00000004 # Queue supports transfer operations
    SparseBinding = 0x00000008 # Queue supports sparse resource memory management operations
    # Provided by VK_VERSION_1_1
    Protected = 0x00000010 # Queues may support protected operations
    # Provided by VK_AMD_extension_25
    Reserved5 = 0x00000020
    # Provided by VK_AMD_extension_24
    Reserved6 = 0x00000040
  MemoryHeapFlagBits* {.size: sizeof(int32), pure.} = enum
    DeviceLocal = 0x00000001 # If set, heap represents device memory
    # Provided by VK_VERSION_1_1
    MultiInstance = 0x00000002 # If set, heap allocations allocate multiple instances by default
  MemoryPropertyFlagBits* {.size: sizeof(int32), pure.} = enum
    DeviceLocal = 0x00000001 # If otherwise stated, then allocate memory on device
    HostVisible = 0x00000002 # Memory is mappable by host
    HostCoherent = 0x00000004 # Memory will have i/o coherency. If not set, application may need to use vkFlushMappedMemoryRanges and vkInvalidateMappedMemoryRanges to flush/invalidate host cache
    HostCached = 0x00000008 # Memory will be cached by the host
    LazilyAllocated = 0x00000010 # Memory may be allocated by the driver when it is required
    # Provided by VK_AMD_device_coherent_memory
    DeviceCoherent = 0x00000040
    # Provided by VK_AMD_device_coherent_memory
    DeviceUncached = 0x00000080
  FormatProperties* = object
    linearTilingFeatures*: FormatFeatureFlags
    optimalTilingFeatures*: FormatFeatureFlags
    bufferFeatures*: FormatFeatureFlags
  PhysicalDeviceType* {.size: sizeof(int32), pure.} = enum
    Other = 0
    IntegratedGpu = 1
    DiscreteGpu = 2
    VirtualGpu = 3
    Cpu = 4
  InstanceCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: InstanceCreateFlags
    pApplicationInfo*: ptr ApplicationInfo
    enabledLayerCount*: uint32
    ppEnabledLayerNames*: cstringArray
    enabledExtensionCount*: uint32
    ppEnabledExtensionNames*: cstringArray
  ReallocationFunction* = proc(
      pUserData: pointer;
      pOriginal: pointer;
      size: uint;
      alignment: uint;
      allocationScope: SystemAllocationScope;
    ): pointer {.cdecl.}
  AllocationFunction* = proc(
      pUserData: pointer;
      size: uint;
      alignment: uint;
      allocationScope: SystemAllocationScope;
    ): pointer {.cdecl.}
  ImageCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    SparseBinding = 0x00000001 # Image should support sparse backing
    SparseResidency = 0x00000002 # Image should support sparse backing with partial residency
    SparseAliased = 0x00000004 # Image should support constent data access to physical memory ranges mapped into multiple locations of sparse images
    MutableFormat = 0x00000008 # Allows image views to have different format than the base image
    CubeCompatible = 0x00000010 # Allows creating image views with cube type from the created image
    # Provided by VK_VERSION_1_1
    Vk2dArrayCompatible = 0x00000020 # The 3D image can be viewed as a 2D or 2D array image
    # Provided by VK_VERSION_1_1
    SplitInstanceBindRegions = 0x00000040 # Allows using VkBindImageMemoryDeviceGroupInfo::pSplitInstanceBindRegions when binding memory to the image
    # Provided by VK_VERSION_1_1
    BlockTexelViewCompatible = 0x00000080
    # Provided by VK_VERSION_1_1
    ExtendedUsage = 0x00000100
    # Provided by VK_VERSION_1_1
    Disjoint = 0x00000200
    # Provided by VK_VERSION_1_1
    Alias = 0x00000400
    # Provided by VK_EXT_sample_locations
    SampleLocationsCompatibleDepth = 0x00001000
    # Provided by VK_NV_corner_sampled_image
    CornerSampled = 0x00002000
    # Provided by VK_EXT_fragment_density_map
    Subsampled = 0x00004000
  QueueFlags* = distinct Flags
  InternalAllocationType* {.size: sizeof(int32), pure.} = enum
    Executable = 0
  InternalAllocationNotification* = proc(
      pUserData: pointer;
      size: uint;
      allocationType: InternalAllocationType;
      allocationScope: SystemAllocationScope;
    ): void {.cdecl.}

  # Device commands
  # ---------------
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
  DeviceQueueCreateFlagBits* = UnusedEnum
  DeviceQueueCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DeviceQueueCreateFlags
    queueFamilyIndex*: uint32
    queueCount*: uint32
    pQueuePriorities*: ptr float32
  Device* = distinct Handle
  DeviceCreateFlags* = distinct Flags
  DeviceQueueCreateFlags* = distinct Flags

  # Extension discovery commands
  # ----------------------------
  ExtensionProperties* = object
    extensionName*: char
    specVersion*: uint32

  # Layer discovery commands
  # ------------------------
  LayerProperties* = object
    layerName*: char
    specVersion*: uint32
    implementationVersion*: uint32
    description*: char

  # Queue commands
  # --------------
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
  PipelineStageFlagBits* {.size: sizeof(int32), pure.} = enum
    TopOfPipe = 0x00000001 # Before subsequent commands are processed
    DrawIndirect = 0x00000002 # Draw/DispatchIndirect command fetch
    VertexInput = 0x00000004 # Vertex/index fetch
    VertexShader = 0x00000008 # Vertex shading
    TessellationControlShader = 0x00000010 # Tessellation control shading
    TessellationEvaluationShader = 0x00000020 # Tessellation evaluation shading
    GeometryShader = 0x00000040 # Geometry shading
    FragmentShader = 0x00000080 # Fragment shading
    EarlyFragmentTests = 0x00000100 # Early fragment (depth and stencil) tests
    LateFragmentTests = 0x00000200 # Late fragment (depth and stencil) tests
    ColorAttachmentOutput = 0x00000400 # Color attachment writes
    ComputeShader = 0x00000800 # Compute shading
    Transfer = 0x00001000 # Transfer/copy operations
    BottomOfPipe = 0x00002000 # After previous commands have completed
    Host = 0x00004000 # Indicates host (CPU) is a source/sink of the dependency
    AllGraphics = 0x00008000 # All stages of the graphics pipeline
    AllCommands = 0x00010000 # All stages supported on the queue
    # Provided by VK_NV_device_generated_commands
    CommandPreprocess = 0x00020000
    # Provided by VK_NV_mesh_shader
    TaskShader = 0x00080000
    # Provided by VK_NV_mesh_shader
    MeshShader = 0x00100000
    # Provided by VK_KHR_ray_tracing
    RayTracingShader = 0x00200000
    # Provided by VK_EXT_fragment_density_map
    FragmentDensityProcess = 0x00800000
    # Provided by VK_EXT_transform_feedback
    TransformFeedback = 0x01000000
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureBuild = 0x02000000
    # Provided by VK_AMD_extension_25
    Reserved26 = 0x04000000
    # Provided by VK_AMD_extension_24
    Reserved27 = 0x08000000
  PipelineStageFlags* = distinct Flags
  Queue* = distinct Handle

  # Memory commands
  # ---------------
  MemoryMapFlags* = distinct Flags
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

  # Memory management API commands
  # ------------------------------
  DeviceMemory* = distinct NonDispatchableHandle
  MemoryRequirements* = object
    size*: DeviceSize
    alignment*: DeviceSize
    memoryTypeBits*: uint32

  # Sparse resource memory management API commands
  # ----------------------------------------------
  SparseMemoryBindFlags* = distinct Flags
  SparseBufferMemoryBindInfo* = object
    buffer*: Buffer
    bindCount*: uint32
    pBinds*: ptr SparseMemoryBind
  ImageSubresource* = object
    aspectMask*: ImageAspectFlags
    mipLevel*: uint32
    arrayLayer*: uint32
  SparseMemoryBindFlagBits* {.size: sizeof(int32), pure.} = enum
    Metadata = 0x00000001 # Operation binds resource metadata to memory
  SparseMemoryBind* = object
    resourceOffset*: DeviceSize
    size*: DeviceSize
    memory*: DeviceMemory
    memoryOffset*: DeviceSize
    flags*: SparseMemoryBindFlags
  ImageAspectFlags* = distinct Flags
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
  SparseImageFormatFlags* = distinct Flags
  SparseImageMemoryBindInfo* = object
    image*: Image
    bindCount*: uint32
    pBinds*: ptr SparseImageMemoryBind
  SparseImageOpaqueMemoryBindInfo* = object
    image*: Image
    bindCount*: uint32
    pBinds*: ptr SparseMemoryBind
  SparseImageMemoryBind* = object
    subresource*: ImageSubresource
    offset*: Offset3D
    extent*: Extent3D
    memory*: DeviceMemory
    memoryOffset*: DeviceSize
    flags*: SparseMemoryBindFlags
  SparseImageFormatFlagBits* {.size: sizeof(int32), pure.} = enum
    SingleMiptail = 0x00000001 # Image uses a single mip tail region for all array layers
    AlignedMipSize = 0x00000002 # Image requires mip level dimensions to be an integer multiple of the sparse image block dimensions for non-tail mip levels.
    NonstandardBlockSize = 0x00000004 # Image uses a non-standard sparse image block dimensions
  SparseImageFormatProperties* = object
    aspectMask*: ImageAspectFlags
    imageGranularity*: Extent3D
    flags*: SparseImageFormatFlags
  ImageAspectFlagBits* {.size: sizeof(int32), pure.} = enum
    Color = 0x00000001
    Depth = 0x00000002
    Stencil = 0x00000004
    Metadata = 0x00000008
    # Provided by VK_VERSION_1_1
    Plane0 = 0x00000010
    # Provided by VK_VERSION_1_1
    Plane1 = 0x00000020
    # Provided by VK_VERSION_1_1
    Plane2 = 0x00000040
    # Provided by VK_EXT_image_drm_format_modifier
    MemoryPlane0 = 0x00000080
    # Provided by VK_EXT_image_drm_format_modifier
    MemoryPlane1 = 0x00000100
    # Provided by VK_EXT_image_drm_format_modifier
    MemoryPlane2 = 0x00000200
    # Provided by VK_EXT_image_drm_format_modifier
    MemoryPlane3 = 0x00000400
  SparseImageMemoryRequirements* = object
    formatProperties*: SparseImageFormatProperties
    imageMipTailFirstLod*: uint32
    imageMipTailSize*: DeviceSize
    imageMipTailOffset*: DeviceSize
    imageMipTailStride*: DeviceSize

  # Fence commands
  # --------------
  FenceCreateFlags* = distinct Flags
  FenceCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    Signaled = 0x00000001
  FenceCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: FenceCreateFlags
  Fence* = distinct NonDispatchableHandle

  # Queue semaphore commands
  # ------------------------
  SemaphoreCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: SemaphoreCreateFlags
  SemaphoreCreateFlags* = distinct Flags
  Semaphore* = distinct NonDispatchableHandle

  # Event commands
  # --------------
  EventCreateFlags* = distinct Flags
  Event* = distinct NonDispatchableHandle
  EventCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: EventCreateFlags

  # Query commands
  # --------------
  QueryPool* = distinct NonDispatchableHandle
  QueryPoolCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: QueryPoolCreateFlags
    queryType*: QueryType
    queryCount*: uint32
    pipelineStatistics*: QueryPipelineStatisticFlags
  QueryPoolCreateFlags* = distinct Flags
  QueryResultFlags* = distinct Flags
  QueryPipelineStatisticFlagBits* {.size: sizeof(int32), pure.} = enum
    InputAssemblyVertices = 0x00000001 # Optional
    InputAssemblyPrimitives = 0x00000002 # Optional
    VertexShaderInvocations = 0x00000004 # Optional
    GeometryShaderInvocations = 0x00000008 # Optional
    GeometryShaderPrimitives = 0x00000010 # Optional
    ClippingInvocations = 0x00000020 # Optional
    ClippingPrimitives = 0x00000040 # Optional
    FragmentShaderInvocations = 0x00000080 # Optional
    TessellationControlShaderPatches = 0x00000100 # Optional
    TessellationEvaluationShaderInvocations = 0x00000200 # Optional
    ComputeShaderInvocations = 0x00000400 # Optional
  QueryType* {.size: sizeof(int32), pure.} = enum
    Occlusion = 0
    PipelineStatistics = 1 # Optional
    Timestamp = 2
    # Provided by VK_AMD_extension_24
    Reserved8 = 100000230008
    # Provided by VK_AMD_extension_25
    Reserved4 = 100000240004
    # Provided by VK_EXT_transform_feedback
    TransformFeedbackStream = 100000280004
    # Provided by VK_KHR_performance_query
    PerformanceQuery = 100001160000
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureCompactedSize = 100001500000
  QueryPipelineStatisticFlags* = distinct Flags
  QueryResultFlagBits* {.size: sizeof(int32), pure.} = enum
    Vk64 = 0x00000001 # Results of the queries are written to the destination buffer as 64-bit values
    Wait = 0x00000002 # Results of the queries are waited on before proceeding with the result copy
    WithAvailability = 0x00000004 # Besides the results of the query, the availability of the results is also written
    Partial = 0x00000008 # Copy the partial results of the query even if the final results are not available

  # Buffer commands
  # ---------------
  BufferUsageFlagBits* {.size: sizeof(int32), pure.} = enum
    TransferSrc = 0x00000001 # Can be used as a source of transfer operations
    TransferDst = 0x00000002 # Can be used as a destination of transfer operations
    UniformTexelBuffer = 0x00000004 # Can be used as TBO
    StorageTexelBuffer = 0x00000008 # Can be used as IBO
    UniformBuffer = 0x00000010 # Can be used as UBO
    StorageBuffer = 0x00000020 # Can be used as SSBO
    IndexBuffer = 0x00000040 # Can be used as source of fixed-function index fetch (index buffer)
    VertexBuffer = 0x00000080 # Can be used as source of fixed-function vertex fetch (VBO)
    IndirectBuffer = 0x00000100 # Can be the source of indirect parameters (e.g. indirect buffer, parameter buffer)
    # Provided by VK_EXT_conditional_rendering
    ConditionalRendering = 0x00000200 # Specifies the buffer can be used as predicate in conditional rendering
    # Provided by VK_KHR_ray_tracing
    RayTracing = 0x00000400
    # Provided by VK_EXT_transform_feedback
    TransformFeedbackBuffer = 0x00000800
    # Provided by VK_EXT_transform_feedback
    TransformFeedbackCounterBuffer = 0x00001000
    # Provided by VK_AMD_extension_24
    Reserved15 = 0x00008000
    # Provided by VK_AMD_extension_24
    Reserved16 = 0x00010000
    # Provided by VK_VERSION_1_2
    ShaderDeviceAddress = 0x00020000
    # Provided by VK_QCOM_extension_173
    Reserved18 = 0x00040000
    # Provided by VK_NV_extension_168
    Reserved20 = 0x00100000
  SharingMode* {.size: sizeof(int32), pure.} = enum
    Exclusive = 0
    Concurrent = 1
  Buffer* = distinct NonDispatchableHandle
  BufferCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    SparseBinding = 0x00000001 # Buffer should support sparse backing
    SparseResidency = 0x00000002 # Buffer should support sparse backing with partial residency
    SparseAliased = 0x00000004 # Buffer should support constent data access to physical memory ranges mapped into multiple locations of sparse buffers
    # Provided by VK_VERSION_1_2
    DeviceAddressCaptureReplay = 0x00000010
  BufferCreateFlags* = distinct Flags
  BufferCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: BufferCreateFlags
    size*: DeviceSize
    usage*: BufferUsageFlags
    sharingMode*: SharingMode
    queueFamilyIndexCount*: uint32
    pQueueFamilyIndices*: ptr uint32
  BufferUsageFlags* = distinct Flags

  # Buffer view commands
  # --------------------
  BufferViewCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: BufferViewCreateFlags
    buffer*: Buffer
    format*: Format
    offset*: DeviceSize
    range*: DeviceSize
  BufferViewCreateFlags* = distinct Flags
  BufferView* = distinct NonDispatchableHandle

  # Image commands
  # --------------
  SubresourceLayout* = object
    offset*: DeviceSize
    size*: DeviceSize
    rowPitch*: DeviceSize
    arrayPitch*: DeviceSize
    depthPitch*: DeviceSize
  Image* = distinct NonDispatchableHandle
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
    Undefined = 0 # Implicit layout an image is when its contents are undefined due to various reasons (e.g. right after creation)
    General = 1 # General layout when image can be used for any kind of access
    ColorAttachmentOptimal = 2 # Optimal layout when image is only used for color attachment read/write
    DepthStencilAttachmentOptimal = 3 # Optimal layout when image is only used for depth/stencil attachment read/write
    DepthStencilReadOnlyOptimal = 4 # Optimal layout when image is used for read only depth/stencil attachment and shader access
    ShaderReadOnlyOptimal = 5 # Optimal layout when image is used for read only shader access
    TransferSrcOptimal = 6 # Optimal layout when image is used only as source of transfer operations
    TransferDstOptimal = 7 # Optimal layout when image is used only as destination of transfer operations
    Preinitialized = 8 # Initial layout used when the data is populated by the CPU
    # Provided by VK_KHR_swapchain
    PresentSrc = 100000010002
    # Provided by VK_KHR_shared_presentable_image
    SharedPresent = 100001110000
    # Provided by VK_VERSION_1_1
    DepthReadOnlyStencilAttachmentOptimal = 100001170000
    # Provided by VK_VERSION_1_1
    DepthAttachmentStencilReadOnlyOptimal = 100001170001
    # Provided by VK_NV_shading_rate_image
    ShadingRateOptimal = 100001640003
    # Provided by VK_EXT_fragment_density_map
    FragmentDensityMapOptimal = 100002180000
    # Provided by VK_VERSION_1_2
    DepthAttachmentOptimal = 100002410000
    # Provided by VK_VERSION_1_2
    DepthReadOnlyOptimal = 100002410001
    # Provided by VK_VERSION_1_2
    StencilAttachmentOptimal = 100002410002
    # Provided by VK_VERSION_1_2
    StencilReadOnlyOptimal = 100002410003

  # Image view commands
  # -------------------
  ImageView* = distinct NonDispatchableHandle
  ImageViewCreateFlags* = distinct Flags
  ComponentMapping* = object
    r*: ComponentSwizzle
    g*: ComponentSwizzle
    b*: ComponentSwizzle
    a*: ComponentSwizzle
  ComponentSwizzle* {.size: sizeof(int32), pure.} = enum
    Identity = 0
    Zero = 1
    One = 2
    R = 3
    G = 4
    B = 5
    A = 6
  ImageViewCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_EXT_fragment_density_map
    FragmentDensityMapDynamic = 0x00000001
    # Provided by VK_EXT_fragment_density_map2
    FragmentDensityMapDeferred = 0x00000002
  ImageViewType* {.size: sizeof(int32), pure.} = enum
    Vk1d = 0
    Vk2d = 1
    Vk3d = 2
    Cube = 3
    Vk1dArray = 4
    Vk2dArray = 5
    CubeArray = 6
  ImageSubresourceRange* = object
    aspectMask*: ImageAspectFlags
    baseMipLevel*: uint32
    levelCount*: uint32
    baseArrayLayer*: uint32
    layerCount*: uint32
  ImageViewCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: ImageViewCreateFlags
    image*: Image
    viewType*: ImageViewType
    format*: Format
    components*: ComponentMapping
    subresourceRange*: ImageSubresourceRange

  # Shader commands
  # ---------------
  ShaderModuleCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_NV_extension_52
    Reserved0 = 0x00000001
  ShaderModuleCreateFlags* = distinct Flags
  ShaderModuleCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: ShaderModuleCreateFlags
    codeSize*: uint
    pCode*: ptr uint32
  ShaderModule* = distinct NonDispatchableHandle

  # Pipeline Cache commands
  # -----------------------
  PipelineCache* = distinct NonDispatchableHandle
  PipelineCacheCreateFlags* = distinct Flags
  PipelineCacheCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineCacheCreateFlags
    initialDataSize*: uint
    pInitialData*: pointer
  PipelineCacheCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_EXT_pipeline_creation_cache_control
    ExternallySynchronized = 0x00000001
    # Provided by VK_GOOGLE_extension_196
    Reserved1 = 0x00000002

  # Pipeline commands
  # -----------------
  PipelineDepthStencilStateCreateFlags* = distinct Flags
  FrontFace* {.size: sizeof(int32), pure.} = enum
    CounterClockwise = 0
    Clockwise = 1
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
  PipelineInputAssemblyStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineInputAssemblyStateCreateFlags
    topology*: PrimitiveTopology
    primitiveRestartEnable*: Bool32
  ShaderStageFlags* = distinct Flags
  PipelineShaderStageCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_EXT_subgroup_size_control
    AllowVaryingSubgroupSize = 0x00000001
    # Provided by VK_EXT_subgroup_size_control
    RequireFullSubgroups = 0x00000002
    # Provided by VK_NV_extension_52
    Reserved2 = 0x00000004
    # Provided by VK_KHR_extension_297
    Reserved3 = 0x00000008
  LogicOp* {.size: sizeof(int32), pure.} = enum
    Clear = 0
    And = 1
    AndReverse = 2
    Copy = 3
    AndInverted = 4
    NoOp = 5
    Xor = 6
    Or = 7
    Nor = 8
    Equivalent = 9
    Invert = 10
    OrReverse = 11
    CopyInverted = 12
    OrInverted = 13
    Nand = 14
    Set = 15
  PipelineTessellationStateCreateFlags* = distinct Flags
  PipelineShaderStageCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineShaderStageCreateFlags
    stage*: ShaderStageFlagBits
    module*: ShaderModule
    pName*: cstring
    pSpecializationInfo*: ptr SpecializationInfo
  PipelineMultisampleStateCreateFlags* = distinct Flags
  ColorComponentFlags* = distinct Flags
  PipelineTessellationStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineTessellationStateCreateFlags
    patchControlPoints*: uint32
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
  VertexInputBindingDescription* = object
    binding*: uint32
    stride*: uint32
    inputRate*: VertexInputRate
  PipelineShaderStageCreateFlags* = distinct Flags
  SpecializationInfo* = object
    mapEntryCount*: uint32
    pMapEntries*: ptr SpecializationMapEntry
    dataSize*: uint
    pData*: pointer
  PipelineVertexInputStateCreateFlags* = distinct Flags
  PipelineViewportStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineViewportStateCreateFlags
    viewportCount*: uint32
    pViewports*: ptr Viewport
    scissorCount*: uint32
    pScissors*: ptr Rect2D
  PolygonMode* {.size: sizeof(int32), pure.} = enum
    Fill = 0
    Line = 1
    Point = 2
    # Provided by VK_NV_fill_rectangle
    FillRectangle = 100001530000
  PipelineVertexInputStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineVertexInputStateCreateFlags
    vertexBindingDescriptionCount*: uint32
    pVertexBindingDescriptions*: ptr VertexInputBindingDescription
    vertexAttributeDescriptionCount*: uint32
    pVertexAttributeDescriptions*: ptr VertexInputAttributeDescription
  PrimitiveTopology* {.size: sizeof(int32), pure.} = enum
    PointList = 0
    LineList = 1
    LineStrip = 2
    TriangleList = 3
    TriangleStrip = 4
    TriangleFan = 5
    LineListWithAdjacency = 6
    LineStripWithAdjacency = 7
    TriangleListWithAdjacency = 8
    TriangleStripWithAdjacency = 9
    PatchList = 10
  PipelineInputAssemblyStateCreateFlags* = distinct Flags
  PipelineColorBlendStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineColorBlendStateCreateFlags
    logicOpEnable*: Bool32
    logicOp*: LogicOp
    attachmentCount*: uint32
    pAttachments*: ptr PipelineColorBlendAttachmentState
    blendConstants*: array[4, float32]
  SampleMask* = distinct uint32
  BlendFactor* {.size: sizeof(int32), pure.} = enum
    Zero = 0
    One = 1
    SrcColor = 2
    OneMinusSrcColor = 3
    DstColor = 4
    OneMinusDstColor = 5
    SrcAlpha = 6
    OneMinusSrcAlpha = 7
    DstAlpha = 8
    OneMinusDstAlpha = 9
    ConstantColor = 10
    OneMinusConstantColor = 11
    ConstantAlpha = 12
    OneMinusConstantAlpha = 13
    SrcAlphaSaturate = 14
    Src1Color = 15
    OneMinusSrc1Color = 16
    Src1Alpha = 17
    OneMinusSrc1Alpha = 18
  PipelineCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    DisableOptimization = 0x00000001
    AllowDerivatives = 0x00000002
    Derivative = 0x00000004
    # Provided by VK_VERSION_1_1
    ViewIndexFromDeviceIndex = 0x00000008
    # Provided by VK_VERSION_1_1
    DispatchBase = 0x00000010
    # Provided by VK_NV_ray_tracing
    DeferCompile = 0x00000020
    # Provided by VK_KHR_pipeline_executable_properties
    CaptureStatistics = 0x00000040
    # Provided by VK_KHR_pipeline_executable_properties
    CaptureInternalRepresentations = 0x00000080
    # Provided by VK_EXT_pipeline_creation_cache_control
    FailOnPipelineCompileRequired = 0x00000100
    # Provided by VK_EXT_pipeline_creation_cache_control
    EarlyReturnOnFailure = 0x00000200
    # Provided by VK_KHR_pipeline_library
    Library = 0x00000800
    # Provided by VK_KHR_ray_tracing
    RayTracingSkipTriangles = 0x00001000
    # Provided by VK_KHR_ray_tracing
    RayTracingSkipAabbs = 0x00002000
    # Provided by VK_KHR_ray_tracing
    RayTracingNoNullAnyHitShaders = 0x00004000
    # Provided by VK_KHR_ray_tracing
    RayTracingNoNullClosestHitShaders = 0x00008000
    # Provided by VK_KHR_ray_tracing
    RayTracingNoNullMissShaders = 0x00010000
    # Provided by VK_KHR_ray_tracing
    RayTracingNoNullIntersectionShaders = 0x00020000
    # Provided by VK_NV_device_generated_commands
    IndirectBindable = 0x00040000
    # Provided by VK_NV_extension_168
    Reserved19 = 0x00080000
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
  PipelineDynamicStateCreateFlags* = distinct Flags
  PipelineColorBlendAttachmentState* = object
    blendEnable*: Bool32
    srcColorBlendFactor*: BlendFactor
    dstColorBlendFactor*: BlendFactor
    colorBlendOp*: BlendOp
    srcAlphaBlendFactor*: BlendFactor
    dstAlphaBlendFactor*: BlendFactor
    alphaBlendOp*: BlendOp
    colorWriteMask*: ColorComponentFlags
  PipelineCreateFlags* = distinct Flags
  VertexInputRate* {.size: sizeof(int32), pure.} = enum
    Vertex = 0
    Instance = 1
  PipelineRasterizationStateCreateFlags* = distinct Flags
  ShaderStageFlagBits* {.size: sizeof(int32), pure.} = enum
    Vertex = 0x00000001
    TessellationControl = 0x00000002
    TessellationEvaluation = 0x00000004
    Geometry = 0x00000008
    Fragment = 0x00000010
    AllGraphics = 0x0000001F
    Compute = 0x00000020
    # Provided by VK_NV_mesh_shader
    Task = 0x00000040
    # Provided by VK_NV_mesh_shader
    Mesh = 0x00000080
    # Provided by VK_KHR_ray_tracing
    Raygen = 0x00000100
    # Provided by VK_KHR_ray_tracing
    AnyHit = 0x00000200
    # Provided by VK_KHR_ray_tracing
    ClosestHit = 0x00000400
    # Provided by VK_KHR_ray_tracing
    Miss = 0x00000800
    # Provided by VK_KHR_ray_tracing
    Intersection = 0x00001000
    # Provided by VK_KHR_ray_tracing
    Callable = 0x00002000
    All = 0x7FFFFFFF
  VertexInputAttributeDescription* = object
    location*: uint32
    binding*: uint32
    format*: Format
    offset*: uint32
  CompareOp* {.size: sizeof(int32), pure.} = enum
    Never = 0
    Less = 1
    Equal = 2
    LessOrEqual = 3
    Greater = 4
    NotEqual = 5
    GreaterOrEqual = 6
    Always = 7
  CullModeFlags* = distinct Flags
  StencilOp* {.size: sizeof(int32), pure.} = enum
    Keep = 0
    Zero = 1
    Replace = 2
    IncrementAndClamp = 3
    DecrementAndClamp = 4
    Invert = 5
    IncrementAndWrap = 6
    DecrementAndWrap = 7
  Viewport* = object
    x*: float32
    y*: float32
    width*: float32
    height*: float32
    minDepth*: float32
    maxDepth*: float32
  BlendOp* {.size: sizeof(int32), pure.} = enum
    Add = 0
    Subtract = 1
    ReverseSubtract = 2
    Min = 3
    Max = 4
    # Provided by VK_EXT_blend_operation_advanced
    Zero = 100001480000
    # Provided by VK_EXT_blend_operation_advanced
    Src = 100001480001
    # Provided by VK_EXT_blend_operation_advanced
    Dst = 100001480002
    # Provided by VK_EXT_blend_operation_advanced
    SrcOver = 100001480003
    # Provided by VK_EXT_blend_operation_advanced
    DstOver = 100001480004
    # Provided by VK_EXT_blend_operation_advanced
    SrcIn = 100001480005
    # Provided by VK_EXT_blend_operation_advanced
    DstIn = 100001480006
    # Provided by VK_EXT_blend_operation_advanced
    SrcOut = 100001480007
    # Provided by VK_EXT_blend_operation_advanced
    DstOut = 100001480008
    # Provided by VK_EXT_blend_operation_advanced
    SrcAtop = 100001480009
    # Provided by VK_EXT_blend_operation_advanced
    DstAtop = 100001480010
    # Provided by VK_EXT_blend_operation_advanced
    Xor = 100001480011
    # Provided by VK_EXT_blend_operation_advanced
    Multiply = 100001480012
    # Provided by VK_EXT_blend_operation_advanced
    Screen = 100001480013
    # Provided by VK_EXT_blend_operation_advanced
    Overlay = 100001480014
    # Provided by VK_EXT_blend_operation_advanced
    Darken = 100001480015
    # Provided by VK_EXT_blend_operation_advanced
    Lighten = 100001480016
    # Provided by VK_EXT_blend_operation_advanced
    Colordodge = 100001480017
    # Provided by VK_EXT_blend_operation_advanced
    Colorburn = 100001480018
    # Provided by VK_EXT_blend_operation_advanced
    Hardlight = 100001480019
    # Provided by VK_EXT_blend_operation_advanced
    Softlight = 100001480020
    # Provided by VK_EXT_blend_operation_advanced
    Difference = 100001480021
    # Provided by VK_EXT_blend_operation_advanced
    Exclusion = 100001480022
    # Provided by VK_EXT_blend_operation_advanced
    Invert = 100001480023
    # Provided by VK_EXT_blend_operation_advanced
    InvertRgb = 100001480024
    # Provided by VK_EXT_blend_operation_advanced
    Lineardodge = 100001480025
    # Provided by VK_EXT_blend_operation_advanced
    Linearburn = 100001480026
    # Provided by VK_EXT_blend_operation_advanced
    Vividlight = 100001480027
    # Provided by VK_EXT_blend_operation_advanced
    Linearlight = 100001480028
    # Provided by VK_EXT_blend_operation_advanced
    Pinlight = 100001480029
    # Provided by VK_EXT_blend_operation_advanced
    Hardmix = 100001480030
    # Provided by VK_EXT_blend_operation_advanced
    HslHue = 100001480031
    # Provided by VK_EXT_blend_operation_advanced
    HslSaturation = 100001480032
    # Provided by VK_EXT_blend_operation_advanced
    HslColor = 100001480033
    # Provided by VK_EXT_blend_operation_advanced
    HslLuminosity = 100001480034
    # Provided by VK_EXT_blend_operation_advanced
    Plus = 100001480035
    # Provided by VK_EXT_blend_operation_advanced
    PlusClamped = 100001480036
    # Provided by VK_EXT_blend_operation_advanced
    PlusClampedAlpha = 100001480037
    # Provided by VK_EXT_blend_operation_advanced
    PlusDarker = 100001480038
    # Provided by VK_EXT_blend_operation_advanced
    Minus = 100001480039
    # Provided by VK_EXT_blend_operation_advanced
    MinusClamped = 100001480040
    # Provided by VK_EXT_blend_operation_advanced
    Contrast = 100001480041
    # Provided by VK_EXT_blend_operation_advanced
    InvertOvg = 100001480042
    # Provided by VK_EXT_blend_operation_advanced
    Red = 100001480043
    # Provided by VK_EXT_blend_operation_advanced
    Green = 100001480044
    # Provided by VK_EXT_blend_operation_advanced
    Blue = 100001480045
  CullModeFlagBits* {.size: sizeof(int32), pure.} = enum
    None = 0
    Front = 0x00000001
    Back = 0x00000002
    FrontAndBack = 0x00000003
  SpecializationMapEntry* = object
    constantID*: uint32
    offset*: uint32
    size*: uint
  PipelineDynamicStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineDynamicStateCreateFlags
    dynamicStateCount*: uint32
    pDynamicStates*: ptr DynamicState
  DynamicState* {.size: sizeof(int32), pure.} = enum
    Viewport = 0
    Scissor = 1
    LineWidth = 2
    DepthBias = 3
    BlendConstants = 4
    DepthBounds = 5
    StencilCompareMask = 6
    StencilWriteMask = 7
    StencilReference = 8
    # Provided by VK_NV_clip_space_w_scaling
    ViewportWScaling = 100000870000
    # Provided by VK_EXT_discard_rectangles
    DiscardRectangle = 100000990000
    # Provided by VK_EXT_sample_locations
    SampleLocations = 100001430000
    # Provided by VK_NV_shading_rate_image
    ViewportShadingRatePalette = 100001640004
    # Provided by VK_NV_shading_rate_image
    ViewportCoarseSampleOrder = 100001640006
    # Provided by VK_NV_scissor_exclusive
    ExclusiveScissor = 100002050001
    # Provided by VK_EXT_line_rasterization
    LineStipple = 100002590000
    # Provided by VK_EXT_extended_dynamic_state
    CullMode = 100002670000
    # Provided by VK_EXT_extended_dynamic_state
    FrontFace = 100002670001
    # Provided by VK_EXT_extended_dynamic_state
    PrimitiveTopology = 100002670002
    # Provided by VK_EXT_extended_dynamic_state
    ViewportWithCount = 100002670003
    # Provided by VK_EXT_extended_dynamic_state
    ScissorWithCount = 100002670004
    # Provided by VK_EXT_extended_dynamic_state
    VertexInputBindingStride = 100002670005
    # Provided by VK_EXT_extended_dynamic_state
    DepthTestEnable = 100002670006
    # Provided by VK_EXT_extended_dynamic_state
    DepthWriteEnable = 100002670007
    # Provided by VK_EXT_extended_dynamic_state
    DepthCompareOp = 100002670008
    # Provided by VK_EXT_extended_dynamic_state
    DepthBoundsTestEnable = 100002670009
    # Provided by VK_EXT_extended_dynamic_state
    StencilTestEnable = 100002670010
    # Provided by VK_EXT_extended_dynamic_state
    StencilOp = 100002670011
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
  PipelineViewportStateCreateFlags* = distinct Flags
  Pipeline* = distinct NonDispatchableHandle
  StencilOpState* = object
    failOp*: StencilOp
    passOp*: StencilOp
    depthFailOp*: StencilOp
    compareOp*: CompareOp
    compareMask*: uint32
    writeMask*: uint32
    reference*: uint32
  PipelineColorBlendStateCreateFlags* = distinct Flags
  ColorComponentFlagBits* {.size: sizeof(int32), pure.} = enum
    R = 0x00000001
    G = 0x00000002
    B = 0x00000004
    A = 0x00000008
  ComputePipelineCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineCreateFlags
    stage*: PipelineShaderStageCreateInfo
    layout*: PipelineLayout
    basePipelineHandle*: Pipeline
    basePipelineIndex*: int32
  PipelineLayoutCreateFlags* = distinct Flags

  # Pipeline layout commands
  # ------------------------
  PipelineLayout* = distinct NonDispatchableHandle
  PushConstantRange* = object
    stageFlags*: ShaderStageFlags
    offset*: uint32
    size*: uint32
  PipelineLayoutCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineLayoutCreateFlags
    setLayoutCount*: uint32
    pSetLayouts*: ptr DescriptorSetLayout
    pushConstantRangeCount*: uint32
    pPushConstantRanges*: ptr PushConstantRange

  # Sampler commands
  # ----------------
  SamplerCreateFlags* = distinct Flags
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
  Sampler* = distinct NonDispatchableHandle
  SamplerCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_EXT_fragment_density_map
    SubsampledCoarseReconstruction = 0x00000002
  BorderColor* {.size: sizeof(int32), pure.} = enum
    FloatTransparentBlack = 0
    IntTransparentBlack = 1
    FloatOpaqueBlack = 2
    IntOpaqueBlack = 3
    FloatOpaqueWhite = 4
    IntOpaqueWhite = 5
    # Provided by VK_EXT_custom_border_color
    FloatCustom = 100002870003
    # Provided by VK_EXT_custom_border_color
    IntCustom = 100002870004
  SamplerAddressMode* {.size: sizeof(int32), pure.} = enum
    Repeat = 0
    MirroredRepeat = 1
    ClampToEdge = 2
    ClampToBorder = 3
  Filter* {.size: sizeof(int32), pure.} = enum
    Nearest = 0
    Linear = 1
    # Provided by VK_IMG_filter_cubic
    Cubic = 100000150000
  SamplerMipmapMode* {.size: sizeof(int32), pure.} = enum
    Nearest = 0 # Choose nearest mip level
    Linear = 1 # Linear filter between mip levels

  # Descriptor set commands
  # -----------------------
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
  DescriptorPoolCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    FreeDescriptorSet = 0x00000001 # Descriptor sets may be freed individually
    # Provided by VK_VERSION_1_2
    UpdateAfterBind = 0x00000002
  DescriptorPoolCreateFlags* = distinct Flags
  DescriptorPoolCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DescriptorPoolCreateFlags
    maxSets*: uint32
    poolSizeCount*: uint32
    pPoolSizes*: ptr DescriptorPoolSize
  DescriptorBufferInfo* = object
    buffer*: Buffer
    offset*: DeviceSize
    range*: DeviceSize
  DescriptorPoolResetFlags* = distinct Flags
  DescriptorSetAllocateInfo* = object
    sType*: StructureType
    pNext*: pointer
    descriptorPool*: DescriptorPool
    descriptorSetCount*: uint32
    pSetLayouts*: ptr DescriptorSetLayout
  DescriptorPool* = distinct NonDispatchableHandle
  DescriptorType* {.size: sizeof(int32), pure.} = enum
    Sampler = 0
    CombinedImageSampler = 1
    SampledImage = 2
    StorageImage = 3
    UniformTexelBuffer = 4
    StorageTexelBuffer = 5
    UniformBuffer = 6
    StorageBuffer = 7
    UniformBufferDynamic = 8
    StorageBufferDynamic = 9
    InputAttachment = 10
    # Provided by VK_EXT_inline_uniform_block
    InlineUniformBlock = 100001380000
    # Provided by VK_KHR_ray_tracing
    AccelerationStructure = 100001500000
  DescriptorSetLayoutBinding* = object
    binding*: uint32
    descriptorType*: DescriptorType
    descriptorCount*: uint32
    stageFlags*: ShaderStageFlags
    pImmutableSamplers*: ptr Sampler
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
  DescriptorSetLayoutCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DescriptorSetLayoutCreateFlags
    bindingCount*: uint32
    pBindings*: ptr DescriptorSetLayoutBinding
  DescriptorSetLayoutCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_KHR_push_descriptor
    PushDescriptor = 0x00000001 # Descriptors are pushed via flink:vkCmdPushDescriptorSetKHR
    # Provided by VK_VERSION_1_2
    UpdateAfterBindPool = 0x00000002
  DescriptorSet* = distinct NonDispatchableHandle
  DescriptorSetLayout* = distinct NonDispatchableHandle
  DescriptorSetLayoutCreateFlags* = distinct Flags
  DescriptorPoolSize* = object
    theType*: DescriptorType
    descriptorCount*: uint32
  DescriptorImageInfo* = object
    sampler*: Sampler
    imageView*: ImageView
    imageLayout*: ImageLayout

  # Pass commands
  # -------------
  AttachmentReference* = object
    attachment*: uint32
    layout*: ImageLayout
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
  DependencyFlagBits* {.size: sizeof(int32), pure.} = enum
    ByRegion = 0x00000001 # Dependency is per pixel region
    # Provided by VK_VERSION_1_1
    ViewLocal = 0x00000002
    # Provided by VK_VERSION_1_1
    DeviceGroup = 0x00000004 # Dependency is across devices
  Framebuffer* = distinct NonDispatchableHandle
  FramebufferCreateFlags* = distinct Flags
  SubpassDescriptionFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_NVX_multiview_per_view_attributes
    PerViewAttributes = 0x00000001
    # Provided by VK_NVX_multiview_per_view_attributes
    PerViewPositionXOnly = 0x00000002
    # Provided by VK_QCOM_render_pass_shader_resolve
    FragmentRegion = 0x00000004
    # Provided by VK_QCOM_render_pass_shader_resolve
    ShaderResolve = 0x00000008
  AccessFlagBits* {.size: sizeof(int32), pure.} = enum
    IndirectCommandRead = 0x00000001 # Controls coherency of indirect command reads
    IndexRead = 0x00000002 # Controls coherency of index reads
    VertexAttributeRead = 0x00000004 # Controls coherency of vertex attribute reads
    UniformRead = 0x00000008 # Controls coherency of uniform buffer reads
    InputAttachmentRead = 0x00000010 # Controls coherency of input attachment reads
    ShaderRead = 0x00000020 # Controls coherency of shader reads
    ShaderWrite = 0x00000040 # Controls coherency of shader writes
    ColorAttachmentRead = 0x00000080 # Controls coherency of color attachment reads
    ColorAttachmentWrite = 0x00000100 # Controls coherency of color attachment writes
    DepthStencilAttachmentRead = 0x00000200 # Controls coherency of depth/stencil attachment reads
    DepthStencilAttachmentWrite = 0x00000400 # Controls coherency of depth/stencil attachment writes
    TransferRead = 0x00000800 # Controls coherency of transfer reads
    TransferWrite = 0x00001000 # Controls coherency of transfer writes
    HostRead = 0x00002000 # Controls coherency of host reads
    HostWrite = 0x00004000 # Controls coherency of host writes
    MemoryRead = 0x00008000 # Controls coherency of memory reads
    MemoryWrite = 0x00010000 # Controls coherency of memory writes
    # Provided by VK_NV_device_generated_commands
    CommandPreprocessRead = 0x00020000
    # Provided by VK_NV_device_generated_commands
    CommandPreprocessWrite = 0x00040000
    # Provided by VK_EXT_blend_operation_advanced
    ColorAttachmentReadNoncoherent = 0x00080000
    # Provided by VK_EXT_conditional_rendering
    ConditionalRenderingRead = 0x00100000 # read access flag for reading conditional rendering predicate
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureRead = 0x00200000
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureWrite = 0x00400000
    # Provided by VK_NV_shading_rate_image
    ShadingRateImageRead = 0x00800000
    # Provided by VK_EXT_fragment_density_map
    FragmentDensityMapRead = 0x01000000
    # Provided by VK_EXT_transform_feedback
    TransformFeedbackWrite = 0x02000000
    # Provided by VK_EXT_transform_feedback
    TransformFeedbackCounterRead = 0x04000000
    # Provided by VK_EXT_transform_feedback
    TransformFeedbackCounterWrite = 0x08000000
    # Provided by VK_AMD_extension_25
    Reserved29 = 0x20000000
    # Provided by VK_AMD_extension_24
    Reserved30 = 0x40000000
  RenderPassCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_QCOM_render_pass_transform
    Transform = 0x00000002
  SubpassDescriptionFlags* = distinct Flags
  AttachmentLoadOp* {.size: sizeof(int32), pure.} = enum
    Load = 0
    Clear = 1
    DontCare = 2
  RenderPassCreateFlags* = distinct Flags
  RenderPass* = distinct NonDispatchableHandle
  AccessFlags* = distinct Flags
  AttachmentDescriptionFlags* = distinct Flags
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
  AttachmentStoreOp* {.size: sizeof(int32), pure.} = enum
    Store = 0
    DontCare = 1
  PipelineBindPoint* {.size: sizeof(int32), pure.} = enum
    Graphics = 0
    Compute = 1
    # Provided by VK_KHR_ray_tracing
    RayTracing = 100001500000
  SubpassDependency* = object
    srcSubpass*: uint32
    dstSubpass*: uint32
    srcStageMask*: PipelineStageFlags
    dstStageMask*: PipelineStageFlags
    srcAccessMask*: AccessFlags
    dstAccessMask*: AccessFlags
    dependencyFlags*: DependencyFlags
  FramebufferCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_VERSION_1_2
    Imageless = 0x00000001
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
  AttachmentDescriptionFlagBits* {.size: sizeof(int32), pure.} = enum
    MayAlias = 0x00000001 # The attachment may alias physical memory of another attachment in the same render pass
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
  DependencyFlags* = distinct Flags

  # Command pool commands
  # ---------------------
  CommandPoolCreateFlags* = distinct Flags
  CommandPoolCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    Transient = 0x00000001 # Command buffers have a short lifetime
    ResetCommandBuffer = 0x00000002 # Command buffers may release their memory individually
  CommandPoolCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: CommandPoolCreateFlags
    queueFamilyIndex*: uint32
  CommandPoolResetFlags* = distinct Flags
  CommandPool* = distinct NonDispatchableHandle
  CommandPoolResetFlagBits* {.size: sizeof(int32), pure.} = enum
    ReleaseResources = 0x00000001 # Release resources owned by the pool

  # Command buffer commands
  # -----------------------
  CommandBufferResetFlags* = distinct Flags
  CommandBufferLevel* {.size: sizeof(int32), pure.} = enum
    Primary = 0
    Secondary = 1
  CommandBufferAllocateInfo* = object
    sType*: StructureType
    pNext*: pointer
    commandPool*: CommandPool
    level*: CommandBufferLevel
    commandBufferCount*: uint32
  QueryControlFlagBits* {.size: sizeof(int32), pure.} = enum
    Precise = 0x00000001 # Require precise results to be collected by the query
  CommandBufferUsageFlags* = distinct Flags
  CommandBufferBeginInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: CommandBufferUsageFlags
    pInheritanceInfo*: ptr CommandBufferInheritanceInfo
  CommandBuffer* = distinct Handle
  CommandBufferInheritanceInfo* = object
    sType*: StructureType
    pNext*: pointer
    renderPass*: RenderPass
    subpass*: uint32
    framebuffer*: Framebuffer
    occlusionQueryEnable*: Bool32
    queryFlags*: QueryControlFlags
    pipelineStatistics*: QueryPipelineStatisticFlags
  QueryControlFlags* = distinct Flags
  CommandBufferResetFlagBits* {.size: sizeof(int32), pure.} = enum
    ReleaseResources = 0x00000001 # Release resources owned by the buffer
  CommandBufferUsageFlagBits* {.size: sizeof(int32), pure.} = enum
    OneTimeSubmit = 0x00000001
    RenderPassContinue = 0x00000002
    SimultaneousUse = 0x00000004 # Command buffer may be submitted/executed more than once simultaneously

  # Command buffer building commands
  # --------------------------------
  StencilFaceFlags* = distinct Flags
  ClearDepthStencilValue* = object
    depth*: float32
    stencil*: uint32
  BufferCopy* = object
    srcOffset*: DeviceSize
    dstOffset*: DeviceSize
    size*: DeviceSize
  ImageResolve* = object
    srcSubresource*: ImageSubresourceLayers
    srcOffset*: Offset3D
    dstSubresource*: ImageSubresourceLayers
    dstOffset*: Offset3D
    extent*: Extent3D
  ImageCopy* = object
    srcSubresource*: ImageSubresourceLayers
    srcOffset*: Offset3D
    dstSubresource*: ImageSubresourceLayers
    dstOffset*: Offset3D
    extent*: Extent3D
  ClearAttachment* = object
    aspectMask*: ImageAspectFlags
    colorAttachment*: uint32
    clearValue*: ClearValue
  BufferImageCopy* = object
    bufferOffset*: DeviceSize
    bufferRowLength*: uint32
    bufferImageHeight*: uint32
    imageSubresource*: ImageSubresourceLayers
    imageOffset*: Offset3D
    imageExtent*: Extent3D
  # Union allowing specification of color or depth and stencil values. Actual value selected is based on attachment being cleared.
  ClearValue* {.union.} = object
    color*: ClearColorValue
    depthStencil*: ClearDepthStencilValue
  ImageBlit* = object
    srcSubresource*: ImageSubresourceLayers
    srcOffsets*: array[2, Offset3D]
    dstSubresource*: ImageSubresourceLayers
    dstOffsets*: array[2, Offset3D]
  ClearRect* = object
    rect*: Rect2D
    baseArrayLayer*: uint32
    layerCount*: uint32
  ImageSubresourceLayers* = object
    aspectMask*: ImageAspectFlags
    mipLevel*: uint32
    baseArrayLayer*: uint32
    layerCount*: uint32
  RenderPassBeginInfo* = object
    sType*: StructureType
    pNext*: pointer
    renderPass*: RenderPass
    framebuffer*: Framebuffer
    renderArea*: Rect2D
    clearValueCount*: uint32
    pClearValues*: ptr ClearValue
  SubpassContents* {.size: sizeof(int32), pure.} = enum
    Inline = 0
    SecondaryCommandBuffers = 1
  StencilFaceFlagBits* {.size: sizeof(int32), pure.} = enum
    Front = 0x00000001 # Front face
    Back = 0x00000002 # Back face
    FrontAndBack = 0x00000003 # Front and back faces
  # Union allowing specification of floating point, integer, or unsigned integer color data. Actual value selected is based on image/attachment being cleared.
  ClearColorValue* {.union.} = object
    float32*: array[4, float32]
    int32*: array[4, int32]
    uint32*: array[4, uint32]
  IndexType* {.size: sizeof(int32), pure.} = enum
    Uint16 = 0
    Uint32 = 1
    # Provided by VK_KHR_ray_tracing
    None = 100001500000
    # Provided by VK_EXT_index_type_uint8
    Uint8 = 100002650000

# Header boilerplate
# ------------------
template defineNonDispatchableHandle*(ObjectName: untyped) =
  type ObjectName* = distinct pointer
template defineHandle*(ObjectName: untyped) =
  type ObjectName* = distinct pointer

# Fundamental types used by many commands and structures
# ------------------------------------------------------

# These types are part of the API, though not directly used in API commands or data structures
# --------------------------------------------------------------------------------------------

# API version macros
# ------------------
template versionMajor*(major: uint32): untyped = ( major shl 22 )
template apiVersion10*(): untyped = makeVersion(1, 0, 0)
template headerVersion*(): untyped = 152
template versionPatch*(patch: uint32): untyped = ( patch )
template headerVersionComplete*(): untyped =
  makeVersion(1, 2, headerVersion)
template versionMajor*(minor: uint32): untyped = ( minor shl 12 )
template apiVersion*(): untyped = makeVersion(1, 0, 0)
template makeVersion*(major, minor, patch: uint32): untyped =
  ( (major shl 22) or (minor shl 12) or patch )

# API constants
# -------------
template nullHandle*(): untyped = ( cast[pointer](0) )
const LodClampNone* = 1000.0f
const QueueFamilyIgnored* = (uint.high)
const RemainingArrayLayers* = (uint.high)
const RemainingMipLevels* = (uint.high)
const True* = 1
const SubpassExternal* = (uint.high)
const AttachmentUnused* = (uint.high)
const False* = 0
const WholeSize* = (uint.high)

# Device initialization
# ---------------------
var # commands
  getPhysicalDeviceImageFormatPropertiesCage: proc(physicalDevice: PhysicalDevice; format: Format; theType: ImageType; tiling: ImageTiling; usage: ImageUsageFlags; flags: ImageCreateFlags; pImageFormatProperties: ptr ImageFormatProperties;): Result {.cdecl.}
  createInstanceCage: proc(pCreateInfo: ptr InstanceCreateInfo; pAllocator: ptr AllocationCallbacks; pInstance: ptr Instance;): Result {.cdecl.}
  destroyInstanceCage: proc(instance: Instance; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  enumeratePhysicalDevicesCage: proc(instance: Instance; pPhysicalDeviceCount: ptr uint32; pPhysicalDevices: ptr PhysicalDevice;): Result {.cdecl.}
  getPhysicalDeviceMemoryPropertiesCage: proc(physicalDevice: PhysicalDevice; pMemoryProperties: ptr PhysicalDeviceMemoryProperties;): void {.cdecl.}
  getDeviceProcAddrCage: proc(device: Device; pName: cstring;): VoidFunction {.cdecl.}
  getPhysicalDevicePropertiesCage: proc(physicalDevice: PhysicalDevice; pProperties: ptr PhysicalDeviceProperties;): void {.cdecl.}
  getPhysicalDeviceQueueFamilyPropertiesCage: proc(physicalDevice: PhysicalDevice; pQueueFamilyPropertyCount: ptr uint32; pQueueFamilyProperties: ptr QueueFamilyProperties;): void {.cdecl.}
  getInstanceProcAddrCage: proc(instance: Instance; pName: cstring;): VoidFunction {.cdecl.}
  getPhysicalDeviceFormatPropertiesCage: proc(physicalDevice: PhysicalDevice; format: Format; pFormatProperties: ptr FormatProperties;): void {.cdecl.}
  getPhysicalDeviceFeaturesCage: proc(physicalDevice: PhysicalDevice; pFeatures: ptr PhysicalDeviceFeatures;): void {.cdecl.}

proc getPhysicalDeviceImageFormatProperties*(
      physicalDevice: PhysicalDevice;
      format: Format;
      theType: ImageType;
      tiling: ImageTiling;
      usage: ImageUsageFlags;
      flags: ImageCreateFlags;
      pImageFormatProperties: ptr ImageFormatProperties;
    ): Result {.cdecl.} =
  getPhysicalDeviceImageFormatPropertiesCage(physicalDevice,format,theType,tiling,usage,flags,pImageFormatProperties)

proc createInstance*(
      pCreateInfo: ptr InstanceCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pInstance: ptr Instance;
    ): Result {.cdecl.} =
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
    ): Result {.cdecl.} =
  enumeratePhysicalDevicesCage(instance,pPhysicalDeviceCount,pPhysicalDevices)

proc getPhysicalDeviceMemoryProperties*(
      physicalDevice: PhysicalDevice;
      pMemoryProperties: ptr PhysicalDeviceMemoryProperties;
    ): void {.cdecl.} =
  getPhysicalDeviceMemoryPropertiesCage(physicalDevice,pMemoryProperties)

proc getDeviceProcAddr*(
      device: Device;
      pName: cstring;
    ): VoidFunction {.cdecl.} =
  getDeviceProcAddrCage(device,pName)

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

proc getInstanceProcAddr*(
      instance: Instance;
      pName: cstring;
    ): VoidFunction {.cdecl.} =
  getInstanceProcAddrCage(instance,pName)

proc getPhysicalDeviceFormatProperties*(
      physicalDevice: PhysicalDevice;
      format: Format;
      pFormatProperties: ptr FormatProperties;
    ): void {.cdecl.} =
  getPhysicalDeviceFormatPropertiesCage(physicalDevice,format,pFormatProperties)

proc getPhysicalDeviceFeatures*(
      physicalDevice: PhysicalDevice;
      pFeatures: ptr PhysicalDeviceFeatures;
    ): void {.cdecl.} =
  getPhysicalDeviceFeaturesCage(physicalDevice,pFeatures)


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
    ): Result {.cdecl.} =
  createDeviceCage(physicalDevice,pCreateInfo,pAllocator,pDevice)

proc destroyDevice*(
      device: Device;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyDeviceCage(device,pAllocator)


# Extension discovery commands
# ----------------------------
var # commands
  enumerateDeviceExtensionPropertiesCage: proc(physicalDevice: PhysicalDevice; pLayerName: cstring; pPropertyCount: ptr uint32; pProperties: ptr ExtensionProperties;): Result {.cdecl.}
  enumerateInstanceExtensionPropertiesCage: proc(pLayerName: cstring; pPropertyCount: ptr uint32; pProperties: ptr ExtensionProperties;): Result {.cdecl.}

proc enumerateDeviceExtensionProperties*(
      physicalDevice: PhysicalDevice;
      pLayerName: cstring;
      pPropertyCount: ptr uint32;
      pProperties: ptr ExtensionProperties;
    ): Result {.cdecl.} =
  enumerateDeviceExtensionPropertiesCage(physicalDevice,pLayerName,pPropertyCount,pProperties)

proc enumerateInstanceExtensionProperties*(
      pLayerName: cstring;
      pPropertyCount: ptr uint32;
      pProperties: ptr ExtensionProperties;
    ): Result {.cdecl.} =
  enumerateInstanceExtensionPropertiesCage(pLayerName,pPropertyCount,pProperties)


# Layer discovery commands
# ------------------------
var # commands
  enumerateDeviceLayerPropertiesCage: proc(physicalDevice: PhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr LayerProperties;): Result {.cdecl.}
  enumerateInstanceLayerPropertiesCage: proc(pPropertyCount: ptr uint32; pProperties: ptr LayerProperties;): Result {.cdecl.}

proc enumerateDeviceLayerProperties*(
      physicalDevice: PhysicalDevice;
      pPropertyCount: ptr uint32;
      pProperties: ptr LayerProperties;
    ): Result {.cdecl.} =
  enumerateDeviceLayerPropertiesCage(physicalDevice,pPropertyCount,pProperties)

proc enumerateInstanceLayerProperties*(
      pPropertyCount: ptr uint32;
      pProperties: ptr LayerProperties;
    ): Result {.cdecl.} =
  enumerateInstanceLayerPropertiesCage(pPropertyCount,pProperties)


# Queue commands
# --------------
var # commands
  getDeviceQueueCage: proc(device: Device; queueFamilyIndex: uint32; queueIndex: uint32; pQueue: ptr Queue;): void {.cdecl.}
  queueWaitIdleCage: proc(queue: Queue;): Result {.cdecl.}
  deviceWaitIdleCage: proc(device: Device;): Result {.cdecl.}
  queueSubmitCage: proc(queue: Queue; submitCount: uint32; pSubmits: ptr SubmitInfo; fence: Fence;): Result {.cdecl.}

proc getDeviceQueue*(
      device: Device;
      queueFamilyIndex: uint32;
      queueIndex: uint32;
      pQueue: ptr Queue;
    ): void {.cdecl.} =
  getDeviceQueueCage(device,queueFamilyIndex,queueIndex,pQueue)

proc queueWaitIdle*(
      queue: Queue;
    ): Result {.cdecl.} =
  queueWaitIdleCage(queue)

proc deviceWaitIdle*(
      device: Device;
    ): Result {.cdecl.} =
  deviceWaitIdleCage(device)

proc queueSubmit*(
      queue: Queue;
      submitCount: uint32;
      pSubmits: ptr SubmitInfo;
      fence: Fence;
    ): Result {.cdecl.} =
  queueSubmitCage(queue,submitCount,pSubmits,fence)


# Memory commands
# ---------------
var # commands
  unmapMemoryCage: proc(device: Device; memory: DeviceMemory;): void {.cdecl.}
  freeMemoryCage: proc(device: Device; memory: DeviceMemory; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  getDeviceMemoryCommitmentCage: proc(device: Device; memory: DeviceMemory; pCommittedMemoryInBytes: ptr DeviceSize;): void {.cdecl.}
  invalidateMappedMemoryRangesCage: proc(device: Device; memoryRangeCount: uint32; pMemoryRanges: ptr MappedMemoryRange;): Result {.cdecl.}
  flushMappedMemoryRangesCage: proc(device: Device; memoryRangeCount: uint32; pMemoryRanges: ptr MappedMemoryRange;): Result {.cdecl.}
  mapMemoryCage: proc(device: Device; memory: DeviceMemory; offset: DeviceSize; size: DeviceSize; flags: MemoryMapFlags; ppData: ptr pointer;): Result {.cdecl.}
  allocateMemoryCage: proc(device: Device; pAllocateInfo: ptr MemoryAllocateInfo; pAllocator: ptr AllocationCallbacks; pMemory: ptr DeviceMemory;): Result {.cdecl.}

proc unmapMemory*(
      device: Device;
      memory: DeviceMemory;
    ): void {.cdecl.} =
  unmapMemoryCage(device,memory)

proc freeMemory*(
      device: Device;
      memory: DeviceMemory;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  freeMemoryCage(device,memory,pAllocator)

proc getDeviceMemoryCommitment*(
      device: Device;
      memory: DeviceMemory;
      pCommittedMemoryInBytes: ptr DeviceSize;
    ): void {.cdecl.} =
  getDeviceMemoryCommitmentCage(device,memory,pCommittedMemoryInBytes)

proc invalidateMappedMemoryRanges*(
      device: Device;
      memoryRangeCount: uint32;
      pMemoryRanges: ptr MappedMemoryRange;
    ): Result {.cdecl.} =
  invalidateMappedMemoryRangesCage(device,memoryRangeCount,pMemoryRanges)

proc flushMappedMemoryRanges*(
      device: Device;
      memoryRangeCount: uint32;
      pMemoryRanges: ptr MappedMemoryRange;
    ): Result {.cdecl.} =
  flushMappedMemoryRangesCage(device,memoryRangeCount,pMemoryRanges)

proc mapMemory*(
      device: Device;
      memory: DeviceMemory;
      offset: DeviceSize;
      size: DeviceSize;
      flags: MemoryMapFlags;
      ppData: ptr pointer;
    ): Result {.cdecl.} =
  mapMemoryCage(device,memory,offset,size,flags,ppData)

proc allocateMemory*(
      device: Device;
      pAllocateInfo: ptr MemoryAllocateInfo;
      pAllocator: ptr AllocationCallbacks;
      pMemory: ptr DeviceMemory;
    ): Result {.cdecl.} =
  allocateMemoryCage(device,pAllocateInfo,pAllocator,pMemory)


# Memory management API commands
# ------------------------------
var # commands
  getImageMemoryRequirementsCage: proc(device: Device; image: Image; pMemoryRequirements: ptr MemoryRequirements;): void {.cdecl.}
  bindBufferMemoryCage: proc(device: Device; buffer: Buffer; memory: DeviceMemory; memoryOffset: DeviceSize;): Result {.cdecl.}
  bindImageMemoryCage: proc(device: Device; image: Image; memory: DeviceMemory; memoryOffset: DeviceSize;): Result {.cdecl.}
  getBufferMemoryRequirementsCage: proc(device: Device; buffer: Buffer; pMemoryRequirements: ptr MemoryRequirements;): void {.cdecl.}

proc getImageMemoryRequirements*(
      device: Device;
      image: Image;
      pMemoryRequirements: ptr MemoryRequirements;
    ): void {.cdecl.} =
  getImageMemoryRequirementsCage(device,image,pMemoryRequirements)

proc bindBufferMemory*(
      device: Device;
      buffer: Buffer;
      memory: DeviceMemory;
      memoryOffset: DeviceSize;
    ): Result {.cdecl.} =
  bindBufferMemoryCage(device,buffer,memory,memoryOffset)

proc bindImageMemory*(
      device: Device;
      image: Image;
      memory: DeviceMemory;
      memoryOffset: DeviceSize;
    ): Result {.cdecl.} =
  bindImageMemoryCage(device,image,memory,memoryOffset)

proc getBufferMemoryRequirements*(
      device: Device;
      buffer: Buffer;
      pMemoryRequirements: ptr MemoryRequirements;
    ): void {.cdecl.} =
  getBufferMemoryRequirementsCage(device,buffer,pMemoryRequirements)


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
    ): Result {.cdecl.} =
  queueBindSparseCage(queue,bindInfoCount,pBindInfo,fence)


# Fence commands
# --------------
var # commands
  waitForFencesCage: proc(device: Device; fenceCount: uint32; pFences: ptr Fence; waitAll: Bool32; timeout: uint64;): Result {.cdecl.}
  destroyFenceCage: proc(device: Device; fence: Fence; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  createFenceCage: proc(device: Device; pCreateInfo: ptr FenceCreateInfo; pAllocator: ptr AllocationCallbacks; pFence: ptr Fence;): Result {.cdecl.}
  getFenceStatusCage: proc(device: Device; fence: Fence;): Result {.cdecl.}
  resetFencesCage: proc(device: Device; fenceCount: uint32; pFences: ptr Fence;): Result {.cdecl.}

proc waitForFences*(
      device: Device;
      fenceCount: uint32;
      pFences: ptr Fence;
      waitAll: Bool32;
      timeout: uint64;
    ): Result {.cdecl.} =
  waitForFencesCage(device,fenceCount,pFences,waitAll,timeout)

proc destroyFence*(
      device: Device;
      fence: Fence;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyFenceCage(device,fence,pAllocator)

proc createFence*(
      device: Device;
      pCreateInfo: ptr FenceCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pFence: ptr Fence;
    ): Result {.cdecl.} =
  createFenceCage(device,pCreateInfo,pAllocator,pFence)

proc getFenceStatus*(
      device: Device;
      fence: Fence;
    ): Result {.cdecl.} =
  getFenceStatusCage(device,fence)

proc resetFences*(
      device: Device;
      fenceCount: uint32;
      pFences: ptr Fence;
    ): Result {.cdecl.} =
  resetFencesCage(device,fenceCount,pFences)


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
    ): Result {.cdecl.} =
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
  destroyEventCage: proc(device: Device; event: Event; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  setEventCage: proc(device: Device; event: Event;): Result {.cdecl.}
  getEventStatusCage: proc(device: Device; event: Event;): Result {.cdecl.}
  createEventCage: proc(device: Device; pCreateInfo: ptr EventCreateInfo; pAllocator: ptr AllocationCallbacks; pEvent: ptr Event;): Result {.cdecl.}
  resetEventCage: proc(device: Device; event: Event;): Result {.cdecl.}

proc destroyEvent*(
      device: Device;
      event: Event;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyEventCage(device,event,pAllocator)

proc setEvent*(
      device: Device;
      event: Event;
    ): Result {.cdecl.} =
  setEventCage(device,event)

proc getEventStatus*(
      device: Device;
      event: Event;
    ): Result {.cdecl.} =
  getEventStatusCage(device,event)

proc createEvent*(
      device: Device;
      pCreateInfo: ptr EventCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pEvent: ptr Event;
    ): Result {.cdecl.} =
  createEventCage(device,pCreateInfo,pAllocator,pEvent)

proc resetEvent*(
      device: Device;
      event: Event;
    ): Result {.cdecl.} =
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
    ): Result {.cdecl.} =
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
    ): Result {.cdecl.} =
  getQueryPoolResultsCage(device,queryPool,firstQuery,queryCount,dataSize,pData,stride,flags)


# Buffer commands
# ---------------
var # commands
  destroyBufferCage: proc(device: Device; buffer: Buffer; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  createBufferCage: proc(device: Device; pCreateInfo: ptr BufferCreateInfo; pAllocator: ptr AllocationCallbacks; pBuffer: ptr Buffer;): Result {.cdecl.}

proc destroyBuffer*(
      device: Device;
      buffer: Buffer;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyBufferCage(device,buffer,pAllocator)

proc createBuffer*(
      device: Device;
      pCreateInfo: ptr BufferCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pBuffer: ptr Buffer;
    ): Result {.cdecl.} =
  createBufferCage(device,pCreateInfo,pAllocator,pBuffer)


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
    ): Result {.cdecl.} =
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
  destroyImageCage: proc(device: Device; image: Image; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  getImageSubresourceLayoutCage: proc(device: Device; image: Image; pSubresource: ptr ImageSubresource; pLayout: ptr SubresourceLayout;): void {.cdecl.}
  createImageCage: proc(device: Device; pCreateInfo: ptr ImageCreateInfo; pAllocator: ptr AllocationCallbacks; pImage: ptr Image;): Result {.cdecl.}

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

proc createImage*(
      device: Device;
      pCreateInfo: ptr ImageCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pImage: ptr Image;
    ): Result {.cdecl.} =
  createImageCage(device,pCreateInfo,pAllocator,pImage)


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
    ): Result {.cdecl.} =
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
  destroyShaderModuleCage: proc(device: Device; shaderModule: ShaderModule; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  createShaderModuleCage: proc(device: Device; pCreateInfo: ptr ShaderModuleCreateInfo; pAllocator: ptr AllocationCallbacks; pShaderModule: ptr ShaderModule;): Result {.cdecl.}

proc destroyShaderModule*(
      device: Device;
      shaderModule: ShaderModule;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyShaderModuleCage(device,shaderModule,pAllocator)

proc createShaderModule*(
      device: Device;
      pCreateInfo: ptr ShaderModuleCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pShaderModule: ptr ShaderModule;
    ): Result {.cdecl.} =
  createShaderModuleCage(device,pCreateInfo,pAllocator,pShaderModule)


# Pipeline Cache commands
# -----------------------
var # commands
  getPipelineCacheDataCage: proc(device: Device; pipelineCache: PipelineCache; pDataSize: ptr uint; pData: pointer;): Result {.cdecl.}
  createPipelineCacheCage: proc(device: Device; pCreateInfo: ptr PipelineCacheCreateInfo; pAllocator: ptr AllocationCallbacks; pPipelineCache: ptr PipelineCache;): Result {.cdecl.}
  mergePipelineCachesCage: proc(device: Device; dstCache: PipelineCache; srcCacheCount: uint32; pSrcCaches: ptr PipelineCache;): Result {.cdecl.}
  destroyPipelineCacheCage: proc(device: Device; pipelineCache: PipelineCache; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}

proc getPipelineCacheData*(
      device: Device;
      pipelineCache: PipelineCache;
      pDataSize: ptr uint;
      pData: pointer;
    ): Result {.cdecl.} =
  getPipelineCacheDataCage(device,pipelineCache,pDataSize,pData)

proc createPipelineCache*(
      device: Device;
      pCreateInfo: ptr PipelineCacheCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pPipelineCache: ptr PipelineCache;
    ): Result {.cdecl.} =
  createPipelineCacheCage(device,pCreateInfo,pAllocator,pPipelineCache)

proc mergePipelineCaches*(
      device: Device;
      dstCache: PipelineCache;
      srcCacheCount: uint32;
      pSrcCaches: ptr PipelineCache;
    ): Result {.cdecl.} =
  mergePipelineCachesCage(device,dstCache,srcCacheCount,pSrcCaches)

proc destroyPipelineCache*(
      device: Device;
      pipelineCache: PipelineCache;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyPipelineCacheCage(device,pipelineCache,pAllocator)


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
    ): Result {.cdecl.} =
  createGraphicsPipelinesCage(device,pipelineCache,createInfoCount,pCreateInfos,pAllocator,pPipelines)

proc createComputePipelines*(
      device: Device;
      pipelineCache: PipelineCache;
      createInfoCount: uint32;
      pCreateInfos: ptr ComputePipelineCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pPipelines: ptr Pipeline;
    ): Result {.cdecl.} =
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
  destroyPipelineLayoutCage: proc(device: Device; pipelineLayout: PipelineLayout; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  createPipelineLayoutCage: proc(device: Device; pCreateInfo: ptr PipelineLayoutCreateInfo; pAllocator: ptr AllocationCallbacks; pPipelineLayout: ptr PipelineLayout;): Result {.cdecl.}

proc destroyPipelineLayout*(
      device: Device;
      pipelineLayout: PipelineLayout;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyPipelineLayoutCage(device,pipelineLayout,pAllocator)

proc createPipelineLayout*(
      device: Device;
      pCreateInfo: ptr PipelineLayoutCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pPipelineLayout: ptr PipelineLayout;
    ): Result {.cdecl.} =
  createPipelineLayoutCage(device,pCreateInfo,pAllocator,pPipelineLayout)


# Sampler commands
# ----------------
# Provided by VK_KHR_sampler_mirror_clamp_to_edge
SamplerAddressMode.defineAlias(MirrorClampToEdge, MirrorClampToEdge) # Alias introduced for consistency with extension suffixing rules
var # commands
  createSamplerCage: proc(device: Device; pCreateInfo: ptr SamplerCreateInfo; pAllocator: ptr AllocationCallbacks; pSampler: ptr Sampler;): Result {.cdecl.}
  destroySamplerCage: proc(device: Device; sampler: Sampler; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}

proc createSampler*(
      device: Device;
      pCreateInfo: ptr SamplerCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pSampler: ptr Sampler;
    ): Result {.cdecl.} =
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
  destroyDescriptorPoolCage: proc(device: Device; descriptorPool: DescriptorPool; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  resetDescriptorPoolCage: proc(device: Device; descriptorPool: DescriptorPool; flags: DescriptorPoolResetFlags;): Result {.cdecl.}
  createDescriptorPoolCage: proc(device: Device; pCreateInfo: ptr DescriptorPoolCreateInfo; pAllocator: ptr AllocationCallbacks; pDescriptorPool: ptr DescriptorPool;): Result {.cdecl.}
  destroyDescriptorSetLayoutCage: proc(device: Device; descriptorSetLayout: DescriptorSetLayout; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  freeDescriptorSetsCage: proc(device: Device; descriptorPool: DescriptorPool; descriptorSetCount: uint32; pDescriptorSets: ptr DescriptorSet;): Result {.cdecl.}
  allocateDescriptorSetsCage: proc(device: Device; pAllocateInfo: ptr DescriptorSetAllocateInfo; pDescriptorSets: ptr DescriptorSet;): Result {.cdecl.}
  updateDescriptorSetsCage: proc(device: Device; descriptorWriteCount: uint32; pDescriptorWrites: ptr WriteDescriptorSet; descriptorCopyCount: uint32; pDescriptorCopies: ptr CopyDescriptorSet;): void {.cdecl.}

proc createDescriptorSetLayout*(
      device: Device;
      pCreateInfo: ptr DescriptorSetLayoutCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pSetLayout: ptr DescriptorSetLayout;
    ): Result {.cdecl.} =
  createDescriptorSetLayoutCage(device,pCreateInfo,pAllocator,pSetLayout)

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
    ): Result {.cdecl.} =
  resetDescriptorPoolCage(device,descriptorPool,flags)

proc createDescriptorPool*(
      device: Device;
      pCreateInfo: ptr DescriptorPoolCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pDescriptorPool: ptr DescriptorPool;
    ): Result {.cdecl.} =
  createDescriptorPoolCage(device,pCreateInfo,pAllocator,pDescriptorPool)

proc destroyDescriptorSetLayout*(
      device: Device;
      descriptorSetLayout: DescriptorSetLayout;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyDescriptorSetLayoutCage(device,descriptorSetLayout,pAllocator)

proc freeDescriptorSets*(
      device: Device;
      descriptorPool: DescriptorPool;
      descriptorSetCount: uint32;
      pDescriptorSets: ptr DescriptorSet;
    ): Result {.cdecl.} =
  freeDescriptorSetsCage(device,descriptorPool,descriptorSetCount,pDescriptorSets)

proc allocateDescriptorSets*(
      device: Device;
      pAllocateInfo: ptr DescriptorSetAllocateInfo;
      pDescriptorSets: ptr DescriptorSet;
    ): Result {.cdecl.} =
  allocateDescriptorSetsCage(device,pAllocateInfo,pDescriptorSets)

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
  destroyRenderPassCage: proc(device: Device; renderPass: RenderPass; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  createFramebufferCage: proc(device: Device; pCreateInfo: ptr FramebufferCreateInfo; pAllocator: ptr AllocationCallbacks; pFramebuffer: ptr Framebuffer;): Result {.cdecl.}
  getRenderAreaGranularityCage: proc(device: Device; renderPass: RenderPass; pGranularity: ptr Extent2D;): void {.cdecl.}
  destroyFramebufferCage: proc(device: Device; framebuffer: Framebuffer; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  createRenderPassCage: proc(device: Device; pCreateInfo: ptr RenderPassCreateInfo; pAllocator: ptr AllocationCallbacks; pRenderPass: ptr RenderPass;): Result {.cdecl.}

proc destroyRenderPass*(
      device: Device;
      renderPass: RenderPass;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyRenderPassCage(device,renderPass,pAllocator)

proc createFramebuffer*(
      device: Device;
      pCreateInfo: ptr FramebufferCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pFramebuffer: ptr Framebuffer;
    ): Result {.cdecl.} =
  createFramebufferCage(device,pCreateInfo,pAllocator,pFramebuffer)

proc getRenderAreaGranularity*(
      device: Device;
      renderPass: RenderPass;
      pGranularity: ptr Extent2D;
    ): void {.cdecl.} =
  getRenderAreaGranularityCage(device,renderPass,pGranularity)

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
    ): Result {.cdecl.} =
  createRenderPassCage(device,pCreateInfo,pAllocator,pRenderPass)


# Command pool commands
# ---------------------
var # commands
  resetCommandPoolCage: proc(device: Device; commandPool: CommandPool; flags: CommandPoolResetFlags;): Result {.cdecl.}
  destroyCommandPoolCage: proc(device: Device; commandPool: CommandPool; pAllocator: ptr AllocationCallbacks;): void {.cdecl.}
  createCommandPoolCage: proc(device: Device; pCreateInfo: ptr CommandPoolCreateInfo; pAllocator: ptr AllocationCallbacks; pCommandPool: ptr CommandPool;): Result {.cdecl.}

proc resetCommandPool*(
      device: Device;
      commandPool: CommandPool;
      flags: CommandPoolResetFlags;
    ): Result {.cdecl.} =
  resetCommandPoolCage(device,commandPool,flags)

proc destroyCommandPool*(
      device: Device;
      commandPool: CommandPool;
      pAllocator: ptr AllocationCallbacks;
    ): void {.cdecl.} =
  destroyCommandPoolCage(device,commandPool,pAllocator)

proc createCommandPool*(
      device: Device;
      pCreateInfo: ptr CommandPoolCreateInfo;
      pAllocator: ptr AllocationCallbacks;
      pCommandPool: ptr CommandPool;
    ): Result {.cdecl.} =
  createCommandPoolCage(device,pCreateInfo,pAllocator,pCommandPool)


# Command buffer commands
# -----------------------
var # commands
  allocateCommandBuffersCage: proc(device: Device; pAllocateInfo: ptr CommandBufferAllocateInfo; pCommandBuffers: ptr CommandBuffer;): Result {.cdecl.}
  endCommandBufferCage: proc(commandBuffer: CommandBuffer;): Result {.cdecl.}
  resetCommandBufferCage: proc(commandBuffer: CommandBuffer; flags: CommandBufferResetFlags;): Result {.cdecl.}
  freeCommandBuffersCage: proc(device: Device; commandPool: CommandPool; commandBufferCount: uint32; pCommandBuffers: ptr CommandBuffer;): void {.cdecl.}
  beginCommandBufferCage: proc(commandBuffer: CommandBuffer; pBeginInfo: ptr CommandBufferBeginInfo;): Result {.cdecl.}

proc allocateCommandBuffers*(
      device: Device;
      pAllocateInfo: ptr CommandBufferAllocateInfo;
      pCommandBuffers: ptr CommandBuffer;
    ): Result {.cdecl.} =
  allocateCommandBuffersCage(device,pAllocateInfo,pCommandBuffers)

proc endCommandBuffer*(
      commandBuffer: CommandBuffer;
    ): Result {.cdecl.} =
  endCommandBufferCage(commandBuffer)

proc resetCommandBuffer*(
      commandBuffer: CommandBuffer;
      flags: CommandBufferResetFlags;
    ): Result {.cdecl.} =
  resetCommandBufferCage(commandBuffer,flags)

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
    ): Result {.cdecl.} =
  beginCommandBufferCage(commandBuffer,pBeginInfo)


# Command buffer building commands
# --------------------------------
StencilFaceFlagBits.defineAlias(StencilFrontAndBack, FrontAndBack) # Alias for backwards compatibility
var # commands
  cmdBlitImageCage: proc(commandBuffer: CommandBuffer; srcImage: Image; srcImageLayout: ImageLayout; dstImage: Image; dstImageLayout: ImageLayout; regionCount: uint32; pRegions: ptr ImageBlit; filter: Filter;): void {.cdecl.}
  cmdSetScissorCage: proc(commandBuffer: CommandBuffer; firstScissor: uint32; scissorCount: uint32; pScissors: ptr Rect2D;): void {.cdecl.}
  cmdBindVertexBuffersCage: proc(commandBuffer: CommandBuffer; firstBinding: uint32; bindingCount: uint32; pBuffers: ptr Buffer; pOffsets: ptr DeviceSize;): void {.cdecl.}
  cmdWaitEventsCage: proc(commandBuffer: CommandBuffer; eventCount: uint32; pEvents: ptr Event; srcStageMask: PipelineStageFlags; dstStageMask: PipelineStageFlags; memoryBarrierCount: uint32; pMemoryBarriers: ptr MemoryBarrier; bufferMemoryBarrierCount: uint32; pBufferMemoryBarriers: ptr BufferMemoryBarrier; imageMemoryBarrierCount: uint32; pImageMemoryBarriers: ptr ImageMemoryBarrier;): void {.cdecl.}
  cmdSetDepthBoundsCage: proc(commandBuffer: CommandBuffer; minDepthBounds: float32; maxDepthBounds: float32;): void {.cdecl.}
  cmdEndRenderPassCage: proc(commandBuffer: CommandBuffer;): void {.cdecl.}
  cmdDispatchCage: proc(commandBuffer: CommandBuffer; groupCountX: uint32; groupCountY: uint32; groupCountZ: uint32;): void {.cdecl.}
  cmdFillBufferCage: proc(commandBuffer: CommandBuffer; dstBuffer: Buffer; dstOffset: DeviceSize; size: DeviceSize; data: uint32;): void {.cdecl.}
  cmdDrawIndexedIndirectCage: proc(commandBuffer: CommandBuffer; buffer: Buffer; offset: DeviceSize; drawCount: uint32; stride: uint32;): void {.cdecl.}
  cmdSetStencilReferenceCage: proc(commandBuffer: CommandBuffer; faceMask: StencilFaceFlags; reference: uint32;): void {.cdecl.}
  cmdSetStencilCompareMaskCage: proc(commandBuffer: CommandBuffer; faceMask: StencilFaceFlags; compareMask: uint32;): void {.cdecl.}
  cmdSetEventCage: proc(commandBuffer: CommandBuffer; event: Event; stageMask: PipelineStageFlags;): void {.cdecl.}
  cmdBindDescriptorSetsCage: proc(commandBuffer: CommandBuffer; pipelineBindPoint: PipelineBindPoint; layout: PipelineLayout; firstSet: uint32; descriptorSetCount: uint32; pDescriptorSets: ptr DescriptorSet; dynamicOffsetCount: uint32; pDynamicOffsets: ptr uint32;): void {.cdecl.}
  cmdSetDepthBiasCage: proc(commandBuffer: CommandBuffer; depthBiasConstantFactor: float32; depthBiasClamp: float32; depthBiasSlopeFactor: float32;): void {.cdecl.}
  cmdCopyImageToBufferCage: proc(commandBuffer: CommandBuffer; srcImage: Image; srcImageLayout: ImageLayout; dstBuffer: Buffer; regionCount: uint32; pRegions: ptr BufferImageCopy;): void {.cdecl.}
  cmdDrawIndirectCage: proc(commandBuffer: CommandBuffer; buffer: Buffer; offset: DeviceSize; drawCount: uint32; stride: uint32;): void {.cdecl.}
  cmdClearDepthStencilImageCage: proc(commandBuffer: CommandBuffer; image: Image; imageLayout: ImageLayout; pDepthStencil: ptr ClearDepthStencilValue; rangeCount: uint32; pRanges: ptr ImageSubresourceRange;): void {.cdecl.}
  cmdBindIndexBufferCage: proc(commandBuffer: CommandBuffer; buffer: Buffer; offset: DeviceSize; indexType: IndexType;): void {.cdecl.}
  cmdPipelineBarrierCage: proc(commandBuffer: CommandBuffer; srcStageMask: PipelineStageFlags; dstStageMask: PipelineStageFlags; dependencyFlags: DependencyFlags; memoryBarrierCount: uint32; pMemoryBarriers: ptr MemoryBarrier; bufferMemoryBarrierCount: uint32; pBufferMemoryBarriers: ptr BufferMemoryBarrier; imageMemoryBarrierCount: uint32; pImageMemoryBarriers: ptr ImageMemoryBarrier;): void {.cdecl.}
  cmdDrawCage: proc(commandBuffer: CommandBuffer; vertexCount: uint32; instanceCount: uint32; firstVertex: uint32; firstInstance: uint32;): void {.cdecl.}
  cmdSetStencilWriteMaskCage: proc(commandBuffer: CommandBuffer; faceMask: StencilFaceFlags; writeMask: uint32;): void {.cdecl.}
  cmdExecuteCommandsCage: proc(commandBuffer: CommandBuffer; commandBufferCount: uint32; pCommandBuffers: ptr CommandBuffer;): void {.cdecl.}
  cmdPushConstantsCage: proc(commandBuffer: CommandBuffer; layout: PipelineLayout; stageFlags: ShaderStageFlags; offset: uint32; size: uint32; pValues: pointer;): void {.cdecl.}
  cmdEndQueryCage: proc(commandBuffer: CommandBuffer; queryPool: QueryPool; query: uint32;): void {.cdecl.}
  cmdCopyImageCage: proc(commandBuffer: CommandBuffer; srcImage: Image; srcImageLayout: ImageLayout; dstImage: Image; dstImageLayout: ImageLayout; regionCount: uint32; pRegions: ptr ImageCopy;): void {.cdecl.}
  cmdSetBlendConstantsCage: proc(commandBuffer: CommandBuffer; blendConstants: float32;): void {.cdecl.}
  cmdDispatchIndirectCage: proc(commandBuffer: CommandBuffer; buffer: Buffer; offset: DeviceSize;): void {.cdecl.}
  cmdResetEventCage: proc(commandBuffer: CommandBuffer; event: Event; stageMask: PipelineStageFlags;): void {.cdecl.}
  cmdCopyBufferCage: proc(commandBuffer: CommandBuffer; srcBuffer: Buffer; dstBuffer: Buffer; regionCount: uint32; pRegions: ptr BufferCopy;): void {.cdecl.}
  cmdClearAttachmentsCage: proc(commandBuffer: CommandBuffer; attachmentCount: uint32; pAttachments: ptr ClearAttachment; rectCount: uint32; pRects: ptr ClearRect;): void {.cdecl.}
  cmdSetViewportCage: proc(commandBuffer: CommandBuffer; firstViewport: uint32; viewportCount: uint32; pViewports: ptr Viewport;): void {.cdecl.}
  cmdUpdateBufferCage: proc(commandBuffer: CommandBuffer; dstBuffer: Buffer; dstOffset: DeviceSize; dataSize: DeviceSize; pData: pointer;): void {.cdecl.}
  cmdClearColorImageCage: proc(commandBuffer: CommandBuffer; image: Image; imageLayout: ImageLayout; pColor: ptr ClearColorValue; rangeCount: uint32; pRanges: ptr ImageSubresourceRange;): void {.cdecl.}
  cmdCopyQueryPoolResultsCage: proc(commandBuffer: CommandBuffer; queryPool: QueryPool; firstQuery: uint32; queryCount: uint32; dstBuffer: Buffer; dstOffset: DeviceSize; stride: DeviceSize; flags: QueryResultFlags;): void {.cdecl.}
  cmdNextSubpassCage: proc(commandBuffer: CommandBuffer; contents: SubpassContents;): void {.cdecl.}
  cmdResolveImageCage: proc(commandBuffer: CommandBuffer; srcImage: Image; srcImageLayout: ImageLayout; dstImage: Image; dstImageLayout: ImageLayout; regionCount: uint32; pRegions: ptr ImageResolve;): void {.cdecl.}
  cmdSetLineWidthCage: proc(commandBuffer: CommandBuffer; lineWidth: float32;): void {.cdecl.}
  cmdWriteTimestampCage: proc(commandBuffer: CommandBuffer; pipelineStage: PipelineStageFlagBits; queryPool: QueryPool; query: uint32;): void {.cdecl.}
  cmdDrawIndexedCage: proc(commandBuffer: CommandBuffer; indexCount: uint32; instanceCount: uint32; firstIndex: uint32; vertexOffset: int32; firstInstance: uint32;): void {.cdecl.}
  cmdCopyBufferToImageCage: proc(commandBuffer: CommandBuffer; srcBuffer: Buffer; dstImage: Image; dstImageLayout: ImageLayout; regionCount: uint32; pRegions: ptr BufferImageCopy;): void {.cdecl.}
  cmdBindPipelineCage: proc(commandBuffer: CommandBuffer; pipelineBindPoint: PipelineBindPoint; pipeline: Pipeline;): void {.cdecl.}
  cmdBeginQueryCage: proc(commandBuffer: CommandBuffer; queryPool: QueryPool; query: uint32; flags: QueryControlFlags;): void {.cdecl.}
  cmdBeginRenderPassCage: proc(commandBuffer: CommandBuffer; pRenderPassBegin: ptr RenderPassBeginInfo; contents: SubpassContents;): void {.cdecl.}
  cmdResetQueryPoolCage: proc(commandBuffer: CommandBuffer; queryPool: QueryPool; firstQuery: uint32; queryCount: uint32;): void {.cdecl.}

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

proc cmdSetScissor*(
      commandBuffer: CommandBuffer;
      firstScissor: uint32;
      scissorCount: uint32;
      pScissors: ptr Rect2D;
    ): void {.cdecl.} =
  cmdSetScissorCage(commandBuffer,firstScissor,scissorCount,pScissors)

proc cmdBindVertexBuffers*(
      commandBuffer: CommandBuffer;
      firstBinding: uint32;
      bindingCount: uint32;
      pBuffers: ptr Buffer;
      pOffsets: ptr DeviceSize;
    ): void {.cdecl.} =
  cmdBindVertexBuffersCage(commandBuffer,firstBinding,bindingCount,pBuffers,pOffsets)

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

proc cmdSetDepthBounds*(
      commandBuffer: CommandBuffer;
      minDepthBounds: float32;
      maxDepthBounds: float32;
    ): void {.cdecl.} =
  cmdSetDepthBoundsCage(commandBuffer,minDepthBounds,maxDepthBounds)

proc cmdEndRenderPass*(
      commandBuffer: CommandBuffer;
    ): void {.cdecl.} =
  cmdEndRenderPassCage(commandBuffer)

proc cmdDispatch*(
      commandBuffer: CommandBuffer;
      groupCountX: uint32;
      groupCountY: uint32;
      groupCountZ: uint32;
    ): void {.cdecl.} =
  cmdDispatchCage(commandBuffer,groupCountX,groupCountY,groupCountZ)

proc cmdFillBuffer*(
      commandBuffer: CommandBuffer;
      dstBuffer: Buffer;
      dstOffset: DeviceSize;
      size: DeviceSize;
      data: uint32;
    ): void {.cdecl.} =
  cmdFillBufferCage(commandBuffer,dstBuffer,dstOffset,size,data)

proc cmdDrawIndexedIndirect*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      drawCount: uint32;
      stride: uint32;
    ): void {.cdecl.} =
  cmdDrawIndexedIndirectCage(commandBuffer,buffer,offset,drawCount,stride)

proc cmdSetStencilReference*(
      commandBuffer: CommandBuffer;
      faceMask: StencilFaceFlags;
      reference: uint32;
    ): void {.cdecl.} =
  cmdSetStencilReferenceCage(commandBuffer,faceMask,reference)

proc cmdSetStencilCompareMask*(
      commandBuffer: CommandBuffer;
      faceMask: StencilFaceFlags;
      compareMask: uint32;
    ): void {.cdecl.} =
  cmdSetStencilCompareMaskCage(commandBuffer,faceMask,compareMask)

proc cmdSetEvent*(
      commandBuffer: CommandBuffer;
      event: Event;
      stageMask: PipelineStageFlags;
    ): void {.cdecl.} =
  cmdSetEventCage(commandBuffer,event,stageMask)

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

proc cmdSetDepthBias*(
      commandBuffer: CommandBuffer;
      depthBiasConstantFactor: float32;
      depthBiasClamp: float32;
      depthBiasSlopeFactor: float32;
    ): void {.cdecl.} =
  cmdSetDepthBiasCage(commandBuffer,depthBiasConstantFactor,depthBiasClamp,depthBiasSlopeFactor)

proc cmdCopyImageToBuffer*(
      commandBuffer: CommandBuffer;
      srcImage: Image;
      srcImageLayout: ImageLayout;
      dstBuffer: Buffer;
      regionCount: uint32;
      pRegions: ptr BufferImageCopy;
    ): void {.cdecl.} =
  cmdCopyImageToBufferCage(commandBuffer,srcImage,srcImageLayout,dstBuffer,regionCount,pRegions)

proc cmdDrawIndirect*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      drawCount: uint32;
      stride: uint32;
    ): void {.cdecl.} =
  cmdDrawIndirectCage(commandBuffer,buffer,offset,drawCount,stride)

proc cmdClearDepthStencilImage*(
      commandBuffer: CommandBuffer;
      image: Image;
      imageLayout: ImageLayout;
      pDepthStencil: ptr ClearDepthStencilValue;
      rangeCount: uint32;
      pRanges: ptr ImageSubresourceRange;
    ): void {.cdecl.} =
  cmdClearDepthStencilImageCage(commandBuffer,image,imageLayout,pDepthStencil,rangeCount,pRanges)

proc cmdBindIndexBuffer*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
      indexType: IndexType;
    ): void {.cdecl.} =
  cmdBindIndexBufferCage(commandBuffer,buffer,offset,indexType)

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

proc cmdDraw*(
      commandBuffer: CommandBuffer;
      vertexCount: uint32;
      instanceCount: uint32;
      firstVertex: uint32;
      firstInstance: uint32;
    ): void {.cdecl.} =
  cmdDrawCage(commandBuffer,vertexCount,instanceCount,firstVertex,firstInstance)

proc cmdSetStencilWriteMask*(
      commandBuffer: CommandBuffer;
      faceMask: StencilFaceFlags;
      writeMask: uint32;
    ): void {.cdecl.} =
  cmdSetStencilWriteMaskCage(commandBuffer,faceMask,writeMask)

proc cmdExecuteCommands*(
      commandBuffer: CommandBuffer;
      commandBufferCount: uint32;
      pCommandBuffers: ptr CommandBuffer;
    ): void {.cdecl.} =
  cmdExecuteCommandsCage(commandBuffer,commandBufferCount,pCommandBuffers)

proc cmdPushConstants*(
      commandBuffer: CommandBuffer;
      layout: PipelineLayout;
      stageFlags: ShaderStageFlags;
      offset: uint32;
      size: uint32;
      pValues: pointer;
    ): void {.cdecl.} =
  cmdPushConstantsCage(commandBuffer,layout,stageFlags,offset,size,pValues)

proc cmdEndQuery*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      query: uint32;
    ): void {.cdecl.} =
  cmdEndQueryCage(commandBuffer,queryPool,query)

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

proc cmdSetBlendConstants*(
      commandBuffer: CommandBuffer;
      blendConstants: float32;
    ): void {.cdecl.} =
  cmdSetBlendConstantsCage(commandBuffer,blendConstants)

proc cmdDispatchIndirect*(
      commandBuffer: CommandBuffer;
      buffer: Buffer;
      offset: DeviceSize;
    ): void {.cdecl.} =
  cmdDispatchIndirectCage(commandBuffer,buffer,offset)

proc cmdResetEvent*(
      commandBuffer: CommandBuffer;
      event: Event;
      stageMask: PipelineStageFlags;
    ): void {.cdecl.} =
  cmdResetEventCage(commandBuffer,event,stageMask)

proc cmdCopyBuffer*(
      commandBuffer: CommandBuffer;
      srcBuffer: Buffer;
      dstBuffer: Buffer;
      regionCount: uint32;
      pRegions: ptr BufferCopy;
    ): void {.cdecl.} =
  cmdCopyBufferCage(commandBuffer,srcBuffer,dstBuffer,regionCount,pRegions)

proc cmdClearAttachments*(
      commandBuffer: CommandBuffer;
      attachmentCount: uint32;
      pAttachments: ptr ClearAttachment;
      rectCount: uint32;
      pRects: ptr ClearRect;
    ): void {.cdecl.} =
  cmdClearAttachmentsCage(commandBuffer,attachmentCount,pAttachments,rectCount,pRects)

proc cmdSetViewport*(
      commandBuffer: CommandBuffer;
      firstViewport: uint32;
      viewportCount: uint32;
      pViewports: ptr Viewport;
    ): void {.cdecl.} =
  cmdSetViewportCage(commandBuffer,firstViewport,viewportCount,pViewports)

proc cmdUpdateBuffer*(
      commandBuffer: CommandBuffer;
      dstBuffer: Buffer;
      dstOffset: DeviceSize;
      dataSize: DeviceSize;
      pData: pointer;
    ): void {.cdecl.} =
  cmdUpdateBufferCage(commandBuffer,dstBuffer,dstOffset,dataSize,pData)

proc cmdClearColorImage*(
      commandBuffer: CommandBuffer;
      image: Image;
      imageLayout: ImageLayout;
      pColor: ptr ClearColorValue;
      rangeCount: uint32;
      pRanges: ptr ImageSubresourceRange;
    ): void {.cdecl.} =
  cmdClearColorImageCage(commandBuffer,image,imageLayout,pColor,rangeCount,pRanges)

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

proc cmdNextSubpass*(
      commandBuffer: CommandBuffer;
      contents: SubpassContents;
    ): void {.cdecl.} =
  cmdNextSubpassCage(commandBuffer,contents)

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

proc cmdSetLineWidth*(
      commandBuffer: CommandBuffer;
      lineWidth: float32;
    ): void {.cdecl.} =
  cmdSetLineWidthCage(commandBuffer,lineWidth)

proc cmdWriteTimestamp*(
      commandBuffer: CommandBuffer;
      pipelineStage: PipelineStageFlagBits;
      queryPool: QueryPool;
      query: uint32;
    ): void {.cdecl.} =
  cmdWriteTimestampCage(commandBuffer,pipelineStage,queryPool,query)

proc cmdDrawIndexed*(
      commandBuffer: CommandBuffer;
      indexCount: uint32;
      instanceCount: uint32;
      firstIndex: uint32;
      vertexOffset: int32;
      firstInstance: uint32;
    ): void {.cdecl.} =
  cmdDrawIndexedCage(commandBuffer,indexCount,instanceCount,firstIndex,vertexOffset,firstInstance)

proc cmdCopyBufferToImage*(
      commandBuffer: CommandBuffer;
      srcBuffer: Buffer;
      dstImage: Image;
      dstImageLayout: ImageLayout;
      regionCount: uint32;
      pRegions: ptr BufferImageCopy;
    ): void {.cdecl.} =
  cmdCopyBufferToImageCage(commandBuffer,srcBuffer,dstImage,dstImageLayout,regionCount,pRegions)

proc cmdBindPipeline*(
      commandBuffer: CommandBuffer;
      pipelineBindPoint: PipelineBindPoint;
      pipeline: Pipeline;
    ): void {.cdecl.} =
  cmdBindPipelineCage(commandBuffer,pipelineBindPoint,pipeline)

proc cmdBeginQuery*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      query: uint32;
      flags: QueryControlFlags;
    ): void {.cdecl.} =
  cmdBeginQueryCage(commandBuffer,queryPool,query,flags)

proc cmdBeginRenderPass*(
      commandBuffer: CommandBuffer;
      pRenderPassBegin: ptr RenderPassBeginInfo;
      contents: SubpassContents;
    ): void {.cdecl.} =
  cmdBeginRenderPassCage(commandBuffer,pRenderPassBegin,contents)

proc cmdResetQueryPool*(
      commandBuffer: CommandBuffer;
      queryPool: QueryPool;
      firstQuery: uint32;
      queryCount: uint32;
    ): void {.cdecl.} =
  cmdResetQueryPoolCage(commandBuffer,queryPool,firstQuery,queryCount)


proc loadInstanceProcs*() =
  nil.defineLoader(`<<`)
  getInstanceProcAddrCage << "vkGetInstanceAddr"
  enumerateInstanceExtensionPropertiesCage << "vkEnumerateInstanceExtensionProperties"
  enumerateInstanceLayerPropertiesCage << "vkEnumerateInstanceLayerProperties"
  createInstanceCage << "vkCreateInstance"

proc loadVk10*(instance: Instance) =
  instance.defineLoader(`<<`)

  # Device initialization
  # ---------------------
  getPhysicalDeviceImageFormatPropertiesCage << "vkGetPhysicalDeviceImageFormatProperties"
  createInstanceCage << "vkCreateInstance"
  destroyInstanceCage << "vkDestroyInstance"
  enumeratePhysicalDevicesCage << "vkEnumeratePhysicalDevices"
  getPhysicalDeviceMemoryPropertiesCage << "vkGetPhysicalDeviceMemoryProperties"
  getDeviceProcAddrCage << "vkGetDeviceProcAddr"
  getPhysicalDevicePropertiesCage << "vkGetPhysicalDeviceProperties"
  getPhysicalDeviceQueueFamilyPropertiesCage << "vkGetPhysicalDeviceQueueFamilyProperties"
  getInstanceProcAddrCage << "vkGetInstanceProcAddr"
  getPhysicalDeviceFormatPropertiesCage << "vkGetPhysicalDeviceFormatProperties"
  getPhysicalDeviceFeaturesCage << "vkGetPhysicalDeviceFeatures"

  # Device commands
  # ---------------
  createDeviceCage << "vkCreateDevice"
  destroyDeviceCage << "vkDestroyDevice"

  # Extension discovery commands
  # ----------------------------
  enumerateDeviceExtensionPropertiesCage << "vkEnumerateDeviceExtensionProperties"
  enumerateInstanceExtensionPropertiesCage << "vkEnumerateInstanceExtensionProperties"

  # Layer discovery commands
  # ------------------------
  enumerateDeviceLayerPropertiesCage << "vkEnumerateDeviceLayerProperties"
  enumerateInstanceLayerPropertiesCage << "vkEnumerateInstanceLayerProperties"

  # Queue commands
  # --------------
  getDeviceQueueCage << "vkGetDeviceQueue"
  queueWaitIdleCage << "vkQueueWaitIdle"
  deviceWaitIdleCage << "vkDeviceWaitIdle"
  queueSubmitCage << "vkQueueSubmit"

  # Memory commands
  # ---------------
  unmapMemoryCage << "vkUnmapMemory"
  freeMemoryCage << "vkFreeMemory"
  getDeviceMemoryCommitmentCage << "vkGetDeviceMemoryCommitment"
  invalidateMappedMemoryRangesCage << "vkInvalidateMappedMemoryRanges"
  flushMappedMemoryRangesCage << "vkFlushMappedMemoryRanges"
  mapMemoryCage << "vkMapMemory"
  allocateMemoryCage << "vkAllocateMemory"

  # Memory management API commands
  # ------------------------------
  getImageMemoryRequirementsCage << "vkGetImageMemoryRequirements"
  bindBufferMemoryCage << "vkBindBufferMemory"
  bindImageMemoryCage << "vkBindImageMemory"
  getBufferMemoryRequirementsCage << "vkGetBufferMemoryRequirements"

  # Sparse resource memory management API commands
  # ----------------------------------------------
  getImageSparseMemoryRequirementsCage << "vkGetImageSparseMemoryRequirements"
  getPhysicalDeviceSparseImageFormatPropertiesCage << "vkGetPhysicalDeviceSparseImageFormatProperties"
  queueBindSparseCage << "vkQueueBindSparse"

  # Fence commands
  # --------------
  waitForFencesCage << "vkWaitForFences"
  destroyFenceCage << "vkDestroyFence"
  createFenceCage << "vkCreateFence"
  getFenceStatusCage << "vkGetFenceStatus"
  resetFencesCage << "vkResetFences"

  # Queue semaphore commands
  # ------------------------
  createSemaphoreCage << "vkCreateSemaphore"
  destroySemaphoreCage << "vkDestroySemaphore"

  # Event commands
  # --------------
  destroyEventCage << "vkDestroyEvent"
  setEventCage << "vkSetEvent"
  getEventStatusCage << "vkGetEventStatus"
  createEventCage << "vkCreateEvent"
  resetEventCage << "vkResetEvent"

  # Query commands
  # --------------
  createQueryPoolCage << "vkCreateQueryPool"
  destroyQueryPoolCage << "vkDestroyQueryPool"
  getQueryPoolResultsCage << "vkGetQueryPoolResults"

  # Buffer commands
  # ---------------
  destroyBufferCage << "vkDestroyBuffer"
  createBufferCage << "vkCreateBuffer"

  # Buffer view commands
  # --------------------
  createBufferViewCage << "vkCreateBufferView"
  destroyBufferViewCage << "vkDestroyBufferView"

  # Image commands
  # --------------
  destroyImageCage << "vkDestroyImage"
  getImageSubresourceLayoutCage << "vkGetImageSubresourceLayout"
  createImageCage << "vkCreateImage"

  # Image view commands
  # -------------------
  createImageViewCage << "vkCreateImageView"
  destroyImageViewCage << "vkDestroyImageView"

  # Shader commands
  # ---------------
  destroyShaderModuleCage << "vkDestroyShaderModule"
  createShaderModuleCage << "vkCreateShaderModule"

  # Pipeline Cache commands
  # -----------------------
  getPipelineCacheDataCage << "vkGetPipelineCacheData"
  createPipelineCacheCage << "vkCreatePipelineCache"
  mergePipelineCachesCage << "vkMergePipelineCaches"
  destroyPipelineCacheCage << "vkDestroyPipelineCache"

  # Pipeline commands
  # -----------------
  createGraphicsPipelinesCage << "vkCreateGraphicsPipelines"
  createComputePipelinesCage << "vkCreateComputePipelines"
  destroyPipelineCage << "vkDestroyPipeline"

  # Pipeline layout commands
  # ------------------------
  destroyPipelineLayoutCage << "vkDestroyPipelineLayout"
  createPipelineLayoutCage << "vkCreatePipelineLayout"

  # Sampler commands
  # ----------------
  createSamplerCage << "vkCreateSampler"
  destroySamplerCage << "vkDestroySampler"

  # Descriptor set commands
  # -----------------------
  createDescriptorSetLayoutCage << "vkCreateDescriptorSetLayout"
  destroyDescriptorPoolCage << "vkDestroyDescriptorPool"
  resetDescriptorPoolCage << "vkResetDescriptorPool"
  createDescriptorPoolCage << "vkCreateDescriptorPool"
  destroyDescriptorSetLayoutCage << "vkDestroyDescriptorSetLayout"
  freeDescriptorSetsCage << "vkFreeDescriptorSets"
  allocateDescriptorSetsCage << "vkAllocateDescriptorSets"
  updateDescriptorSetsCage << "vkUpdateDescriptorSets"

  # Pass commands
  # -------------
  destroyRenderPassCage << "vkDestroyRenderPass"
  createFramebufferCage << "vkCreateFramebuffer"
  getRenderAreaGranularityCage << "vkGetRenderAreaGranularity"
  destroyFramebufferCage << "vkDestroyFramebuffer"
  createRenderPassCage << "vkCreateRenderPass"

  # Command pool commands
  # ---------------------
  resetCommandPoolCage << "vkResetCommandPool"
  destroyCommandPoolCage << "vkDestroyCommandPool"
  createCommandPoolCage << "vkCreateCommandPool"

  # Command buffer commands
  # -----------------------
  allocateCommandBuffersCage << "vkAllocateCommandBuffers"
  endCommandBufferCage << "vkEndCommandBuffer"
  resetCommandBufferCage << "vkResetCommandBuffer"
  freeCommandBuffersCage << "vkFreeCommandBuffers"
  beginCommandBufferCage << "vkBeginCommandBuffer"

  # Command buffer building commands
  # --------------------------------
  cmdBlitImageCage << "vkCmdBlitImage"
  cmdSetScissorCage << "vkCmdSetScissor"
  cmdBindVertexBuffersCage << "vkCmdBindVertexBuffers"
  cmdWaitEventsCage << "vkCmdWaitEvents"
  cmdSetDepthBoundsCage << "vkCmdSetDepthBounds"
  cmdEndRenderPassCage << "vkCmdEndRenderPass"
  cmdDispatchCage << "vkCmdDispatch"
  cmdFillBufferCage << "vkCmdFillBuffer"
  cmdDrawIndexedIndirectCage << "vkCmdDrawIndexedIndirect"
  cmdSetStencilReferenceCage << "vkCmdSetStencilReference"
  cmdSetStencilCompareMaskCage << "vkCmdSetStencilCompareMask"
  cmdSetEventCage << "vkCmdSetEvent"
  cmdBindDescriptorSetsCage << "vkCmdBindDescriptorSets"
  cmdSetDepthBiasCage << "vkCmdSetDepthBias"
  cmdCopyImageToBufferCage << "vkCmdCopyImageToBuffer"
  cmdDrawIndirectCage << "vkCmdDrawIndirect"
  cmdClearDepthStencilImageCage << "vkCmdClearDepthStencilImage"
  cmdBindIndexBufferCage << "vkCmdBindIndexBuffer"
  cmdPipelineBarrierCage << "vkCmdPipelineBarrier"
  cmdDrawCage << "vkCmdDraw"
  cmdSetStencilWriteMaskCage << "vkCmdSetStencilWriteMask"
  cmdExecuteCommandsCage << "vkCmdExecuteCommands"
  cmdPushConstantsCage << "vkCmdPushConstants"
  cmdEndQueryCage << "vkCmdEndQuery"
  cmdCopyImageCage << "vkCmdCopyImage"
  cmdSetBlendConstantsCage << "vkCmdSetBlendConstants"
  cmdDispatchIndirectCage << "vkCmdDispatchIndirect"
  cmdResetEventCage << "vkCmdResetEvent"
  cmdCopyBufferCage << "vkCmdCopyBuffer"
  cmdClearAttachmentsCage << "vkCmdClearAttachments"
  cmdSetViewportCage << "vkCmdSetViewport"
  cmdUpdateBufferCage << "vkCmdUpdateBuffer"
  cmdClearColorImageCage << "vkCmdClearColorImage"
  cmdCopyQueryPoolResultsCage << "vkCmdCopyQueryPoolResults"
  cmdNextSubpassCage << "vkCmdNextSubpass"
  cmdResolveImageCage << "vkCmdResolveImage"
  cmdSetLineWidthCage << "vkCmdSetLineWidth"
  cmdWriteTimestampCage << "vkCmdWriteTimestamp"
  cmdDrawIndexedCage << "vkCmdDrawIndexed"
  cmdCopyBufferToImageCage << "vkCmdCopyBufferToImage"
  cmdBindPipelineCage << "vkCmdBindPipeline"
  cmdBeginQueryCage << "vkCmdBeginQuery"
  cmdBeginRenderPassCage << "vkCmdBeginRenderPass"
  cmdResetQueryPoolCage << "vkCmdResetQueryPool"