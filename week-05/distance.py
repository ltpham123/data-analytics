#   4) How do you calculate the distance between coordinates (x1, y1) and (x2, y2)? Hint:
#   You'll need to look up how to calculate a square root in Python, which may involve a
#   function from the math module.

#   Pythagorean theorem: distance = sqrt((x2 - x1)^2 + (y2 - y1)^2)
import math
x1 = float(input("Enter x-coordinate of the first point: "))
y1 = float(input("Enter y-coordinate of the first point: "))
x2 = float(input("Enter x-coordinate of the second point: "))
y2 = float(input("Enter y-coordinate of the second point: "))

distance = math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)
print(f"The distance between the points ({x1}, {y1}) and ({x2}, {y2}) is: {distance:.2f}")