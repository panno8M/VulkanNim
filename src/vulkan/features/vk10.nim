# Generated at 2021-08-27T14:20:42+09:00
# vulkan 1.0
# Vulkan core API interface definitions
# ======================================

import ../platform


const
  # API constants
  AttachmentUnused* = (uint.high)
  False* = 0
  LodClampNone* = 1000.0f
  QueueFamilyIgnored* = (uint.high)
  RemainingArrayLayers* = (uint.high)
  RemainingMipLevels* = (uint.high)
  SubpassExternal* = (uint.high)
  True* = 1
  WholeSize* = (uint.high)

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
  Bool32* = distinct uint32
  DeviceAddress* = distinct uint64
  DeviceSize* = distinct uint64
  Extent2D* = object
    width*: uint32
    height*: uint32
  Extent3D* = object
    width*: uint32
    height*: uint32
    depth*: uint32
  Flags* = distinct uint32
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
    ErrorSurfaceLostKhr = 100000000000
    # Provided by VK_KHR_surface
    ErrorNativeWindowInUseKhr = 100000000001
    # Provided by VK_KHR_swapchain
    SuboptimalKhr = 100000010003
    # Provided by VK_KHR_swapchain
    ErrorOutOfDateKhr = 100000010004
    # Provided by VK_KHR_display_swapchain
    ErrorIncompatibleDisplayKhr = 100000030001
    # Provided by VK_EXT_debug_report
    ErrorValidationFailedExt = 100000110001
    # Provided by VK_NV_glsl_shader
    ErrorInvalidShaderNv = 100000120000
    # Provided by VK_VERSION_1_1
    ErrorOutOfPoolMemory = 100000690000
    # Provided by VK_VERSION_1_1
    ErrorInvalidExternalHandle = 100000720003
    # Provided by VK_KHR_ray_tracing
    ErrorIncompatibleVersionKhr = 100001500000
    # Provided by VK_EXT_image_drm_format_modifier
    ErrorInvalidDrmFormatModifierPlaneLayoutExt = 100001580000
    # Provided by VK_VERSION_1_2
    ErrorFragmentation = 100001610000
    # Provided by VK_EXT_global_priority
    ErrorNotPermittedExt = 100001740001
    # Provided by VK_EXT_full_screen_exclusive
    ErrorFullScreenExclusiveModeLostExt = 100002550000
    # Provided by VK_VERSION_1_2
    ErrorInvalidOpaqueCaptureAddress = 100002570000
    # Provided by VK_KHR_deferred_host_operations
    ThreadIdleKhr = 100002680000
    # Provided by VK_KHR_deferred_host_operations
    ThreadDoneKhr = 100002680001
    # Provided by VK_KHR_deferred_host_operations
    OperationDeferredKhr = 100002680002
    # Provided by VK_KHR_deferred_host_operations
    OperationNotDeferredKhr = 100002680003
    # Provided by VK_EXT_pipeline_creation_cache_control
    PipelineCompileRequiredExt = 100002970000
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
    # Provided by VK_VERSION_1_2
    PhysicalDeviceVulkan11Features = 49
    # Provided by VK_VERSION_1_2
    PhysicalDeviceVulkan11Properties = 50
    # Provided by VK_VERSION_1_2
    PhysicalDeviceVulkan12Features = 51
    # Provided by VK_VERSION_1_2
    PhysicalDeviceVulkan12Properties = 52
    # Provided by VK_KHR_swapchain
    SwapchainCreateInfoKhr = 100000010000
    # Provided by VK_KHR_swapchain
    PresentInfoKhr = 100000010001
    # Provided by VK_KHR_display
    DisplayModeCreateInfoKhr = 100000020000
    # Provided by VK_KHR_display
    DisplaySurfaceCreateInfoKhr = 100000020001
    # Provided by VK_KHR_display_swapchain
    DisplayPresentInfoKhr = 100000030000
    # Provided by VK_KHR_xlib_surface
    XlibSurfaceCreateInfoKhr = 100000040000
    # Provided by VK_KHR_xcb_surface
    XcbSurfaceCreateInfoKhr = 100000050000
    # Provided by VK_KHR_wayland_surface
    WaylandSurfaceCreateInfoKhr = 100000060000
    # Provided by VK_KHR_android_surface
    AndroidSurfaceCreateInfoKhr = 100000080000
    # Provided by VK_KHR_win32_surface
    Win32SurfaceCreateInfoKhr = 100000090000
    # Provided by VK_ANDROID_native_buffer
    NativeBufferAndroid = 100000100000
    # Provided by VK_ANDROID_native_buffer
    SwapchainImageCreateInfoAndroid = 100000100001
    # Provided by VK_ANDROID_native_buffer
    PhysicalDevicePresentationPropertiesAndroid = 100000100002
    # Provided by VK_EXT_debug_report
    DebugReportCallbackCreateInfoExt = 100000110000
    # Provided by VK_AMD_rasterization_order
    PipelineRasterizationStateRasterizationOrderAmd = 100000180000
    # Provided by VK_EXT_debug_marker
    DebugMarkerObjectNameInfoExt = 100000220000
    # Provided by VK_EXT_debug_marker
    DebugMarkerObjectTagInfoExt = 100000220001
    # Provided by VK_EXT_debug_marker
    DebugMarkerMarkerInfoExt = 100000220002
    # Provided by VK_NV_dedicated_allocation
    DedicatedAllocationImageCreateInfoNv = 100000260000
    # Provided by VK_NV_dedicated_allocation
    DedicatedAllocationBufferCreateInfoNv = 100000260001
    # Provided by VK_NV_dedicated_allocation
    DedicatedAllocationMemoryAllocateInfoNv = 100000260002
    # Provided by VK_EXT_transform_feedback
    PhysicalDeviceTransformFeedbackFeaturesExt = 100000280000
    # Provided by VK_EXT_transform_feedback
    PhysicalDeviceTransformFeedbackPropertiesExt = 100000280001
    # Provided by VK_EXT_transform_feedback
    PipelineRasterizationStateStreamCreateInfoExt = 100000280002
    # Provided by VK_NVX_image_view_handle
    ImageViewHandleInfoNvx = 100000300000
    # Provided by VK_NVX_image_view_handle
    ImageViewAddressPropertiesNvx = 100000300001
    # Provided by VK_AMD_texture_gather_bias_lod
    TextureLodGatherFormatPropertiesAmd = 100000410000
    # Provided by VK_GGP_stream_descriptor_surface
    StreamDescriptorSurfaceCreateInfoGgp = 100000490000
    # Provided by VK_NV_corner_sampled_image
    PhysicalDeviceCornerSampledImageFeaturesNv = 100000500000
    # Provided by VK_VERSION_1_1
    RenderPassMultiviewCreateInfo = 100000530000
    # Provided by VK_VERSION_1_1
    PhysicalDeviceMultiviewFeatures = 100000530001
    # Provided by VK_VERSION_1_1
    PhysicalDeviceMultiviewProperties = 100000530002
    # Provided by VK_NV_external_memory
    ExternalMemoryImageCreateInfoNv = 100000560000
    # Provided by VK_NV_external_memory
    ExportMemoryAllocateInfoNv = 100000560001
    # Provided by VK_NV_external_memory_win32
    ImportMemoryWin32HandleInfoNv = 100000570000
    # Provided by VK_NV_external_memory_win32
    ExportMemoryWin32HandleInfoNv = 100000570001
    # Provided by VK_NV_win32_keyed_mutex
    Win32KeyedMutexAcquireReleaseInfoNv = 100000580000
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
    # Provided by VK_KHR_swapchain
    DeviceGroupPresentCapabilitiesKhr = 100000600007
    # Provided by VK_KHR_swapchain
    ImageSwapchainCreateInfoKhr = 100000600008
    # Provided by VK_KHR_swapchain
    BindImageMemorySwapchainInfoKhr = 100000600009
    # Provided by VK_KHR_swapchain
    AcquireNextImageInfoKhr = 100000600010
    # Provided by VK_KHR_swapchain
    DeviceGroupPresentInfoKhr = 100000600011
    # Provided by VK_KHR_swapchain
    DeviceGroupSwapchainCreateInfoKhr = 100000600012
    # Provided by VK_VERSION_1_1
    BindBufferMemoryDeviceGroupInfo = 100000600013
    # Provided by VK_VERSION_1_1
    BindImageMemoryDeviceGroupInfo = 100000600014
    # Provided by VK_EXT_validation_flags
    ValidationFlagsExt = 100000610000
    # Provided by VK_NN_vi_surface
    ViSurfaceCreateInfoNn = 100000620000
    # Provided by VK_VERSION_1_1
    PhysicalDeviceShaderDrawParametersFeatures = 100000630000
    # Provided by VK_EXT_texture_compression_astc_hdr
    PhysicalDeviceTextureCompressionAstcHdrFeaturesExt = 100000660000
    # Provided by VK_EXT_astc_decode_mode
    ImageViewAstcDecodeModeExt = 100000670000
    # Provided by VK_EXT_astc_decode_mode
    PhysicalDeviceAstcDecodeFeaturesExt = 100000670001
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
    ImportMemoryWin32HandleInfoKhr = 100000730000
    # Provided by VK_KHR_external_memory_win32
    ExportMemoryWin32HandleInfoKhr = 100000730001
    # Provided by VK_KHR_external_memory_win32
    MemoryWin32HandlePropertiesKhr = 100000730002
    # Provided by VK_KHR_external_memory_win32
    MemoryGetWin32HandleInfoKhr = 100000730003
    # Provided by VK_KHR_external_memory_fd
    ImportMemoryFdInfoKhr = 100000740000
    # Provided by VK_KHR_external_memory_fd
    MemoryFdPropertiesKhr = 100000740001
    # Provided by VK_KHR_external_memory_fd
    MemoryGetFdInfoKhr = 100000740002
    # Provided by VK_KHR_win32_keyed_mutex
    Win32KeyedMutexAcquireReleaseInfoKhr = 100000750000
    # Provided by VK_VERSION_1_1
    PhysicalDeviceExternalSemaphoreInfo = 100000760000
    # Provided by VK_VERSION_1_1
    ExternalSemaphoreProperties = 100000760001
    # Provided by VK_VERSION_1_1
    ExportSemaphoreCreateInfo = 100000770000
    # Provided by VK_KHR_external_semaphore_win32
    ImportSemaphoreWin32HandleInfoKhr = 100000780000
    # Provided by VK_KHR_external_semaphore_win32
    ExportSemaphoreWin32HandleInfoKhr = 100000780001
    # Provided by VK_KHR_external_semaphore_win32
    D3d12FenceSubmitInfoKhr = 100000780002
    # Provided by VK_KHR_external_semaphore_win32
    SemaphoreGetWin32HandleInfoKhr = 100000780003
    # Provided by VK_KHR_external_semaphore_fd
    ImportSemaphoreFdInfoKhr = 100000790000
    # Provided by VK_KHR_external_semaphore_fd
    SemaphoreGetFdInfoKhr = 100000790001
    # Provided by VK_KHR_push_descriptor
    PhysicalDevicePushDescriptorPropertiesKhr = 100000800000
    # Provided by VK_EXT_conditional_rendering
    CommandBufferInheritanceConditionalRenderingInfoExt = 100000810000
    # Provided by VK_EXT_conditional_rendering
    PhysicalDeviceConditionalRenderingFeaturesExt = 100000810001
    # Provided by VK_EXT_conditional_rendering
    ConditionalRenderingBeginInfoExt = 100000810002
    # Provided by VK_VERSION_1_2
    PhysicalDeviceShaderFloat16Int8Features = 100000820000
    # Provided by VK_VERSION_1_1
    PhysicalDevice16bitStorageFeatures = 100000830000
    # Provided by VK_KHR_incremental_present
    PresentRegionsKhr = 100000840000
    # Provided by VK_VERSION_1_1
    DescriptorUpdateTemplateCreateInfo = 100000850000
    # Provided by VK_NV_clip_space_w_scaling
    PipelineViewportWScalingStateCreateInfoNv = 100000870000
    # Provided by VK_EXT_display_surface_counter
    SurfaceCapabilities2Ext = 100000900000
    # Provided by VK_EXT_display_control
    DisplayPowerInfoExt = 100000910000
    # Provided by VK_EXT_display_control
    DeviceEventInfoExt = 100000910001
    # Provided by VK_EXT_display_control
    DisplayEventInfoExt = 100000910002
    # Provided by VK_EXT_display_control
    SwapchainCounterCreateInfoExt = 100000910003
    # Provided by VK_GOOGLE_display_timing
    PresentTimesInfoGoogle = 100000920000
    # Provided by VK_VERSION_1_1
    PhysicalDeviceSubgroupProperties = 100000940000
    # Provided by VK_NVX_multiview_per_view_attributes
    PhysicalDeviceMultiviewPerViewAttributesPropertiesNvx = 100000970000
    # Provided by VK_NV_viewport_swizzle
    PipelineViewportSwizzleStateCreateInfoNv = 100000980000
    # Provided by VK_EXT_discard_rectangles
    PhysicalDeviceDiscardRectanglePropertiesExt = 100000990000
    # Provided by VK_EXT_discard_rectangles
    PipelineDiscardRectangleStateCreateInfoExt = 100000990001
    # Provided by VK_EXT_conservative_rasterization
    PhysicalDeviceConservativeRasterizationPropertiesExt = 100001010000
    # Provided by VK_EXT_conservative_rasterization
    PipelineRasterizationConservativeStateCreateInfoExt = 100001010001
    # Provided by VK_EXT_depth_clip_enable
    PhysicalDeviceDepthClipEnableFeaturesExt = 100001020000
    # Provided by VK_EXT_depth_clip_enable
    PipelineRasterizationDepthClipStateCreateInfoExt = 100001020001
    # Provided by VK_EXT_hdr_metadata
    HdrMetadataExt = 100001050000
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
    SharedPresentSurfaceCapabilitiesKhr = 100001110000
    # Provided by VK_VERSION_1_1
    PhysicalDeviceExternalFenceInfo = 100001120000
    # Provided by VK_VERSION_1_1
    ExternalFenceProperties = 100001120001
    # Provided by VK_VERSION_1_1
    ExportFenceCreateInfo = 100001130000
    # Provided by VK_KHR_external_fence_win32
    ImportFenceWin32HandleInfoKhr = 100001140000
    # Provided by VK_KHR_external_fence_win32
    ExportFenceWin32HandleInfoKhr = 100001140001
    # Provided by VK_KHR_external_fence_win32
    FenceGetWin32HandleInfoKhr = 100001140002
    # Provided by VK_KHR_external_fence_fd
    ImportFenceFdInfoKhr = 100001150000
    # Provided by VK_KHR_external_fence_fd
    FenceGetFdInfoKhr = 100001150001
    # Provided by VK_KHR_performance_query
    PhysicalDevicePerformanceQueryFeaturesKhr = 100001160000
    # Provided by VK_KHR_performance_query
    PhysicalDevicePerformanceQueryPropertiesKhr = 100001160001
    # Provided by VK_KHR_performance_query
    QueryPoolPerformanceCreateInfoKhr = 100001160002
    # Provided by VK_KHR_performance_query
    PerformanceQuerySubmitInfoKhr = 100001160003
    # Provided by VK_KHR_performance_query
    AcquireProfilingLockInfoKhr = 100001160004
    # Provided by VK_KHR_performance_query
    PerformanceCounterKhr = 100001160005
    # Provided by VK_KHR_performance_query
    PerformanceCounterDescriptionKhr = 100001160006
    # Provided by VK_VERSION_1_1
    PhysicalDevicePointClippingProperties = 100001170000
    # Provided by VK_VERSION_1_1
    RenderPassInputAttachmentAspectCreateInfo = 100001170001
    # Provided by VK_VERSION_1_1
    ImageViewUsageCreateInfo = 100001170002
    # Provided by VK_VERSION_1_1
    PipelineTessellationDomainOriginStateCreateInfo = 100001170003
    # Provided by VK_KHR_get_surface_capabilities2
    PhysicalDeviceSurfaceInfo2Khr = 100001190000
    # Provided by VK_KHR_get_surface_capabilities2
    SurfaceCapabilities2Khr = 100001190001
    # Provided by VK_KHR_get_surface_capabilities2
    SurfaceFormat2Khr = 100001190002
    # Provided by VK_VERSION_1_1
    PhysicalDeviceVariablePointersFeatures = 100001200000
    # Provided by VK_KHR_get_display_properties2
    DisplayProperties2Khr = 100001210000
    # Provided by VK_KHR_get_display_properties2
    DisplayPlaneProperties2Khr = 100001210001
    # Provided by VK_KHR_get_display_properties2
    DisplayModeProperties2Khr = 100001210002
    # Provided by VK_KHR_get_display_properties2
    DisplayPlaneInfo2Khr = 100001210003
    # Provided by VK_KHR_get_display_properties2
    DisplayPlaneCapabilities2Khr = 100001210004
    # Provided by VK_MVK_ios_surface
    IosSurfaceCreateInfoM = 100001220000
    # Provided by VK_MVK_macos_surface
    MacosSurfaceCreateInfoM = 100001230000
    # Provided by VK_VERSION_1_1
    MemoryDedicatedRequirements = 100001270000
    # Provided by VK_VERSION_1_1
    MemoryDedicatedAllocateInfo = 100001270001
    # Provided by VK_EXT_debug_utils
    DebugUtilsObjectNameInfoExt = 100001280000
    # Provided by VK_EXT_debug_utils
    DebugUtilsObjectTagInfoExt = 100001280001
    # Provided by VK_EXT_debug_utils
    DebugUtilsLabelExt = 100001280002
    # Provided by VK_EXT_debug_utils
    DebugUtilsMessengerCallbackDataExt = 100001280003
    # Provided by VK_EXT_debug_utils
    DebugUtilsMessengerCreateInfoExt = 100001280004
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    AndroidHardwareBufferUsageAndroid = 100001290000
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    AndroidHardwareBufferPropertiesAndroid = 100001290001
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    AndroidHardwareBufferFormatPropertiesAndroid = 100001290002
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    ImportAndroidHardwareBufferInfoAndroid = 100001290003
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    MemoryGetAndroidHardwareBufferInfoAndroid = 100001290004
    # Provided by VK_ANDROID_external_memory_android_hardware_buffer
    ExternalFormatAndroid = 100001290005
    # Provided by VK_VERSION_1_2
    PhysicalDeviceSamplerFilterMinmaxProperties = 100001300000
    # Provided by VK_VERSION_1_2
    SamplerReductionModeCreateInfo = 100001300001
    # Provided by VK_EXT_inline_uniform_block
    PhysicalDeviceInlineUniformBlockFeaturesExt = 100001380000
    # Provided by VK_EXT_inline_uniform_block
    PhysicalDeviceInlineUniformBlockPropertiesExt = 100001380001
    # Provided by VK_EXT_inline_uniform_block
    WriteDescriptorSetInlineUniformBlockExt = 100001380002
    # Provided by VK_EXT_inline_uniform_block
    DescriptorPoolInlineUniformBlockCreateInfoExt = 100001380003
    # Provided by VK_EXT_sample_locations
    SampleLocationsInfoExt = 100001430000
    # Provided by VK_EXT_sample_locations
    RenderPassSampleLocationsBeginInfoExt = 100001430001
    # Provided by VK_EXT_sample_locations
    PipelineSampleLocationsStateCreateInfoExt = 100001430002
    # Provided by VK_EXT_sample_locations
    PhysicalDeviceSampleLocationsPropertiesExt = 100001430003
    # Provided by VK_EXT_sample_locations
    MultisamplePropertiesExt = 100001430004
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
    PhysicalDeviceBlendOperationAdvancedFeaturesExt = 100001480000
    # Provided by VK_EXT_blend_operation_advanced
    PhysicalDeviceBlendOperationAdvancedPropertiesExt = 100001480001
    # Provided by VK_EXT_blend_operation_advanced
    PipelineColorBlendAdvancedStateCreateInfoExt = 100001480002
    # Provided by VK_NV_fragment_coverage_to_color
    PipelineCoverageToColorStateCreateInfoNv = 100001490000
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureBuildGeometryInfoKhr = 100001500000
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureCreateGeometryTypeInfoKhr = 100001500001
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureDeviceAddressInfoKhr = 100001500002
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureGeometryAabbsDataKhr = 100001500003
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureGeometryInstancesDataKhr = 100001500004
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureGeometryTrianglesDataKhr = 100001500005
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureGeometryKhr = 100001500006
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureMemoryRequirementsInfoKhr = 100001500008
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureVersionKhr = 100001500009
    # Provided by VK_KHR_ray_tracing
    CopyAccelerationStructureInfoKhr = 100001500010
    # Provided by VK_KHR_ray_tracing
    CopyAccelerationStructureToMemoryInfoKhr = 100001500011
    # Provided by VK_KHR_ray_tracing
    CopyMemoryToAccelerationStructureInfoKhr = 100001500012
    # Provided by VK_KHR_ray_tracing
    PhysicalDeviceRayTracingFeaturesKhr = 100001500013
    # Provided by VK_KHR_ray_tracing
    PhysicalDeviceRayTracingPropertiesKhr = 100001500014
    # Provided by VK_KHR_ray_tracing
    RayTracingPipelineCreateInfoKhr = 100001500015
    # Provided by VK_KHR_ray_tracing
    RayTracingShaderGroupCreateInfoKhr = 100001500016
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureCreateInfoKhr = 100001500017
    # Provided by VK_KHR_ray_tracing
    RayTracingPipelineInterfaceCreateInfoKhr = 100001500018
    # Provided by VK_NV_framebuffer_mixed_samples
    PipelineCoverageModulationStateCreateInfoNv = 100001520000
    # Provided by VK_NV_shader_sm_builtins
    PhysicalDeviceShaderSmBuiltinsFeaturesNv = 100001540000
    # Provided by VK_NV_shader_sm_builtins
    PhysicalDeviceShaderSmBuiltinsPropertiesNv = 100001540001
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
    DrmFormatModifierPropertiesListExt = 100001580000
    # Provided by VK_EXT_image_drm_format_modifier
    DrmFormatModifierPropertiesExt = 100001580001
    # Provided by VK_EXT_image_drm_format_modifier
    PhysicalDeviceImageDrmFormatModifierInfoExt = 100001580002
    # Provided by VK_EXT_image_drm_format_modifier
    ImageDrmFormatModifierListCreateInfoExt = 100001580003
    # Provided by VK_EXT_image_drm_format_modifier
    ImageDrmFormatModifierExplicitCreateInfoExt = 100001580004
    # Provided by VK_EXT_image_drm_format_modifier
    ImageDrmFormatModifierPropertiesExt = 100001580005
    # Provided by VK_EXT_validation_cache
    ValidationCacheCreateInfoExt = 100001600000
    # Provided by VK_EXT_validation_cache
    ShaderModuleValidationCacheCreateInfoExt = 100001600001
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
    PipelineViewportShadingRateImageStateCreateInfoNv = 100001640000
    # Provided by VK_NV_shading_rate_image
    PhysicalDeviceShadingRateImageFeaturesNv = 100001640001
    # Provided by VK_NV_shading_rate_image
    PhysicalDeviceShadingRateImagePropertiesNv = 100001640002
    # Provided by VK_NV_shading_rate_image
    PipelineViewportCoarseSampleOrderStateCreateInfoNv = 100001640005
    # Provided by VK_NV_ray_tracing
    RayTracingPipelineCreateInfoNv = 100001650000
    # Provided by VK_NV_ray_tracing
    AccelerationStructureCreateInfoNv = 100001650001
    # Provided by VK_NV_ray_tracing
    GeometryNv = 100001650003
    # Provided by VK_NV_ray_tracing
    GeometryTrianglesNv = 100001650004
    # Provided by VK_NV_ray_tracing
    GeometryAabbNv = 100001650005
    # Provided by VK_KHR_ray_tracing
    BindAccelerationStructureMemoryInfoKhr = 100001650006
    # Provided by VK_KHR_ray_tracing
    WriteDescriptorSetAccelerationStructureKhr = 100001650007
    # Provided by VK_NV_ray_tracing
    AccelerationStructureMemoryRequirementsInfoNv = 100001650008
    # Provided by VK_NV_ray_tracing
    PhysicalDeviceRayTracingPropertiesNv = 100001650009
    # Provided by VK_NV_ray_tracing
    RayTracingShaderGroupCreateInfoNv = 100001650011
    # Provided by VK_NV_ray_tracing
    AccelerationStructureInfoNv = 100001650012
    # Provided by VK_NV_representative_fragment_test
    PhysicalDeviceRepresentativeFragmentTestFeaturesNv = 100001660000
    # Provided by VK_NV_representative_fragment_test
    PipelineRepresentativeFragmentTestStateCreateInfoNv = 100001660001
    # Provided by VK_VERSION_1_1
    PhysicalDeviceMaintenance3Properties = 100001680000
    # Provided by VK_VERSION_1_1
    DescriptorSetLayoutSupport = 100001680001
    # Provided by VK_EXT_filter_cubic
    PhysicalDeviceImageViewImageFormatInfoExt = 100001700000
    # Provided by VK_EXT_filter_cubic
    FilterCubicImageViewImageFormatPropertiesExt = 100001700001
    # Provided by VK_EXT_global_priority
    DeviceQueueGlobalPriorityCreateInfoExt = 100001740000
    # Provided by VK_VERSION_1_2
    PhysicalDeviceShaderSubgroupExtendedTypesFeatures = 100001750000
    # Provided by VK_VERSION_1_2
    PhysicalDevice8bitStorageFeatures = 100001770000
    # Provided by VK_EXT_external_memory_host
    ImportMemoryHostPointerInfoExt = 100001780000
    # Provided by VK_EXT_external_memory_host
    MemoryHostPointerPropertiesExt = 100001780001
    # Provided by VK_EXT_external_memory_host
    PhysicalDeviceExternalMemoryHostPropertiesExt = 100001780002
    # Provided by VK_VERSION_1_2
    PhysicalDeviceShaderAtomicInt64Features = 100001800000
    # Provided by VK_KHR_shader_clock
    PhysicalDeviceShaderClockFeaturesKhr = 100001810000
    # Provided by VK_AMD_pipeline_compiler_control
    PipelineCompilerControlCreateInfoAmd = 100001830000
    # Provided by VK_EXT_calibrated_timestamps
    CalibratedTimestampInfoExt = 100001840000
    # Provided by VK_AMD_shader_core_properties
    PhysicalDeviceShaderCorePropertiesAmd = 100001850000
    # Provided by VK_AMD_memory_overallocation_behavior
    DeviceMemoryOverallocationCreateInfoAmd = 100001890000
    # Provided by VK_EXT_vertex_attribute_divisor
    PhysicalDeviceVertexAttributeDivisorPropertiesExt = 100001900000
    # Provided by VK_EXT_vertex_attribute_divisor
    PipelineVertexInputDivisorStateCreateInfoExt = 100001900001
    # Provided by VK_EXT_vertex_attribute_divisor
    PhysicalDeviceVertexAttributeDivisorFeaturesExt = 100001900002
    # Provided by VK_GGP_frame_token
    PresentFrameTokenGgp = 100001910000
    # Provided by VK_EXT_pipeline_creation_feedback
    PipelineCreationFeedbackCreateInfoExt = 100001920000
    # Provided by VK_VERSION_1_2
    PhysicalDeviceDriverProperties = 100001960000
    # Provided by VK_VERSION_1_2
    PhysicalDeviceFloatControlsProperties = 100001970000
    # Provided by VK_VERSION_1_2
    PhysicalDeviceDepthStencilResolveProperties = 100001990000
    # Provided by VK_VERSION_1_2
    SubpassDescriptionDepthStencilResolve = 100001990001
    # Provided by VK_NV_compute_shader_derivatives
    PhysicalDeviceComputeShaderDerivativesFeaturesNv = 100002010000
    # Provided by VK_NV_mesh_shader
    PhysicalDeviceMeshShaderFeaturesNv = 100002020000
    # Provided by VK_NV_mesh_shader
    PhysicalDeviceMeshShaderPropertiesNv = 100002020001
    # Provided by VK_NV_fragment_shader_barycentric
    PhysicalDeviceFragmentShaderBarycentricFeaturesNv = 100002030000
    # Provided by VK_NV_shader_image_footprint
    PhysicalDeviceShaderImageFootprintFeaturesNv = 100002040000
    # Provided by VK_NV_scissor_exclusive
    PipelineViewportExclusiveScissorStateCreateInfoNv = 100002050000
    # Provided by VK_NV_scissor_exclusive
    PhysicalDeviceExclusiveScissorFeaturesNv = 100002050002
    # Provided by VK_NV_device_diagnostic_checkpoints
    CheckpointDataNv = 100002060000
    # Provided by VK_NV_device_diagnostic_checkpoints
    QueueFamilyCheckpointPropertiesNv = 100002060001
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
    PhysicalDeviceShaderIntegerFunctions2FeaturesIntel = 100002090000
    # Provided by VK_INTEL_performance_query
    QueryPoolPerformanceQueryCreateInfoIntel = 100002100000
    # Provided by VK_INTEL_performance_query
    InitializePerformanceApiInfoIntel = 100002100001
    # Provided by VK_INTEL_performance_query
    PerformanceMarkerInfoIntel = 100002100002
    # Provided by VK_INTEL_performance_query
    PerformanceStreamMarkerInfoIntel = 100002100003
    # Provided by VK_INTEL_performance_query
    PerformanceOverrideInfoIntel = 100002100004
    # Provided by VK_INTEL_performance_query
    PerformanceConfigurationAcquireInfoIntel = 100002100005
    # Provided by VK_VERSION_1_2
    PhysicalDeviceVulkanMemoryModelFeatures = 100002110000
    # Provided by VK_EXT_pci_bus_info
    PhysicalDevicePciBusInfoPropertiesExt = 100002120000
    # Provided by VK_AMD_display_native_hdr
    DisplayNativeHdrSurfaceCapabilitiesAmd = 100002130000
    # Provided by VK_AMD_display_native_hdr
    SwapchainDisplayNativeHdrCreateInfoAmd = 100002130001
    # Provided by VK_FUCHSIA_imagepipe_surface
    ImagepipeSurfaceCreateInfoFuchsia = 100002140000
    # Provided by VK_EXT_metal_surface
    MetalSurfaceCreateInfoExt = 100002170000
    # Provided by VK_EXT_fragment_density_map
    PhysicalDeviceFragmentDensityMapFeaturesExt = 100002180000
    # Provided by VK_EXT_fragment_density_map
    PhysicalDeviceFragmentDensityMapPropertiesExt = 100002180001
    # Provided by VK_EXT_fragment_density_map
    RenderPassFragmentDensityMapCreateInfoExt = 100002180002
    # Provided by VK_VERSION_1_2
    PhysicalDeviceScalarBlockLayoutFeatures = 100002210000
    # Provided by VK_EXT_subgroup_size_control
    PhysicalDeviceSubgroupSizeControlPropertiesExt = 100002250000
    # Provided by VK_EXT_subgroup_size_control
    PipelineShaderStageRequiredSubgroupSizeCreateInfoExt = 100002250001
    # Provided by VK_EXT_subgroup_size_control
    PhysicalDeviceSubgroupSizeControlFeaturesExt = 100002250002
    # Provided by VK_AMD_shader_core_properties2
    PhysicalDeviceShaderCoreProperties2Amd = 100002270000
    # Provided by VK_AMD_device_coherent_memory
    PhysicalDeviceCoherentMemoryFeaturesAmd = 100002290000
    # Provided by VK_EXT_memory_budget
    PhysicalDeviceMemoryBudgetPropertiesExt = 100002370000
    # Provided by VK_EXT_memory_priority
    PhysicalDeviceMemoryPriorityFeaturesExt = 100002380000
    # Provided by VK_EXT_memory_priority
    MemoryPriorityAllocateInfoExt = 100002380001
    # Provided by VK_KHR_surface_protected_capabilities
    SurfaceProtectedCapabilitiesKhr = 100002390000
    # Provided by VK_NV_dedicated_allocation_image_aliasing
    PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNv = 100002400000
    # Provided by VK_VERSION_1_2
    PhysicalDeviceSeparateDepthStencilLayoutsFeatures = 100002410000
    # Provided by VK_VERSION_1_2
    AttachmentReferenceStencilLayout = 100002410001
    # Provided by VK_VERSION_1_2
    AttachmentDescriptionStencilLayout = 100002410002
    # Provided by VK_EXT_buffer_device_address
    PhysicalDeviceBufferDeviceAddressFeaturesExt = 100002440000
    # Provided by VK_VERSION_1_2
    BufferDeviceAddressInfo = 100002440001
    # Provided by VK_EXT_buffer_device_address
    BufferDeviceAddressCreateInfoExt = 100002440002
    # Provided by VK_EXT_tooling_info
    PhysicalDeviceToolPropertiesExt = 100002450000
    # Provided by VK_VERSION_1_2
    ImageStencilUsageCreateInfo = 100002460000
    # Provided by VK_EXT_validation_features
    ValidationFeaturesExt = 100002470000
    # Provided by VK_NV_cooperative_matrix
    PhysicalDeviceCooperativeMatrixFeaturesNv = 100002490000
    # Provided by VK_NV_cooperative_matrix
    CooperativeMatrixPropertiesNv = 100002490001
    # Provided by VK_NV_cooperative_matrix
    PhysicalDeviceCooperativeMatrixPropertiesNv = 100002490002
    # Provided by VK_NV_coverage_reduction_mode
    PhysicalDeviceCoverageReductionModeFeaturesNv = 100002500000
    # Provided by VK_NV_coverage_reduction_mode
    PipelineCoverageReductionStateCreateInfoNv = 100002500001
    # Provided by VK_NV_coverage_reduction_mode
    FramebufferMixedSamplesCombinationNv = 100002500002
    # Provided by VK_EXT_fragment_shader_interlock
    PhysicalDeviceFragmentShaderInterlockFeaturesExt = 100002510000
    # Provided by VK_EXT_ycbcr_image_arrays
    PhysicalDeviceYcbcrImageArraysFeaturesExt = 100002520000
    # Provided by VK_VERSION_1_2
    PhysicalDeviceUniformBufferStandardLayoutFeatures = 100002530000
    # Provided by VK_EXT_full_screen_exclusive
    SurfaceFullScreenExclusiveInfoExt = 100002550000
    # Provided by VK_EXT_full_screen_exclusive
    SurfaceFullScreenExclusiveWin32InfoExt = 100002550001
    # Provided by VK_EXT_full_screen_exclusive
    SurfaceCapabilitiesFullScreenExclusiveExt = 100002550002
    # Provided by VK_EXT_headless_surface
    HeadlessSurfaceCreateInfoExt = 100002560000
    # Provided by VK_VERSION_1_2
    PhysicalDeviceBufferDeviceAddressFeatures = 100002570000
    # Provided by VK_VERSION_1_2
    BufferOpaqueCaptureAddressCreateInfo = 100002570002
    # Provided by VK_VERSION_1_2
    MemoryOpaqueCaptureAddressAllocateInfo = 100002570003
    # Provided by VK_VERSION_1_2
    DeviceMemoryOpaqueCaptureAddressInfo = 100002570004
    # Provided by VK_EXT_line_rasterization
    PhysicalDeviceLineRasterizationFeaturesExt = 100002590000
    # Provided by VK_EXT_line_rasterization
    PipelineRasterizationLineStateCreateInfoExt = 100002590001
    # Provided by VK_EXT_line_rasterization
    PhysicalDeviceLineRasterizationPropertiesExt = 100002590002
    # Provided by VK_EXT_shader_atomic_float
    PhysicalDeviceShaderAtomicFloatFeaturesExt = 100002600000
    # Provided by VK_VERSION_1_2
    PhysicalDeviceHostQueryResetFeatures = 100002610000
    # Provided by VK_EXT_index_type_uint8
    PhysicalDeviceIndexTypeUint8FeaturesExt = 100002650000
    # Provided by VK_EXT_extended_dynamic_state
    PhysicalDeviceExtendedDynamicStateFeaturesExt = 100002670000
    # Provided by VK_KHR_deferred_host_operations
    DeferredOperationInfoKhr = 100002680000
    # Provided by VK_KHR_pipeline_executable_properties
    PhysicalDevicePipelineExecutablePropertiesFeaturesKhr = 100002690000
    # Provided by VK_KHR_pipeline_executable_properties
    PipelineInfoKhr = 100002690001
    # Provided by VK_KHR_pipeline_executable_properties
    PipelineExecutablePropertiesKhr = 100002690002
    # Provided by VK_KHR_pipeline_executable_properties
    PipelineExecutableInfoKhr = 100002690003
    # Provided by VK_KHR_pipeline_executable_properties
    PipelineExecutableStatisticKhr = 100002690004
    # Provided by VK_KHR_pipeline_executable_properties
    PipelineExecutableInternalRepresentationKhr = 100002690005
    # Provided by VK_EXT_shader_demote_to_helper_invocation
    PhysicalDeviceShaderDemoteToHelperInvocationFeaturesExt = 100002760000
    # Provided by VK_NV_device_generated_commands
    PhysicalDeviceDeviceGeneratedCommandsPropertiesNv = 100002770000
    # Provided by VK_NV_device_generated_commands
    GraphicsShaderGroupCreateInfoNv = 100002770001
    # Provided by VK_NV_device_generated_commands
    GraphicsPipelineShaderGroupsCreateInfoNv = 100002770002
    # Provided by VK_NV_device_generated_commands
    IndirectCommandsLayoutTokenNv = 100002770003
    # Provided by VK_NV_device_generated_commands
    IndirectCommandsLayoutCreateInfoNv = 100002770004
    # Provided by VK_NV_device_generated_commands
    GeneratedCommandsInfoNv = 100002770005
    # Provided by VK_NV_device_generated_commands
    GeneratedCommandsMemoryRequirementsInfoNv = 100002770006
    # Provided by VK_NV_device_generated_commands
    PhysicalDeviceDeviceGeneratedCommandsFeaturesNv = 100002770007
    # Provided by VK_EXT_texel_buffer_alignment
    PhysicalDeviceTexelBufferAlignmentFeaturesExt = 100002810000
    # Provided by VK_EXT_texel_buffer_alignment
    PhysicalDeviceTexelBufferAlignmentPropertiesExt = 100002810001
    # Provided by VK_QCOM_render_pass_transform
    CommandBufferInheritanceRenderPassTransformInfoQcom = 100002820000
    # Provided by VK_QCOM_render_pass_transform
    RenderPassTransformBeginInfoQcom = 100002820001
    # Provided by VK_EXT_robustness2
    PhysicalDeviceRobustness2FeaturesExt = 100002860000
    # Provided by VK_EXT_robustness2
    PhysicalDeviceRobustness2PropertiesExt = 100002860001
    # Provided by VK_EXT_custom_border_color
    SamplerCustomBorderColorCreateInfoExt = 100002870000
    # Provided by VK_EXT_custom_border_color
    PhysicalDeviceCustomBorderColorPropertiesExt = 100002870001
    # Provided by VK_EXT_custom_border_color
    PhysicalDeviceCustomBorderColorFeaturesExt = 100002870002
    # Provided by VK_KHR_pipeline_library
    PipelineLibraryCreateInfoKhr = 100002900000
    # Provided by VK_EXT_private_data
    PhysicalDevicePrivateDataFeaturesExt = 100002950000
    # Provided by VK_EXT_private_data
    DevicePrivateDataCreateInfoExt = 100002950001
    # Provided by VK_EXT_private_data
    PrivateDataSlotCreateInfoExt = 100002950002
    # Provided by VK_EXT_pipeline_creation_cache_control
    PhysicalDevicePipelineCreationCacheControlFeaturesExt = 100002970000
    # Provided by VK_NV_device_diagnostics_config
    PhysicalDeviceDiagnosticsConfigFeaturesNv = 100003000000
    # Provided by VK_NV_device_diagnostics_config
    DeviceDiagnosticsConfigCreateInfoNv = 100003000001
    # Provided by VK_QCOM_extension_310
    ReservedQcom = 100003090000
    # Provided by VK_EXT_fragment_density_map2
    PhysicalDeviceFragmentDensityMap2FeaturesExt = 100003320000
    # Provided by VK_EXT_fragment_density_map2
    PhysicalDeviceFragmentDensityMap2PropertiesExt = 100003320001
    # Provided by VK_EXT_image_robustness
    PhysicalDeviceImageRobustnessFeaturesExt = 100003350000
    # Provided by VK_EXT_4444_formats
    PhysicalDevice4444FormatsFeaturesExt = 100003400000
    # Provided by VK_EXT_directfb_surface
    DirectfbSurfaceCreateInfoExt = 100003460000

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
    SurfaceKhr = 100000000000 # VkSurfaceKHR
    # Provided by VK_KHR_swapchain
    SwapchainKhr = 100000010000 # VkSwapchainKHR
    # Provided by VK_KHR_display
    DisplayKhr = 100000020000 # VkDisplayKHR
    # Provided by VK_KHR_display
    DisplayModeKhr = 100000020001 # VkDisplayModeKHR
    # Provided by VK_EXT_debug_report
    DebugReportCallbackExt = 100000110000 # VkDebugReportCallbackEXT
    # Provided by VK_VERSION_1_1
    DescriptorUpdateTemplate = 100000850000
    # Provided by VK_EXT_debug_utils
    DebugUtilsMessengerExt = 100001280000 # VkDebugUtilsMessengerEXT
    # Provided by VK_VERSION_1_1
    SamplerYcbcrConversion = 100001560000
    # Provided by VK_EXT_validation_cache
    ValidationCacheExt = 100001600000 # VkValidationCacheEXT
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureKhr = 100001650000
    # Provided by VK_INTEL_performance_query
    PerformanceConfigurationIntel = 100002100000
    # Provided by VK_KHR_deferred_host_operations
    DeferredOperationKhr = 100002680000
    # Provided by VK_NV_device_generated_commands
    IndirectCommandsLayoutNv = 100002770000 # VkIndirectCommandsLayoutNV
    # Provided by VK_EXT_private_data
    PrivateDataSlotExt = 100002950000
  VendorId* {.size: sizeof(int32), pure.} = enum
    Viv = 0x00010001 # Vivante vendor ID
    Vsi = 0x00010002 # VeriSilicon vendor ID
    Kazan = 0x00010003 # Kazan Software Renderer
    Codeplay = 0x00010004 # Codeplay Software Ltd. vendor ID
    Mesa = 0x00010005 # Mesa vendor ID

  # API constants
  # -------------
  PipelineCacheHeaderVersion* {.size: sizeof(int32), pure.} = enum
    One = 1

  # Device initialization
  # ---------------------
  AllocationFunction* = proc(
      pUserData: pointer;
      size: uint;
      alignment: uint;
      allocationScope: SystemAllocationScope;
    ): ptr pointer {.cdecl.}
  FreeFunction* = proc(
      pUserData: pointer;
      pMemory: pointer;
    ): pointer {.cdecl.}
  InternalAllocationNotification* = proc(
      pUserData: pointer;
      size: uint;
      allocationType: InternalAllocationType;
      allocationScope: SystemAllocationScope;
    ): pointer {.cdecl.}
  InternalFreeNotification* = proc(
      pUserData: pointer;
      size: uint;
      allocationType: InternalAllocationType;
      allocationScope: SystemAllocationScope;
    ): pointer {.cdecl.}
  ReallocationFunction* = proc(
      pUserData: pointer;
      pOriginal: pointer;
      size: uint;
      alignment: uint;
      allocationScope: SystemAllocationScope;
    ): ptr pointer {.cdecl.}
  VoidFunction* = proc(): pointer {.cdecl.}
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
    Pvrtc12bppUnormBlockImg = 100000540000
    # Provided by VK_IMG_format_pvrtc
    Pvrtc14bppUnormBlockImg = 100000540001
    # Provided by VK_IMG_format_pvrtc
    Pvrtc22bppUnormBlockImg = 100000540002
    # Provided by VK_IMG_format_pvrtc
    Pvrtc24bppUnormBlockImg = 100000540003
    # Provided by VK_IMG_format_pvrtc
    Pvrtc12bppSrgbBlockImg = 100000540004
    # Provided by VK_IMG_format_pvrtc
    Pvrtc14bppSrgbBlockImg = 100000540005
    # Provided by VK_IMG_format_pvrtc
    Pvrtc22bppSrgbBlockImg = 100000540006
    # Provided by VK_IMG_format_pvrtc
    Pvrtc24bppSrgbBlockImg = 100000540007
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc4x4SfloatBlockExt = 100000660000
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc5x4SfloatBlockExt = 100000660001
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc5x5SfloatBlockExt = 100000660002
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc6x5SfloatBlockExt = 100000660003
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc6x6SfloatBlockExt = 100000660004
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc8x5SfloatBlockExt = 100000660005
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc8x6SfloatBlockExt = 100000660006
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc8x8SfloatBlockExt = 100000660007
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc10x5SfloatBlockExt = 100000660008
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc10x6SfloatBlockExt = 100000660009
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc10x8SfloatBlockExt = 100000660010
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc10x10SfloatBlockExt = 100000660011
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc12x10SfloatBlockExt = 100000660012
    # Provided by VK_EXT_texture_compression_astc_hdr
    Astc12x12SfloatBlockExt = 100000660013
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
    Astc3x3x3UnormBlockExt = 100002880000
    # Provided by VK_EXT_extension_289
    Astc3x3x3SrgbBlockExt = 100002880001
    # Provided by VK_EXT_extension_289
    Astc3x3x3SfloatBlockExt = 100002880002
    # Provided by VK_EXT_extension_289
    Astc4x3x3UnormBlockExt = 100002880003
    # Provided by VK_EXT_extension_289
    Astc4x3x3SrgbBlockExt = 100002880004
    # Provided by VK_EXT_extension_289
    Astc4x3x3SfloatBlockExt = 100002880005
    # Provided by VK_EXT_extension_289
    Astc4x4x3UnormBlockExt = 100002880006
    # Provided by VK_EXT_extension_289
    Astc4x4x3SrgbBlockExt = 100002880007
    # Provided by VK_EXT_extension_289
    Astc4x4x3SfloatBlockExt = 100002880008
    # Provided by VK_EXT_extension_289
    Astc4x4x4UnormBlockExt = 100002880009
    # Provided by VK_EXT_extension_289
    Astc4x4x4SrgbBlockExt = 100002880010
    # Provided by VK_EXT_extension_289
    Astc4x4x4SfloatBlockExt = 100002880011
    # Provided by VK_EXT_extension_289
    Astc5x4x4UnormBlockExt = 100002880012
    # Provided by VK_EXT_extension_289
    Astc5x4x4SrgbBlockExt = 100002880013
    # Provided by VK_EXT_extension_289
    Astc5x4x4SfloatBlockExt = 100002880014
    # Provided by VK_EXT_extension_289
    Astc5x5x4UnormBlockExt = 100002880015
    # Provided by VK_EXT_extension_289
    Astc5x5x4SrgbBlockExt = 100002880016
    # Provided by VK_EXT_extension_289
    Astc5x5x4SfloatBlockExt = 100002880017
    # Provided by VK_EXT_extension_289
    Astc5x5x5UnormBlockExt = 100002880018
    # Provided by VK_EXT_extension_289
    Astc5x5x5SrgbBlockExt = 100002880019
    # Provided by VK_EXT_extension_289
    Astc5x5x5SfloatBlockExt = 100002880020
    # Provided by VK_EXT_extension_289
    Astc6x5x5UnormBlockExt = 100002880021
    # Provided by VK_EXT_extension_289
    Astc6x5x5SrgbBlockExt = 100002880022
    # Provided by VK_EXT_extension_289
    Astc6x5x5SfloatBlockExt = 100002880023
    # Provided by VK_EXT_extension_289
    Astc6x6x5UnormBlockExt = 100002880024
    # Provided by VK_EXT_extension_289
    Astc6x6x5SrgbBlockExt = 100002880025
    # Provided by VK_EXT_extension_289
    Astc6x6x5SfloatBlockExt = 100002880026
    # Provided by VK_EXT_extension_289
    Astc6x6x6UnormBlockExt = 100002880027
    # Provided by VK_EXT_extension_289
    Astc6x6x6SrgbBlockExt = 100002880028
    # Provided by VK_EXT_extension_289
    Astc6x6x6SfloatBlockExt = 100002880029
    # Provided by VK_EXT_4444_formats
    A4r4g4b4UnormPack16Ext = 100003400000
    # Provided by VK_EXT_4444_formats
    A4b4g4r4UnormPack16Ext = 100003400001
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
    SampledImageFilterCubicBitImg = 0x00002000 # Format can be filtered with VK_FILTER_CUBIC_IMG when being sampled
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
    Disjoint = 0x00400000 # Format supports disjoint planes
    # Provided by VK_VERSION_1_1
    CositedChromaSamples = 0x00800000 # Format can have cosited rather than midpoint chroma samples
    # Provided by VK_EXT_fragment_density_map
    FragmentDensityMapBitExt = 0x01000000
    # Provided by VK_AMD_extension_25
    Reserved25BitKhr = 0x02000000
    # Provided by VK_AMD_extension_25
    Reserved26BitKhr = 0x04000000
    # Provided by VK_AMD_extension_24
    Reserved27BitKhr = 0x08000000
    # Provided by VK_AMD_extension_24
    Reserved28BitKhr = 0x10000000
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureVertexBufferBitKhr = 0x20000000
    # Provided by VK_AMD_extension_227
    AmdReserved30 = 0x40000000
  FormatFeatureFlags* = distinct Flags
  FormatProperties* = object
    linearTilingFeatures*: FormatFeatureFlags
    optimalTilingFeatures*: FormatFeatureFlags
    bufferFeatures*: FormatFeatureFlags
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
    # Provided by VK_VERSION_1_1
    Protected = 0x00000800 # Image requires protected memory
    # Provided by VK_EXT_sample_locations
    SampleLocationsCompatibleDepthBitExt = 0x00001000
    # Provided by VK_NV_corner_sampled_image
    CornerSampledBitNv = 0x00002000
    # Provided by VK_EXT_fragment_density_map
    SubsampledBitExt = 0x00004000
  ImageCreateFlags* = distinct Flags
  ImageFormatProperties* = object
    maxExtent*: Extent3D
    maxMipLevels*: uint32
    maxArrayLayers*: uint32
    sampleCounts*: SampleCountFlags
    maxResourceSize*: DeviceSize
  ImageTiling* {.size: sizeof(int32), pure.} = enum
    Optimal = 0
    Linear = 1
    # Provided by VK_EXT_image_drm_format_modifier
    DrmFormatModifierExt = 100001580000
  ImageType* {.size: sizeof(int32), pure.} = enum
    Vk1d = 0
    Vk2d = 1
    Vk3d = 2
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
    ShadingRateImageBitNv = 0x00000100
    # Provided by VK_EXT_fragment_density_map
    FragmentDensityMapBitExt = 0x00000200
    # Provided by VK_AMD_extension_25
    Reserved10BitKhr = 0x00000400
    # Provided by VK_AMD_extension_25
    Reserved11BitKhr = 0x00000800
    # Provided by VK_AMD_extension_25
    Reserved12BitKhr = 0x00001000
    # Provided by VK_AMD_extension_24
    Reserved13BitKhr = 0x00002000
    # Provided by VK_AMD_extension_24
    Reserved14BitKhr = 0x00004000
    # Provided by VK_AMD_extension_24
    Reserved15BitKhr = 0x00008000
    # Provided by VK_QCOM_extension_173
    Reserved16BitQcom = 0x00010000
    # Provided by VK_QCOM_extension_173
    Reserved17BitQcom = 0x00020000
  ImageUsageFlags* = distinct Flags
  Instance* = distinct Handle
  InstanceCreateFlags* = distinct Flags
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
    Executable = 0
  MemoryHeap* = object
    size*: DeviceSize
    flags*: MemoryHeapFlags
  MemoryHeapFlagBits* {.size: sizeof(int32), pure.} = enum
    DeviceLocal = 0x00000001 # If set, heap represents device memory
    # Provided by VK_VERSION_1_1
    MultiInstance = 0x00000002 # If set, heap allocations allocate multiple instances by default
    # Provided by VK_KHR_extension_309
    Reserved2BitKhr = 0x00000004
  MemoryHeapFlags* = distinct Flags
  MemoryPropertyFlagBits* {.size: sizeof(int32), pure.} = enum
    DeviceLocal = 0x00000001 # If otherwise stated, then allocate memory on device
    HostVisible = 0x00000002 # Memory is mappable by host
    HostCoherent = 0x00000004 # Memory will have i/o coherency. If not set, application may need to use vkFlushMappedMemoryRanges and vkInvalidateMappedMemoryRanges to flush/invalidate host cache
    HostCached = 0x00000008 # Memory will be cached by the host
    LazilyAllocated = 0x00000010 # Memory may be allocated by the driver when it is required
    # Provided by VK_VERSION_1_1
    Protected = 0x00000020 # Memory is protected
    # Provided by VK_AMD_device_coherent_memory
    DeviceCoherentBitAmd = 0x00000040
    # Provided by VK_AMD_device_coherent_memory
    DeviceUncachedBitAmd = 0x00000080
  MemoryPropertyFlags* = distinct Flags
  MemoryType* = object
    propertyFlags*: MemoryPropertyFlags
    heapIndex*: uint32
  PhysicalDevice* = distinct Handle
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
    Other = 0
    IntegratedGpu = 1
    DiscreteGpu = 2
    VirtualGpu = 3
    Cpu = 4
  QueueFamilyProperties* = object
    queueFlags*: QueueFlags
    queueCount*: uint32
    timestampValidBits*: uint32
    minImageTransferGranularity*: Extent3D
  QueueFlagBits* {.size: sizeof(int32), pure.} = enum
    Graphics = 0x00000001 # Queue supports graphics operations
    Compute = 0x00000002 # Queue supports compute operations
    Transfer = 0x00000004 # Queue supports transfer operations
    SparseBinding = 0x00000008 # Queue supports sparse resource memory management operations
    # Provided by VK_VERSION_1_1
    Protected = 0x00000010 # Queues may support protected operations
    # Provided by VK_AMD_extension_25
    Reserved5BitKhr = 0x00000020
    # Provided by VK_AMD_extension_24
    Reserved6BitKhr = 0x00000040
  QueueFlags* = distinct Flags
  SampleCountFlagBits* {.size: sizeof(int32), pure.} = enum
    Vk1 = 0x00000001 # Sample count 1 supported
    Vk2 = 0x00000002 # Sample count 2 supported
    Vk4 = 0x00000004 # Sample count 4 supported
    Vk8 = 0x00000008 # Sample count 8 supported
    Vk16 = 0x00000010 # Sample count 16 supported
    Vk32 = 0x00000020 # Sample count 32 supported
    Vk64 = 0x00000040 # Sample count 64 supported
  SampleCountFlags* = distinct Flags
  SystemAllocationScope* {.size: sizeof(int32), pure.} = enum
    Command = 0
    Object = 1
    Cache = 2
    Device = 3
    Instance = 4

  # Device commands
  # ---------------
  Device* = distinct Handle
  DeviceCreateFlags* = distinct Flags
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
    Protected = 0x00000001 # Queue is a protected-capable device queue
  DeviceQueueCreateFlags* = distinct Flags
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
    CommandPreprocessBitNv = 0x00020000
    # Provided by VK_EXT_conditional_rendering
    ConditionalRenderingBitExt = 0x00040000 # A pipeline stage for conditional rendering predicate fetch
    # Provided by VK_NV_mesh_shader
    TaskShaderBitNv = 0x00080000
    # Provided by VK_NV_mesh_shader
    MeshShaderBitNv = 0x00100000
    # Provided by VK_KHR_ray_tracing
    RayTracingShaderBitKhr = 0x00200000
    # Provided by VK_NV_shading_rate_image
    ShadingRateImageBitNv = 0x00400000
    # Provided by VK_EXT_fragment_density_map
    FragmentDensityProcessBitExt = 0x00800000
    # Provided by VK_EXT_transform_feedback
    TransformFeedbackBitExt = 0x01000000
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureBuildBitKhr = 0x02000000
    # Provided by VK_AMD_extension_25
    Reserved26BitKhr = 0x04000000
    # Provided by VK_AMD_extension_24
    Reserved27BitKhr = 0x08000000
  PipelineStageFlags* = distinct Flags
  Queue* = distinct Handle
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
  MemoryMapFlags* = distinct Flags

  # Memory management API commands
  # ------------------------------
  DeviceMemory* = distinct NonDispatchableHandle
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
    MemoryPlane0BitExt = 0x00000080
    # Provided by VK_EXT_image_drm_format_modifier
    MemoryPlane1BitExt = 0x00000100
    # Provided by VK_EXT_image_drm_format_modifier
    MemoryPlane2BitExt = 0x00000200
    # Provided by VK_EXT_image_drm_format_modifier
    MemoryPlane3BitExt = 0x00000400
  ImageAspectFlags* = distinct Flags
  ImageSubresource* = object
    aspectMask*: ImageAspectFlags
    mipLevel*: uint32
    arrayLayer*: uint32
  SparseBufferMemoryBindInfo* = object
    buffer*: Buffer
    bindCount*: uint32
    pBinds*: ptr SparseMemoryBind
  SparseImageFormatFlagBits* {.size: sizeof(int32), pure.} = enum
    SingleMiptail = 0x00000001 # Image uses a single mip tail region for all array layers
    AlignedMipSize = 0x00000002 # Image requires mip level dimensions to be an integer multiple of the sparse image block dimensions for non-tail mip levels.
    NonstandardBlockSize = 0x00000004 # Image uses a non-standard sparse image block dimensions
  SparseImageFormatFlags* = distinct Flags
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
    Metadata = 0x00000001 # Operation binds resource metadata to memory
  SparseMemoryBindFlags* = distinct Flags

  # Fence commands
  # --------------
  Fence* = distinct NonDispatchableHandle
  FenceCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    Signaled = 0x00000001
  FenceCreateFlags* = distinct Flags
  FenceCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: FenceCreateFlags

  # Queue semaphore commands
  # ------------------------
  Semaphore* = distinct NonDispatchableHandle
  SemaphoreCreateFlags* = distinct Flags
  SemaphoreCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: SemaphoreCreateFlags

  # Event commands
  # --------------
  Event* = distinct NonDispatchableHandle
  EventCreateFlags* = distinct Flags
  EventCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: EventCreateFlags

  # Query commands
  # --------------
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
  QueryPipelineStatisticFlags* = distinct Flags
  QueryPool* = distinct NonDispatchableHandle
  QueryPoolCreateFlags* = distinct Flags
  QueryPoolCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: QueryPoolCreateFlags
    queryType*: QueryType
    queryCount*: uint32
    pipelineStatistics*: QueryPipelineStatisticFlags
  QueryResultFlagBits* {.size: sizeof(int32), pure.} = enum
    Vk64 = 0x00000001 # Results of the queries are written to the destination buffer as 64-bit values
    Wait = 0x00000002 # Results of the queries are waited on before proceeding with the result copy
    WithAvailability = 0x00000004 # Besides the results of the query, the availability of the results is also written
    Partial = 0x00000008 # Copy the partial results of the query even if the final results are not available
  QueryResultFlags* = distinct Flags
  QueryType* {.size: sizeof(int32), pure.} = enum
    Occlusion = 0
    PipelineStatistics = 1 # Optional
    Timestamp = 2
    # Provided by VK_AMD_extension_24
    Reserved8 = 100000230008
    # Provided by VK_AMD_extension_25
    Reserved4 = 100000240004
    # Provided by VK_EXT_transform_feedback
    TransformFeedbackStreamExt = 100000280004
    # Provided by VK_KHR_performance_query
    PerformanceQueryKhr = 100001160000
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureSerializationSizeKhr = 100001500000
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureCompactedSizeKhr = 100001650000
    # Provided by VK_INTEL_performance_query
    PerformanceQueryIntel = 100002100000

  # Buffer commands
  # ---------------
  Buffer* = distinct NonDispatchableHandle
  BufferCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    SparseBinding = 0x00000001 # Buffer should support sparse backing
    SparseResidency = 0x00000002 # Buffer should support sparse backing with partial residency
    SparseAliased = 0x00000004 # Buffer should support constent data access to physical memory ranges mapped into multiple locations of sparse buffers
    # Provided by VK_VERSION_1_1
    Protected = 0x00000008 # Buffer requires protected memory
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
    ConditionalRenderingBitExt = 0x00000200 # Specifies the buffer can be used as predicate in conditional rendering
    # Provided by VK_KHR_ray_tracing
    RayTracingBitKhr = 0x00000400
    # Provided by VK_EXT_transform_feedback
    TransformFeedbackBufferBitExt = 0x00000800
    # Provided by VK_EXT_transform_feedback
    TransformFeedbackCounterBufferBitExt = 0x00001000
    # Provided by VK_AMD_extension_25
    Reserved13BitKhr = 0x00002000
    # Provided by VK_AMD_extension_25
    Reserved14BitKhr = 0x00004000
    # Provided by VK_AMD_extension_24
    Reserved15BitKhr = 0x00008000
    # Provided by VK_AMD_extension_24
    Reserved16BitKhr = 0x00010000
    # Provided by VK_VERSION_1_2
    ShaderDeviceAddress = 0x00020000
    # Provided by VK_QCOM_extension_173
    Reserved18BitQcom = 0x00040000
    # Provided by VK_NV_extension_168
    Reserved19BitKhr = 0x00080000
    # Provided by VK_NV_extension_168
    Reserved20BitKhr = 0x00100000
  BufferUsageFlags* = distinct Flags
  SharingMode* {.size: sizeof(int32), pure.} = enum
    Exclusive = 0
    Concurrent = 1

  # Buffer view commands
  # --------------------
  BufferView* = distinct NonDispatchableHandle
  BufferViewCreateFlags* = distinct Flags
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
    PresentSrcKhr = 100000010002
    # Provided by VK_KHR_shared_presentable_image
    SharedPresentKhr = 100001110000
    # Provided by VK_VERSION_1_1
    DepthReadOnlyStencilAttachmentOptimal = 100001170000
    # Provided by VK_VERSION_1_1
    DepthAttachmentStencilReadOnlyOptimal = 100001170001
    # Provided by VK_NV_shading_rate_image
    ShadingRateOptimalNv = 100001640003
    # Provided by VK_EXT_fragment_density_map
    FragmentDensityMapOptimalExt = 100002180000
    # Provided by VK_VERSION_1_2
    DepthAttachmentOptimal = 100002410000
    # Provided by VK_VERSION_1_2
    DepthReadOnlyOptimal = 100002410001
    # Provided by VK_VERSION_1_2
    StencilAttachmentOptimal = 100002410002
    # Provided by VK_VERSION_1_2
    StencilReadOnlyOptimal = 100002410003
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
    Identity = 0
    Zero = 1
    One = 2
    R = 3
    G = 4
    B = 5
    A = 6
  ImageSubresourceRange* = object
    aspectMask*: ImageAspectFlags
    baseMipLevel*: uint32
    levelCount*: uint32
    baseArrayLayer*: uint32
    layerCount*: uint32
  ImageView* = distinct NonDispatchableHandle
  ImageViewCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_EXT_fragment_density_map
    FragmentDensityMapDynamicBitExt = 0x00000001
    # Provided by VK_EXT_fragment_density_map2
    FragmentDensityMapDeferredBitExt = 0x00000002
  ImageViewCreateFlags* = distinct Flags
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
    Vk1d = 0
    Vk2d = 1
    Vk3d = 2
    Cube = 3
    Vk1dArray = 4
    Vk2dArray = 5
    CubeArray = 6

  # Shader commands
  # ---------------
  ShaderModule* = distinct NonDispatchableHandle
  ShaderModuleCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_NV_extension_52
    Reserved0BitNv = 0x00000001
  ShaderModuleCreateFlags* = distinct Flags
  ShaderModuleCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: ShaderModuleCreateFlags
    codeSize*: uint
    pCode*: ptr uint32

  # Pipeline Cache commands
  # -----------------------
  PipelineCache* = distinct NonDispatchableHandle
  PipelineCacheCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_EXT_pipeline_creation_cache_control
    ExternallySynchronizedBitExt = 0x00000001
    # Provided by VK_GOOGLE_extension_196
    Reserved1BitExt = 0x00000002
  PipelineCacheCreateFlags* = distinct Flags
  PipelineCacheCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineCacheCreateFlags
    initialDataSize*: uint
    pInitialData*: pointer

  # Pipeline commands
  # -----------------
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
  BlendOp* {.size: sizeof(int32), pure.} = enum
    Add = 0
    Subtract = 1
    ReverseSubtract = 2
    Min = 3
    Max = 4
    # Provided by VK_EXT_blend_operation_advanced
    ZeroExt = 100001480000
    # Provided by VK_EXT_blend_operation_advanced
    SrcExt = 100001480001
    # Provided by VK_EXT_blend_operation_advanced
    DstExt = 100001480002
    # Provided by VK_EXT_blend_operation_advanced
    SrcOverExt = 100001480003
    # Provided by VK_EXT_blend_operation_advanced
    DstOverExt = 100001480004
    # Provided by VK_EXT_blend_operation_advanced
    SrcInExt = 100001480005
    # Provided by VK_EXT_blend_operation_advanced
    DstInExt = 100001480006
    # Provided by VK_EXT_blend_operation_advanced
    SrcOutExt = 100001480007
    # Provided by VK_EXT_blend_operation_advanced
    DstOutExt = 100001480008
    # Provided by VK_EXT_blend_operation_advanced
    SrcAtopExt = 100001480009
    # Provided by VK_EXT_blend_operation_advanced
    DstAtopExt = 100001480010
    # Provided by VK_EXT_blend_operation_advanced
    XorExt = 100001480011
    # Provided by VK_EXT_blend_operation_advanced
    MultiplyExt = 100001480012
    # Provided by VK_EXT_blend_operation_advanced
    ScreenExt = 100001480013
    # Provided by VK_EXT_blend_operation_advanced
    OverlayExt = 100001480014
    # Provided by VK_EXT_blend_operation_advanced
    DarkenExt = 100001480015
    # Provided by VK_EXT_blend_operation_advanced
    LightenExt = 100001480016
    # Provided by VK_EXT_blend_operation_advanced
    ColordodgeExt = 100001480017
    # Provided by VK_EXT_blend_operation_advanced
    ColorburnExt = 100001480018
    # Provided by VK_EXT_blend_operation_advanced
    HardlightExt = 100001480019
    # Provided by VK_EXT_blend_operation_advanced
    SoftlightExt = 100001480020
    # Provided by VK_EXT_blend_operation_advanced
    DifferenceExt = 100001480021
    # Provided by VK_EXT_blend_operation_advanced
    ExclusionExt = 100001480022
    # Provided by VK_EXT_blend_operation_advanced
    InvertExt = 100001480023
    # Provided by VK_EXT_blend_operation_advanced
    InvertRgbExt = 100001480024
    # Provided by VK_EXT_blend_operation_advanced
    LineardodgeExt = 100001480025
    # Provided by VK_EXT_blend_operation_advanced
    LinearburnExt = 100001480026
    # Provided by VK_EXT_blend_operation_advanced
    VividlightExt = 100001480027
    # Provided by VK_EXT_blend_operation_advanced
    LinearlightExt = 100001480028
    # Provided by VK_EXT_blend_operation_advanced
    PinlightExt = 100001480029
    # Provided by VK_EXT_blend_operation_advanced
    HardmixExt = 100001480030
    # Provided by VK_EXT_blend_operation_advanced
    HslHueExt = 100001480031
    # Provided by VK_EXT_blend_operation_advanced
    HslSaturationExt = 100001480032
    # Provided by VK_EXT_blend_operation_advanced
    HslColorExt = 100001480033
    # Provided by VK_EXT_blend_operation_advanced
    HslLuminosityExt = 100001480034
    # Provided by VK_EXT_blend_operation_advanced
    PlusExt = 100001480035
    # Provided by VK_EXT_blend_operation_advanced
    PlusClampedExt = 100001480036
    # Provided by VK_EXT_blend_operation_advanced
    PlusClampedAlphaExt = 100001480037
    # Provided by VK_EXT_blend_operation_advanced
    PlusDarkerExt = 100001480038
    # Provided by VK_EXT_blend_operation_advanced
    MinusExt = 100001480039
    # Provided by VK_EXT_blend_operation_advanced
    MinusClampedExt = 100001480040
    # Provided by VK_EXT_blend_operation_advanced
    ContrastExt = 100001480041
    # Provided by VK_EXT_blend_operation_advanced
    InvertOvgExt = 100001480042
    # Provided by VK_EXT_blend_operation_advanced
    RedExt = 100001480043
    # Provided by VK_EXT_blend_operation_advanced
    GreenExt = 100001480044
    # Provided by VK_EXT_blend_operation_advanced
    BlueExt = 100001480045
  ColorComponentFlagBits* {.size: sizeof(int32), pure.} = enum
    R = 0x00000001
    G = 0x00000002
    B = 0x00000004
    A = 0x00000008
  ColorComponentFlags* = distinct Flags
  CompareOp* {.size: sizeof(int32), pure.} = enum
    Never = 0
    Less = 1
    Equal = 2
    LessOrEqual = 3
    Greater = 4
    NotEqual = 5
    GreaterOrEqual = 6
    Always = 7
  ComputePipelineCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineCreateFlags
    stage*: PipelineShaderStageCreateInfo
    layout*: PipelineLayout
    basePipelineHandle*: Pipeline
    basePipelineIndex*: int32
  CullModeFlagBits* {.size: sizeof(int32), pure.} = enum
    None = 0
    Front = 0x00000001
    Back = 0x00000002
    FrontAndBack = 0x00000003
  CullModeFlags* = distinct Flags
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
    ViewportWScalingNv = 100000870000
    # Provided by VK_EXT_discard_rectangles
    DiscardRectangleExt = 100000990000
    # Provided by VK_EXT_sample_locations
    SampleLocationsExt = 100001430000
    # Provided by VK_NV_shading_rate_image
    ViewportShadingRatePaletteNv = 100001640004
    # Provided by VK_NV_shading_rate_image
    ViewportCoarseSampleOrderNv = 100001640006
    # Provided by VK_NV_scissor_exclusive
    ExclusiveScissorNv = 100002050001
    # Provided by VK_EXT_line_rasterization
    LineStippleExt = 100002590000
    # Provided by VK_EXT_extended_dynamic_state
    CullModeExt = 100002670000
    # Provided by VK_EXT_extended_dynamic_state
    FrontFaceExt = 100002670001
    # Provided by VK_EXT_extended_dynamic_state
    PrimitiveTopologyExt = 100002670002
    # Provided by VK_EXT_extended_dynamic_state
    ViewportWithCountExt = 100002670003
    # Provided by VK_EXT_extended_dynamic_state
    ScissorWithCountExt = 100002670004
    # Provided by VK_EXT_extended_dynamic_state
    VertexInputBindingStrideExt = 100002670005
    # Provided by VK_EXT_extended_dynamic_state
    DepthTestEnableExt = 100002670006
    # Provided by VK_EXT_extended_dynamic_state
    DepthWriteEnableExt = 100002670007
    # Provided by VK_EXT_extended_dynamic_state
    DepthCompareOpExt = 100002670008
    # Provided by VK_EXT_extended_dynamic_state
    DepthBoundsTestEnableExt = 100002670009
    # Provided by VK_EXT_extended_dynamic_state
    StencilTestEnableExt = 100002670010
    # Provided by VK_EXT_extended_dynamic_state
    StencilOpExt = 100002670011
  FrontFace* {.size: sizeof(int32), pure.} = enum
    CounterClockwise = 0
    Clockwise = 1
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
  Pipeline* = distinct NonDispatchableHandle
  PipelineColorBlendAttachmentState* = object
    blendEnable*: Bool32
    srcColorBlendFactor*: BlendFactor
    dstColorBlendFactor*: BlendFactor
    colorBlendOp*: BlendOp
    srcAlphaBlendFactor*: BlendFactor
    dstAlphaBlendFactor*: BlendFactor
    alphaBlendOp*: BlendOp
    colorWriteMask*: ColorComponentFlags
  PipelineColorBlendStateCreateFlags* = distinct Flags
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
    DisableOptimization = 0x00000001
    AllowDerivatives = 0x00000002
    Derivative = 0x00000004
    # Provided by VK_VERSION_1_1
    ViewIndexFromDeviceIndex = 0x00000008
    # Provided by VK_VERSION_1_1
    DispatchBase = 0x00000010
    # Provided by VK_NV_ray_tracing
    DeferCompileBitNv = 0x00000020
    # Provided by VK_KHR_pipeline_executable_properties
    CaptureStatisticsBitKhr = 0x00000040
    # Provided by VK_KHR_pipeline_executable_properties
    CaptureInternalRepresentationsBitKhr = 0x00000080
    # Provided by VK_EXT_pipeline_creation_cache_control
    FailOnPipelineCompileRequiredBitExt = 0x00000100
    # Provided by VK_EXT_pipeline_creation_cache_control
    EarlyReturnOnFailureBitExt = 0x00000200
    # Provided by VK_KHR_pipeline_library
    LibraryBitKhr = 0x00000800
    # Provided by VK_KHR_ray_tracing
    RayTracingSkipTrianglesBitKhr = 0x00001000
    # Provided by VK_KHR_ray_tracing
    RayTracingSkipAabbsBitKhr = 0x00002000
    # Provided by VK_KHR_ray_tracing
    RayTracingNoNullAnyHitShadersBitKhr = 0x00004000
    # Provided by VK_KHR_ray_tracing
    RayTracingNoNullClosestHitShadersBitKhr = 0x00008000
    # Provided by VK_KHR_ray_tracing
    RayTracingNoNullMissShadersBitKhr = 0x00010000
    # Provided by VK_KHR_ray_tracing
    RayTracingNoNullIntersectionShadersBitKhr = 0x00020000
    # Provided by VK_NV_device_generated_commands
    IndirectBindableBitNv = 0x00040000
    # Provided by VK_NV_extension_168
    Reserved19BitKhr = 0x00080000
  PipelineCreateFlags* = distinct Flags
  PipelineDepthStencilStateCreateFlags* = distinct Flags
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
  PipelineDynamicStateCreateFlags* = distinct Flags
  PipelineDynamicStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineDynamicStateCreateFlags
    dynamicStateCount*: uint32
    pDynamicStates*: ptr DynamicState
  PipelineInputAssemblyStateCreateFlags* = distinct Flags
  PipelineInputAssemblyStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineInputAssemblyStateCreateFlags
    topology*: PrimitiveTopology
    primitiveRestartEnable*: Bool32
  PipelineLayoutCreateFlags* = distinct Flags
  PipelineMultisampleStateCreateFlags* = distinct Flags
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
  PipelineRasterizationStateCreateFlags* = distinct Flags
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
    AllowVaryingSubgroupSizeBitExt = 0x00000001
    # Provided by VK_EXT_subgroup_size_control
    RequireFullSubgroupsBitExt = 0x00000002
    # Provided by VK_NV_extension_52
    Reserved2BitNv = 0x00000004
    # Provided by VK_KHR_extension_297
    Reserved3BitKhr = 0x00000008
  PipelineShaderStageCreateFlags* = distinct Flags
  PipelineShaderStageCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineShaderStageCreateFlags
    stage*: ShaderStageFlagBits
    module*: ShaderModule
    pName*: cstring
    pSpecializationInfo*: ptr SpecializationInfo
  PipelineTessellationStateCreateFlags* = distinct Flags
  PipelineTessellationStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineTessellationStateCreateFlags
    patchControlPoints*: uint32
  PipelineVertexInputStateCreateFlags* = distinct Flags
  PipelineVertexInputStateCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: PipelineVertexInputStateCreateFlags
    vertexBindingDescriptionCount*: uint32
    pVertexBindingDescriptions*: ptr VertexInputBindingDescription
    vertexAttributeDescriptionCount*: uint32
    pVertexAttributeDescriptions*: ptr VertexInputAttributeDescription
  PipelineViewportStateCreateFlags* = distinct Flags
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
    FillRectangleNv = 100001530000
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
  SampleMask* = distinct uint32
  ShaderStageFlagBits* {.size: sizeof(int32), pure.} = enum
    Vertex = 0x00000001
    TessellationControl = 0x00000002
    TessellationEvaluation = 0x00000004
    Geometry = 0x00000008
    Fragment = 0x00000010
    AllGraphics = 0x0000001F
    Compute = 0x00000020
    # Provided by VK_NV_mesh_shader
    TaskBitNv = 0x00000040
    # Provided by VK_NV_mesh_shader
    MeshBitNv = 0x00000080
    # Provided by VK_KHR_ray_tracing
    RaygenBitKhr = 0x00000100
    # Provided by VK_KHR_ray_tracing
    AnyHitBitKhr = 0x00000200
    # Provided by VK_KHR_ray_tracing
    ClosestHitBitKhr = 0x00000400
    # Provided by VK_KHR_ray_tracing
    MissBitKhr = 0x00000800
    # Provided by VK_KHR_ray_tracing
    IntersectionBitKhr = 0x00001000
    # Provided by VK_KHR_ray_tracing
    CallableBitKhr = 0x00002000
    All = 0x7FFFFFFF
  ShaderStageFlags* = distinct Flags
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
    Keep = 0
    Zero = 1
    Replace = 2
    IncrementAndClamp = 3
    DecrementAndClamp = 4
    Invert = 5
    IncrementAndWrap = 6
    DecrementAndWrap = 7
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
    Vertex = 0
    Instance = 1
  Viewport* = object
    x*: float32
    y*: float32
    width*: float32
    height*: float32
    minDepth*: float32
    maxDepth*: float32

  # Pipeline layout commands
  # ------------------------
  PipelineLayout* = distinct NonDispatchableHandle
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
    FloatTransparentBlack = 0
    IntTransparentBlack = 1
    FloatOpaqueBlack = 2
    IntOpaqueBlack = 3
    FloatOpaqueWhite = 4
    IntOpaqueWhite = 5
    # Provided by VK_EXT_custom_border_color
    FloatCustomExt = 100002870003
    # Provided by VK_EXT_custom_border_color
    IntCustomExt = 100002870004
  Filter* {.size: sizeof(int32), pure.} = enum
    Nearest = 0
    Linear = 1
    # Provided by VK_IMG_filter_cubic
    CubicImg = 100000150000
  Sampler* = distinct NonDispatchableHandle
  SamplerAddressMode* {.size: sizeof(int32), pure.} = enum
    Repeat = 0
    MirroredRepeat = 1
    ClampToEdge = 2
    ClampToBorder = 3
    # Provided by VK_VERSION_1_2
    MirrorClampToEdge = 4 # No need to add an extnumber attribute, since this uses a core enum value
  SamplerCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_EXT_fragment_density_map
    SubsampledBitExt = 0x00000001
    # Provided by VK_EXT_fragment_density_map
    SubsampledCoarseReconstructionBitExt = 0x00000002
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
  SamplerMipmapMode* {.size: sizeof(int32), pure.} = enum
    Nearest = 0 # Choose nearest mip level
    Linear = 1 # Linear filter between mip levels

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
  DescriptorPool* = distinct NonDispatchableHandle
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
  DescriptorPoolResetFlags* = distinct Flags
  DescriptorPoolSize* = object
    theType*: DescriptorType
    descriptorCount*: uint32
  DescriptorSet* = distinct NonDispatchableHandle
  DescriptorSetAllocateInfo* = object
    sType*: StructureType
    pNext*: pointer
    descriptorPool*: DescriptorPool
    descriptorSetCount*: uint32
    pSetLayouts*: ptr DescriptorSetLayout
  DescriptorSetLayout* = distinct NonDispatchableHandle
  DescriptorSetLayoutBinding* = object
    binding*: uint32
    descriptorType*: DescriptorType
    descriptorCount*: uint32
    stageFlags*: ShaderStageFlags
    pImmutableSamplers*: ptr Sampler
  DescriptorSetLayoutCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_KHR_push_descriptor
    PushDescriptorBitKhr = 0x00000001 # Descriptors are pushed via flink:vkCmdPushDescriptorSetKHR
    # Provided by VK_VERSION_1_2
    UpdateAfterBindPool = 0x00000002
  DescriptorSetLayoutCreateFlags* = distinct Flags
  DescriptorSetLayoutCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: DescriptorSetLayoutCreateFlags
    bindingCount*: uint32
    pBindings*: ptr DescriptorSetLayoutBinding
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
    InlineUniformBlockExt = 100001380000
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureKhr = 100001650000
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
    CommandPreprocessReadBitNv = 0x00020000
    # Provided by VK_NV_device_generated_commands
    CommandPreprocessWriteBitNv = 0x00040000
    # Provided by VK_EXT_blend_operation_advanced
    ColorAttachmentReadNoncoherentBitExt = 0x00080000
    # Provided by VK_EXT_conditional_rendering
    ConditionalRenderingReadBitExt = 0x00100000 # read access flag for reading conditional rendering predicate
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureReadBitKhr = 0x00200000
    # Provided by VK_KHR_ray_tracing
    AccelerationStructureWriteBitKhr = 0x00400000
    # Provided by VK_NV_shading_rate_image
    ShadingRateImageReadBitNv = 0x00800000
    # Provided by VK_EXT_fragment_density_map
    FragmentDensityMapReadBitExt = 0x01000000
    # Provided by VK_EXT_transform_feedback
    TransformFeedbackWriteBitExt = 0x02000000
    # Provided by VK_EXT_transform_feedback
    TransformFeedbackCounterReadBitExt = 0x04000000
    # Provided by VK_EXT_transform_feedback
    TransformFeedbackCounterWriteBitExt = 0x08000000
    # Provided by VK_AMD_extension_25
    Reserved28BitKhr = 0x10000000
    # Provided by VK_AMD_extension_25
    Reserved29BitKhr = 0x20000000
    # Provided by VK_AMD_extension_24
    Reserved30BitKhr = 0x40000000
  AccessFlags* = distinct Flags
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
    MayAlias = 0x00000001 # The attachment may alias physical memory of another attachment in the same render pass
  AttachmentDescriptionFlags* = distinct Flags
  AttachmentLoadOp* {.size: sizeof(int32), pure.} = enum
    Load = 0
    Clear = 1
    DontCare = 2
  AttachmentReference* = object
    attachment*: uint32
    layout*: ImageLayout
  AttachmentStoreOp* {.size: sizeof(int32), pure.} = enum
    Store = 0
    DontCare = 1
    # Provided by VK_QCOM_render_pass_store_ops
    NoneQcom = 100003010000
  DependencyFlagBits* {.size: sizeof(int32), pure.} = enum
    ByRegion = 0x00000001 # Dependency is per pixel region
    # Provided by VK_VERSION_1_1
    ViewLocal = 0x00000002
    # Provided by VK_VERSION_1_1
    DeviceGroup = 0x00000004 # Dependency is across devices
  DependencyFlags* = distinct Flags
  Framebuffer* = distinct NonDispatchableHandle
  FramebufferCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_VERSION_1_2
    Imageless = 0x00000001
  FramebufferCreateFlags* = distinct Flags
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
    Graphics = 0
    Compute = 1
    # Provided by VK_KHR_ray_tracing
    RayTracingKhr = 100001650000
  RenderPass* = distinct NonDispatchableHandle
  RenderPassCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    # Provided by VK_KHR_extension_221
    Reserved0BitKhr = 0x00000001
    # Provided by VK_QCOM_render_pass_transform
    TransformBitQcom = 0x00000002
  RenderPassCreateFlags* = distinct Flags
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
    PerViewAttributesBitNvx = 0x00000001
    # Provided by VK_NVX_multiview_per_view_attributes
    PerViewPositionXOnlyBitNvx = 0x00000002
    # Provided by VK_QCOM_render_pass_shader_resolve
    FragmentRegionBitQcom = 0x00000004
    # Provided by VK_QCOM_render_pass_shader_resolve
    ShaderResolveBitQcom = 0x00000008
  SubpassDescriptionFlags* = distinct Flags

  # Command pool commands
  # ---------------------
  CommandPool* = distinct NonDispatchableHandle
  CommandPoolCreateFlagBits* {.size: sizeof(int32), pure.} = enum
    Transient = 0x00000001 # Command buffers have a short lifetime
    ResetCommandBuffer = 0x00000002 # Command buffers may release their memory individually
    # Provided by VK_VERSION_1_1
    Protected = 0x00000004 # Command buffers allocated from pool are protected command buffers
  CommandPoolCreateFlags* = distinct Flags
  CommandPoolCreateInfo* = object
    sType*: StructureType
    pNext*: pointer
    flags*: CommandPoolCreateFlags
    queueFamilyIndex*: uint32
  CommandPoolResetFlagBits* {.size: sizeof(int32), pure.} = enum
    ReleaseResources = 0x00000001 # Release resources owned by the pool
  CommandPoolResetFlags* = distinct Flags

  # Command buffer commands
  # -----------------------
  CommandBuffer* = distinct Handle
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
    Primary = 0
    Secondary = 1
  CommandBufferResetFlagBits* {.size: sizeof(int32), pure.} = enum
    ReleaseResources = 0x00000001 # Release resources owned by the buffer
  CommandBufferResetFlags* = distinct Flags
  CommandBufferUsageFlagBits* {.size: sizeof(int32), pure.} = enum
    OneTimeSubmit = 0x00000001
    RenderPassContinue = 0x00000002
    SimultaneousUse = 0x00000004 # Command buffer may be submitted/executed more than once simultaneously
  CommandBufferUsageFlags* = distinct Flags
  QueryControlFlagBits* {.size: sizeof(int32), pure.} = enum
    Precise = 0x00000001 # Require precise results to be collected by the query
  QueryControlFlags* = distinct Flags

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
    Uint16 = 0
    Uint32 = 1
    # Provided by VK_KHR_ray_tracing
    NoneKhr = 100001650000
    # Provided by VK_EXT_index_type_uint8
    Uint8Ext = 100002650000
  RenderPassBeginInfo* = object
    sType*: StructureType
    pNext*: pointer
    renderPass*: RenderPass
    framebuffer*: Framebuffer
    renderArea*: Rect2D
    clearValueCount*: uint32
    pClearValues*: ptr ClearValue
  StencilFaceFlagBits* {.size: sizeof(int32), pure.} = enum
    Front = 0x00000001 # Front face
    Back = 0x00000002 # Back face
    FrontAndBack = 0x00000003 # Front and back faces
  StencilFaceFlags* = distinct Flags
  SubpassContents* {.size: sizeof(int32), pure.} = enum
    Inline = 0
    SecondaryCommandBuffers = 1

