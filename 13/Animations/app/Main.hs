{-# OPTIONS -Wall #-}

module Main (main) where

import Vis (defaultOpts, display) -- use it only for 3d display, otherwise comment out
-- import Graphics.Gloss

-- import TwoDPictures.Lines (displayModeAxes, axes)
-- import TwoDPictures.DiskAndCircle (displayModeDisk, wholePicture)
-- import TwoDAnimations.SimpleDisk (displayMode, rate, initialState, displayFunc, updateFunc)
-- import TwoDAnimations.Projectile (displayMode, rate, initialState, displayFunc, updateFunc)
import ThreeDPictures.BlueCube (blueCube)
import ThreeDPictures.CoordinateSystem (axes, orient)

main :: IO ()
main = -- for those import Gloss
       -- display displayModeAxes black axes
       -- display displayModeDisk black wholePicture
       -- simulate displayMode black rate initialState displayFunc (const updateFunc) -- the same calling for simple animation and projectile motion. choose proper import
       
       -- for those import Vis
       -- display defaultOpts blueCube
       -- display defaultOpts axes
       display defaultOpts $ orient axes
