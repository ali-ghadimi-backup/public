#see the readme.md file for description and data 


"""
The fleet consists of 10 ships. The fleet is made up of 4 different types of ships, each of different size as follows:

One battleship, occupying 4 squares
Two cruisers, each occupying 3 squares
Three destroyers, each occupying 2 squares
Four submarines, each occupying 1 square


ship = (row, column, horizontal (T/F), length, hits = {(row, column)})

fleet = [ship1, ship2, ship3, ship4, ship5, ship6, ship7, ship8, ship9, ship10]




is_open_sea(row, column, fleet) -- checks if the square given by row and column neither contains nor is adjacent (horizontally, vertically, or diagonally) to some ship in fleet.
Returns Boolean True if so and False otherwise


ok_to_place_ship_at(row, column, horizontal, length, fleet)-- checks if addition of a ship, specified by row, column, horizontal, and
length as in ship representation above, to the fleet results in a legal arrangement (see the figure above).
If so, the function returns Boolean True and it returns False otherwise. This function makes use of the function is_open_sea

place_ship_at(row, column, horizontal, length, fleet) -- returns a new fleet that is the result of adding a ship, specified by row, column,
horizontal, and length as in ship representation above, to fleet. It may be assumed that the resulting arrangement of the new fleet is legal

randomly_place_all_ships() -- returns a fleet that is a result of a random legal arrangement of the 10 ships in the ocean.
This function makes use of the functions ok_to_place_ship_at and place_ship_at



"""

# Importing required libraries

import random


# Global Veriables

fleet = []



# find the random place of the fleet:


def randomly_place_all_ships():
    import random
    ship = tuple()
    ship_dimention = [4, 3, 3, 2, 2, 2, 1, 1, 1, 1]
    counter = 0

    for j in ship_dimention:
        counter += 1
        check = False
        while check != True:
            row = random.randint(0, 9)
            column = random.randint(0, 9)
            horizontal = bool(random.getrandbits(1))
            length = int(j)
            check = ok_to_place_ship_at(row, column, horizontal, length, fleet)
            if check == True:
                fleet.append( (row, column, horizontal, length) )
            

# Check the corners + using is_open_sea to check if it's legal to place the ship

def ok_to_place_ship_at(row, column, horizontal, length, fleet):
    if ( horizontal == True and row + (length-1) <= 9 ) or ( horizontal != True and column + (length-1) <= 9 ):
        return True
    #elif horizontal != True and column + (length-1) <= 9:
    #    return True
    else:
        return False



def is_open_sea(row, column, fleet):




    pass



def place_ship_at(row, column, horizontal, length, fleet):
    #remove pass and add your implementation
    pass

def is_sunk(a, b):
    #remove pass and add your implementation
    pass

def ship_type(a, ship_type):
    #remove pass and add your implementation
    if len(ship_type) == 1:
        return "submarine"
    elif len(ship_type) == 2:
        return "destroyer"
    elif len(ship_type) == 3:
        return "cruiser"
    elif len(ship_type) == 4:
        return "battleship"






def check_if_hits(row, column, fleet):
    #remove pass and add your implementation
    pass

def hit(row, column, fleet):
    #remove pass and add your implementation
    pass

def are_unsunk_ships_left(fleet):
    #remove pass and add your implementation
    pass

def main():
    #the implementation provided below is indicative only
    #you should improve it or fully rewrite to provide better functionality (see readme file)

    current_fleet = randomly_place_all_ships()

    game_over = False
    shots = 0

    while not game_over:
        loc_str = input("Enter row and colum to shoot (separted by space): ").split()    
        current_row = int(loc_str[0])
        current_column = int(loc_str[1])
        shots += 1
        if check_if_hits(current_row, current_column, current_fleet):
            print("You have a hit!")
            (current_fleet, ship_hit) = hit(current_row, current_column, current_fleet)
            if is_sunk(ship_hit):
                print("You sank a " + ship_type(ship_hit) + "!")
        else:
            print("You missed!")

        if not are_unsunk_shis_left(current_fleet): game_over = True

    print("Game over! You required", shots, "shots.")


if __name__ == '__main__': #keep this in
   main()
