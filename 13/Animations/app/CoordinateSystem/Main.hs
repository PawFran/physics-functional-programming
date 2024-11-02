module Main where 

import Vis
import Linear
import SpatialMath

type R = Double

orient :: VisObject R -> VisObject R 
orient = RotEulerDeg (Euler 270 180 0)

axes :: VisObject R
axes = VisObjects [Line Nothing [V3 0 0 0 , V3 1 0 0] red
                       ,Line Nothing [V3 0 0 0 , V3 0 1 0] green
                       ,Line Nothing [V3 0 0 0 , V3 0 0 1] blue
                       ]

main :: IO ()
main = display defaultOpts $ orient axes 