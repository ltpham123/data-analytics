class Restaurant:
    """
    A class to represent, describe, and label a restaurant and its food.
    An enhanced version includes number of customers served and customer rating.

    Contains its name and food type

    A function to describe the restaurant.

    A function to describe the restaurant status.

    An enhanced version includes:
    
        A function to add number of customers served.

        A function to print number of customers served.
    """
    def __init__(self, rest_name, food_type):
        """Initializes name and industry type of its food served"""
        self.rest_name = rest_name
        self.food_type = food_type
        self.number_served = 0
        self.customer_ratings = []

    def describe_rest(self):
        """Describes the restaurant based on the name and food_type given."""
        print(f"{self.rest_name} serves {self.food_type.lower()}.")

    def rest_open(self):
        """Prints that the restaurant is open."""
        print(f"{self.rest_name} is open.")

    def add_num_served(self):
        self.number_served += int(input("How many customers served today? "))

    def print_num_served(self):
        print(f"{self.rest_name} has served {self.number_served} customers")

    def customer_rating(self):
        while True:
            try:
                rating = int(input("How would you rate your experience today on a scale of 1-5 (5 being execellent)? "))
                if 1 <= rating <= 5:
                    break

                print("Please enter an integer from 1-5.")

            except ValueError:
                print("Invalid rating given.")

        self.customer_ratings.append(rating)
        avg_rating = sum(self.customer_ratings) / len(self.customer_ratings)
        print(f"Your rating was {rating}. The average rating for this restaurant is {avg_rating:.1f}")

# mcdonalds = Restaurant("McDonald's", "Burgers")
# mcdonalds.describe_rest()
# mcdonalds.rest_open()
# mcdonalds.print_num_served()
# mcdonalds.add_num_served()
# mcdonalds.add_num_served()
# mcdonalds.print_num_served()

# wendys = Restaurant("Wendy's", "Burgers")
# wendys.describe_rest()
# wendys.rest_open()
# wendys.print_num_served()
# wendys.add_num_served()
# wendys.add_num_served()
# wendys.add_num_served()
# wendys.print_num_served()

oberweis = Restaurant("Oberweis", "Milkshakes")
oberweis.describe_rest()
oberweis.rest_open()
oberweis.print_num_served()
oberweis.add_num_served()
oberweis.print_num_served()
oberweis.customer_rating()