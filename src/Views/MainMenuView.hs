module Views.MainMenuView where

import Brick

import Brick.Widgets.Center (center)

import Text.Printf

import CrossyRoad
import Views.ViewHelper

mainMenuView :: CrossyRoad -> [Widget String]
mainMenuView g = [mainMenuView' g]

mainMenuView' :: CrossyRoad -> Widget String
mainMenuView' g = createWindow (vTile [ center title, instructions, score (maxScore g) ])

title, instructions :: Widget n
title = vBox [ str "....@@@@@@@&/......................................................................................"
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
             , str "....................................................................../@@@@@@@@#..................."]

instructions = vBox [ str "Press Enter to start"
                    , str "Press Q to exit back to Main Menu"
                    , str "Press Esc to quit"]

score :: Int -> Widget n
score s = vBox [ str (printf "High score: %d" s)]