module Chapter3 where

--2 
f :: Double -> Double
f x = if x <= 0
      then 0
      else x

e r = if r <= 1
      then r
      else 1/r^2

--3
isXorY :: Char -> Bool
isXorY x = x == 'X' || x == 'Y'

--4
bagFee :: Bool -> Int
bagFee checking = if checking
                  then 100
                  else 0

bagFee2 :: Bool -> Int
bagFee2 checking = case checking of
                    True -> 100
                    False -> 0

bagFee3 :: Bool -> Int
bagFee3 True = 100
bagFee3 False = 0

bagFee4 :: Bool -> Int
bagFee4 checking | checking == True  = 100
                 | checking == False = 0

--5
greaterThan50 :: Integer -> Bool
-- greaterThan50 = (<) 50
greaterThan50 = flip (>) 50

--6 
amazingCurve :: Int -> Int
--amazingCurve x = min 100 (2*x)
amazingCurve = min 100 . (*) 2

--9
-- 2 ^ (2^n) where n is number of args
-- so 2^4=16 for Bool->Bool and (2^8)=256 for Bool->Bool->Bool

--10
--True || False && False || False
--( True || (False && False) || False ) /= ( (True || False) && (False || False) )
