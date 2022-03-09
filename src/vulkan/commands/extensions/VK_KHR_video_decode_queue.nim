# This file is generated by the program.
# Note that any changes to this file will be reset by the execution of
# the generated program.

# VK_KHR_video_decode_queue

import ../tools
const
  # VK_KHR_video_decode_queue
  KhrVideoDecodeQueueSpecVersion* = 2
  KhrVideoDecodeQueueExtensionName* = "VK_KHR_video_decode_queue"


# VK_KHR_video_decode_queue
# =========================
proc cmdDecodeVideoKHR*(
      commandBuffer: CommandBuffer;
      pFrameInfo: ptr VideoDecodeInfoKHR;
    ): void {.lazyload("vkCmdDecodeVideoKHR", DeviceLevel),
      queues: QueueFlags{decode}, cmdchain.}


proc loadAllVK_KHR_video_decode_queue*(instance: Instance) = instance.loadCommands:
  cmdDecodeVideoKHR
proc loadVK_KHR_video_decode_queue*(device: Device) = device.loadCommands:
  cmdDecodeVideoKHR