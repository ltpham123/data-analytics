#   Display one of the greetings below based on the current hour:

#   Time
#   until 10:00am   'Good morning!'
#   10:00am until 5:00pm   'Good day!'
#   5:00pm or later   'Good evening!'

from datetime import datetime
current_time = datetime.now().time()  # Get the current time

#   Testing different times by manually setting current_time
# current_time = datetime.strptime("09:30:00", "%H:%M:%S").time()  # Morning
# current_time = datetime.strptime("14:00:00", "%H:%M:%S").time()  # Day
# current_time = datetime.strptime("18:00:00", "%H:%M:%S").time()  # Evening
# current_time = datetime.strptime("23:30:00", "%H:%M:%S").time()  # wydusl
# current_time = datetime.strptime("06:30:00", "%H:%M:%S").time()  # back to Morning

if current_time < datetime.strptime("10:00:00", "%H:%M:%S").time():
    print("Good morning!")
elif current_time < datetime.strptime("17:00:00", "%H:%M:%S").time():
    print("Good day!")
elif current_time < datetime.strptime("23:00:00", "%H:%M:%S").time():  # updated to include 11pm
    print("Good evening!")
elif current_time > datetime.strptime("23:00:00", "%H:%M:%S").time() or current_time < datetime.strptime("04:00:00", "%H:%M:%S").time():  # updated to include 11pm and 4am
    print("What are you doing up so late??")