# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_EXT_color_write_enable

import ../tools
const
  # VK_EXT_color_write_enable
  ExtColorWriteEnableSpecVersion* = 1
  ExtColorWriteEnableExtensionName* = "VK_EXT_color_write_enable"


# VK_EXT_color_write_enable
# =========================
proc cmdSetColorWriteEnableEXT*(
      commandBuffer: CommandBuffer;
      attachmentCount: uint32;
      pColorWriteEnables {.length: attachmentCount.}: arrPtr[Bool32];
    ): void {.lazyload("vkCmdSetColorWriteEnableEXT", DeviceLevel), cmdchain.}


proc loadAllVK_EXT_color_write_enable*(instance: Instance) = instance.loadCommands:
  cmdSetColorWriteEnableEXT
proc loadVK_EXT_color_write_enable*(device: Device) = device.loadCommands:
  cmdSetColorWriteEnableEXT