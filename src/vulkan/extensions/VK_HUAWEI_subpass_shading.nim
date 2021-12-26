# Generated at 2021-12-26T16:57:02Z
# VK_HUAWEI_subpass_shading

import ../platform

import ../features/vk10
import ./VK_KHR_create_renderpass2
import ./VK_KHR_synchronization2
export VK_KHR_create_renderpass2
export VK_KHR_synchronization2
prepareVulkanLibDef()

const
  HuaweiSubpassShadingSpecVersion* = 2
  HuaweiSubpassShadingExtensionName* = "VK_HUAWEI_subpass_shading"

type
  SubpassShadingPipelineCreateInfoHUAWEI* = object
    sType* {.constant: (StructureType.subpassShadingPipelineCreateInfoHuawei).}: StructureType
    pNext* {.optional.}: pointer
    renderPass*: RenderPass
    subpass*: uint32
  PhysicalDeviceSubpassShadingFeaturesHUAWEI* = object
    sType* {.constant: (StructureType.physicalDeviceSubpassShadingFeaturesHuawei).}: StructureType
    pNext* {.optional.}: pointer
    subpassShading*: Bool32
  PhysicalDeviceSubpassShadingPropertiesHUAWEI* = object
    sType* {.constant: (StructureType.physicalDeviceSubpassShadingPropertiesHuawei).}: StructureType
    pNext* {.optional.}: pointer
    maxSubpassShadingWorkgroupSizeAspectRatio*: uint32

proc getDeviceSubpassShadingMaxWorkgroupSizeHUAWEI*(
      device: Device;
      renderpass: RenderPass;
      pMaxWorkgroupSize: ptr Extent2D;
    ): Result {.cdecl,
      successCodes(success, incomplete),
      errorCodes(errorOutOfHostMemory, errorOutOfDeviceMemory, errorSurfaceLostKhr),
      lazyload("vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI", DeviceLevel).}
proc cmdSubpassShadingHUAWEI*(
      commandBuffer: CommandBuffer;
    ): void {.cdecl, lazyload("vkCmdSubpassShadingHUAWEI", DeviceLevel).}

proc loadAllVK_HUAWEI_subpass_shading*(instance: Instance) =
  instance.loadCommand getDeviceSubpassShadingMaxWorkgroupSizeHUAWEI
  instance.loadCommand cmdSubpassShadingHUAWEI

proc loadVK_HUAWEI_subpass_shading*(device: Device) =
  device.loadCommand getDeviceSubpassShadingMaxWorkgroupSizeHUAWEI
  device.loadCommand cmdSubpassShadingHUAWEI

