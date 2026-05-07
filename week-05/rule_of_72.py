# How long will it take a savings account worth X to double in value based on an interest
# rate of IR? (Hint: Look up the “rule of 72”)
# Your current savings is [number].
# At a [number]% interest rate, your savings account will be
# worth [number] in [number] years
# rule of 72: years to double = 72 / interest rate

# Show your doubled balance with 2 digits to the right of the decimal point by using
# format(__, ".2f") and show years with 1 digit to the right of the decimal. How
# can you do this using format()?

# There are a couple ways you might get the interest rate to display as a percentage.
# One option is to use the format function. In this case, instead of including the
# character f to assign a fixed decimal format, use the character % to assign the
# percentage format, e.g. format(__, ".0%")

interest_rate = 0.05 # 5  # Example interest rate in percent
current_savings = 10000  # Example current savings
years_to_double = 72 / (interest_rate * 100)

# print(f"Your current savings is {current_savings:.2f}.")
# print(f"At a {interest_rate}% interest rate, your savings account will be")
# print(f"worth {current_savings*2:.2f} in {years_to_double:.2f} years.")
print(f"Your current savings is {format(current_savings, '.2f')}.")
print(f"At a {format(interest_rate, '.0%')} interest rate, your savings account will be")
print(f"worth {format(current_savings*2, '.2f')} in {format(years_to_double, '.1f')} years.")