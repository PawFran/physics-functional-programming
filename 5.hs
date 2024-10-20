import Data.Function ((&))

--1
l = [-2, -1.2..2.0]

--2
sndItem :: [a] -> a
sndItem lst = if null lst
                then error "Empty list has no second item"
              else if length lst == 1
                then error "1-item list has no 2nd item"
              else
                lst !! 1

--6
last' :: [a] -> a
last' = head . reverse

--7
palindrome :: String -> Bool
palindrome x = x == reverse x

--9
cycle' :: [a] -> [a]
cycle' = concat . repeat
--cycle' x = repeat x & concat

--12
diff k = pi - approx 
                where approx = sum [1/n^2 | n <- [1..k]] & (*) 6 & sqrt

--13
fact :: Integer -> Integer
fact 1 = 1
fact n = n * fact(n-1)

fact2 :: Integer -> Integer
fact2 n = product [1..n]

--14
expList :: Double -> [Double]
expList x = [(1 + x/n)**n | n <- [1..]]

percentApproxs base approximationFunction = [(exp base - x) / exp base | x <- approximationFunction base]
desiredIterations base approximationFunction = takeWhile (\x -> x > 0.1) (percentApproxs base approximationFunction) & length & (+) 1

-- desiredIterations 1 expList
-- desiredIterations 10 expList

--15
seriesAsSequence :: [Double] -> [Double]
seriesAsSequence baseSequence = [take n baseSequence & sum | n <- [1..]]

factorial m = fromIntegral (product [1..m])
expSeries :: Double -> [Double]
expSeries x = seriesAsSequence [x^m / factorial m | m <- [0..]]

-- desiredIterations 1 expSeries
-- desiredIterations 10 expSeries