# The diameter of a given circle is the same as the day of your birthday (not the month,
# just the day). Figure out the formula, refresh your recollection of the difference
# between diameter and radius, and figure out what the script should look like.
# The area of a circle with radius [number] is [number]

# diameter = 13  # Example day of the month (13th)
diameter = int(input("What is your day of birth? "))  # Get the diameter from user input; initially a string, so convert to integer
radius = diameter / 2
area = 3.14159 * (radius ** 2)
print(f"The area of a circle with radius {format(radius, '.2f')} is {format(area, '.2f')}")  # Measurements are based in 'units'