# Header boilerplate
# ------------------
template defineHandle*(ObjectName: untyped) =
  type ObjectName* = distinct Handle
template defineNonDispatchableHandle*(ObjectName: untyped) =
  type ObjectName* = distinct NonDispatchableHandle


# Fundamental types used by many commands and structures
# ------------------------------------------------------
Result.defineAliases:
  # Provided by VK_KHR_maintenance1
  ErrorOutOfPoolMemory as ErrorOutOfPoolMemoryKhr
  # Provided by VK_KHR_external_memory
  ErrorInvalidExternalHandle as ErrorInvalidExternalHandleKhr
  # Provided by VK_EXT_descriptor_indexing
  ErrorFragmentation as ErrorFragmentationExt
  # Provided by VK_EXT_buffer_device_address
  ErrorInvalidOpaqueCaptureAddress as ErrorInvalidDeviceAddressExt
  # Provided by VK_KHR_buffer_device_address
  ErrorInvalidOpaqueCaptureAddress as ErrorInvalidOpaqueCaptureAddressKhr
  # Provided by VK_EXT_pipeline_creation_cache_control
  PipelineCompileRequiredExt as ErrorPipelineCompileRequiredExt

StructureType.defineAliases:
  # Provided by VK_VERSION_1_1
  PhysicalDeviceVariablePointersFeatures as PhysicalDeviceVariablePointerFeatures
  # Provided by VK_VERSION_1_1
  PhysicalDeviceShaderDrawParametersFeatures as PhysicalDeviceShaderDrawParameterFeatures
  # Provided by VK_EXT_debug_report
  DebugReportCallbackCreateInfoExt as DebugReportCreateInfoExt # Backwards-compatible alias containing a typo
  # Provided by VK_KHR_multiview
  RenderPassMultiviewCreateInfo as RenderPassMultiviewCreateInfoKhr
  # Provided by VK_KHR_multiview
  PhysicalDeviceMultiviewFeatures as PhysicalDeviceMultiviewFeaturesKhr
  # Provided by VK_KHR_multiview
  PhysicalDeviceMultiviewProperties as PhysicalDeviceMultiviewPropertiesKhr
  # Provided by VK_KHR_get_physical_device_properties2
  PhysicalDeviceFeatures2 as PhysicalDeviceFeatures2Khr
  # Provided by VK_KHR_get_physical_device_properties2
  PhysicalDeviceProperties2 as PhysicalDeviceProperties2Khr
  # Provided by VK_KHR_get_physical_device_properties2
  FormatProperties2 as FormatProperties2Khr
  # Provided by VK_KHR_get_physical_device_properties2
  ImageFormatProperties2 as ImageFormatProperties2Khr
  # Provided by VK_KHR_get_physical_device_properties2
  PhysicalDeviceImageFormatInfo2 as PhysicalDeviceImageFormatInfo2Khr
  # Provided by VK_KHR_get_physical_device_properties2
  QueueFamilyProperties2 as QueueFamilyProperties2Khr
  # Provided by VK_KHR_get_physical_device_properties2
  PhysicalDeviceMemoryProperties2 as PhysicalDeviceMemoryProperties2Khr
  # Provided by VK_KHR_get_physical_device_properties2
  SparseImageFormatProperties2 as SparseImageFormatProperties2Khr
  # Provided by VK_KHR_get_physical_device_properties2
  PhysicalDeviceSparseImageFormatInfo2 as PhysicalDeviceSparseImageFormatInfo2Khr
  # Provided by VK_KHR_device_group
  MemoryAllocateFlagsInfo as MemoryAllocateFlagsInfoKhr
  # Provided by VK_KHR_device_group
  DeviceGroupRenderPassBeginInfo as DeviceGroupRenderPassBeginInfoKhr
  # Provided by VK_KHR_device_group
  DeviceGroupCommandBufferBeginInfo as DeviceGroupCommandBufferBeginInfoKhr
  # Provided by VK_KHR_device_group
  DeviceGroupSubmitInfo as DeviceGroupSubmitInfoKhr
  # Provided by VK_KHR_device_group
  DeviceGroupBindSparseInfo as DeviceGroupBindSparseInfoKhr
  # Provided by VK_KHR_device_group
  BindBufferMemoryDeviceGroupInfo as BindBufferMemoryDeviceGroupInfoKhr
  # Provided by VK_KHR_device_group
  BindImageMemoryDeviceGroupInfo as BindImageMemoryDeviceGroupInfoKhr
  # Provided by VK_KHR_device_group_creation
  PhysicalDeviceGroupProperties as PhysicalDeviceGroupPropertiesKhr
  # Provided by VK_KHR_device_group_creation
  DeviceGroupDeviceCreateInfo as DeviceGroupDeviceCreateInfoKhr
  # Provided by VK_KHR_external_memory_capabilities
  PhysicalDeviceExternalImageFormatInfo as PhysicalDeviceExternalImageFormatInfoKhr
  # Provided by VK_KHR_external_memory_capabilities
  ExternalImageFormatProperties as ExternalImageFormatPropertiesKhr
  # Provided by VK_KHR_external_memory_capabilities
  PhysicalDeviceExternalBufferInfo as PhysicalDeviceExternalBufferInfoKhr
  # Provided by VK_KHR_external_memory_capabilities
  ExternalBufferProperties as ExternalBufferPropertiesKhr
  # Provided by VK_KHR_external_memory_capabilities
  PhysicalDeviceIdProperties as PhysicalDeviceIdPropertiesKhr
  # Provided by VK_KHR_external_memory
  ExternalMemoryBufferCreateInfo as ExternalMemoryBufferCreateInfoKhr
  # Provided by VK_KHR_external_memory
  ExternalMemoryImageCreateInfo as ExternalMemoryImageCreateInfoKhr
  # Provided by VK_KHR_external_memory
  ExportMemoryAllocateInfo as ExportMemoryAllocateInfoKhr
  # Provided by VK_KHR_external_semaphore_capabilities
  PhysicalDeviceExternalSemaphoreInfo as PhysicalDeviceExternalSemaphoreInfoKhr
  # Provided by VK_KHR_external_semaphore_capabilities
  ExternalSemaphoreProperties as ExternalSemaphorePropertiesKhr
  # Provided by VK_KHR_external_semaphore_capabilities
  PhysicalDeviceIdProperties as PhysicalDeviceIdPropertiesKhr
  # Provided by VK_KHR_external_semaphore
  ExportSemaphoreCreateInfo as ExportSemaphoreCreateInfoKhr
  # Provided by VK_KHR_shader_float16_int8
  PhysicalDeviceShaderFloat16Int8Features as PhysicalDeviceShaderFloat16Int8FeaturesKhr
  # Provided by VK_KHR_shader_float16_int8
  PhysicalDeviceShaderFloat16Int8Features as PhysicalDeviceFloat16Int8FeaturesKhr
  # Provided by VK_KHR_16bit_storage
  PhysicalDevice16bitStorageFeatures as PhysicalDevice16bitStorageFeaturesKhr
  # Provided by VK_KHR_descriptor_update_template
  DescriptorUpdateTemplateCreateInfo as DescriptorUpdateTemplateCreateInfoKhr
  # Provided by VK_EXT_display_surface_counter
  SurfaceCapabilities2Ext as SurfaceCapabilities2Ext # Backwards-compatible alias containing a typo
  # Provided by VK_KHR_imageless_framebuffer
  PhysicalDeviceImagelessFramebufferFeatures as PhysicalDeviceImagelessFramebufferFeaturesKhr
  # Provided by VK_KHR_imageless_framebuffer
  FramebufferAttachmentsCreateInfo as FramebufferAttachmentsCreateInfoKhr
  # Provided by VK_KHR_imageless_framebuffer
  FramebufferAttachmentImageInfo as FramebufferAttachmentImageInfoKhr
  # Provided by VK_KHR_imageless_framebuffer
  RenderPassAttachmentBeginInfo as RenderPassAttachmentBeginInfoKhr
  # Provided by VK_KHR_create_renderpass2
  AttachmentDescription2 as AttachmentDescription2Khr
  # Provided by VK_KHR_create_renderpass2
  AttachmentReference2 as AttachmentReference2Khr
  # Provided by VK_KHR_create_renderpass2
  SubpassDescription2 as SubpassDescription2Khr
  # Provided by VK_KHR_create_renderpass2
  SubpassDependency2 as SubpassDependency2Khr
  # Provided by VK_KHR_create_renderpass2
  RenderPassCreateInfo2 as RenderPassCreateInfo2Khr
  # Provided by VK_KHR_create_renderpass2
  SubpassBeginInfo as SubpassBeginInfoKhr
  # Provided by VK_KHR_create_renderpass2
  SubpassEndInfo as SubpassEndInfoKhr
  # Provided by VK_KHR_external_fence_capabilities
  PhysicalDeviceExternalFenceInfo as PhysicalDeviceExternalFenceInfoKhr
  # Provided by VK_KHR_external_fence_capabilities
  ExternalFenceProperties as ExternalFencePropertiesKhr
  # Provided by VK_KHR_external_fence_capabilities
  PhysicalDeviceIdProperties as PhysicalDeviceIdPropertiesKhr
  # Provided by VK_KHR_external_fence
  ExportFenceCreateInfo as ExportFenceCreateInfoKhr
  # Provided by VK_KHR_maintenance2
  PhysicalDevicePointClippingProperties as PhysicalDevicePointClippingPropertiesKhr
  # Provided by VK_KHR_maintenance2
  RenderPassInputAttachmentAspectCreateInfo as RenderPassInputAttachmentAspectCreateInfoKhr
  # Provided by VK_KHR_maintenance2
  ImageViewUsageCreateInfo as ImageViewUsageCreateInfoKhr
  # Provided by VK_KHR_maintenance2
  PipelineTessellationDomainOriginStateCreateInfo as PipelineTessellationDomainOriginStateCreateInfoKhr
  # Provided by VK_KHR_variable_pointers
  PhysicalDeviceVariablePointersFeatures as PhysicalDeviceVariablePointersFeaturesKhr
  # Provided by VK_KHR_variable_pointers
  PhysicalDeviceVariablePointersFeaturesKhr as PhysicalDeviceVariablePointerFeaturesKhr
  # Provided by VK_KHR_dedicated_allocation
  MemoryDedicatedRequirements as MemoryDedicatedRequirementsKhr
  # Provided by VK_KHR_dedicated_allocation
  MemoryDedicatedAllocateInfo as MemoryDedicatedAllocateInfoKhr
  # Provided by VK_EXT_sampler_filter_minmax
  PhysicalDeviceSamplerFilterMinmaxProperties as PhysicalDeviceSamplerFilterMinmaxPropertiesExt
  # Provided by VK_EXT_sampler_filter_minmax
  SamplerReductionModeCreateInfo as SamplerReductionModeCreateInfoExt
  # Provided by VK_KHR_get_memory_requirements2
  BufferMemoryRequirementsInfo2 as BufferMemoryRequirementsInfo2Khr
  # Provided by VK_KHR_get_memory_requirements2
  ImageMemoryRequirementsInfo2 as ImageMemoryRequirementsInfo2Khr
  # Provided by VK_KHR_get_memory_requirements2
  ImageSparseMemoryRequirementsInfo2 as ImageSparseMemoryRequirementsInfo2Khr
  # Provided by VK_KHR_get_memory_requirements2
  MemoryRequirements2 as MemoryRequirements2Khr
  # Provided by VK_KHR_get_memory_requirements2
  SparseImageMemoryRequirements2 as SparseImageMemoryRequirements2Khr
  # Provided by VK_KHR_image_format_list
  ImageFormatListCreateInfo as ImageFormatListCreateInfoKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  SamplerYcbcrConversionCreateInfo as SamplerYcbcrConversionCreateInfoKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  SamplerYcbcrConversionInfo as SamplerYcbcrConversionInfoKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  BindImagePlaneMemoryInfo as BindImagePlaneMemoryInfoKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  ImagePlaneMemoryRequirementsInfo as ImagePlaneMemoryRequirementsInfoKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  PhysicalDeviceSamplerYcbcrConversionFeatures as PhysicalDeviceSamplerYcbcrConversionFeaturesKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  SamplerYcbcrConversionImageFormatProperties as SamplerYcbcrConversionImageFormatPropertiesKhr
  # Provided by VK_KHR_bind_memory2
  BindBufferMemoryInfo as BindBufferMemoryInfoKhr
  # Provided by VK_KHR_bind_memory2
  BindImageMemoryInfo as BindImageMemoryInfoKhr
  # Provided by VK_EXT_descriptor_indexing
  DescriptorSetLayoutBindingFlagsCreateInfo as DescriptorSetLayoutBindingFlagsCreateInfoExt
  # Provided by VK_EXT_descriptor_indexing
  PhysicalDeviceDescriptorIndexingFeatures as PhysicalDeviceDescriptorIndexingFeaturesExt
  # Provided by VK_EXT_descriptor_indexing
  PhysicalDeviceDescriptorIndexingProperties as PhysicalDeviceDescriptorIndexingPropertiesExt
  # Provided by VK_EXT_descriptor_indexing
  DescriptorSetVariableDescriptorCountAllocateInfo as DescriptorSetVariableDescriptorCountAllocateInfoExt
  # Provided by VK_EXT_descriptor_indexing
  DescriptorSetVariableDescriptorCountLayoutSupport as DescriptorSetVariableDescriptorCountLayoutSupportExt
  # Provided by VK_NV_ray_tracing
  BindAccelerationStructureMemoryInfoKhr as BindAccelerationStructureMemoryInfoNv
  # Provided by VK_NV_ray_tracing
  WriteDescriptorSetAccelerationStructureKhr as WriteDescriptorSetAccelerationStructureNv
  # Provided by VK_KHR_maintenance3
  PhysicalDeviceMaintenance3Properties as PhysicalDeviceMaintenance3PropertiesKhr
  # Provided by VK_KHR_maintenance3
  DescriptorSetLayoutSupport as DescriptorSetLayoutSupportKhr
  # Provided by VK_KHR_shader_subgroup_extended_types
  PhysicalDeviceShaderSubgroupExtendedTypesFeatures as PhysicalDeviceShaderSubgroupExtendedTypesFeaturesKhr
  # Provided by VK_KHR_8bit_storage
  PhysicalDevice8bitStorageFeatures as PhysicalDevice8bitStorageFeaturesKhr
  # Provided by VK_KHR_shader_atomic_int64
  PhysicalDeviceShaderAtomicInt64Features as PhysicalDeviceShaderAtomicInt64FeaturesKhr
  # Provided by VK_KHR_driver_properties
  PhysicalDeviceDriverProperties as PhysicalDeviceDriverPropertiesKhr
  # Provided by VK_KHR_shader_float_controls
  PhysicalDeviceFloatControlsProperties as PhysicalDeviceFloatControlsPropertiesKhr
  # Provided by VK_KHR_depth_stencil_resolve
  PhysicalDeviceDepthStencilResolveProperties as PhysicalDeviceDepthStencilResolvePropertiesKhr
  # Provided by VK_KHR_depth_stencil_resolve
  SubpassDescriptionDepthStencilResolve as SubpassDescriptionDepthStencilResolveKhr
  # Provided by VK_KHR_timeline_semaphore
  PhysicalDeviceTimelineSemaphoreFeatures as PhysicalDeviceTimelineSemaphoreFeaturesKhr
  # Provided by VK_KHR_timeline_semaphore
  PhysicalDeviceTimelineSemaphoreProperties as PhysicalDeviceTimelineSemaphorePropertiesKhr
  # Provided by VK_KHR_timeline_semaphore
  SemaphoreTypeCreateInfo as SemaphoreTypeCreateInfoKhr
  # Provided by VK_KHR_timeline_semaphore
  TimelineSemaphoreSubmitInfo as TimelineSemaphoreSubmitInfoKhr
  # Provided by VK_KHR_timeline_semaphore
  SemaphoreWaitInfo as SemaphoreWaitInfoKhr
  # Provided by VK_KHR_timeline_semaphore
  SemaphoreSignalInfo as SemaphoreSignalInfoKhr
  # Provided by VK_INTEL_performance_query
  QueryPoolPerformanceQueryCreateInfoIntel as QueryPoolCreateInfoIntel # Backwards-compatible alias
  # Provided by VK_KHR_vulkan_memory_model
  PhysicalDeviceVulkanMemoryModelFeatures as PhysicalDeviceVulkanMemoryModelFeaturesKhr
  # Provided by VK_EXT_scalar_block_layout
  PhysicalDeviceScalarBlockLayoutFeatures as PhysicalDeviceScalarBlockLayoutFeaturesExt
  # Provided by VK_KHR_separate_depth_stencil_layouts
  PhysicalDeviceSeparateDepthStencilLayoutsFeatures as PhysicalDeviceSeparateDepthStencilLayoutsFeaturesKhr
  # Provided by VK_KHR_separate_depth_stencil_layouts
  AttachmentReferenceStencilLayout as AttachmentReferenceStencilLayoutKhr
  # Provided by VK_KHR_separate_depth_stencil_layouts
  AttachmentDescriptionStencilLayout as AttachmentDescriptionStencilLayoutKhr
  # Provided by VK_EXT_buffer_device_address
  PhysicalDeviceBufferDeviceAddressFeaturesExt as PhysicalDeviceBufferAddressFeaturesExt
  # Provided by VK_EXT_buffer_device_address
  BufferDeviceAddressInfo as BufferDeviceAddressInfoExt
  # Provided by VK_EXT_separate_stencil_usage
  ImageStencilUsageCreateInfo as ImageStencilUsageCreateInfoExt
  # Provided by VK_KHR_uniform_buffer_standard_layout
  PhysicalDeviceUniformBufferStandardLayoutFeatures as PhysicalDeviceUniformBufferStandardLayoutFeaturesKhr
  # Provided by VK_KHR_buffer_device_address
  PhysicalDeviceBufferDeviceAddressFeatures as PhysicalDeviceBufferDeviceAddressFeaturesKhr
  # Provided by VK_KHR_buffer_device_address
  BufferDeviceAddressInfo as BufferDeviceAddressInfoKhr
  # Provided by VK_KHR_buffer_device_address
  BufferOpaqueCaptureAddressCreateInfo as BufferOpaqueCaptureAddressCreateInfoKhr
  # Provided by VK_KHR_buffer_device_address
  MemoryOpaqueCaptureAddressAllocateInfo as MemoryOpaqueCaptureAddressAllocateInfoKhr
  # Provided by VK_KHR_buffer_device_address
  DeviceMemoryOpaqueCaptureAddressInfo as DeviceMemoryOpaqueCaptureAddressInfoKhr
  # Provided by VK_EXT_host_query_reset
  PhysicalDeviceHostQueryResetFeatures as PhysicalDeviceHostQueryResetFeaturesExt



