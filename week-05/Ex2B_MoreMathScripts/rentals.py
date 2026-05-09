#   6) There are X people going on a tour. Charter vans seat 15 passengers each. Vans cost
#   $250 per day to rent (including the driver’s pay). How many vans do you need? How
#   much will it cost to rent vans? What is the cost if you split it per person?

people = int(input("Enter the number of people going on the tour: "))
vans_needed = (people + 14) // 15  # 14 for rounding up to the next whole van

cost_per_van = 250
total_cost = vans_needed * cost_per_van
cost_per_person = total_cost / people
print(f"You will need {vans_needed} vans to accommodate {people} people.")
print(f"The total cost to rent the vans per day is: ${total_cost:.2f}")
print(f"The cost per person is: ${cost_per_person:.2f}")

#   Test your script with 38 tourists. Now do some separate calculations to check your
#   work:
#   a) How much money did your script say you had to charge per person?
#       Each person pays $19.74.
#   b) If you multiply that out, how much did you collect?
#       Total collected: $750.12.
#   c) How much were the vans?
#       Total cost of vans: $750.00.
#   d) Why do you have leftover money?
#       The leftover money is due to rounding the cost per person to two decimal places. The fractional
#       round up causes the total collected amount to be slightly higher than the actual cost of the vans,
#       but never more than $0.01 per person from the excess rounding.