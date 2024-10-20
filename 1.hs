-- 1
print $ sin 30

radians :: Double -> Double
radians degrees = degrees * (pi/180)

print $ sin (radians 30)

--2
2 ^ 3 ^ 4 == 2 ^ (3 ^ 4)
2 / 3 / 4 == (2 / 3) / 4
7 - 5 / 4 == 7 - (5 / 4)
log 49/7 == (log 49) / 7

-- 3
r x y = sqrt (x^2 + y^2)
theta x y = atan2 (y/x)

--4
(sqrt 2) ** 2

--5 
--- a < b < c === a < b AND b < c
--- and it could be comparison of boolean vs int