# These types are part of the API, though not directly used in API commands or data structures
# --------------------------------------------------------------------------------------------
ObjectType.defineAliases:
  # Provided by VK_KHR_descriptor_update_template
  DescriptorUpdateTemplate as DescriptorUpdateTemplateKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  SamplerYcbcrConversion as SamplerYcbcrConversionKhr
  # Provided by VK_NV_ray_tracing
  AccelerationStructureKhr as AccelerationStructureNv



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
Format.defineAliases:
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G8b8g8r8422Unorm as G8b8g8r8422UnormKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  B8g8r8g8422Unorm as B8g8r8g8422UnormKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G8B8R83plane420Unorm as G8B8R83plane420UnormKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G8B8r82plane420Unorm as G8B8r82plane420UnormKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G8B8R83plane422Unorm as G8B8R83plane422UnormKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G8B8r82plane422Unorm as G8B8r82plane422UnormKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G8B8R83plane444Unorm as G8B8R83plane444UnormKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  R10x6UnormPack16 as R10x6UnormPack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  R10x6g10x6Unorm2pack16 as R10x6g10x6Unorm2pack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  R10x6g10x6b10x6a10x6Unorm4pack16 as R10x6g10x6b10x6a10x6Unorm4pack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G10x6b10x6g10x6r10x6422Unorm4pack16 as G10x6b10x6g10x6r10x6422Unorm4pack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  B10x6g10x6r10x6g10x6422Unorm4pack16 as B10x6g10x6r10x6g10x6422Unorm4pack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G10x6B10x6R10x63plane420Unorm3pack16 as G10x6B10x6R10x63plane420Unorm3pack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G10x6B10x6r10x62plane420Unorm3pack16 as G10x6B10x6r10x62plane420Unorm3pack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G10x6B10x6R10x63plane422Unorm3pack16 as G10x6B10x6R10x63plane422Unorm3pack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G10x6B10x6r10x62plane422Unorm3pack16 as G10x6B10x6r10x62plane422Unorm3pack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G10x6B10x6R10x63plane444Unorm3pack16 as G10x6B10x6R10x63plane444Unorm3pack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  R12x4UnormPack16 as R12x4UnormPack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  R12x4g12x4Unorm2pack16 as R12x4g12x4Unorm2pack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  R12x4g12x4b12x4a12x4Unorm4pack16 as R12x4g12x4b12x4a12x4Unorm4pack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G12x4b12x4g12x4r12x4422Unorm4pack16 as G12x4b12x4g12x4r12x4422Unorm4pack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  B12x4g12x4r12x4g12x4422Unorm4pack16 as B12x4g12x4r12x4g12x4422Unorm4pack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G12x4B12x4R12x43plane420Unorm3pack16 as G12x4B12x4R12x43plane420Unorm3pack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G12x4B12x4r12x42plane420Unorm3pack16 as G12x4B12x4r12x42plane420Unorm3pack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G12x4B12x4R12x43plane422Unorm3pack16 as G12x4B12x4R12x43plane422Unorm3pack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G12x4B12x4r12x42plane422Unorm3pack16 as G12x4B12x4r12x42plane422Unorm3pack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G12x4B12x4R12x43plane444Unorm3pack16 as G12x4B12x4R12x43plane444Unorm3pack16Khr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G16b16g16r16422Unorm as G16b16g16r16422UnormKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  B16g16r16g16422Unorm as B16g16r16g16422UnormKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G16B16R163plane420Unorm as G16B16R163plane420UnormKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G16B16r162plane420Unorm as G16B16r162plane420UnormKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G16B16R163plane422Unorm as G16B16R163plane422UnormKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G16B16r162plane422Unorm as G16B16r162plane422UnormKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  G16B16R163plane444Unorm as G16B16R163plane444UnormKhr

