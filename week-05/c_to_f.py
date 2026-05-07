#   2) How do you convert a temperature from Celsius to Fahrenheit?
#   fahrenheit = (celsius * 9 / 5) + 32

temp_c = float(input("Enter temperature in Celsius: "))
temp_f = (temp_c * 9 / 5) + 32
print(f"{format(temp_c, '.2f')} degrees Celsius is equal to {format(temp_f, '.2f')} degrees Fahrenheit.")