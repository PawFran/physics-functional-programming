module Main where 

import Vis
import SpatialMath

rotatingCube :: Float -> VisObject Float
rotatingCube t = RotEulerRad (Euler 0 0 t) (Cube 1 Solid blue)

orient :: VisObject Float -> VisObject Float
orient = RotEulerDeg (Euler 270 180 0) 

main :: IO ()
main = animate defaultOpts (orient . rotatingCube)