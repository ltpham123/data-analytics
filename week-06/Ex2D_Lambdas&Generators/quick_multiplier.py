doubler = lambda n: n * 2

print(doubler(8))  # doubles 8 numerically
print(doubler(-4))  # doubles -4 numerically
print(doubler('banana'))  # print banana twice, concatenated

tripler = lambda n: n * 3

def multiplier(num_multi):
    return lambda n: n * num_multi

quadrupler = multiplier(4)
quintupler = multiplier(5)
sextupler = multiplier(6)
septupler = multiplier(7)
octupler = multiplier(8)
nonupler = multiplier(9)
decupler = multiplier(10)

print(quadrupler(8))
print(quintupler(-4))
print(sextupler('banana'))
print(septupler(8))
print(octupler(-4))
print(nonupler('banana'))
print(decupler(8))