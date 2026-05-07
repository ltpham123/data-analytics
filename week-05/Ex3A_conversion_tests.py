# Description: This script tests various numeric
# conversion techniques
# Author: Longley Pham

# Initialize string variables

a = " 101.1 "
b = '55'
c = "402 Stevens"
d = 'Number 5 '

print(a, type(a))  # Output: ' 101.1 ' <class 'str'>
print(b, type(b))  # Output: '55' <class 'str'>
print(c, type(c))  # Output: '402 Stevens' <class 'str'>
print(d, type(d))  # Output: 'Number 5 ' <class 'str'>



# Attempt to convert strings to integers

#int(a)  # Raised a ValueError because of leading and trailing whitespaces in the string
int(b)  # successfully converts the string '55' to the integer 55
# int(c)  # Raised a ValueError because the string contains non-numeric characters
# int(d)  # Raised a ValueError because the string contains non-numeric characters

print(int(b), type(int(b)))  # Output: 55 <class 'int'>



# Attempt to convert strings to floats

float(a)  # successfully converts the string ' 101.1 ' to the float 101.1
# why is this different from int(a)? The `float()` function can handle leading and trailing
# whitespaces in the string, as well as the decimal point, but the `int()` function cannot.
# Based on documentation, float(a) ignores whitespaces while int(a) is strict about the format.
float(b)  # successfully converts the string '55' to the float 55.0
# float(c)  # Raised a ValueError because the string contains non-numeric characters
# float(d)  # Raised a ValueError because the string contains non-numeric characters

print(float(a), type(float(a)))  # Output: 101.1 <class 'float'>
print(float(b), type(float(b)))  # Output: 55.0 <class 'float'>



# Attempt to cast into a float then integer
int(float(a))  # successfully converts the string ' 101.1 ' to the integer 101; float(a) removes whitespaces first
int(float(b))  # successfully converts the string '55' to the integer 55
# int(float(c))  # Raised a ValueError because the string contains non-numeric characters
# int(float(d))  # Raised a ValueError because the string contains non-numeric characters

print(int(float(a)), type(int(float(a))))  # Output: 101 <class 'int'>
print(int(float(b)), type(int(float(b))))  # Output: 55 <class 'int'>



# Slicing to add just the numeric portion of the string to a new variable,
# then cast number as an integer or string

new_a = float(a[1:6])  # Slices the string ' 101.1 ' to get '101.1'
new_b = int(b[0:2])  # Slices the string '55' to get '55'
new_c = c[0:3]  # Slices the string '402 Stevens' to get '402'
new_d = d[7:8]  # Slices the string 'Number 5 ' to get '5'

print(new_a, type(new_a))  # Output: 101.1 <class 'float'>
print(new_b, type(new_b))  # Output: 55 <class 'int'>
print(new_c, type(new_c))  # Output: 402 <class 'str'>
print(new_d, type(new_d))  # Output: 5 <class 'str'>



# Stripping leading/trailing spaces using the `strip()` method
strip_a = a.strip()  # Removes leading and trailing whitespaces from ' 101.1 '
strip_d = d.strip()  # Removes leading and trailing whitespaces from 'Number 5 '

print(strip_a, type(strip_a))  # Output: '101.1' <class 'str'>
print(strip_d, type(strip_d))  # Output: 'Number 5' <class 'str'>