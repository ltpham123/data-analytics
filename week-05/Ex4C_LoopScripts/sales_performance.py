sales_data = [
    ('Marcus Webb',      'East',     4250.00),
    ('Priya Sharma',     'West',     5875.00),
    ('DeShawn Carter',   'East',     3100.75),
    ('LaTonya Rivers',   'South',    4500.00),
    ('Bob Nguyen',       'West',     4980.25),
]

for name, region, sales in sales_data:
    print(f"{name} ({region}): ${sales:.2f}")
    if sales >= 5000:
        print(f"  ^ Top performer!")