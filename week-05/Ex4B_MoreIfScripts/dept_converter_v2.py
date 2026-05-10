#   Determine and print department name based on a department code.
#   Changed to reflect match/case statements instead of if/elif/else statements.

#   1 = Marketing
#   5 = Sales
#   10 = Accounting
#   12 = Legal
#   18 = IT
#   20 = Customer Relations

department_code = int(input("Enter department code: "))

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