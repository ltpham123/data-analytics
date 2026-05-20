import random

products = ['Laptop', 'Monitor', 'Keyboard', 'Mouse', 'Webcam', 'Headset', 'Docking Station', 'USB Hub', 'Desk Lamp', 'Surge Protector']

potd = random.choice(products)
survey_products = random.sample(products, 3)

random.shuffle(products)
shuffled_products = products

daily_count = random.randint(50, 300)

print(f"Product of the Day: {potd}")
print(f"Three products for survey: {survey_products[0]}, {survey_products[1]}, and {survey_products[2]}")
print(f"Shuffled products: {shuffled_products}")
print(f"Daily sales count: {daily_count}")
