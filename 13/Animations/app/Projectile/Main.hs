module Main (main) where

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

type Position = (Float, Float)
type Velocity = (Float, Float)
type State = (Position, Velocity)

initialState :: State
initialState = ((-200, -100), (40, 80))

displayFunc :: State -> Picture
displayFunc ((x,y), _) = Translate x y redDisk

updateFunc :: Float -> State -> State
updateFunc dt ((x,y), (vx, vy)) = ((x + vx * dt, y + vy * dt)
                                  ,(vx         , vy - 9.8 * dt)
                                  )
main :: IO ()
main = simulate displayMode black rate initialState displayFunc (const updateFunc)