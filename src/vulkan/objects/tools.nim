import ../enums/enumdefs
import ../handles
import ../basetypes

template optional* {.pragma.}
template constant*(v: typed) {.pragma.}

template length*(v: untyped) {.pragma.}

export enumdefs
export handles
export basetypes