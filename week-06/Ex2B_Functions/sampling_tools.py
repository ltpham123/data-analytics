import random

products = ['Laptop', 'Monitor', 'Keyboard', 'Mouse', 'Webcam', 'Headset', 'Docking Station', 'USB Hub', 'Desk Lamp', 'Surge Protector']

potd = random.choice(products)
survey_products = random.sample(products, 3)

random.shuffle(products)

daily_count = random.randint(50, 300)

print(f"Product of the Day: {potd}")  # picks one random product
print(f"Three products for survey: {survey_products[0]}, {survey_products[1]}, and {survey_products[2]}")  # picks three random products without duplicates
print(f"Shuffled products: {products}")  # shuffles list and prints new list
print(f"Daily sales count: {daily_count}")  # generates a random integer from the specified range
