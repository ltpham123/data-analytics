# ValueError
try:
    num = int("hello world")
except ValueError:
    print("ValueError: Cannot cast a string into an integer")
else:
    print(num)
finally:
    print("Let's try another one")

# NameError
try:
    fruit = banana
except NameError:
    print("NameError: strings need to be enclosed with quotes")
else:
    print(fruit)
finally:
    print("Let's try another one")

# TypeError
try:
    sum = 5 + 10 + "15"
except TypeError:
    print("TypeError: Can't combine a string and an integer")
else:
    print(sum)
finally:
    print("Let's try another one")

#SyntaxError
try:
    exec("""
        for i in range(2)
            print("Hello! " + str(i))
         """)
except SyntaxError:
    print("SyntaxError: missing a colon")
else:
    print("No syntax error")
finally:
    print("Let's try another one")