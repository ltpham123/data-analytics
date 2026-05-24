test_file = open("about_me.txt", "r")
# print(test_file.read())

# print(test_file.read(50))  # reads up to 50 characters
# print(test_file.read(50))  # reads up to the next 50 characters

# print(test_file.readline(10))  # reads the next line up to 10 characters
# print(test_file.readline())  # finishes the line it was on
# print(test_file.readline())  # reads the next line

# for i in range(1, 5):  # prints the first four lines
#     print(test_file.readline())

# print(test_file.readlines())  # prints the text file out into a list with each element ending with a new line
# print(test_file.readlines(1))  # prints the first line with the new line
# print(test_file.readlines(1))  # prints the next line w/ the new line

# print(test_file.readlines(10))  # just prints the next line w/ the new line; first line w/ comment
# print(test_file.readlines(10))  # just prints out the next line; the number just prints the bytes, not exact character or words

# print(test_file.readlines(100))  # stops after second sentence
print(test_file.readlines(-1))  # prints all



test_file.close()