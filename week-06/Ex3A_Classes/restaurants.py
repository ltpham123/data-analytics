class Restaurant:
    """
    A class to represent, describe, and label a restaurant and its food.

    Contains its name and food type

    A function to describe the restaurant.

    A function to describe the restaurant status.
    """
    def __init__(self, rest_name, food_type):
        """Initializes name and industry type of its food served"""
        self.rest_name = rest_name
        self.food_type = food_type

    def describe_rest(self):
        """Describes the restaurant based on the name and food_type given."""
        print(f"{self.rest_name} serves {self.food_type.lower()}.")

    def rest_open(self):
        """Prints that the restaurant is open."""
        print(f"{self.rest_name} is open.")

mcdonalds = Restaurant("McDonald's", "Burgers")
mcdonalds.describe_rest()
mcdonalds.rest_open()

wendys = Restaurant("Wendy's", "Burgers")
wendys.describe_rest()
wendys.rest_open()

oberweis = Restaurant("Oberweis", "Milkshakes")
oberweis.describe_rest()
oberweis.rest_open()