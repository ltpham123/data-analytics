set_range = range(1, 101)
rng_pool = set()  # sets can generate randomness since they are unordered collections

for i in range(1, 101):
    rng_pool.add(str(set_range[i-1]))

rng_target = int(list(rng_pool)[0])  # converts a set to a list

rng_guess = int(input("Guess a number between 1 and 100: "))

while rng_guess != rng_target:
    if rng_guess < rng_target:
        print("Too low! Try again.")
    else:
        print("Too high! Try again.")
    rng_guess = int(input("Guess a number between 1 and 100: "))

print(f"Congratulations! You guessed the number {rng_target} correctly!")