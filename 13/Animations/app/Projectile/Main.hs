module Main where

import Graphics.Gloss

-- in window or full screen
displayMode :: Display
displayMode = InWindow "My Window" (1000, 700) (10, 10)

-- updates per second. the higher value, the smoother the motion is
rate :: Int
rate = 30 -- 2 is discrete; but not much difference (if any!) between 30 and 30000

disk :: Float -> Picture
disk radius = ThickCircle (radius / 2) radius

redDisk :: Picture
redDisk = Color red (disk 25)

type State = (Float, Float)

initialState :: State
initialState = (-100, -100)

displayFunc :: State -> Picture
displayFunc (x, y) = Translate x y redDisk

updateFunc :: Float -> State -> State
updateFunc dt (x, y) = (x + 10 * dt * speed, y - 5 * dt * speed)
                            where speed = 10 -- dt is pixel/second

main :: IO ()
main =  simulate displayMode black rate initialState displayFunc (const updateFunc)
