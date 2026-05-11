my_likes = ["New York Strip Steak", "Spam Musubi", "Porkchops", "Strawberry Ice Cream", "Mac and Cheese"]
#   Top 5 favorites
for i, likes in enumerate(my_likes):
    if i == 0:
        print(f"{i+1}. {likes} <- top pick!")
        continue

    print(f"{i+1}. {likes}")

#   Reversed order
for i, likes in enumerate(reversed(my_likes)):
    if i == len(my_likes)-1:
        print(f"{len(my_likes)-i}. {likes} <- top pick!")
        continue

    print(f"{len(my_likes)-i}. {likes}")