FormatFeatureFlagBits.defineAliases:
  # Provided by VK_KHR_maintenance1
  TransferSrc as TransferSrcBitKhr
  # Provided by VK_KHR_maintenance1
  TransferDst as TransferDstBitKhr
  # Provided by VK_EXT_sampler_filter_minmax
  SampledImageFilterMinmax as SampledImageFilterMinmaxBitExt
  # Provided by VK_KHR_sampler_ycbcr_conversion
  MidpointChromaSamples as MidpointChromaSamplesBitKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  SampledImageYcbcrConversionLinearFilter as SampledImageYcbcrConversionLinearFilterBitKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  SampledImageYcbcrConversionSeparateReconstructionFilter as SampledImageYcbcrConversionSeparateReconstructionFilterBitKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  SampledImageYcbcrConversionChromaReconstructionExplicit as SampledImageYcbcrConversionChromaReconstructionExplicitBitKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  SampledImageYcbcrConversionChromaReconstructionExplicitForceable as SampledImageYcbcrConversionChromaReconstructionExplicitForceableBitKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  Disjoint as DisjointBitKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  CositedChromaSamples as CositedChromaSamplesBitKhr
  # Provided by VK_EXT_filter_cubic
  SampledImageFilterCubicBitImg as SampledImageFilterCubicBitExt

