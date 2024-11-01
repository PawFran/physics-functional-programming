{-# OPTIONS -Wall #-}

module SimpleVec where

infixl 6 ^+^
infixl 6 ^-^
infixr 7 *^
infixl 7 ^*
infixr 7 ^/
infixr 7 <.>
infixl 7 ><

data Vec = Vec { xComp :: Double
               , yComp :: Double
               , zComp :: Double
               } deriving Eq

-- deriving gives default implementations: ex, Eq, Show, but also Ord. what is default implementation for Ord in such case ?

showDouble :: Double -> String
showDouble x | x < 0     = "(" ++ show x ++ ")"
             | otherwise = show x

instance Show Vec where
    show (Vec x y z) = "Vec " ++ showDouble x ++ " "
                              ++ showDouble y ++ " "
                              ++ showDouble z

type R = Double
type PosVec = Vec
type Velocity = Vec
type Acceleration = Vec
type Time = R

iHat :: Vec
iHat = Vec 1 0 0

jHat :: Vec
jHat = Vec 0 1 0

kHat :: Vec
kHat = Vec 0 0 1

zeroV :: Vec
zeroV = Vec 0 0 0

negateVec :: Vec -> Vec
negateVec (Vec a b c) = Vec (-a) (-b) (-c)

(^+^) :: Vec -> Vec -> Vec
Vec ax ay az ^+^ Vec bx by bz = Vec (ax + bx) (ay + by) (az + bz)

(^-^) :: Vec -> Vec -> Vec
Vec ax ay az ^-^ Vec bx by bz = Vec (ax - bx) (ay - by) (az - bz)

sumV :: [Vec] -> Vec
sumV = foldr (^+^) zeroV

(*^) :: Double -> Vec -> Vec
x *^ Vec a b c = Vec (x*a) (x*b) (x*c)

(^*) :: Vec -> Double -> Vec
Vec a b c ^* x = Vec (x*a) (x*b) (x*c)

(<.>) :: Vec -> Vec -> Double
Vec ax ay az <.> Vec bx by bz = ax*bx + ay*by + az*bz

(><) :: Vec -> Vec -> Vec
Vec ax ay az >< Vec bx by bz = Vec (ay*bz - az*by) (az*bx - ax*bz) (ax*by - ay*bx)

(^/) :: Vec -> Double -> Vec
v ^/ x = v ^* (1/x)

magnitude :: Vec -> Double
magnitude v = sqrt (v <.> v)

positionCA :: PosVec -> Velocity -> Acceleration -> Time -> PosVec
positionCA r0 v0 a0 t = 0.5 *^ t**2 *^ a0 ^+^ v0 ^* t ^+^ r0

projectilePos :: PosVec -> Velocity -> Time -> Vec
projectilePos r0 v0 = positionCA r0 v0 g
                        where g = 9.81 *^ negateVec kHat
