x = 100
y = 20

if x // y == 5:
    print('x divided by y is 5')
    x = 1
else:
    print('are the variables set up correctly?')

if x * y == y:
    print('now x times y is y')
    x = 10
else:
    print('Whoops, x equals ' + str(x))

if x < y:
    print('x is less than y')
    x *= 2
else:
    print('uh oh, x is not less than y')

if x > y:
    print('how is x greater than y??')
else:
    print('x is NOT greater than y')

print('The final value of x is ' + str(x) + ' and the final value of y is ' + str(y))