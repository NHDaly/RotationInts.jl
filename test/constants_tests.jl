@testitem "constant initialization" begin
    @test Rot8(FULL_ROTATION) == FULL_ROTATION % Rot8 == typemax(Rot8)
    @test Rot128(FULL_ROTATION) == FULL_ROTATION % Rot128 == typemax(Rot128)
    @test Rot8(HALF_ROTATION) == HALF_ROTATION % Rot8 == typemax(Rot8) ÷ 2
    @test Rot128(HALF_ROTATION) == HALF_ROTATION % Rot128 == typemax(Rot128) ÷ 2
    @test Rot8(QUARTER_ROTATION) == QUARTER_ROTATION % Rot8 == typemax(Rot8) ÷ 4
    @test Rot128(QUARTER_ROTATION) == QUARTER_ROTATION % Rot128 == typemax(Rot128) ÷ 4
    @test Rot8(EIGHTH_ROTATION) == EIGHTH_ROTATION % Rot8 == typemax(Rot8) ÷ 8
    @test Rot128(EIGHTH_ROTATION) == EIGHTH_ROTATION % Rot128 == typemax(Rot128) ÷ 8
    @test Rot8(SIXTEENTH_ROTATION) == SIXTEENTH_ROTATION % Rot8 == typemax(Rot8) ÷ 16
    @test Rot128(SIXTEENTH_ROTATION) == SIXTEENTH_ROTATION % Rot128 == typemax(Rot128) ÷ 16
end

@testitem "constant arithmetic" begin
    @test Rot8(FULL_ROTATION ÷ 2) == HALF_ROTATION % Rot8
    @test Rot8(FULL_ROTATION ÷ 4) == QUARTER_ROTATION % Rot8
    @test Rot8(FULL_ROTATION ÷ 8) == EIGHTH_ROTATION % Rot8
    @test Rot8(FULL_ROTATION ÷ 16) == SIXTEENTH_ROTATION % Rot8

    # NOTE: We cannot exactly reverse the above:
    # HALF*2 does not exactly equal FULL due to Unsigned integers having an odd typemax

    # TODO: Support approximately equal
    # @test Rot8(HALF_ROTATION * 2) ≈ FULL_ROTATION % Rot8

    @test Rot8(HALF_ROTATION * 2) + eps(Rot8) == FULL_ROTATION % Rot8
end
