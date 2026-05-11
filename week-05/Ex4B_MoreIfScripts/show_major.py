#   Display the name of the major and location of the department's
#   office based on the major code

student_name = input("Enter student name: ")
student_major = input("Enter major code: ").upper()

#   dictionary, initialize blanks: <unknown>
#   for major name and nothing for location
#   Serves as alternate output for invalid codes

major_directory = {
    "BIOL": {
        "major": "Biology",
        "location": "Science Bldg, Room 310"
        },
    "CSCI": {
        "major": "Computer Science",
        "location": "Sheppard Hall, Room 314"
        },
    "ENG": {
        "major": "English",
        "location": "Kerr Hall, Room 201"
        },
    "HIST": {
        "major": "History",
        "location": "Kerr Hall, Room 114"
        },
    "MKT": {
        "major": "Marketing",
        "location": "Westly Hall, Room 310"
        }
}

if student_major in major_directory:
    major_name = major_directory[student_major]["major"]
    major_location = major_directory[student_major]["location"]
else:
    major_name = "<unknown>"
    major_location = ""

print(f"Student: {student_name}")
print(f"Major: {major_name}")
print(f"Office Location: {major_location}")