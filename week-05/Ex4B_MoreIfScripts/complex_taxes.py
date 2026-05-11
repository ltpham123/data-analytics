#   Calculate federal tax based on the values of annual
#   gross income and a filing status ('single' or 'joint').

#   Create a script that calculates gross pay

pay_rate = float(input("Enter hourly pay rate: "))
hours_worked = float(input("Enter hours worked: "))
filing_status = input("Enter filing status (single/joint): ").lower()

if hours_worked > 40:
    overtime_hours = hours_worked - 40
    hours_worked = 40
else:
    overtime_hours = 0

weekly_gross_pay = (pay_rate * hours_worked) + (pay_rate * overtime_hours * 1.5)
annual_gross_pay = weekly_gross_pay * 52  # Assuming 52 weeks in a year

#   tax table for single filers
#   under 12,000: 5%
#   12,000 to 24,999.99: 10%
#   25,000 to 74,999.99: 15%
#   75,000 and over: 20%

#   tax table for joint filers
#   under 12,000: 0%
#   12,000 to 24,999.99: 6%
#   25,000 to 74,999.99: 11%
#   75,000 and over: 20%

if filing_status == "single":
    if annual_gross_pay < 12000:
        tax_rate = 0.05
    elif annual_gross_pay < 25000:
        tax_rate = 0.10
    elif annual_gross_pay < 75000:
        tax_rate = 0.15
    else:
        tax_rate = 0.20

if filing_status == "joint":
    if annual_gross_pay < 12000:
        tax_rate = 0.00
    elif annual_gross_pay < 25000:
        tax_rate = 0.06
    elif annual_gross_pay < 75000:
        tax_rate = 0.11
    else:
        tax_rate = 0.20

print(f"You worked {hours_worked + overtime_hours} hours this period.")
print(f"Because you earn ${pay_rate:.2f} per hour, your gross pay is ${weekly_gross_pay:.2f}.")
print(f"Your filing status is {filing_status}")
print(f"Your tax withholding for the week is ${weekly_gross_pay * tax_rate:.2f}.")
print(f"Your net pay is ${weekly_gross_pay - (weekly_gross_pay * tax_rate):.2f}.")