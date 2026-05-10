#   Determine and print department name based on a department code.

#   1 = Marketing
#   5 = Sales
#   10 = Accounting
#   12 = Legal
#   18 = IT
#   20 = Customer Relations

department_code = int(input("Enter department code: "))
#   if/elif/else statements for department code
# if department_code == 1:
#     print("Department: Marketing")
# elif department_code == 5:
#     print("Department: Sales")
# elif department_code == 10:
#     print("Department: Accounting")
# elif department_code == 12:
#     print("Department: Legal")
# elif department_code == 18:
#     print("Department: IT")
# elif department_code == 20:
#     print("Department: Customer Relations")
# else:
#     print("Invalid department code.")

#   match/case statement for department code
match department_code:
    case 1:
        print("Department: Marketing")
    case 5:
        print("Department: Sales")
    case 10:
        print("Department: Accounting")
    case 12:
        print("Department: Legal")
    case 18:
        print("Department: IT")
    case 20:
        print("Department: Customer Relations")
    case _:
        print("Invalid department code.")