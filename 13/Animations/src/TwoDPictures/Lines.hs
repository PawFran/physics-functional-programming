module TwoDPictures.Lines (displayModeAxes, axes) where

import Graphics.Gloss

displayModeAxes :: Display
displayModeAxes = InWindow "Axes" (1000, 700) (10, 10)

axes :: Picture
axes = Pictures [Color red   $ Line [(0, 0), (100,  0)]
                ,Color green $ Line [(0, 0), (0,  100)]
                ]
