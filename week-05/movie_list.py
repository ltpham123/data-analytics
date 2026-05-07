watch_list = ["The Shawshank Redemption", "The Godfather", "The Dark Knight", "Pulp Fiction", "Forrest Gump", "Inception", "The Matrix", "Fight Club"]
print(f'The list watch_list includes the {len(watch_list)} movies I\'d like to watch')
# print(watch_list)

# print(sorted(watch_list))
# print(watch_list)
# # The first print statement prints the list in alphabetical order, but the second print statement shows the unchanged original list.

watch_list.sort()
print(watch_list)
# The sort() method permanently changes the order of the list, so the original list is now in alphabetical order.

watch_list.append('Hoppers')
print(f'After adding {watch_list[-1]}, the list watch_list now includes the {len(watch_list)} movies I\'d like to watch')
watch_list.sort()
print(watch_list)