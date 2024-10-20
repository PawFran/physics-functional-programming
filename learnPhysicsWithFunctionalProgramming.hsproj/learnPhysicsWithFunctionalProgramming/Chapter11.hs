module Chapter11 where

import Graphics.Gnuplot.Simple
import Data.Function ((&))

type R = Double

--1 
plot1 :: IO ()
plot1 = plotFunc [Title "y=x^2", XLabel "xs", YLabel "ys"] [-3, -2.9 .. 3 :: Double] (^2)

--2
plot2 = plotFuncs [] [0, 0.1 .. 10 :: Double] [cos, sin]

--3
ts = [0, 0.1 .. 6 :: Double]

txPairs :: [(R, R)]
txPairs = [(t, 30*t - 4.9 * t**2) | t <- ts]

plot3 = plotPath [Title "plot 3", XLabel "Time (s)", YLabel "Position (m)"] txPairs

--4
-- sin approx by Taylor series

factorial :: Int -> Int
factorial n = product [1..n]

approxsin :: R -> R
approxsin x = x - (x^3 / fact 3) + (x^5 / fact 5) - (x^7 / fact 7)
                where fact = fromIntegral . factorial

xs = [-4, -3.99 .. 4 :: Double]

sinPath :: [(R, R)]
sinPath = [(x, sin x) | x <- xs]

approxPath :: [(R, R)]
approxPath = [(x, approxsin x) | x <- xs]

plot4 = plotPathsStyle [Title "sin approximation by Taylor Series", XLabel "xs", YLabel "ys"] [ (defaultStyle {lineSpec = CustomStyle [LineTitle "sin x"]}, sinPath)
                          , (defaultStyle {lineSpec = CustomStyle [LineTitle "approximation"]}, approxPath)
                          ]
