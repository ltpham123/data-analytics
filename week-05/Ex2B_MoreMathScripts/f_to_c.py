#   1) How do you convert a temperature from Fahrenheit to Celsius?
#   celsius = (fahrenheit - 32) * 5 / 9

temp_f = float(input("Enter temperature in Fahrenheit: "))
temp_c = (temp_f - 32) * 5 / 9
print(f"{format(temp_f, '.2f')} degrees Fahrenheit is equal to {format(temp_c, '.2f')} degrees Celsius.")