name_1 = "PRIYA SHARMA"
name_2 = "bob NGUYEN"
name_3 = "LaTonya Williams"
salary_1 = "$82,500"
salary_2 = "$74,000"

# Convert all three names to lowercase using .lower() and print the results
print(name_1.lower())
print(name_2.lower())
print(name_3.lower())

# Convert all three names to title case using .title() and print the results
print(name_1.title())
print(name_2.title())
print(name_3.title())

# Remove the dollar sign from both salary strings using .replace() and print the results
print(salary_1.replace("$", ""))
print(salary_2.replace("$", ""))

# Combine with int() to produce a usable integer
print(int(salary_1.replace("$", "").replace(",", "")), type(int(salary_1.replace("$", "").replace(",", ""))))  # Use replace twice to remove both $ and , before casting to integer
print(int(salary_2.replace("$", "").replace(",", "")), type(int(salary_2.replace("$", "").replace(",", ""))))  # Use replace twice to remove both $ and , before casting to integer