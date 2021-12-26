# Generated at 2021-12-26T16:57:02Z
# VK_NVX_binary_import

import ../platform

import ../features/vk10

prepareVulkanLibDef()

const
  NvxBinaryImportSpecVersion* = 1
  NvxBinaryImportExtensionName* = "VK_NVX_binary_import"

type
  CuModuleCreateInfoNVX* = object
    sType* {.constant: (StructureType.cuModuleCreateInfoNvx).}: StructureType
    pNext* {.optional.}: pointer
    dataSize*: uint
    pData* {.length: dataSize.}: pointer
  CuFunctionCreateInfoNVX* = object
    sType* {.constant: (StructureType.cuFunctionCreateInfoNvx).}: StructureType
    pNext* {.optional.}: pointer
    module*: CuModuleNVX
    pName*: cstring
  CuLaunchInfoNVX* = object
    sType* {.constant: (StructureType.cuLaunchInfoNvx).}: StructureType
    pNext* {.optional.}: pointer
    function*: CuFunctionNVX
    gridDimX*: uint32
    gridDimY*: uint32
    gridDimZ*: uint32
    blockDimX*: uint32
    blockDimY*: uint32
    blockDimZ*: uint32
    sharedMemBytes*: uint32
    paramCount* {.optional.}: uint
    pParams* {.length: paramCount.}: arrPtr[pointer]
    extraCount* {.optional.}: uint
    pExtras* {.length: extraCount.}: arrPtr[pointer]

proc createCuModuleNVX*(
      device: Device;
      pCreateInfo: ptr CuModuleCreateInfoNVX;
      pAllocator = default(ptr AllocationCallbacks);
      pModule: ptr CuModuleNVX;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorInitializationFailed),
      lazyload("vkCreateCuModuleNVX", DeviceLevel).}
proc createCuFunctionNVX*(
      device: Device;
      pCreateInfo: ptr CuFunctionCreateInfoNVX;
      pAllocator = default(ptr AllocationCallbacks);
      pFunction: ptr CuFunctionNVX;
    ): Result {.cdecl,
      successCodes(success),
      errorCodes(errorOutOfHostMemory, errorInitializationFailed),
      lazyload("vkCreateCuFunctionNVX", DeviceLevel).}
proc destroyCuModuleNVX*(
      device: Device;
      module: CuModuleNVX;
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, lazyload("vkDestroyCuModuleNVX", DeviceLevel).}
proc destroyCuFunctionNVX*(
      device: Device;
      function: CuFunctionNVX;
      pAllocator = default(ptr AllocationCallbacks);
    ): void {.cdecl, lazyload("vkDestroyCuFunctionNVX", DeviceLevel).}
proc cmdCuLaunchKernelNVX*(
      commandBuffer: CommandBuffer;
      pLaunchInfo: ptr CuLaunchInfoNVX;
    ): void {.cdecl, lazyload("vkCmdCuLaunchKernelNVX", DeviceLevel).}

proc loadAllVK_NVX_binary_import*(instance: Instance) =
  instance.loadCommand createCuModuleNVX
  instance.loadCommand createCuFunctionNVX
  instance.loadCommand destroyCuModuleNVX
  instance.loadCommand destroyCuFunctionNVX
  instance.loadCommand cmdCuLaunchKernelNVX

proc loadVK_NVX_binary_import*(device: Device) =
  device.loadCommand createCuModuleNVX
  device.loadCommand createCuFunctionNVX
  device.loadCommand destroyCuModuleNVX
  device.loadCommand destroyCuFunctionNVX
  device.loadCommand cmdCuLaunchKernelNVX

