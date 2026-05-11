starting_balance = 1000
savings_goal = 2000
weekly_savings = 100

current_balance = starting_balance
weeks = 0

print(f"Starting balance: ${current_balance}")
print(f"Savings goal: ${savings_goal}")
print(f"Weekly savings: ${weekly_savings}")

while current_balance < savings_goal:
    current_balance += weekly_savings
    weeks += 1
    if current_balance <= ((savings_goal - starting_balance) * 0.5) + starting_balance:
        print(f"This week my balance increased to ${current_balance}")
    elif current_balance <= ((savings_goal - starting_balance) * 0.75) + starting_balance:
        print(f"Almost there! This week my balance is up to ${current_balance}")
    elif current_balance == savings_goal:
        break
    else:
        current_balance -= 50  # Treat myself to something nice
        print(f"So close! After treating myself, my balance is up to ${current_balance}")

print(f"Goat met! My current balance is ${current_balance}.")