ImageCreateFlagBits.defineAliases:
  # Provided by VK_KHR_device_group
  SplitInstanceBindRegions as SplitInstanceBindRegionsBitKhr
  # Provided by VK_KHR_maintenance1
  Vk2dArrayCompatible as Vk2dArrayCompatibleBitKhr
  # Provided by VK_KHR_maintenance2
  BlockTexelViewCompatible as BlockTexelViewCompatibleBitKhr
  # Provided by VK_KHR_maintenance2
  ExtendedUsage as ExtendedUsageBitKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  Disjoint as DisjointBitKhr
  # Provided by VK_KHR_bind_memory2
  Alias as AliasBitKhr

MemoryHeapFlagBits.defineAliases:
  # Provided by VK_KHR_device_group_creation
  MultiInstance as MultiInstanceBitKhr

StructureType.defineAliases:
  # Provided by VK_VERSION_1_1
  PhysicalDeviceVariablePointersFeatures as PhysicalDeviceVariablePointerFeatures
  # Provided by VK_VERSION_1_1
  PhysicalDeviceShaderDrawParametersFeatures as PhysicalDeviceShaderDrawParameterFeatures
  # Provided by VK_EXT_debug_report
  DebugReportCallbackCreateInfoExt as DebugReportCreateInfoExt # Backwards-compatible alias containing a typo
  # Provided by VK_KHR_multiview
  RenderPassMultiviewCreateInfo as RenderPassMultiviewCreateInfoKhr
  # Provided by VK_KHR_multiview
  PhysicalDeviceMultiviewFeatures as PhysicalDeviceMultiviewFeaturesKhr
  # Provided by VK_KHR_multiview
  PhysicalDeviceMultiviewProperties as PhysicalDeviceMultiviewPropertiesKhr
  # Provided by VK_KHR_get_physical_device_properties2
  PhysicalDeviceFeatures2 as PhysicalDeviceFeatures2Khr
  # Provided by VK_KHR_get_physical_device_properties2
  PhysicalDeviceProperties2 as PhysicalDeviceProperties2Khr
  # Provided by VK_KHR_get_physical_device_properties2
  FormatProperties2 as FormatProperties2Khr
  # Provided by VK_KHR_get_physical_device_properties2
  ImageFormatProperties2 as ImageFormatProperties2Khr
  # Provided by VK_KHR_get_physical_device_properties2
  PhysicalDeviceImageFormatInfo2 as PhysicalDeviceImageFormatInfo2Khr
  # Provided by VK_KHR_get_physical_device_properties2
  QueueFamilyProperties2 as QueueFamilyProperties2Khr
  # Provided by VK_KHR_get_physical_device_properties2
  PhysicalDeviceMemoryProperties2 as PhysicalDeviceMemoryProperties2Khr
  # Provided by VK_KHR_get_physical_device_properties2
  SparseImageFormatProperties2 as SparseImageFormatProperties2Khr
  # Provided by VK_KHR_get_physical_device_properties2
  PhysicalDeviceSparseImageFormatInfo2 as PhysicalDeviceSparseImageFormatInfo2Khr
  # Provided by VK_KHR_device_group
  MemoryAllocateFlagsInfo as MemoryAllocateFlagsInfoKhr
  # Provided by VK_KHR_device_group
  DeviceGroupRenderPassBeginInfo as DeviceGroupRenderPassBeginInfoKhr
  # Provided by VK_KHR_device_group
  DeviceGroupCommandBufferBeginInfo as DeviceGroupCommandBufferBeginInfoKhr
  # Provided by VK_KHR_device_group
  DeviceGroupSubmitInfo as DeviceGroupSubmitInfoKhr
  # Provided by VK_KHR_device_group
  DeviceGroupBindSparseInfo as DeviceGroupBindSparseInfoKhr
  # Provided by VK_KHR_device_group
  BindBufferMemoryDeviceGroupInfo as BindBufferMemoryDeviceGroupInfoKhr
  # Provided by VK_KHR_device_group
  BindImageMemoryDeviceGroupInfo as BindImageMemoryDeviceGroupInfoKhr
  # Provided by VK_KHR_device_group_creation
  PhysicalDeviceGroupProperties as PhysicalDeviceGroupPropertiesKhr
  # Provided by VK_KHR_device_group_creation
  DeviceGroupDeviceCreateInfo as DeviceGroupDeviceCreateInfoKhr
  # Provided by VK_KHR_external_memory_capabilities
  PhysicalDeviceExternalImageFormatInfo as PhysicalDeviceExternalImageFormatInfoKhr
  # Provided by VK_KHR_external_memory_capabilities
  ExternalImageFormatProperties as ExternalImageFormatPropertiesKhr
  # Provided by VK_KHR_external_memory_capabilities
  PhysicalDeviceExternalBufferInfo as PhysicalDeviceExternalBufferInfoKhr
  # Provided by VK_KHR_external_memory_capabilities
  ExternalBufferProperties as ExternalBufferPropertiesKhr
  # Provided by VK_KHR_external_memory_capabilities
  PhysicalDeviceIdProperties as PhysicalDeviceIdPropertiesKhr
  # Provided by VK_KHR_external_memory
  ExternalMemoryBufferCreateInfo as ExternalMemoryBufferCreateInfoKhr
  # Provided by VK_KHR_external_memory
  ExternalMemoryImageCreateInfo as ExternalMemoryImageCreateInfoKhr
  # Provided by VK_KHR_external_memory
  ExportMemoryAllocateInfo as ExportMemoryAllocateInfoKhr
  # Provided by VK_KHR_external_semaphore_capabilities
  PhysicalDeviceExternalSemaphoreInfo as PhysicalDeviceExternalSemaphoreInfoKhr
  # Provided by VK_KHR_external_semaphore_capabilities
  ExternalSemaphoreProperties as ExternalSemaphorePropertiesKhr
  # Provided by VK_KHR_external_semaphore_capabilities
  PhysicalDeviceIdProperties as PhysicalDeviceIdPropertiesKhr
  # Provided by VK_KHR_external_semaphore
  ExportSemaphoreCreateInfo as ExportSemaphoreCreateInfoKhr
  # Provided by VK_KHR_shader_float16_int8
  PhysicalDeviceShaderFloat16Int8Features as PhysicalDeviceShaderFloat16Int8FeaturesKhr
  # Provided by VK_KHR_shader_float16_int8
  PhysicalDeviceShaderFloat16Int8Features as PhysicalDeviceFloat16Int8FeaturesKhr
  # Provided by VK_KHR_16bit_storage
  PhysicalDevice16bitStorageFeatures as PhysicalDevice16bitStorageFeaturesKhr
  # Provided by VK_KHR_descriptor_update_template
  DescriptorUpdateTemplateCreateInfo as DescriptorUpdateTemplateCreateInfoKhr
  # Provided by VK_EXT_display_surface_counter
  SurfaceCapabilities2Ext as SurfaceCapabilities2Ext # Backwards-compatible alias containing a typo
  # Provided by VK_KHR_imageless_framebuffer
  PhysicalDeviceImagelessFramebufferFeatures as PhysicalDeviceImagelessFramebufferFeaturesKhr
  # Provided by VK_KHR_imageless_framebuffer
  FramebufferAttachmentsCreateInfo as FramebufferAttachmentsCreateInfoKhr
  # Provided by VK_KHR_imageless_framebuffer
  FramebufferAttachmentImageInfo as FramebufferAttachmentImageInfoKhr
  # Provided by VK_KHR_imageless_framebuffer
  RenderPassAttachmentBeginInfo as RenderPassAttachmentBeginInfoKhr
  # Provided by VK_KHR_create_renderpass2
  AttachmentDescription2 as AttachmentDescription2Khr
  # Provided by VK_KHR_create_renderpass2
  AttachmentReference2 as AttachmentReference2Khr
  # Provided by VK_KHR_create_renderpass2
  SubpassDescription2 as SubpassDescription2Khr
  # Provided by VK_KHR_create_renderpass2
  SubpassDependency2 as SubpassDependency2Khr
  # Provided by VK_KHR_create_renderpass2
  RenderPassCreateInfo2 as RenderPassCreateInfo2Khr
  # Provided by VK_KHR_create_renderpass2
  SubpassBeginInfo as SubpassBeginInfoKhr
  # Provided by VK_KHR_create_renderpass2
  SubpassEndInfo as SubpassEndInfoKhr
  # Provided by VK_KHR_external_fence_capabilities
  PhysicalDeviceExternalFenceInfo as PhysicalDeviceExternalFenceInfoKhr
  # Provided by VK_KHR_external_fence_capabilities
  ExternalFenceProperties as ExternalFencePropertiesKhr
  # Provided by VK_KHR_external_fence_capabilities
  PhysicalDeviceIdProperties as PhysicalDeviceIdPropertiesKhr
  # Provided by VK_KHR_external_fence
  ExportFenceCreateInfo as ExportFenceCreateInfoKhr
  # Provided by VK_KHR_maintenance2
  PhysicalDevicePointClippingProperties as PhysicalDevicePointClippingPropertiesKhr
  # Provided by VK_KHR_maintenance2
  RenderPassInputAttachmentAspectCreateInfo as RenderPassInputAttachmentAspectCreateInfoKhr
  # Provided by VK_KHR_maintenance2
  ImageViewUsageCreateInfo as ImageViewUsageCreateInfoKhr
  # Provided by VK_KHR_maintenance2
  PipelineTessellationDomainOriginStateCreateInfo as PipelineTessellationDomainOriginStateCreateInfoKhr
  # Provided by VK_KHR_variable_pointers
  PhysicalDeviceVariablePointersFeatures as PhysicalDeviceVariablePointersFeaturesKhr
  # Provided by VK_KHR_variable_pointers
  PhysicalDeviceVariablePointersFeaturesKhr as PhysicalDeviceVariablePointerFeaturesKhr
  # Provided by VK_KHR_dedicated_allocation
  MemoryDedicatedRequirements as MemoryDedicatedRequirementsKhr
  # Provided by VK_KHR_dedicated_allocation
  MemoryDedicatedAllocateInfo as MemoryDedicatedAllocateInfoKhr
  # Provided by VK_EXT_sampler_filter_minmax
  PhysicalDeviceSamplerFilterMinmaxProperties as PhysicalDeviceSamplerFilterMinmaxPropertiesExt
  # Provided by VK_EXT_sampler_filter_minmax
  SamplerReductionModeCreateInfo as SamplerReductionModeCreateInfoExt
  # Provided by VK_KHR_get_memory_requirements2
  BufferMemoryRequirementsInfo2 as BufferMemoryRequirementsInfo2Khr
  # Provided by VK_KHR_get_memory_requirements2
  ImageMemoryRequirementsInfo2 as ImageMemoryRequirementsInfo2Khr
  # Provided by VK_KHR_get_memory_requirements2
  ImageSparseMemoryRequirementsInfo2 as ImageSparseMemoryRequirementsInfo2Khr
  # Provided by VK_KHR_get_memory_requirements2
  MemoryRequirements2 as MemoryRequirements2Khr
  # Provided by VK_KHR_get_memory_requirements2
  SparseImageMemoryRequirements2 as SparseImageMemoryRequirements2Khr
  # Provided by VK_KHR_image_format_list
  ImageFormatListCreateInfo as ImageFormatListCreateInfoKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  SamplerYcbcrConversionCreateInfo as SamplerYcbcrConversionCreateInfoKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  SamplerYcbcrConversionInfo as SamplerYcbcrConversionInfoKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  BindImagePlaneMemoryInfo as BindImagePlaneMemoryInfoKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  ImagePlaneMemoryRequirementsInfo as ImagePlaneMemoryRequirementsInfoKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  PhysicalDeviceSamplerYcbcrConversionFeatures as PhysicalDeviceSamplerYcbcrConversionFeaturesKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  SamplerYcbcrConversionImageFormatProperties as SamplerYcbcrConversionImageFormatPropertiesKhr
  # Provided by VK_KHR_bind_memory2
  BindBufferMemoryInfo as BindBufferMemoryInfoKhr
  # Provided by VK_KHR_bind_memory2
  BindImageMemoryInfo as BindImageMemoryInfoKhr
  # Provided by VK_EXT_descriptor_indexing
  DescriptorSetLayoutBindingFlagsCreateInfo as DescriptorSetLayoutBindingFlagsCreateInfoExt
  # Provided by VK_EXT_descriptor_indexing
  PhysicalDeviceDescriptorIndexingFeatures as PhysicalDeviceDescriptorIndexingFeaturesExt
  # Provided by VK_EXT_descriptor_indexing
  PhysicalDeviceDescriptorIndexingProperties as PhysicalDeviceDescriptorIndexingPropertiesExt
  # Provided by VK_EXT_descriptor_indexing
  DescriptorSetVariableDescriptorCountAllocateInfo as DescriptorSetVariableDescriptorCountAllocateInfoExt
  # Provided by VK_EXT_descriptor_indexing
  DescriptorSetVariableDescriptorCountLayoutSupport as DescriptorSetVariableDescriptorCountLayoutSupportExt
  # Provided by VK_NV_ray_tracing
  BindAccelerationStructureMemoryInfoKhr as BindAccelerationStructureMemoryInfoNv
  # Provided by VK_NV_ray_tracing
  WriteDescriptorSetAccelerationStructureKhr as WriteDescriptorSetAccelerationStructureNv
  # Provided by VK_KHR_maintenance3
  PhysicalDeviceMaintenance3Properties as PhysicalDeviceMaintenance3PropertiesKhr
  # Provided by VK_KHR_maintenance3
  DescriptorSetLayoutSupport as DescriptorSetLayoutSupportKhr
  # Provided by VK_KHR_shader_subgroup_extended_types
  PhysicalDeviceShaderSubgroupExtendedTypesFeatures as PhysicalDeviceShaderSubgroupExtendedTypesFeaturesKhr
  # Provided by VK_KHR_8bit_storage
  PhysicalDevice8bitStorageFeatures as PhysicalDevice8bitStorageFeaturesKhr
  # Provided by VK_KHR_shader_atomic_int64
  PhysicalDeviceShaderAtomicInt64Features as PhysicalDeviceShaderAtomicInt64FeaturesKhr
  # Provided by VK_KHR_driver_properties
  PhysicalDeviceDriverProperties as PhysicalDeviceDriverPropertiesKhr
  # Provided by VK_KHR_shader_float_controls
  PhysicalDeviceFloatControlsProperties as PhysicalDeviceFloatControlsPropertiesKhr
  # Provided by VK_KHR_depth_stencil_resolve
  PhysicalDeviceDepthStencilResolveProperties as PhysicalDeviceDepthStencilResolvePropertiesKhr
  # Provided by VK_KHR_depth_stencil_resolve
  SubpassDescriptionDepthStencilResolve as SubpassDescriptionDepthStencilResolveKhr
  # Provided by VK_KHR_timeline_semaphore
  PhysicalDeviceTimelineSemaphoreFeatures as PhysicalDeviceTimelineSemaphoreFeaturesKhr
  # Provided by VK_KHR_timeline_semaphore
  PhysicalDeviceTimelineSemaphoreProperties as PhysicalDeviceTimelineSemaphorePropertiesKhr
  # Provided by VK_KHR_timeline_semaphore
  SemaphoreTypeCreateInfo as SemaphoreTypeCreateInfoKhr
  # Provided by VK_KHR_timeline_semaphore
  TimelineSemaphoreSubmitInfo as TimelineSemaphoreSubmitInfoKhr
  # Provided by VK_KHR_timeline_semaphore
  SemaphoreWaitInfo as SemaphoreWaitInfoKhr
  # Provided by VK_KHR_timeline_semaphore
  SemaphoreSignalInfo as SemaphoreSignalInfoKhr
  # Provided by VK_INTEL_performance_query
  QueryPoolPerformanceQueryCreateInfoIntel as QueryPoolCreateInfoIntel # Backwards-compatible alias
  # Provided by VK_KHR_vulkan_memory_model
  PhysicalDeviceVulkanMemoryModelFeatures as PhysicalDeviceVulkanMemoryModelFeaturesKhr
  # Provided by VK_EXT_scalar_block_layout
  PhysicalDeviceScalarBlockLayoutFeatures as PhysicalDeviceScalarBlockLayoutFeaturesExt
  # Provided by VK_KHR_separate_depth_stencil_layouts
  PhysicalDeviceSeparateDepthStencilLayoutsFeatures as PhysicalDeviceSeparateDepthStencilLayoutsFeaturesKhr
  # Provided by VK_KHR_separate_depth_stencil_layouts
  AttachmentReferenceStencilLayout as AttachmentReferenceStencilLayoutKhr
  # Provided by VK_KHR_separate_depth_stencil_layouts
  AttachmentDescriptionStencilLayout as AttachmentDescriptionStencilLayoutKhr
  # Provided by VK_EXT_buffer_device_address
  PhysicalDeviceBufferDeviceAddressFeaturesExt as PhysicalDeviceBufferAddressFeaturesExt
  # Provided by VK_EXT_buffer_device_address
  BufferDeviceAddressInfo as BufferDeviceAddressInfoExt
  # Provided by VK_EXT_separate_stencil_usage
  ImageStencilUsageCreateInfo as ImageStencilUsageCreateInfoExt
  # Provided by VK_KHR_uniform_buffer_standard_layout
  PhysicalDeviceUniformBufferStandardLayoutFeatures as PhysicalDeviceUniformBufferStandardLayoutFeaturesKhr
  # Provided by VK_KHR_buffer_device_address
  PhysicalDeviceBufferDeviceAddressFeatures as PhysicalDeviceBufferDeviceAddressFeaturesKhr
  # Provided by VK_KHR_buffer_device_address
  BufferDeviceAddressInfo as BufferDeviceAddressInfoKhr
  # Provided by VK_KHR_buffer_device_address
  BufferOpaqueCaptureAddressCreateInfo as BufferOpaqueCaptureAddressCreateInfoKhr
  # Provided by VK_KHR_buffer_device_address
  MemoryOpaqueCaptureAddressAllocateInfo as MemoryOpaqueCaptureAddressAllocateInfoKhr
  # Provided by VK_KHR_buffer_device_address
  DeviceMemoryOpaqueCaptureAddressInfo as DeviceMemoryOpaqueCaptureAddressInfoKhr
  # Provided by VK_EXT_host_query_reset
  PhysicalDeviceHostQueryResetFeatures as PhysicalDeviceHostQueryResetFeaturesExt

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
PipelineStageFlagBits.defineAliases:
  # Provided by VK_NV_ray_tracing
  RayTracingShaderBitKhr as RayTracingShaderBitNv
  # Provided by VK_NV_ray_tracing
  AccelerationStructureBuildBitKhr as AccelerationStructureBuildBitNv

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
ImageAspectFlagBits.defineAliases:
  # Provided by VK_KHR_sampler_ycbcr_conversion
  Plane0 as Plane0BitKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  Plane1 as Plane1BitKhr
  # Provided by VK_KHR_sampler_ycbcr_conversion
  Plane2 as Plane2BitKhr

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
QueryType.defineAliases:
  # Provided by VK_NV_ray_tracing
  AccelerationStructureCompactedSizeKhr as AccelerationStructureCompactedSizeNv

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
BufferCreateFlagBits.defineAliases:
  # Provided by VK_EXT_buffer_device_address
  DeviceAddressCaptureReplay as DeviceAddressCaptureReplayBitExt
  # Provided by VK_KHR_buffer_device_address
  DeviceAddressCaptureReplay as DeviceAddressCaptureReplayBitKhr

