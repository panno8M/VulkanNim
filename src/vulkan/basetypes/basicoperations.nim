import typedefs

proc toString*(b: Bool32): string = (if b.uint32 == 1: "VkTrue" else: "VkFalse")
proc `$`*(b: Bool32): string = b.toString

converter toBool*(b: Bool32): bool = bool(b)
converter toBool32*(b: bool): Bool32 = Bool32(b)