contact_info = {
    "name": "John Doe",
    "address": "123 Main St",
    "city": "Anytown",
    "state": "USA",
    "zip": 12345,
}

del contact_info["name"]

full_name = {
    "first_name": "John",
    "last_name": "Doe",
}

full_name.update({
    "honorifics": "Mr."
})

contact_info.update({
    "full_name": full_name
})

print(f'{contact_info["full_name"]["honorifics"]} {contact_info["full_name"]["first_name"]} {contact_info["full_name"]["last_name"]}\n{contact_info["address"]}\n{contact_info["city"]}, {contact_info["state"]} {contact_info["zip"]}')