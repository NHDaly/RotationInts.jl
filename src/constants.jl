
struct RotationConstant{AmountName} end

const FULL_ROTATION = RotationConstant{:FULL}()
const HALF_ROTATION = RotationConstant{:HALF}()
const QUARTER_ROTATION = RotationConstant{:QUARTER}()
const EIGHTH_ROTATION = RotationConstant{:EIGHTH}()
const SIXTEENTH_ROTATION = RotationConstant{:SIXTEENTH}()

Base.:(*)()
