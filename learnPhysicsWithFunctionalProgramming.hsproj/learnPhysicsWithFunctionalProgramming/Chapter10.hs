module Chapter10 where

import SimpleVec
import Graphics.Gnuplot.Simple
import Data.Function ((&))

type R = Double
type Time = R
type StepSize = R
type VectorValuedFunction = R -> Vec
type RealFunction = R -> R
type LowerLimit = R
type UpperLimit = R
type PosVec = Vec
type Velocity = Vec
type Acceleration = Vec

--1
v0 = 20*^iHat
v1 = 20*^iHat ^-^ 9.8*^kHat

v :: Time -> Vec
v t = 20*^iHat ^-^ (9.8*t)*^kHat

r :: Time -> Vec
r t = 30*^jHat ^+^ (20*t)*^iHat ^-^ (4.9*t^2)*^kHat

x :: Time -> Double
x t = iHat <.> r t

--2
integral :: StepSize -> RealFunction -> LowerLimit -> UpperLimit -> R
integral dt f a b = sum [f t * dt | t <- [a + dt/2, a + 3*dt/2 .. b - dt/2]]

vecIntegral :: StepSize -> VectorValuedFunction -> LowerLimit -> UpperLimit -> Vec
vecIntegral dt f a b = Vec x y z
                        where x = integral dt (xComp . f) a b
                              y = integral dt (yComp . f) a b
                              z = integral dt (zComp . f) a b

-- vecIntegral 0.1 r 0 2 should be close to Vec 40 60 (-13.07)

--3
g = 9.81
maxHeight :: PosVec -> Velocity -> R
maxHeight (Vec _ _ z) (Vec _ _ vz) = z + vz^2/(2*g)

--4
speedCA :: Velocity -> Acceleration -> Time -> R
--speedCA v a = \t -> magnitude $ v ^+^ a ^* t
speedCA v a t = magnitude $ v ^+^ a ^* t -- the same in fact

--5
projectileVel :: Velocity -> Time -> Velocity
projectileVel (Vec v0x v0y v0z) t = Vec vx vy vz
                                        where vx = v0x
                                              vy = v0y
                                              vz = v0z - g*t

--6
-- ???

--7
xyProj :: Vec -> Vec
xyProj (Vec x y _) = Vec x y 0

--8
magAngles :: Vec -> (R, R, R)
magAngles v = (magnitude v, theta, phi)
                where theta = atan $ sqrt (vx^2 + vy^2) / vz
                      phi = atan $ vy/vx
                      vx = xComp v
                      vy = yComp v
                      vz = zComp v

-- magAngles $ Vec (-1) (-2) (-3) - why result is wrong ???

--9
gEarth = Vec 0 (-9.8) 0
theta = 52*pi/180
speed = 25
vInitialVec = Vec (speed * cos theta) (speed * sin theta) 0

vBall :: R -> Vec
vBall t = vInitialVec ^+^ gEarth^*t

speedRateChange :: Vec -> Vec -> R
speedRateChange v a = (v <.> a) / magnitude v

speedRateChangeBall :: R -> R
speedRateChangeBall t = speedRateChange v a
                            where v = vBall t
                                  a = gEarth 

timeWithZeroRate = [(t, speedRateChangeBall t) | t <- [0, 0.0001 ..]] & dropWhile ((<0) . snd) & head & fst
-- vBall timeWithZeroRate & magnitude

plot = plotFunc [] [0,0.1..4] (speedRateChangeBall)

--10
radius = 2
w = 6

rUCM :: Time -> Vec
rUCM t = radius *^ Vec ( cos (w*t) ) ( sin (w*t) ) 0

vUCM :: Time -> Vec
vUCM t = (w*radius) *^ Vec ( - sin(w*t) ) ( cos(w*t) ) 0

aUCM :: Time -> Vec
aUCM t = (- w^2 * radius) *^ Vec ( cos(w*t) ) ( sin(w*t) ) 0

--- tangential component of acceleration should be 0
aParallel :: Vec -> Vec -> Vec
aParallel v a = let vHat = v ^/ magnitude v
                in (vHat <.> a) *^ vHat
-- small difference possible due to using Double
--maximum [( magnitude $ aParallel (vUCM t) (aUCM t) ) | t <- [0, 0.1 .. 100]]

--- perpendicular component of acceleration should be w^2 * radius = 72
aPerp :: Vec -> Vec -> Vec
aPerp v a = a ^-^ aParallel v a

-- small difference possible due to using Double
-- [aPerp (vUCM t) (aUCM t) | t <- [0, 0.1 .. 100]] & map (\x -> abs (magnitude x - 72)) & maximum

--11
rNCM :: (R, R -> R) -> R -> Vec
rNCM (radius, theta) t = radius *^ Vec ( cos (theta t) )( sin (theta t) ) 0

-- ...
