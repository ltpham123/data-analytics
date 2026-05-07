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