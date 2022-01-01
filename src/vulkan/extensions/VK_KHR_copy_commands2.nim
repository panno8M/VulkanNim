# VK_KHR_copy_commands2

import ../features/vk10
import ../platform
prepareVulkanLibDef()

const
  KhrCopyCommands2SpecVersion* = 1
  KhrCopyCommands2ExtensionName* = "VK_KHR_copy_commands2"

type
  CopyBufferInfo2KHR* = object
    sType* {.constant: (StructureType.copyBufferInfo2Khr).}: StructureType
    pNext* {.optional.}: pointer
    srcBuffer*: Buffer
    dstBuffer*: Buffer
    regionCount*: uint32
    pRegions* {.length: regionCount.}: arrPtr[BufferCopy2KHR]
  CopyImageInfo2KHR* = object
    sType* {.constant: (StructureType.copyImageInfo2Khr).}: StructureType
    pNext* {.optional.}: pointer
    srcImage*: Image
    srcImageLayout*: ImageLayout
    dstImage*: Image
    dstImageLayout*: ImageLayout
    regionCount*: uint32
    pRegions* {.length: regionCount.}: arrPtr[ImageCopy2KHR]
  CopyBufferToImageInfo2KHR* = object
    sType* {.constant: (StructureType.copyBufferToImageInfo2Khr).}: StructureType
    pNext* {.optional.}: pointer
    srcBuffer*: Buffer
    dstImage*: Image
    dstImageLayout*: ImageLayout
    regionCount*: uint32
    pRegions* {.length: regionCount.}: arrPtr[BufferImageCopy2KHR]
  CopyImageToBufferInfo2KHR* = object
    sType* {.constant: (StructureType.copyImageToBufferInfo2Khr).}: StructureType
    pNext* {.optional.}: pointer
    srcImage*: Image
    srcImageLayout*: ImageLayout
    dstBuffer*: Buffer
    regionCount*: uint32
    pRegions* {.length: regionCount.}: arrPtr[BufferImageCopy2KHR]
  BlitImageInfo2KHR* = object
    sType* {.constant: (StructureType.blitImageInfo2Khr).}: StructureType
    pNext* {.optional.}: pointer
    srcImage*: Image
    srcImageLayout*: ImageLayout
    dstImage*: Image
    dstImageLayout*: ImageLayout
    regionCount*: uint32
    pRegions* {.length: regionCount.}: arrPtr[ImageBlit2KHR]
    filter*: Filter
  ResolveImageInfo2KHR* = object
    sType* {.constant: (StructureType.resolveImageInfo2Khr).}: StructureType
    pNext* {.optional.}: pointer
    srcImage*: Image
    srcImageLayout*: ImageLayout
    dstImage*: Image
    dstImageLayout*: ImageLayout
    regionCount*: uint32
    pRegions* {.length: regionCount.}: arrPtr[ImageResolve2KHR]
  BufferCopy2KHR* = object
    sType* {.constant: (StructureType.bufferCopy2Khr).}: StructureType
    pNext* {.optional.}: pointer
    srcOffset*: DeviceSize
    dstOffset*: DeviceSize
    size*: DeviceSize
  ImageCopy2KHR* = object
    sType* {.constant: (StructureType.imageCopy2Khr).}: StructureType
    pNext* {.optional.}: pointer
    srcSubresource*: ImageSubresourceLayers
    srcOffset*: Offset3D
    dstSubresource*: ImageSubresourceLayers
    dstOffset*: Offset3D
    extent*: Extent3D
  ImageBlit2KHR* = object
    sType* {.constant: (StructureType.imageBlit2Khr).}: StructureType
    pNext* {.optional.}: pointer
    srcSubresource*: ImageSubresourceLayers
    srcOffsets*: array[2, Offset3D]
    dstSubresource*: ImageSubresourceLayers
    dstOffsets*: array[2, Offset3D]
  BufferImageCopy2KHR* = object
    sType* {.constant: (StructureType.bufferImageCopy2Khr).}: StructureType
    pNext* {.optional.}: pointer
    bufferOffset*: DeviceSize
    bufferRowLength*: uint32
    bufferImageHeight*: uint32
    imageSubresource*: ImageSubresourceLayers
    imageOffset*: Offset3D
    imageExtent*: Extent3D
  ImageResolve2KHR* = object
    sType* {.constant: (StructureType.imageResolve2Khr).}: StructureType
    pNext* {.optional.}: pointer
    srcSubresource*: ImageSubresourceLayers
    srcOffset*: Offset3D
    dstSubresource*: ImageSubresourceLayers
    dstOffset*: Offset3D
    extent*: Extent3D

proc cmdCopyBuffer2KHR*(
      commandBuffer: CommandBuffer;
      pCopyBufferInfo: ptr CopyBufferInfo2KHR;
    ): void {.cdecl, lazyload("vkCmdCopyBuffer2KHR", DeviceLevel).}
proc cmdCopyImage2KHR*(
      commandBuffer: CommandBuffer;
      pCopyImageInfo: ptr CopyImageInfo2KHR;
    ): void {.cdecl, lazyload("vkCmdCopyImage2KHR", DeviceLevel).}
proc cmdCopyBufferToImage2KHR*(
      commandBuffer: CommandBuffer;
      pCopyBufferToImageInfo: ptr CopyBufferToImageInfo2KHR;
    ): void {.cdecl, lazyload("vkCmdCopyBufferToImage2KHR", DeviceLevel).}
proc cmdCopyImageToBuffer2KHR*(
      commandBuffer: CommandBuffer;
      pCopyImageToBufferInfo: ptr CopyImageToBufferInfo2KHR;
    ): void {.cdecl, lazyload("vkCmdCopyImageToBuffer2KHR", DeviceLevel).}
proc cmdBlitImage2KHR*(
      commandBuffer: CommandBuffer;
      pBlitImageInfo: ptr BlitImageInfo2KHR;
    ): void {.cdecl, lazyload("vkCmdBlitImage2KHR", DeviceLevel).}
proc cmdResolveImage2KHR*(
      commandBuffer: CommandBuffer;
      pResolveImageInfo: ptr ResolveImageInfo2KHR;
    ): void {.cdecl, lazyload("vkCmdResolveImage2KHR", DeviceLevel).}

proc loadAllVK_KHR_copy_commands2*(instance: Instance) = instance.loadCommands:
  cmdCopyBuffer2KHR
  cmdCopyImage2KHR
  cmdCopyBufferToImage2KHR
  cmdCopyImageToBuffer2KHR
  cmdBlitImage2KHR
  cmdResolveImage2KHR
proc loadVK_KHR_copy_commands2*(device: Device) = device.loadCommands:
  cmdCopyBuffer2KHR
  cmdCopyImage2KHR
  cmdCopyBufferToImage2KHR
  cmdCopyImageToBuffer2KHR
  cmdBlitImage2KHR
  cmdResolveImage2KHR
