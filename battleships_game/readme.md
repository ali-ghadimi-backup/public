# Battleships
The first game I have ever made! The famous Battleships is a simple game developed in Python.
The project was the Principles of Programming I module coursework, one of the MSC Data Science compulsory modules I passed in 2020.

## Implementaion
I used sets to brute force the random position of the fleet with all the described restrictions; the program works fine; there is a separate test.py containing tests with pytest for almost all of the functions.

# About the game:
 
Each player has a fleet and an ocean (hidden from the other player), and tries to be the first to sink the other player's fleet.
In this project, you play with the computer.

The Ocean is a field of 10 x 10 squares. The squares are numbered from 0 to 9 in each dimension, with numbers increasing from top to bottom and from left to right.

The fleet consists of 10 ships. The fleet is made up of 4 different types of ships, each of varying size as follows:

- One battleship occupying 4 squares
- Two cruisers, each occupying 3 squares
- Three destroyers, each occupying 2 squares
- Four submarines, each occupying 1 square

The computer randomly places all the ten ships of the fleet in the Ocean to start the game. Each vessel can be placed either horizontally or vertically.

No ships may be immediately adjacent, either horizontally, vertically, or diagonally.

The human player does not know where the ships are. The human player tries to hit the ships by calling out a row and column number.

The computer responds with one bit of information: "You have a hit!" or "You missed!". The human player can call out the same location more than once

When a ship is hit but not sunk, the program does  **not**  provide any information about what kind of a ship was hit.
However, when a ship is hit  _and_  sinks, the program prints out a message  `"You sank a  _ship-type_!"`  

A ship is "sunk" when every square of the ship has been hit. Thus, it takes four hits (in four different places) to sink a battleship, three to sink a cruiser, two for a destroyer, and one for a submarine. The objective is to sink the fleet with as few shots as possible; the best possible score would be 20. (Low scores are better.) When all ships have been sunk, the program prints out a message that the game is over and tells how many shots were required.






