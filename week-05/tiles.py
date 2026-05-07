#   5) You are going to tile a room whose dimensions are length by width feet. There are
#   twelve tiles per box, each 1 foot by 1 foot. How many boxes of tiles do you need? You
#   can only buy full boxes, not a partial box.

#   You also want to buy at least 10% more tiles than you need in order to handle chips,
#   breakage, and mess-ups. How many total boxes will you buy?

#   Find the total amount of tiles. Multiply by 1.10 to cover chips, breakage and mess-ups.
#   Divide by 12 to find the number of boxes, rounded up since we can only buy full boxes.
#   "To round up in Python, you can use the math.ceil() function from the math module."

import math

length = float(input("Enter the length of the room in feet: "))
width = float(input("Enter the width of the room in feet: "))
area = length * width

total_tiles = area * 1.10
boxes_needed = math.ceil(total_tiles / 12)
print(f"You will need to buy {boxes_needed} boxes of tiles to cover the room, including extra for chips and breakage.")