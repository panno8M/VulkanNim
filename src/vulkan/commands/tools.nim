import ../basetypes;     export basetypes
import ../handles;       export handles
import ../enums;         export enums
import ../objects;       export objects
import loadercomponents; export loadercomponents
import commandloaders;   export commandloaders

import ../objects/tools as objecttools; export objecttools
import ../objects/temp_externalobjects; export temp_externalobjects


proc getInstanceProcAddr*(
      instance = default(Instance);
      pName: cstring;
    ): PFN_VoidFunction {.cdecl, preload("vkGetInstanceProcAddr").}
proc getDeviceProcAddr*(
      device: Device;
      pName: cstring;
    ): PFN_VoidFunction {.cdecl, preload("vkGetDeviceProcAddr").}

template successCodes*(v: seq[Result]) {.pragma.}
template errorCodes*(v: seq[Result]) {.pragma.}
template queues*(v: QueueFlags) {.pragma.}
template cmdbufferlevel*(v: seq[CommandBufferLevel]) {.pragma.}