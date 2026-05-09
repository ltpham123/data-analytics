# How do you calculate the tip amount on a restaurant bill given the tip percentage?
# Assume tip percentage is 15%
# Tip amount = (Tip percentage / 100) * Bill total
# The tip on a $[number] restaurant bill is $[number]

total_bill = 50.00  # Example total bill amount
tip_percentage = 15  # Tip percentage
tip_amount = (tip_percentage / 100) * total_bill
print(f"The tip on a ${total_bill:.2f} restaurant bill is ${tip_amount:.2f}")

# Can also assign the tip percentage as a decimal for easier calculation
tip_percentage_decimal = 0.15  # Tip percentage as a decimal
tip_amount_decimal = tip_percentage_decimal * total_bill
print(f"The tip on a ${total_bill:.2f} restaurant bill is ${tip_amount_decimal:.2f}")