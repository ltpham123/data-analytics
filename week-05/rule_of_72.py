# How long will it take a savings account worth X to double in value based on an interest
# rate of IR? (Hint: Look up the “rule of 72”)
# Your current savings is [number].
# At a [number]% interest rate, your savings account will be
# worth [number] in [number] years

interest_rate = 5  # Example interest rate in percent
current_savings = 10000  # Example current savings
years_to_double = 72 / interest_rate

print(f"Your current savings is {current_savings:.2f}.")
print(f"At a {interest_rate}% interest rate, your savings account will be")
print(f"worth {current_savings*2:.2f} in {years_to_double:.2f} years.")