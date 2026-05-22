def display_mailing_label(name, address, city, state, zip):
    print(f"{name}")
    print(f"{address}")
    print(f"{city}, {state} {zip}")

# modified display_mailing_label
def display_mailing_label_mod(name, address1, address2, city, state, zip):
    print(f"{name}")
    if address2:
        print(f"{address1}\n{address2}")
    else:
        print(f"{address1}")
    print(f"{city}, {state} {zip}")

def add_numbers(*num_input):
    sum_total = 0
    num_track = ""
    for num in num_input:
        sum_total += num
        if num_track == "":
            num_track = str(num)
        else:
            num_track += " + " + str(num)
    print(f"{num_track} = {sum_total}")

def display_receipt(total_due, amount_paid):
    print(f"Total Due: ${total_due:.2f}")
    print(f"Amount Paid: ${amount_paid:.2f}\n")

    difference = total_due - amount_paid
    if difference <= 0:
        if difference < 0:
            difference *= -1
        print(f"Change Due: ${difference:.2f}")
    else:
        print(f"Remaining balance: ${difference:.2f}")

# modified display_receipt
def display_receipt_mod(total_due, amount_paid, *add_totals):
    sum_total = total_due
    
    for total in add_totals:
        sum_total += total

    print(f"Total Due: ${sum_total:.2f}")
    print(f"Amount Paid: ${amount_paid:.2f}\n")

    difference = sum_total - amount_paid
    if difference <= 0:
        if difference < 0:
            difference *= -1
        print(f"Change Due: ${difference:.2f}")
    else:
        print(f"Remaining balance: ${difference:.2f}")

# display_mailing_label("John Smith", "123 Main Street", "Chicago", "IL", "60601")
# display_mailing_label("Alice Johnson", "456 Oak Avenue", "River Grove", "IL", "60171")

# add_numbers(5)
# add_numbers(10, 20)
# add_numbers(1, 2, 3, 4, 5, 6)

# display_receipt(50.00, 75.00)   # overpaying
# display_receipt(50.00, 50.00)   # exact payment
# display_receipt(50.00, 30.00)   # underpaying

# modified display_address
# display_mailing_label_mod("John Smith", "123 Main St", "", "Chicago", "IL", "60601")
# display_mailing_label_mod("ABC Company", "456 Market Ave", "Suite 300", "New York", "NY", "10001")

# multiple bills
# display_receipt_mod(40.00, 70.00, 6.25, 4.75, 3.00, 2.50)
# display_receipt_mod(25.00, 37.00, 5.00, 3.50, 2.00, 1.50)
# display_receipt_mod(30.00, 20.00, 5.00, 4.50, 3.25, 2.75)