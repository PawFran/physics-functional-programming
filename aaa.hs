import Data.Function ((&))

--1
myOr :: [Bool] -> Bool
myOr = foldr (||) False

-- [[a, b] | a <- [True, False], b <- [True, False]] & map myOr

--2 
-- myAny :: (a -> Bool) -> [a] -> Bool
-- myAny f l :: foldr (f . (||)) $ l
