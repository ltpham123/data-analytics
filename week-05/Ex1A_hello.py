########################
### YUU Data Academy ###
### Longley Pham     ###
### Exercise 1A      ###
########################

print('Hello world!')

message = 'Hello world!'
print(message)

# "Hello world" prints twice because the "Run Code" button
# runs the entire script beginning from the very top, where
# line 1 and line 4 are both printing "Hello world": one as
# a direct string in the print function and one calling the
# variable in the print function

# Displaying dollars and cents
dollars = 3     # initializes as an integer
cents = .50     # initializes as a float
print(dollars + cents)

# When an integer and a float gets added together, it becomes
# a float. The print function turns the output into a string
# The float function does not include the trailing zeros when
# declared. Additionally, dollars initializes as an integer
# if it isn't declared. Similarly, cents initializes as a
# float

# Adding cents to cents
cents = cents + .25
print(dollars + cents) # adds .25 to .50

d_str = '3 dollars'
c_str = '50 cents'
print(d_str + " " + c_str)