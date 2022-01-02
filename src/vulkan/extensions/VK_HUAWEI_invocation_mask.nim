# VK_HUAWEI_invocation_mask

import ../features/vk10
import ../platform
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
