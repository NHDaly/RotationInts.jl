
abstract type AbstractRotation end

struct RotationInt{T<:Unsigned} <: AbstractRotation
    x::T
end

const Rot8 = RotationInt{UInt8}
const Rot16 = RotationInt{UInt16}
const Rot32 = RotationInt{UInt32}
const Rot64 = RotationInt{UInt64}
const Rot128 = RotationInt{UInt128}

function degrees(r::RotationInt{T}) where T
    return r.x / typemax(T) * 360
end
function radians(r::RotationInt{T}) where T
    return r.x / typemax(T) * 2π
end

function from_degrees(::Type{RotationInt{T}}, d::Number) where T
    return RotationInt{T}(round(T, d / 360 * typemax(T)))
end
function from_radians(::Type{RotationInt{T}}, r::Number) where T
    return RotationInt{T}(round(T, r / (2π) * typemax(T)))
end

Base.typemax(::Type{RotationInt{T}}) where T = RotationInt{T}(typemax(T))
Base.typemin(::Type{RotationInt{T}}) where T = RotationInt{T}(typemin(T))
Base.eps(::Type{RotationInt{T}}) where T = RotationInt{T}(one(T))

Base.:(*)(r::RotationInt{T}, i::Number) where T = RotationInt{T}(r.x * i)
Base.:(*)(i::Number, r::RotationInt{T}) where T = RotationInt{T}(r.x * i)
# Base.:(/)(r::RotationInt{T}, i::Number) where T = RotationInt{T}(r.x ÷ i)  # TODO: allow?
Base.:(÷)(r::RotationInt{T}, i::Number) where T = RotationInt{T}(r.x ÷ i)
Base.:(+)(a::RotationInt{T}, b::RotationInt{T}) where T = RotationInt{T}(a.x + b.x)
Base.:(-)(a::RotationInt{T}, b::RotationInt{T}) where T = RotationInt{T}(a.x - b.x)




