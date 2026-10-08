module RotationInts

include("impl.jl")
include("constants.jl")

export RotationInt
export Rot8, Rot16, Rot32, Rot64, Rot128
export degrees, radians
export from_degrees, from_radians

export FULL_ROTATION, HALF_ROTATION, QUARTER_ROTATION, EIGHTH_ROTATION, SIXTEENTH_ROTATION

end
