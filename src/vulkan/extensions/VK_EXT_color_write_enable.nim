# Generated at 2021-12-30T16:35:41Z
# VK_EXT_color_write_enable

import ../platform

import ../features/vk10
import ./VK_KHR_get_physical_device_properties2
export VK_KHR_get_physical_device_properties2
prepareVulkanLibDef()

const
  ExtColorWriteEnableSpecVersion* = 1
  ExtColorWriteEnableExtensionName* = "VK_EXT_color_write_enable"

type
  PhysicalDeviceColorWriteEnableFeaturesEXT* = object
    sType* {.constant: (StructureType.physicalDeviceColorWriteEnableFeaturesExt).}: StructureType
    pNext* {.optional.}: pointer
    colorWriteEnable*: Bool32
  PipelineColorWriteCreateInfoEXT* = object
    sType* {.constant: (StructureType.pipelineColorWriteCreateInfoExt).}: StructureType
    pNext* {.optional.}: pointer
    attachmentCount* {.optional.}: uint32
    pColorWriteEnables* {.length: attachmentCount.}: arrPtr[Bool32]

proc cmdSetColorWriteEnableEXT*(
      commandBuffer: CommandBuffer;
      attachmentCount: uint32;
      pColorWriteEnables {.length: attachmentCount.}: arrPtr[Bool32];
    ): void {.cdecl, lazyload("vkCmdSetColorWriteEnableEXT", DeviceLevel).}

proc loadAllVK_EXT_color_write_enable*(instance: Instance) =
  instance.loadCommand cmdSetColorWriteEnableEXT
proc loadVK_EXT_color_write_enable*(device: Device) =
  device.loadCommand cmdSetColorWriteEnableEXT
