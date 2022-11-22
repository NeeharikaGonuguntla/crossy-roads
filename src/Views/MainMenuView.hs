module Views.MainMenuView where

import Brick

import Brick.Widgets.Center (center)

import Text.Printf

import CrossyRoad
import Views.ViewHelper

mainMenuView :: CrossyRoad -> [Widget String]
mainMenuView g = [mainMenuView' g]

mainMenuView' :: CrossyRoad -> Widget String
mainMenuView' g = createWindow (vTile [ center (title (maxScore g)) ])

title:: Int -> Widget n
title s = vBox [ str "....@@@@@@@&/......................................................................................"
               , str "..@@@@@@@@@@@@@@@@@@@&,............................................................................"
               , str ".@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%..................................................................."
               , str "@@@  %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(........................................................."
               , str "@/            &@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@................................................"
               , str "@*    ,@@@@@@@@@@       /@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&*....................................."
               , str "@*    ,@@@@@@@@@@     @@#    (@@@@%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&............................"
               , str "@/    ,@@@@@@@@@@       ,     @@/          ,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(.................."
               , str ".&@@@%.       &@@     @@%   ,@@@/    .@@     #@@*.   (@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/.....,#%"
               , str "........*%@@@@@@@     @@@     @@/    .@@     #@@     #.      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
               , str ".............../@.%@@@@@@/    @@/    .@@     #@@&    ,&@@@@@@@@#        ,&@@@@@@@@@@@@@@@@@@@@@@@@@"
               , str ".............../@          *@@@@@@&.         #@@@@@@@@.    .@@@#     @@@@.  /@@   /@@@@@@@@@@@@@@@@"
               , str ".............../@     @@@     @@#@   #@@@@@@@@@@      %@     @@@@        %@@@@@     @@@     @@@@@@@"
               , str ".............../@             @@/           @@@@@@@@@@*      @@%&@@@@@@     *@@     @@@     @@@@@@,"
               , str ".............../@     @@@   .@@@/    .@@     #@@        *@@@@@@&,           /@@@@@%         @@@@@.."
               , str ".............../@@%   @@@     @@/    .@@     #@@     @@@     @@#  (@@@@@@# @@@@@@@@     @@@@@@@/..."
               , str ".....................,&@@@@@( @@@,    &@     #@@             @@#           @@@@@@@@*    @@@@@......"
               , str ".............................../@@@@@@,      #@@     @@@     @@#     @@     /@@@@@@....#@@@........"
               , str ".........................................#@@@@@@.    @@@     @@#     @@     /@@@@@@................"
               , str "..................................................,%@@@@@(   @@#     @@     /@@@@@/................"
               , str "............................................................,@@@@@&,        /@@@@.................."
               , str "....................................................................../@@@@@@@@#..................."
               , str " "
               , str "Press Enter to start"
               , str "Press Space to pause"
               , str "Press Esc to quit"
               , str " "
               , str (printf "High score: %d" s)]