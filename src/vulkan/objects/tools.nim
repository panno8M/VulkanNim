import ../enums/enumdefs
import ../handles/handle_concretes
import ../basetypes

template optional* {.pragma.}
template constant*(v: typed) {.pragma.}

template length*(v: untyped) {.pragma.}

export enumdefs
export handle_concretes
export basetypes