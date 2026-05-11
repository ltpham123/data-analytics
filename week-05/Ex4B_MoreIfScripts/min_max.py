#   Displays both the smallest then the largest of three numbers.

a = 8
b = 455.1
c = -3

if a <= b and a <= c:
    min_num = a
elif b <= a and b <= c:
    min_num = b
else:
    min_num = c

if a >= b and a >= c:
    max_num = a
elif b >= a and b >= c:
    max_num = b
else:
    max_num = c

print(f"The smallest number is {min_num}.")
print(f"The largest number is {max_num}.")