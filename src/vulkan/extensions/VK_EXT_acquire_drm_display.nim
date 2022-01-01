# Generated at 2021-12-31T11:28:23Z
# VK_EXT_acquire_drm_display

import ../platform

import ../features/vk10
import ./VK_EXT_direct_mode_display
export VK_EXT_direct_mode_display
prepareVulkanLibDef()

const
  ExtAcquireDrmDisplaySpecVersion* = 1
  ExtAcquireDrmDisplayExtensionName* = "VK_EXT_acquire_drm_display"

proc acquireDrmDisplayEXT*(
      physicalDevice: PhysicalDevice;
      drmFd: int32;
      display: DisplayKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorInitializationFailed],
      lazyload("vkAcquireDrmDisplayEXT", InstanceLevel).}
proc getDrmDisplayEXT*(
      physicalDevice: PhysicalDevice;
      drmFd: int32;
      connectorId: uint32;
      display: ptr DisplayKHR;
    ): Result {.cdecl,
      successCodes: @[Result.success],
      errorCodes: @[Result.errorInitializationFailed, Result.errorOutOfHostMemory],
      lazyload("vkGetDrmDisplayEXT", InstanceLevel).}

proc loadAllVK_EXT_acquire_drm_display*(instance: Instance) = instance.loadCommands:
  acquireDrmDisplayEXT
  getDrmDisplayEXT
proc loadVK_EXT_acquire_drm_display*(instance: Instance) = instance.loadCommands:
  acquireDrmDisplayEXT
  getDrmDisplayEXT
