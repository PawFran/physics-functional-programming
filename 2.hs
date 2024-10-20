import Data.Function ((&))

-- 1
f1 :: Double -> Double
f1 x = sqrt (1 + x)

f2 :: Double -> Double
f2 = sqrt . (+) 1

f3 :: Double -> Double
f3 x = x & (+) 1 & sqrt
-- h = (+) 1 & sqrt - why doesn't work ?

-- 2
g = 9.81
type Time = Double
yRock30 :: Time -> Double
yRock30 t = v0*t - g*t^2/2
                where v0 = 30

-- 3
vRock30 :: Time -> Double
vRock30 t = 30 - g*t

-- 4
radians :: Double -> Double
radians = (*) (pi/180)

sinDeg :: Double -> Double
sinDeg x = sin . radians $ x

-- 5
f x = x ** (1/3)
-- f = (**) (1/3) doesn't work as intended because it's (1/3)**x not x**(1/3)
-- f = flip (**) (1/3)
-- f = (** (1/3))
g1 x = exp x + 8**x
h x = 1 / (sqrt $ (x-5)^2 + 16)
gamma x = 1 / sqrt(1 - x^2)
u x = 1 / (10 + x) + 1 / (10 - x)
l x = sqrt $ x*(x+1)
e x = 1 / (abs x ^ 3)
e2 x = 1 / (x^2 + 4)**(3/2)

-- 6
gamma2 = \x -> 1 / sqrt(1 - x^2)