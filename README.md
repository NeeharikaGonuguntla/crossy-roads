# crossy-roads
UCSD CSE 230 Final Project -- Creating a crossy-roads game in Haskell using Brick library.


## Members
- Pujika Kumar
- Minh Vo
- Vaishnavi Muppala
- Neeharika Gonuguntla

## Proposal
The goal of our project is to recreate the popular Crossy Road game. The game features a road layout with moving cars. These cars can move in both directions and at varying speeds. To gain a good score, the player has to maneuver the chicken across the screen (perpendicular to the road) without being hit by the cars. The chicken can travel in all four directions: forward, backward, left, and right. It is an infinite game, and the player's goal is to achieve a high score. These instructions for navigation will be mentioned before the start of the game. The game gets progressively more challenging with each level, the difficulty being an increase in the number of cars and car speed. The game is over if the chicken is hit by one of the moving cars. Throughout the game, we will display various information to the player, such as the current score and level. When the game is over, we will reveal the game's final statistics, such as the final score and highest level obtained. 

## Update
### Key Components
The architecture of our game consists of a CrossyRoad class that represents a 21*21 game grid, a Model class encompassing our game model and a View class for our UI, a Control class for our game actions, and finally a Main class. We implemented these classes to fit the model of a real-time game where the chicken navigates in either of the four directions, based on the user input. But, we are still working on adding the cars within the grid and to end the game when the car hits the chicken.

### Libraries
- Brick Library
- vty
