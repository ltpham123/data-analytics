#   Create a script to determine whether a given
#   year is a leap year in the Gregorian calendar

year = int(input("Enter a year: "))

# if year % 4 == 0:
#     if (year // 100) % 4 != 0:
#         print(f"{year} is not a leap year.")
#     else:
#         print(f"{year} is a leap year.")
# else:
#     print(f"{year} is not a leap year.")

if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0):
    print(f"{year} is a leap year.")
else:
    print(f"{year} is not a leap year.")