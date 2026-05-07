candies = ("gummy bears", "lollipop", "jawbreaker")
fruit_flavors = ("banana apple", "very berry strawberry", "tangy orange")

# Create a new variable to store candy combinations as a set using the index of each tuple
candy_combinations = set()
candy_combinations.add(fruit_flavors[0] + " " + candies[0])
candy_combinations.add(fruit_flavors[1] + " " + candies[0])
candy_combinations.add(fruit_flavors[2] + " " + candies[0])
candy_combinations.add(fruit_flavors[0] + " " + candies[1])
candy_combinations.add(fruit_flavors[1] + " " + candies[1])
candy_combinations.add(fruit_flavors[2] + " " + candies[1])
candy_combinations.add(fruit_flavors[0] + " " + candies[2])
candy_combinations.add(fruit_flavors[1] + " " + candies[2])
candy_combinations.add(fruit_flavors[2] + " " + candies[2])
print(f'Today\'s candy combinations include: ')
print(candy_combinations)
# Had me confused for a second why it was happening, but I forgot that sets do not maintain order
# and do not allow duplicates. So the output will be a set of unique candy combinations without
# any specific order.