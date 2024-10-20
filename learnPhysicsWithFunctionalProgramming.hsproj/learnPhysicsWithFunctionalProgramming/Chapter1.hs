module Chapter1 where

deg2Rad :: Double -> Double
deg2Rad degrees = degrees * (pi/180)

rad2Deg :: Double -> Double
rad2Deg radians = radians * (180/pi)

-- 3
r x y = sqrt (x^2 + y^2)
theta x y = atan2 (y/x)

--5 
--- a < b < c === a < b AND b < c
--- and it could be comparison of boolean vs int