BufferUsageFlagBits.defineAliases:
  # Provided by VK_NV_ray_tracing
  RayTracingBitKhr as RayTracingBitNv
  # Provided by VK_EXT_buffer_device_address
  ShaderDeviceAddress as ShaderDeviceAddressBitExt
  # Provided by VK_KHR_buffer_device_address
  ShaderDeviceAddress as ShaderDeviceAddressBitKhr

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
ImageLayout.defineAliases:
  # Provided by VK_KHR_maintenance2
  DepthReadOnlyStencilAttachmentOptimal as DepthReadOnlyStencilAttachmentOptimalKhr
  # Provided by VK_KHR_maintenance2
  DepthAttachmentStencilReadOnlyOptimal as DepthAttachmentStencilReadOnlyOptimalKhr
  # Provided by VK_KHR_separate_depth_stencil_layouts
  DepthAttachmentOptimal as DepthAttachmentOptimalKhr
  # Provided by VK_KHR_separate_depth_stencil_layouts
  DepthReadOnlyOptimal as DepthReadOnlyOptimalKhr
  # Provided by VK_KHR_separate_depth_stencil_layouts
  StencilAttachmentOptimal as StencilAttachmentOptimalKhr
  # Provided by VK_KHR_separate_depth_stencil_layouts
  StencilReadOnlyOptimal as StencilReadOnlyOptimalKhr

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
PipelineCreateFlagBits.defineAliases:
  # Provided by VK_VERSION_1_1
  DispatchBase as DispatchBase
  # Provided by VK_KHR_device_group
  ViewIndexFromDeviceIndex as ViewIndexFromDeviceIndexBitKhr
  # Provided by VK_KHR_device_group
  DispatchBase as DispatchBaseKhr

