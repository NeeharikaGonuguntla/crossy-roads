module Views.ViewHelper where

import Brick

import Brick.Widgets.Border (borderWithLabel, hBorder)
import Brick.Widgets.Border.Style (unicode)

createWindow :: Widget String -> Widget String
createWindow w = 
  withBorderStyle unicode (
    borderWithLabel (str "Crossy Road") w)

vTile :: [Widget n] -> Widget n
vTile (b:bs) = vBox (b : [hBorder <=> b | b <- bs])
vTile _      = emptyWidget

hTile :: [Widget n] -> Widget n
hTile (b:bs) = hBox (b:bs)
hTile _      = emptyWidget