set_range = range(1, 101)
rng_pool = set()  # sets can generate randomness since they are unordered collections

for i in range(1, 101):
    rng_pool.add(str(set_range[i-1]))

rng_target = int(list(rng_pool)[0])  # converts a set to a list

guess_list = []

while True:
    rng_guess = input("Guess a number between 1 and 100: ")
    if rng_guess.isdigit() and int(rng_guess) in range(1, 101):
        break
    else:
        print("Invalid input.")

# rng_guess = int(input("Guess a number between 1 and 100: "))
num_guesses = 1
guess_list.append(rng_guess)

while int(rng_guess) != rng_target:
    if int(rng_guess) < rng_target:
        print("Too low! Try again.")
    else:
        print("Too high! Try again.")
    while True:
        rng_guess = input("Guess a number between 1 and 100: ")
        if rng_guess.isdigit() and int(rng_guess) in range(1, 101):
            break
        else:
            print("Invalid input.")
    num_guesses += 1
    guess_list.append(rng_guess)

if num_guesses < 5:
    print("You're awesome!")
print(f"Congratulations! You guessed the number {rng_target} correctly!")
print(f"It took you {num_guesses} guesses: {guess_list}")