ShaderStageFlagBits.defineAliases:
  # Provided by VK_NV_ray_tracing
  RaygenBitKhr as RaygenBitNv
  # Provided by VK_NV_ray_tracing
  AnyHitBitKhr as AnyHitBitNv
  # Provided by VK_NV_ray_tracing
  ClosestHitBitKhr as ClosestHitBitNv
  # Provided by VK_NV_ray_tracing
  MissBitKhr as MissBitNv
  # Provided by VK_NV_ray_tracing
  IntersectionBitKhr as IntersectionBitNv
  # Provided by VK_NV_ray_tracing
  CallableBitKhr as CallableBitNv

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
Filter.defineAliases:
  # Provided by VK_EXT_filter_cubic
  CubicImg as CubicExt

SamplerAddressMode.defineAliases:
  # Provided by VK_KHR_sampler_mirror_clamp_to_edge
  MirrorClampToEdge as MirrorClampToEdgeKhr # Alias introduced for consistency with extension suffixing rules

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
DescriptorPoolCreateFlagBits.defineAliases:
  # Provided by VK_EXT_descriptor_indexing
  UpdateAfterBind as UpdateAfterBindBitExt

DescriptorSetLayoutCreateFlagBits.defineAliases:
  # Provided by VK_EXT_descriptor_indexing
  UpdateAfterBindPool as UpdateAfterBindPoolBitExt

DescriptorType.defineAliases:
  # Provided by VK_NV_ray_tracing
  AccelerationStructureKhr as AccelerationStructureNv

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
AccessFlagBits.defineAliases:
  # Provided by VK_NV_ray_tracing
  AccelerationStructureReadBitKhr as AccelerationStructureReadBitNv
  # Provided by VK_NV_ray_tracing
  AccelerationStructureWriteBitKhr as AccelerationStructureWriteBitNv

DependencyFlagBits.defineAliases:
  # Provided by VK_KHR_multiview
  ViewLocal as ViewLocalBitKhr
  # Provided by VK_KHR_device_group
  DeviceGroup as DeviceGroupBitKhr

FramebufferCreateFlagBits.defineAliases:
  # Provided by VK_KHR_imageless_framebuffer
  Imageless as ImagelessBitKhr

PipelineBindPoint.defineAliases:
  # Provided by VK_NV_ray_tracing
  RayTracingKhr as RayTracingNv

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
IndexType.defineAliases:
  # Provided by VK_NV_ray_tracing
  NoneKhr as NoneNv

StencilFaceFlagBits.defineAliases:
  FrontAndBack as StencilFrontAndBack # Alias for backwards compatibility

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
  nil.defineLoader(`<<`)
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