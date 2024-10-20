import Data.Function ((&))

type R = Double

type Precision = R
type RealFunction = R -> R
type LowerLimit = R
type UpperLimit = R

integral :: Precision -> RealFunction -> LowerLimit -> UpperLimit -> R
integral dt f a b = sum [f t * dt | t <- [a + dt/2, a + 3*dt/2 .. b - dt/2]]

--1 
g = 9.81
yRock :: R -> R -> R
yRock v0 t = v0*t - g*t^2/2

vRock :: R -> R -> R
vRock v0 t = v0 - g*t

--4
greaterThanOrEq7 :: Int -> Bool
greaterThanOrEq7 x = x >=7

--9
repeat' = iterate id

--10
replicate' n x = repeat x & take n

--11
velocities = iterate (+5) 0

--12
map' :: (a -> b) -> [a] -> [b]
map' f xs = [f x | x <- xs]

--13
filter' :: (a -> Bool) -> [a] -> [a]
filter' p xs = [x | x <- xs, p x]

--14
average :: [Double] -> Double
average xs = sum xs / fromIntegral (length xs)

--15
trapIntegrate :: Int -> RealFunction -> R -> R -> R
trapIntegrate n f a b = (1/2 * f a + sum [f (a + (fromIntegral k)*dx) | k <- [1..n-1]] + 1/2 * f b) * dx
                            where dx = (b-a) / fromIntegral n

diff1 = (trapIntegrate 100 (\x -> x^3) 0 1) - 0.25
diff2 = (trapIntegrate 100 (\x -> x^3) 0 1e-6) - 2.5*10e-25
diff3 = (trapIntegrate 100 (\x -> exp (-x^2)) 0 1) - 0.7468