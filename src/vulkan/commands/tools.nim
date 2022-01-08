import ../basetypes
import ../handles
import ../enums
import ../objects
import loadercomponents
import commandloaders

import ../objects/tools as objecttools
import ../objects/temp_externalobjects

export basetypes
export handles
export enums
export objects
export loadercomponents
export commandloaders

export objecttools
export temp_externalobjects


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