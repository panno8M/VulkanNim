
# ========================= #
#      LOADER TEMPLATE      #
# ========================= #

# You can use these templates to load Vulkan proc dynamically and individually.
import macros
import strformat

template load*(vkProcPtr: untyped; instance: Instance): untyped =
  when not vkProcPtr.hasCustomPragma(loadable):
    {.fatal: "Specify the loading config with loadable pragma.", vkProcPtr.}
  const pg = vkProcPtr.getCustomPragmaVal(loadable)
  when LoadWith.Instance in pg.with:
    vkProcPtr = cast[typeof vkProcPtr](instance.getInstanceProcAddr(pg.loadFrom))
  else:
    {.fatal: "To load using with Instance, add \"LoadWith.Instance\" to the loadable pragma if available.", vkProcPtr.}
template smartLoad*(vkProcPtr: untyped; instance: Instance): untyped =
  if vkProcPtr.isNil:
    vkProcPtr.load(instance)
template withLoad*(vkProcPtr: untyped; instance: Instance): typeof vkProcPtr =
  vkProcPtr.load(instance)
  vkProcPtr

template load*(vkProcPtr: untyped; device: Device): untyped =
  when not vkProcPtr.hasCustomPragma(loadable):
    {.fatal: "Specify the loading config with loadable pragma.", vkProcPtr.}
  const pg = vkProcPtr.getCustomPragmaVal(loadable)
  when LoadWith.Device in pg.with:
    vkProcPtr = cast[typeof vkProcPtr](device.getDeviceProcAddr(pg.loadFrom))
  else:
    {.fatal: "To load using with Device, add \"LoadWith.Device\" to the loadable pragma if available.", vkProcPtr.}
template smartLoad*(vkProcPtr: untyped; device: Device): untyped =
  if vkProcPtr.isNil:
    vkProcPtr.load(device)
template withLoad*(vkProcPtr: untyped; device: Device): typeof vkProcPtr =
  vkProcPtr.load(device)
  vkProcPtr

# ========================= #
#      LOADER TEMPLATE      #
# ========================= #
