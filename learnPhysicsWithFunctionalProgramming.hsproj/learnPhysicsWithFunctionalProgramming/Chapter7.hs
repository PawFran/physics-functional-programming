module Chapter7 where
  
import Data.List
import Graphics.Gnuplot.Simple


--1
--doesn't compile, but works fine in console
plotFunc [] [-10,-9.99..10] sin

--2
g = 9.81
yRock30 t = 30*t - g*t^2/2
plotFunc [] [0,0.1..6] yRock30

--3
yRock :: R -> R -> R
yRock v0 t = v0*t - g*t^2/2

plotFunc [] [0,0.1..4] (yRock 20)