module Main where 

import Vis
import Linear
import SpatialMath

type R = Float

baseAxes :: [VisObject Float]
baseAxes =  [Line Nothing [V3 0 0 0 , V3 1 0 0] red
            ,Line Nothing [V3 0 0 0 , V3 0 1 0] green
            ,Line Nothing [V3 0 0 0 , V3 0 0 1] blue
            ]

translation :: R -> R -> R -> VisObject R -> VisObject R 
translation x y z = Trans $ V3 x y z

axes1 :: [VisObject R]
axes1 = map upperLeftCorner baseAxes
            where upperLeftCorner = Trans $ V3 (-2) 2 0

axes :: VisObject Float
axes = VisObjects $ baseAxes  ++ axes1

axesRotation :: (Float, Float, Float) -> Float -> VisObject Float
axesRotation (x, y, z) t = RotEulerDeg (Euler (t*x) (t*y) (t*z)) axes

main :: IO ()
main = animate defaultOpts $ axesRotation (50, 10, 20)
