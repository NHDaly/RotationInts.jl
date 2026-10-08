
struct RotationConstant{Amount} end

const FULL_ROTATION = RotationConstant{:FULL_ROTATION}()
const HALF_ROTATION = RotationConstant{:HALF_ROTATION}()
const QUARTER_ROTATION = RotationConstant{:QUARTER_ROTATION}()
const EIGHTH_ROTATION = RotationConstant{:EIGHTH_ROTATION}()
const SIXTEENTH_ROTATION = RotationConstant{:SIXTEENTH_ROTATION}()

Base.show(io::IO, ::RotationConstant{Amount}) where Amount = print(io, Symbol(Amount))

function RotationInt{T}(::RotationConstant{:FULL_ROTATION}) where (T<:Unsigned)
    return RotationInt{T}(typemax(T))
end
function RotationInt{T}(::RotationConstant{:HALF_ROTATION}) where (T<:Unsigned)
    return RotationInt{T}(typemax(T) ÷ 2)
end
function RotationInt{T}(::RotationConstant{:QUARTER_ROTATION}) where (T<:Unsigned)
    return RotationInt{T}(typemax(T) ÷ 4)
end
function RotationInt{T}(::RotationConstant{:EIGHTH_ROTATION}) where (T<:Unsigned)
    return RotationInt{T}(typemax(T) ÷ 8)
end
function RotationInt{T}(::RotationConstant{:SIXTEENTH_ROTATION}) where (T<:Unsigned)
    return RotationInt{T}(typemax(T) ÷ 16)
end
function Base.:(%)(c::RotationConstant, ::Type{R}) where (R<:RotationInt)
    return R(c)
end


struct RotationConstantMultiplier{Amount, Num<:Number}
    multiplier::Num
end

function Base.show(io::IO, c::RotationConstantMultiplier{Amount}) where Amount
    print(io, c.multiplier, " * ", RotationConstant{Amount}())
end

Base.:(*)(::RotationConstant{Amount}, m::Num) where {Amount, Num<:Number} = RotationConstantMultiplier{Amount, Num}(m)
Base.:(*)(m::Num, ::RotationConstant{Amount}) where {Amount, Num<:Number} = RotationConstantMultiplier{Amount, Num}(m)
Base.:(/)(::RotationConstant{Amount}, m::Num) where {Amount, Num<:Integer} = RotationConstantMultiplier{Amount, Rational{Num}}(1 // m)
Base.:(÷)(::RotationConstant{Amount}, m::Num) where {Amount, Num<:Integer} = RotationConstantMultiplier{Amount, Rational{Num}}(1 // (m÷1))
Base.:(/)(::RotationConstant{Amount}, m::Num) where {Amount, Num<:AbstractFloat} = RotationConstantMultiplier{Amount, Num}(1 / m)
Base.:(÷)(::RotationConstant{Amount}, m::Num) where {Amount, Num<:AbstractFloat} = RotationConstantMultiplier{Amount, Num}(1 / (m÷1))

function RotationInt{T}(c::RotationConstantMultiplier{Amount, Num}) where {T<:Unsigned, Amount, Num<:Number}
    # TODO: Or should it be round?
    return RotationInt{T}(floor(c.multiplier * RotationInt{T}(RotationConstant{Amount}()).x))
end

