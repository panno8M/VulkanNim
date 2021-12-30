# Generated at 2021-12-30T17:13:13Z
# VK_HUAWEI_invocation_mask

import ../platform

import ../features/vk10
import ./VK_KHR_ray_tracing_pipeline
import ./VK_KHR_synchronization2
export VK_KHR_ray_tracing_pipeline
export VK_KHR_synchronization2
prepareVulkanLibDef()

const
  HuaweiInvocationMaskSpecVersion* = 1
  HuaweiInvocationMaskExtensionName* = "VK_HUAWEI_invocation_mask"

type
  PhysicalDeviceInvocationMaskFeaturesHUAWEI* = object
    sType* {.constant: (StructureType.physicalDeviceInvocationMaskFeaturesHuawei).}: StructureType
    pNext* {.optional.}: pointer
    invocationMask*: Bool32

proc cmdBindInvocationMaskHUAWEI*(
      commandBuffer: CommandBuffer;
      imageView = default(ImageView);
      imageLayout: ImageLayout;
    ): void {.cdecl, lazyload("vkCmdBindInvocationMaskHUAWEI", DeviceLevel).}

proc loadAllVK_HUAWEI_invocation_mask*(instance: Instance) = instance.loadCommands:
  cmdBindInvocationMaskHUAWEI
proc loadVK_HUAWEI_invocation_mask*(device: Device) = device.loadCommands:
  cmdBindInvocationMaskHUAWEI
