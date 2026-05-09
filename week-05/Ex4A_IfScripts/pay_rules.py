#   Create a script that calculates gross pay

pay_rate = float(input("Enter hourly pay rate: "))
hours_worked = float(input("Enter hours worked: "))

if hours_worked > 40:
    overtime_hours = hours_worked - 40
    hours_worked = 40
else:
    overtime_hours = 0

gross_pay = (pay_rate * hours_worked) + (pay_rate * overtime_hours * 1.5)

print(f"Gross pay: ${gross_pay:.2f}")