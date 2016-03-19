module ErrorfreeArithmetic

import Base: (+),(-),(*),fma

export eftIncr, eftDecr, eftSqr,          # single
       eftAdd, eftSub, eftMul,            # double
       eftAdd3, eftMul3,                  # triple
       eftAdd3to2, eftMul3to4, eftMult3to2,
       eftFMA, eftFMA, eftFMAto2, eftFMSto2

include "single.jl"
include "double.jl"
include "triple.jl"

end # module
