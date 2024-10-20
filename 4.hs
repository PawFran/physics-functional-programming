type R = Double

type Time           = R
type Position       = R
type Velocity       = R
type Acceleration   = R

type Precision      = R
type RealFunction   = R -> R

derivative :: Precision -> RealFunction -> RealFunction
derivative dt f x = ( f(x + dt/2) - f(x - dt/2) ) / dt

--5 
pos :: Time -> Position
pos t = if t < 0
        then 0
        else 5*t^2

velAnalytic :: Time -> Velocity
velAnalytic t = if t < 0
                then 0
                else 10*t

accAnalytic :: Time -> Acceleration
accAnalytic t = if t < 0
                then 0
                else 10*t

velNumerical :: Time -> Velocity
velNumerical t = derivative 0.1 pos t

accNumerical :: Time -> Acceleration
accNumerical t = derivative 0.1 velNumerical t

diffVel x = velAnalytic x - velNumerical x
-- diffVel 1e10
diffAcc x = accAnalytic x - accNumerical x
-- diffAcc 5
