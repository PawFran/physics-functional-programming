import Data.Function ((&))
import Graphics.Gnuplot.Simple

type R = Double

--1 
polarToCart :: (R, R) -> (R, R)
polarToCart (r, theta) = (r * cos theta, r * sin theta)

--3
headSafe :: [a] -> Maybe a
headSafe []    = Nothing
headSafe (x:_) = Just x

--4 
maybeToList :: Maybe a -> [a]
maybeToList Nothing   = []
maybeToList (Just x)  = [x]

--6
zip' :: ([a], [b]) -> [(a, b)]
zip' (l, k) = zip l k

--9
x :: (R, R, R) -> R
x (r, theta, phi) = r * sin theta * cos phi

--10
tvPairs :: [(R, R)]
tvPairs = iterate tvUpdate (0, 0)
            where tvUpdate (t, v) = (t + 1, v + 5)


--11
fibHelper :: [(Int, Int)]
fibHelper = iterate (\(x, y) -> (y, x + y)) (0, 1)

fibonacci :: [Int]
fibonacci = map snd fibHelper

--12
factHelper :: [(Int, Int)]
factHelper = (0, 1) : iterate (\(x, y) -> (x + 1, y * (x + 1))) (1, 1)

fact :: Int -> Int
fact n = factHelper !! n & snd

--13
pick13 :: [(R, R, R)] -> [(R, R)]
pick13 triples = [(x, z) | (x, y, z) <- triples]

triples = [(x, y, z) | x <- [1..2], y<-[3..4], z<-[5..6]]

--14
g = 9.81
v0 = 15
rockCoordinates dt = iterate (\(t, x, v) -> (t + dt, x + v * dt - g*dt^2/2, v - g*dt)) (0, 0, 15)
rockInTheAir dt = takeWhile (\(t, x, v) -> x >= 0) (rockCoordinates dt)

--15
toTriple :: ((a, b), c) -> (a, b, c)
toTriple ((a, b), c) = (a, b, c)
